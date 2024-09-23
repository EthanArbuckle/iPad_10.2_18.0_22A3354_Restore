@implementation VCPPhotosSceneprintAssetProcessingTask

- (VCPPhotosSceneprintAssetProcessingTask)initWithAssets:(id)a3 options:(id)a4 andCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPPhotosSceneprintAssetProcessingTask *v12;
  void *v13;
  id completionHandler;
  void *v15;
  void *v16;
  VCPPhotosSceneprintAssetProcessingTask *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v19.receiver = self;
    v19.super_class = (Class)VCPPhotosSceneprintAssetProcessingTask;
    v12 = -[VCPPhotosSceneprintAssetProcessingTask init](&v19, sel_init);
    if (v12)
    {
      v13 = _Block_copy(v11);
      completionHandler = v12->_completionHandler;
      v12->_completionHandler = v13;

      objc_storeStrong((id *)&v12->_assets, a3);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SceneprintRevision"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SceneprintRevision"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12->_revision = objc_msgSend(v16, "unsignedIntegerValue");

      }
      else
      {
        v12->_revision = 3737841671;
      }
    }
    self = v12;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  void *v3;
  unsigned __int8 v4;
  void (**completionHandler)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEE040], "globalSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseCachedResources");

  v4 = atomic_load((unsigned __int8 *)&self->_started);
  if ((v4 & 1) == 0)
  {
    completionHandler = (void (**)(id, _QWORD, void *))self->_completionHandler;
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sceneprint task cancelled"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -128, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    completionHandler[2](completionHandler, 0, v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)VCPPhotosSceneprintAssetProcessingTask;
  -[VCPPhotosSceneprintAssetProcessingTask dealloc](&v10, sel_dealloc);
}

+ (id)taskWithAssets:(id)a3 options:(id)a4 andCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssets:options:andCompletionHandler:", v7, v8, v9);

  return v10;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_cancel);
}

+ (unint64_t)_panoVNRequestMethod
{
  return 0;
}

- (BOOL)run:(id *)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  const void **v33;
  id v34;
  uint64_t v35;
  id v36;
  unint64_t revision;
  char v38;
  id v39;
  void *v40;
  void *v41;
  char v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  BOOL v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *context;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  NSArray *obj;
  void *v75;
  uint64_t v76;
  VCPPhotosSceneprintAssetProcessingTask *v77;
  void *v78;
  id v80;
  id v81;
  const void *v82;
  const void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  v77 = self;
  atomic_store(1u, (unsigned __int8 *)&self->_started);
  +[VCPSceneProcessingImageManager imageManager](VCPSceneProcessingImageManager, "imageManager");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v77->_assets;
  v4 = a3;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
  if (!v5)
    goto LABEL_48;
  v76 = *(_QWORD *)v85;
  v72 = *MEMORY[0x1E0CB2F90];
  v73 = *MEMORY[0x1E0CB2D50];
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v85 != v76)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v6);
      v8 = atomic_load((unsigned __int8 *)&v77->_cancel);
      if ((v8 & 1) != 0)
      {
        if (v4)
        {
          v61 = (void *)MEMORY[0x1E0CB35C8];
          v99 = v73;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sceneprint task cancelled"));
          v100 = objc_claimAutoreleasedReturnValue();
          v78 = (void *)v100;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "errorWithDomain:code:userInfo:", v72, -128, v29);
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = *v4;
          *v4 = (id)v62;
LABEL_53:

LABEL_54:
LABEL_55:

        }
LABEL_56:

        v60 = 0;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0CD1440], "vcp_allAcceptableResourcesForAsset:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v6));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "vcp_thumbnailResource");
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v78, "vcp_isLocallyAvailable") & 1) == 0)
      {
        if (a3)
        {
          v64 = (void *)MEMORY[0x1E0CB35C8];
          v97 = v73;
          v65 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "localIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "stringWithFormat:", CFSTR("[%@] Thumbnail is not locally available"), v29);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = v63;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "errorWithDomain:code:userInfo:", v72, -23802, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = *a3;
          *a3 = v67;

          goto LABEL_53;
        }
        goto LABEL_55;
      }
      v10 = objc_msgSend(v7, "vcp_abnormalImageDimensionForSceneNet");
      if (v10)
      {
        v11 = objc_msgSend((id)objc_opt_class(), "_panoVNRequestMethod");
        if (!v11)
        {
          v30 = objc_alloc(MEMORY[0x1E0CEDF70]);
          objc_msgSend(v78, "privateFileURL");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v30, "initWithURL:options:", v31, MEMORY[0x1E0C9AA70]);

          goto LABEL_25;
        }
        v82 = 0;
        v83 = 0;
        objc_msgSend(v78, "privateFileURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v75, "loadFullPixelBuffer:scaledPixelBuffer299:scaledPixelBuffer360:fromImageURL:abnormalDimension:", &v83, &v82, 0, v12, v10);

        if (v13)
        {
          if (a3)
          {
            v14 = (void *)MEMORY[0x1E0CB35C8];
            v93 = v73;
            v15 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v7, "localIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringWithFormat:", CFSTR("[%@] Failed to load thumbnail image"), v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "errorWithDomain:code:userInfo:", v72, v13, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = *a3;
            *a3 = v19;

          }
LABEL_16:
          v29 = 0;
          goto LABEL_24;
        }
        v32 = objc_alloc(MEMORY[0x1E0CEDF70]);
        if (v11 == 1)
          v33 = &v83;
        else
          v33 = &v82;
        v35 = objc_msgSend(v32, "initWithCVPixelBuffer:options:", *v33, MEMORY[0x1E0C9AA70]);
      }
      else
      {
        v82 = 0;
        v83 = 0;
        objc_msgSend(v78, "privateFileURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v75, "loadFullPixelBuffer:scaledPixelBuffer299:scaledPixelBuffer360:fromImageURL:abnormalDimension:", &v83, &v82, 0, v21, 0);

        if (v13)
        {
          if (a3)
          {
            v22 = (void *)MEMORY[0x1E0CB35C8];
            v95 = v73;
            v23 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v7, "localIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringWithFormat:", CFSTR("[%@] Failed to load thumbnail image"), v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = v25;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "errorWithDomain:code:userInfo:", v72, v13, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = *a3;
            *a3 = v27;

          }
          goto LABEL_16;
        }
        v34 = objc_alloc(MEMORY[0x1E0CEDF70]);
        v35 = objc_msgSend(v34, "initWithCVPixelBuffer:options:", v82, MEMORY[0x1E0C9AA70]);
      }
      v29 = (void *)v35;
LABEL_24:
      CF<opaqueCMSampleBuffer *>::~CF(&v82);
      CF<opaqueCMSampleBuffer *>::~CF(&v83);
      if (v13)
        goto LABEL_54;
LABEL_25:
      v36 = objc_alloc_init(MEMORY[0x1E0CEDE40]);
      revision = v77->_revision;
      v81 = 0;
      v38 = objc_msgSend(v36, "setRevision:error:", revision, &v81);
      v39 = v81;
      if ((v38 & 1) == 0)
      {
        if (!a3)
        {
          v49 = 1;
          goto LABEL_42;
        }
        v50 = (void *)MEMORY[0x1E0CB35C8];
        v91 = v73;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to set revision %lu - %@"), objc_opt_class(), v77->_revision, v39);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v44;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "errorWithDomain:code:userInfo:", v72, -50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = *a3;
        *a3 = v52;

        goto LABEL_35;
      }
      objc_msgSend(v36, "setMetalContextPriority:", 1);
      objc_msgSend(v36, "setPreferBackgroundProcessing:", 1);
      if (DeviceHasANE())
      {
        objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setProcessingDevice:", v40);

      }
      v90 = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v39;
      v42 = objc_msgSend(v29, "performRequests:error:", v41, &v80);
      v43 = v80;

      if ((v42 & 1) != 0)
      {
        objc_msgSend(v36, "results");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "count") == 1)
        {
          objc_msgSend(v44, "firstObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "sceneprints");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "firstObject");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "localIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setObject:forKeyedSubscript:", v47, v48);
          v49 = 0;
          goto LABEL_39;
        }
        if (a3)
        {
          v54 = (void *)MEMORY[0x1E0CB35C8];
          v88 = v73;
          v55 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "localIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringWithFormat:", CFSTR("[%@] Invalid sceneprint result"), v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "errorWithDomain:code:userInfo:", v72, -18, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = *a3;
          *a3 = v57;

          v49 = 1;
LABEL_39:

        }
        else
        {
          v49 = 1;
        }
        v39 = v43;
LABEL_41:

        goto LABEL_42;
      }
      if (a3)
      {
        v39 = v43;
        v44 = *a3;
        *a3 = v39;
LABEL_35:
        v49 = 1;
        goto LABEL_41;
      }
      v49 = 1;
      v39 = v43;
LABEL_42:

      v4 = a3;
      if (v49)
        goto LABEL_56;
      ++v6;
    }
    while (v5 != v6);
    v59 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
    v5 = v59;
  }
  while (v59);
LABEL_48:

  (*((void (**)(void))v77->_completionHandler + 2))();
  v60 = 1;
LABEL_57:

  objc_autoreleasePoolPop(context);
  return v60;
}

- (int)run
{
  int v3;
  void *v4;
  id v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  if (-[VCPPhotosSceneprintAssetProcessingTask run:](self, "run:", &v6))
  {
    v3 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Sceneprint task failed (%@)", buf, 0xCu);

    }
    (*((void (**)(void))self->_completionHandler + 2))();
    v3 = objc_msgSend(v6, "code");
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
