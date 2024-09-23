@implementation VCPMADVISceneClassificationTask

- (VCPMADVISceneClassificationTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADVISceneClassificationTask *v12;
  VCPMADVISceneClassificationTask *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cancelQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVISceneClassificationTask;
  v12 = -[VCPMADVISceneClassificationTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    v14 = dispatch_queue_create("VCPMADVISceneClassificationTask", 0);
    cancelQueue = v13->_cancelQueue;
    v13->_cancelQueue = (OS_dispatch_queue *)v14;

  }
  return v13;
}

+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  objc_class *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:imageAsset:andSignpostPayload:", v8, v9, v10);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Incompatible request (%@) specified to %@", (uint8_t *)&v17, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)setPreferredMetalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_preferredMetalDevice, a3);
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
  NSObject *cancelQueue;
  _QWORD block[5];

  cancelQueue = self->_cancelQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCPMADVISceneClassificationTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __41__VCPMADVISceneClassificationTask_cancel__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id WeakRetained;
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "cancel");
  v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));

  if (v2)
    objc_msgSend(v2, "cancel");
  v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));

  if (v5)
    objc_msgSend(v5, "cancel");
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));

  if (v3)
    objc_msgSend(v3, "cancel");
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));

  if (v6)
    objc_msgSend(v6, "cancel");
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));

}

- (void)configureRequest:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setMetalContextPriority:", 0);
  if (DeviceHasANE())
  {
    objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProcessingDevice:", v3);

  }
}

- (void)configureRequest:(id)a3 withRevision:(unint64_t)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setRevision:", a4);
  -[VCPMADVISceneClassificationTask configureRequest:](self, "configureRequest:", v6);

}

- (int)run
{
  unsigned __int8 v2;
  MADVISceneClassificationRequest *request;
  void *v5;
  MTLDevice *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  NSObject *cancelQueue;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  char v20;
  MTLDevice *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  char v25;
  MTLDevice *v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  char v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  MTLDevice *preferredMetalDevice;
  unsigned __int8 v43;
  NSObject *v44;
  os_signpost_id_t v45;
  NSObject *v46;
  NSObject *v47;
  NSString *signpostPayload;
  id v49;
  const void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  NSString *v56;
  NSObject *v57;
  os_signpost_id_t v58;
  NSObject *v59;
  NSObject *v60;
  NSString *v61;
  int v62;
  MTLDevice *v63;
  NSObject *v64;
  NSObject *v65;
  NSString *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  MADVISceneClassificationRequest *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  MADVISceneClassificationRequest *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint32_t v97;
  uint64_t v98;
  unsigned __int8 v99;
  id v101;
  void *v102;
  void *v103;
  MTLDevice *v104;
  id v105;
  id v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  MTLDevice *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[5];
  id v121;
  MTLDevice *v122;
  _QWORD v123[5];
  id v124;
  MTLDevice *v125;
  _QWORD v126[5];
  id v127;
  MTLDevice *v128;
  _QWORD v129[5];
  id v130;
  _QWORD block[5];
  id v132;
  id v133;
  unsigned int v134;
  const void *v135;
  id v136;
  _BYTE v137[128];
  uint64_t v138;
  void *v139;
  uint8_t buf[4];
  uint64_t v141;
  __int16 v142;
  MTLDevice *v143;
  uint64_t v144;
  _QWORD v145[4];

  v145[1] = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v2 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVISceneClassificationTask running...", buf, 2u);
    }
    v135 = 0;
    v134 = 0;
    if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &v135, &v134))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVISceneClassificationTask image loading failed", buf, 2u);
      }
      request = self->_request;
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v144 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v6 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
      v145[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, &v144, 1);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVISceneClassificationRequest setError:](request, "setError:", v7);
      v8 = 0;
      goto LABEL_101;
    }
    +[VCPMADVISceneClassificationResource sharedResource](VCPMADVISceneClassificationResource, "sharedResource");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateResource:", v114);
    v111 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0CEE020]);
    v113 = v10;
    if (!v10)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v82 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v141 = v82;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@", buf, 0xCu);
      }
      v6 = 0;
      v8 = -18;
      goto LABEL_100;
    }
    -[VCPMADVISceneClassificationTask configureRequest:](self, "configureRequest:", v10);
    objc_msgSend(v113, "setMaximumLeafObservations:", -[MADVISceneClassificationRequest maximumLeafObservations](self->_request, "maximumLeafObservations"));
    objc_msgSend(v113, "setMaximumHierarchicalObservations:", -[MADVISceneClassificationRequest maximumHierarchicalObservations](self->_request, "maximumHierarchicalObservations"));
    v11 = -[MADVISceneClassificationRequest classificationRevision](self->_request, "classificationRevision");
    v133 = 0;
    v12 = objc_msgSend(v113, "setRevision:error:", v11, &v133);
    v6 = (MTLDevice *)v133;
    if ((v12 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v83 = -[MADVISceneClassificationRequest classificationRevision](self->_request, "classificationRevision");
        *(_DWORD *)buf = 134218242;
        v141 = v83;
        v142 = 2112;
        v143 = v6;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set VNSceneClassificationRequest::setRevision %lu: %@", buf, 0x16u);
      }
      v84 = self->_request;
      v85 = (void *)MEMORY[0x1E0CB35C8];
      v138 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set VNSceneClassificationRequest::setRevision %lu: %@"), -[MADVISceneClassificationRequest classificationRevision](v84, "classificationRevision"), v6);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = v86;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVISceneClassificationRequest setError:](v84, "setError:", v88);

      v8 = 0;
      goto LABEL_100;
    }
    objc_msgSend(v112, "addObject:", v113);
    v13 = MEMORY[0x1E0C809B0];
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke;
    block[3] = &unk_1E6B16D58;
    block[4] = self;
    v15 = v113;
    v132 = v15;
    dispatch_sync(cancelQueue, block);
    v16 = objc_alloc_init(MEMORY[0x1E0CEE060]);
    if (!v16)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        v8 = -18;
LABEL_99:

LABEL_100:
        v7 = v111;
LABEL_101:

        CF<opaqueCMSampleBuffer *>::~CF(&v135);
        return v8;
      }
      v110 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v89 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v141 = v89;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@", buf, 0xCu);
      }
      v8 = -18;
LABEL_98:
      v16 = v110;
      goto LABEL_99;
    }
    v110 = v16;
    -[VCPMADVISceneClassificationTask configureRequest:withRevision:](self, "configureRequest:withRevision:", v16, -[MADVISceneClassificationRequest nsfwRevision](self->_request, "nsfwRevision"));
    objc_msgSend(v112, "addObject:", v16);
    v17 = self->_cancelQueue;
    v129[0] = v13;
    v129[1] = 3221225472;
    v129[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke_172;
    v129[3] = &unk_1E6B16D58;
    v129[4] = self;
    v108 = v16;
    v130 = v108;
    dispatch_sync(v17, v129);
    v18 = objc_alloc_init(MEMORY[0x1E0CEDD88]);
    if (!v18)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v90 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v141 = v90;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@", buf, 0xCu);
      }
      v8 = -18;
      goto LABEL_97;
    }
    v107 = v15;
    v109 = v18;
    -[VCPMADVISceneClassificationTask configureRequest:](self, "configureRequest:", v18);
    v19 = -[MADVISceneClassificationRequest significantEventRevision](self->_request, "significantEventRevision");
    v128 = v6;
    v20 = objc_msgSend(v18, "setRevision:error:", v19, &v128);
    v21 = v128;

    if ((v20 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v91 = -[MADVISceneClassificationRequest significantEventRevision](self->_request, "significantEventRevision");
        *(_DWORD *)buf = 134218242;
        v141 = v91;
        v142 = 2112;
        v143 = v21;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set VNClassifySignificantEventRequest::setRevision %lu: %@", buf, 0x16u);
      }
      v8 = -18;
      v6 = v21;
      goto LABEL_97;
    }
    objc_msgSend(v112, "addObject:", v18);
    v22 = self->_cancelQueue;
    v126[0] = v13;
    v126[1] = 3221225472;
    v126[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke_174;
    v126[3] = &unk_1E6B16D58;
    v126[4] = self;
    v105 = v18;
    v127 = v105;
    dispatch_sync(v22, v126);
    v23 = objc_alloc_init(MEMORY[0x1E0CEDFE8]);
    if (!v23)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v92 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v141 = v92;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@", buf, 0xCu);
      }
      v8 = -18;
      goto LABEL_96;
    }
    v106 = v23;
    -[VCPMADVISceneClassificationTask configureRequest:](self, "configureRequest:", v23);
    v24 = -[MADVISceneClassificationRequest recognizeObjectsRevision](self->_request, "recognizeObjectsRevision");
    v125 = v21;
    v25 = objc_msgSend(v23, "setRevision:error:", v24, &v125);
    v26 = v125;

    if ((v25 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v93 = -[MADVISceneClassificationRequest recognizeObjectsRevision](self->_request, "recognizeObjectsRevision");
        *(_DWORD *)buf = 134218242;
        v141 = v93;
        v142 = 2112;
        v143 = v26;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set VNRecognizeObjectsRequest::setRevision %lu: %@", buf, 0x16u);
      }
      v8 = -18;
      v21 = v26;
      goto LABEL_96;
    }
    objc_msgSend(v112, "addObject:", v23);
    v27 = self->_cancelQueue;
    v123[0] = v13;
    v123[1] = 3221225472;
    v123[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke_176;
    v123[3] = &unk_1E6B16D58;
    v123[4] = self;
    v28 = v23;
    v124 = v28;
    dispatch_sync(v27, v123);
    v29 = objc_alloc_init(MEMORY[0x1E0CEDF08]);
    v30 = v29;
    if (v29)
    {
      v102 = v28;
      v103 = v29;
      -[VCPMADVISceneClassificationTask configureRequest:](self, "configureRequest:", v29);
      v31 = -[MADVISceneClassificationRequest saliencyRevision](self->_request, "saliencyRevision");
      v122 = v26;
      v32 = objc_msgSend(v30, "setRevision:error:", v31, &v122);
      v104 = v122;

      if ((v32 & 1) != 0)
      {
        objc_msgSend(v112, "addObject:", v103);
        v33 = self->_cancelQueue;
        v120[0] = v13;
        v120[1] = 3221225472;
        v120[2] = __38__VCPMADVISceneClassificationTask_run__block_invoke_178;
        v120[3] = &unk_1E6B16D58;
        v120[4] = self;
        v101 = v103;
        v121 = v101;
        dispatch_sync(v33, v120);
        if (self->_preferredMetalDevice)
        {
          v118 = 0u;
          v119 = 0u;
          v116 = 0u;
          v117 = 0u;
          v34 = v112;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v116, v137, 16);
          if (v35)
          {
            v36 = *(_QWORD *)v117;
            v37 = MEMORY[0x1E0C81028];
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v117 != v36)
                  objc_enumerationMutation(v34);
                v39 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0CEDFC0], "deviceForMetalDevice:", self->_preferredMetalDevice);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "setProcessingDevice:", v40);

                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v39, "processingDevice");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  preferredMetalDevice = self->_preferredMetalDevice;
                  *(_DWORD *)buf = 138412546;
                  v141 = (uint64_t)v41;
                  v142 = 2112;
                  v143 = preferredMetalDevice;
                  _os_log_impl(&dword_1B6C4A000, v37, OS_LOG_TYPE_DEBUG, "[SceneClassification] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);

                }
              }
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v116, v137, 16);
            }
            while (v35);
          }

        }
        v43 = atomic_load((unsigned __int8 *)&self->_canceled);
        if ((v43 & 1) != 0)
        {
          v8 = -128;
LABEL_94:

          v30 = v103;
          v26 = v104;
          goto LABEL_95;
        }
        VCPSignPostLog();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = os_signpost_id_generate(v44);

        VCPSignPostLog();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          signpostPayload = self->_signpostPayload;
          *(_DWORD *)buf = 138412290;
          v141 = (uint64_t)signpostPayload;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v45, "VNImageRequestHandler_init", "%@", buf, 0xCu);
        }

        v49 = objc_alloc(MEMORY[0x1E0CEDF70]);
        v50 = v135;
        v51 = v134;
        objc_msgSend(v114, "session");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v49, "initWithCVPixelBuffer:orientation:options:session:", v50, v51, MEMORY[0x1E0C9AA70], v52);

        VCPSignPostLog();
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = v54;
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
        {
          v56 = self->_signpostPayload;
          *(_DWORD *)buf = 138412290;
          v141 = (uint64_t)v56;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v55, OS_SIGNPOST_INTERVAL_END, v45, "VNImageRequestHandler_init", "%@", buf, 0xCu);
        }

        VCPSignPostLog();
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = os_signpost_id_generate(v57);

        VCPSignPostLog();
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = v59;
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
        {
          v61 = self->_signpostPayload;
          *(_DWORD *)buf = 138412290;
          v141 = (uint64_t)v61;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v58, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
        }

        v115 = v104;
        v62 = objc_msgSend(v53, "performRequests:error:", v112, &v115);
        v63 = v115;

        v104 = v63;
        VCPSignPostLog();
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = v64;
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
        {
          v66 = self->_signpostPayload;
          *(_DWORD *)buf = 138412290;
          v141 = (uint64_t)v66;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v65, OS_SIGNPOST_INTERVAL_END, v58, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
        }

        if (v62)
        {
          v67 = objc_alloc_init(MEMORY[0x1E0D477F0]);
          objc_msgSend(v107, "results");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setClassificationObservations:", v68);

          objc_msgSend(v108, "results");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setNSFWObservations:", v69);

          objc_msgSend(v105, "results");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setSignificantEventObservations:", v70);

          objc_msgSend(v102, "results");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setRecognizedObjectObservations:", v71);

          objc_msgSend(v101, "results");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setSaliencyObservations:", v72);

          v73 = self->_request;
          v136 = v67;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v136, 1);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[MADVISceneClassificationRequest setResults:](v73, "setResults:", v74);

          v75 = objc_msgSend(v107, "executionNanoseconds");
          v76 = objc_msgSend(v108, "executionNanoseconds");
          v77 = objc_msgSend(v105, "executionNanoseconds");
          v78 = objc_msgSend(v102, "executionNanoseconds");
          v79 = objc_msgSend(v101, "executionNanoseconds");
          -[MADVISceneClassificationRequest results](self->_request, "results");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "firstObject");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setExecutionNanoseconds:", v76 + v75 + v77 + v78 + v79);

        }
        else
        {
          v99 = atomic_load((unsigned __int8 *)&self->_canceled);
          if ((v99 & 1) != 0)
          {
            v8 = -128;
LABEL_93:

            goto LABEL_94;
          }
          -[MADVISceneClassificationRequest setError:](self->_request, "setError:", v104);
        }
        objc_msgSend(v111, "reset");
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVISceneClassificationTask complete", buf, 2u);
        }
        v8 = 0;
        goto LABEL_93;
      }
      v30 = v103;
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v8 = -18;
        v26 = v104;
        goto LABEL_95;
      }
      v98 = -[MADVISceneClassificationRequest saliencyRevision](self->_request, "saliencyRevision");
      *(_DWORD *)buf = 134218242;
      v141 = v98;
      v142 = 2112;
      v26 = v104;
      v143 = v104;
      v95 = MEMORY[0x1E0C81028];
      v96 = "Failed to set VNGenerateAttentionBasedSaliencyImageRequest::setRevision %lu: %@";
      v97 = 22;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_83;
      v94 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v141 = v94;
      v95 = MEMORY[0x1E0C81028];
      v96 = "Failed to create %@";
      v97 = 12;
    }
    _os_log_impl(&dword_1B6C4A000, v95, OS_LOG_TYPE_ERROR, v96, buf, v97);
LABEL_83:
    v8 = -18;
LABEL_95:

    v21 = v26;
    v23 = v106;
LABEL_96:

    v6 = v21;
    v18 = v109;
LABEL_97:

    goto LABEL_98;
  }
  return -128;
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke_172(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke_174(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke_176(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

id __38__VCPMADVISceneClassificationTask_run__block_invoke_178(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakSaliencyRequest);
  objc_destroyWeak((id *)&self->_weakRecognizedObjectsRequest);
  objc_destroyWeak((id *)&self->_weakSignificantEventRequest);
  objc_destroyWeak((id *)&self->_weakNSFWRequest);
  objc_destroyWeak((id *)&self->_weakClassificationRequest);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
