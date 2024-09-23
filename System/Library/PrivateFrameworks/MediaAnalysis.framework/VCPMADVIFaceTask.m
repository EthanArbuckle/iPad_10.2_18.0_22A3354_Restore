@implementation VCPMADVIFaceTask

- (VCPMADVIFaceTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADVIFaceTask *v12;
  VCPMADVIFaceTask *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *cancelQueue;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPMADVIFaceTask;
  v12 = -[VCPMADVIFaceTask init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
    v14 = dispatch_queue_create("VCPMADVIFaceTask", 0);
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
  block[2] = __26__VCPMADVIFaceTask_cancel__block_invoke;
  block[3] = &unk_1E6B15468;
  block[4] = self;
  dispatch_sync(cancelQueue, block);
}

void __26__VCPMADVIFaceTask_cancel__block_invoke(uint64_t a1)
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

- (int)run
{
  unsigned __int8 v2;
  MADVIFaceRequest *request;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  MADVIFaceRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *cancelQueue;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSString *signpostPayload;
  id v24;
  const void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  NSString *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  NSString *v35;
  void *v36;
  char v37;
  NSObject *v38;
  NSObject *v39;
  NSString *v40;
  void *v41;
  uint64_t v42;
  int v43;
  id v44;
  void *v45;
  MADVIFaceRequest *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  MADVIFaceRequest *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  void *v61;
  MADVIFaceRequest *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  id v70;
  void *v71;
  MADVIFaceRequest *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  id v80;
  void *v81;
  MADVIFaceRequest *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  NSObject *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t i;
  void *v94;
  void *v95;
  void *v96;
  MTLDevice *preferredMetalDevice;
  unsigned __int8 v98;
  NSObject *v99;
  os_signpost_id_t v100;
  NSObject *v101;
  NSObject *v102;
  NSString *v103;
  int v104;
  id v105;
  NSObject *v106;
  NSObject *v107;
  NSString *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  MADVIFaceRequest *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  unsigned __int8 v124;
  id v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _QWORD v145[5];
  id v146;
  id v147;
  _QWORD v148[5];
  id v149;
  id v150;
  _QWORD v151[5];
  id v152;
  id v153;
  _QWORD v154[5];
  id v155;
  id v156;
  id v157;
  _QWORD block[5];
  id v159;
  id v160;
  unsigned int v161;
  const void *v162;
  id v163;
  uint8_t buf[4];
  uint64_t v165;
  __int16 v166;
  MTLDevice *v167;
  _BYTE v168[128];
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  id v178;
  id v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  _QWORD v183[4];

  v183[1] = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v2 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIFaceTask running...", buf, 2u);
    }
    v162 = 0;
    v161 = 0;
    if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &v162, &v161))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADVIFaceTask image loading failed", buf, 2u);
      }
      request = self->_request;
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v182 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v183[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v183, &v182, 1);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v139);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIFaceRequest setError:](request, "setError:", v7);
      v8 = 0;
      goto LABEL_43;
    }
    +[VCPMADVIFaceResource sharedResource](VCPMADVIFaceResource, "sharedResource");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateResource:", v139);
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    +[VCPDefaultPhotoLibraryManager sharedManager](VCPDefaultPhotoLibraryManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultPhotoLibrary");
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:](VCPPhotosFaceProcessingContext, "contextWithPhotoLibrary:", v138);
    v160 = 0;
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v160, objc_opt_class(), objc_msgSend(v137, "processingVersion"));
    v11 = v160;
    v135 = v11;
    if ((_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPMADVIFaceTask] Failed to configuate VNDetectFaceRectanglesRequest"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v165 = (uint64_t)v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v13 = self->_request;
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v180 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIFaceRequest setError:](v13, "setError:", v17);

      v6 = 0;
      v8 = 0;
      goto LABEL_42;
    }
    cancelQueue = self->_cancelQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__VCPMADVIFaceTask_run__block_invoke;
    block[3] = &unk_1E6B16D58;
    block[4] = self;
    v133 = v11;
    v159 = v133;
    dispatch_sync(cancelQueue, block);
    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_generate(v19);

    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v165 = (uint64_t)signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VCPMADVIFaceTask_VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    v24 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v25 = v162;
    v26 = v161;
    objc_msgSend(v139, "session");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = (void *)objc_msgSend(v24, "initWithCVPixelBuffer:orientation:options:session:", v25, v26, MEMORY[0x1E0C9AA70], v27);

    VCPSignPostLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      v30 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v165 = (uint64_t)v30;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_END, v20, "VCPMADVIFaceTask_VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    VCPSignPostLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_signpost_id_generate(v31);

    VCPSignPostLog();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      v35 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v165 = (uint64_t)v35;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "VCPMADVIFaceTask_detectFace", "%@", buf, 0xCu);
    }

    v179 = v133;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v179, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = 0;
    v37 = objc_msgSend(v134, "performRequests:error:", v36, &v157);
    v6 = v157;

    if ((v37 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[≈] Failed to detect faces - %@"), v6);
      v51 = objc_claimAutoreleasedReturnValue();
      v131 = (void *)v51;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v165 = v51;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v52 = self->_request;
      v53 = (void *)MEMORY[0x1E0CB35C8];
      v177 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v51);
      v132 = (id)objc_claimAutoreleasedReturnValue();
      v178 = v132;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIFaceRequest setError:](v52, "setError:", v55);

      goto LABEL_39;
    }
    VCPSignPostLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      v40 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v165 = (uint64_t)v40;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v39, OS_SIGNPOST_INTERVAL_END, v32, "VCPMADVIFaceTask_detectFace", "%@", buf, 0xCu);
    }

    objc_msgSend(v133, "results");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");

    if (!v42)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPMADVIFaceTask] No face detected from CVPixelBuffer", buf, 2u);
      }
      -[MADVIFaceRequest setResults:](self->_request, "setResults:", MEMORY[0x1E0C9AA60]);
      v8 = 0;
      goto LABEL_41;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = 0;
    v43 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v156, objc_opt_class(), objc_msgSend(v137, "processingVersion"));
    v44 = v156;
    v132 = v44;
    if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPMADVIFaceTask] Failed to configuate VNCreateFaceprintRequest"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v165 = (uint64_t)v45;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v46 = self->_request;
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v175 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = v48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIFaceRequest setError:](v46, "setError:", v50);

LABEL_39:
      v8 = 0;
LABEL_40:

LABEL_41:
LABEL_42:

      v7 = v136;
LABEL_43:

      CF<opaqueCMSampleBuffer *>::~CF(&v162);
      return v8;
    }
    v57 = v44;
    objc_msgSend(v133, "results");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setInputFaceObservations:", v58);

    objc_msgSend(v131, "addObject:", v132);
    v59 = self->_cancelQueue;
    v154[0] = MEMORY[0x1E0C809B0];
    v154[1] = 3221225472;
    v154[2] = __23__VCPMADVIFaceTask_run__block_invoke_184;
    v154[3] = &unk_1E6B16D58;
    v154[4] = self;
    v132 = v132;
    v155 = v132;
    dispatch_sync(v59, v154);
    v153 = 0;
    LODWORD(v59) = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v153, objc_opt_class(), objc_msgSend(v137, "processingVersion"));
    v60 = v153;
    v130 = v60;
    if ((_DWORD)v59)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPMADVIFaceTask] Failed to configuate VNClassifyFaceAttributesRequest"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v165 = (uint64_t)v61;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v62 = self->_request;
      v63 = (void *)MEMORY[0x1E0CB35C8];
      v173 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v61);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = v64;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIFaceRequest setError:](v62, "setError:", v66);

      v8 = 0;
      goto LABEL_95;
    }
    v67 = v60;
    objc_msgSend(v133, "results");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setInputFaceObservations:", v68);

    objc_msgSend(v131, "addObject:", v130);
    v69 = self->_cancelQueue;
    v151[0] = MEMORY[0x1E0C809B0];
    v151[1] = 3221225472;
    v151[2] = __23__VCPMADVIFaceTask_run__block_invoke_188;
    v151[3] = &unk_1E6B16D58;
    v151[4] = self;
    v128 = v130;
    v152 = v128;
    dispatch_sync(v69, v151);
    v150 = 0;
    LODWORD(v69) = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v150, objc_opt_class(), objc_msgSend(v137, "processingVersion"));
    v70 = v150;
    v129 = v70;
    if ((_DWORD)v69)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPMADVIFaceTask] Failed to configuate VNDetectFaceExpressionsRequest"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v165 = (uint64_t)v71;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v72 = self->_request;
      v73 = (void *)MEMORY[0x1E0CB35C8];
      v171 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v71);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = v74;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIFaceRequest setError:](v72, "setError:", v76);

      v8 = 0;
      goto LABEL_94;
    }
    v77 = v70;
    objc_msgSend(v133, "results");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setInputFaceObservations:", v78);

    objc_msgSend(v131, "addObject:", v129);
    v79 = self->_cancelQueue;
    v148[0] = MEMORY[0x1E0C809B0];
    v148[1] = 3221225472;
    v148[2] = __23__VCPMADVIFaceTask_run__block_invoke_192;
    v148[3] = &unk_1E6B16D58;
    v148[4] = self;
    v126 = v129;
    v149 = v126;
    dispatch_sync(v79, v148);
    v147 = 0;
    LODWORD(v79) = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v147, objc_opt_class(), objc_msgSend(v137, "processingVersion"));
    v80 = v147;
    v127 = v80;
    if ((_DWORD)v79)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[VCPMADVIFaceTask] Failed to configuate VNDetectFaceLandmarksRequest"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v165 = (uint64_t)v81;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v82 = self->_request;
      v83 = (void *)MEMORY[0x1E0CB35C8];
      v169 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v81);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = v84;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADVIFaceRequest setError:](v82, "setError:", v86);

      v8 = 0;
      goto LABEL_93;
    }
    v87 = v80;
    objc_msgSend(v133, "results");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setInputFaceObservations:", v88);

    objc_msgSend(v131, "addObject:", v127);
    v89 = self->_cancelQueue;
    v145[0] = MEMORY[0x1E0C809B0];
    v145[1] = 3221225472;
    v145[2] = __23__VCPMADVIFaceTask_run__block_invoke_196;
    v145[3] = &unk_1E6B16D58;
    v145[4] = self;
    v125 = v127;
    v146 = v125;
    dispatch_sync(v89, v145);
    if (self->_preferredMetalDevice)
    {
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v90 = v131;
      v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v141, v168, 16);
      if (v91)
      {
        v92 = *(_QWORD *)v142;
        do
        {
          for (i = 0; i != v91; ++i)
          {
            if (*(_QWORD *)v142 != v92)
              objc_enumerationMutation(v90);
            v94 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CEDFC0], "deviceForMetalDevice:", self->_preferredMetalDevice);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setProcessingDevice:", v95);

            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v94, "processingDevice");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              preferredMetalDevice = self->_preferredMetalDevice;
              *(_DWORD *)buf = 138412546;
              v165 = (uint64_t)v96;
              v166 = 2112;
              v167 = preferredMetalDevice;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VCPMADVIFaceTask] Set VNProcessingDevice: %@ (%@)", buf, 0x16u);

            }
          }
          v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v141, v168, 16);
        }
        while (v91);
      }

    }
    v98 = atomic_load((unsigned __int8 *)&self->_canceled);
    if ((v98 & 1) == 0)
    {
      VCPSignPostLog();
      v99 = objc_claimAutoreleasedReturnValue();
      v100 = os_signpost_id_generate(v99);

      VCPSignPostLog();
      v101 = objc_claimAutoreleasedReturnValue();
      v102 = v101;
      if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
      {
        v103 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v165 = (uint64_t)v103;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v102, OS_SIGNPOST_INTERVAL_BEGIN, v100, "VCPMADVIFaceTask_additionalFaceRequests", "%@", buf, 0xCu);
      }

      v140 = v6;
      v104 = objc_msgSend(v134, "performRequests:error:", v131, &v140);
      v105 = v140;

      v6 = v105;
      VCPSignPostLog();
      v106 = objc_claimAutoreleasedReturnValue();
      v107 = v106;
      if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
      {
        v108 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v165 = (uint64_t)v108;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v107, OS_SIGNPOST_INTERVAL_END, v100, "VCPMADVIFaceTask_additionalFaceRequests", "%@", buf, 0xCu);
      }

      if (v104)
      {
        v109 = objc_alloc_init(MEMORY[0x1E0D477C0]);
        objc_msgSend(v133, "results");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setFaceRectanglesObservations:", v110);

        objc_msgSend(v132, "results");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setFaceprintObservations:", v111);

        objc_msgSend(v128, "results");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setFaceAttributesObservations:", v112);

        objc_msgSend(v126, "results");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setFaceExpressionsObservations:", v113);

        objc_msgSend(v125, "results");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "setFaceLandmarksObservations:", v114);

        v115 = self->_request;
        v163 = v109;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v163, 1);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[MADVIFaceRequest setResults:](v115, "setResults:", v116);

        v117 = objc_msgSend(v133, "executionNanoseconds");
        v118 = objc_msgSend(v132, "executionNanoseconds");
        v119 = objc_msgSend(v128, "executionNanoseconds");
        v120 = objc_msgSend(v126, "executionNanoseconds");
        v121 = objc_msgSend(v125, "executionNanoseconds");
        -[MADVIFaceRequest results](self->_request, "results");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "firstObject");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "setExecutionNanoseconds:", v118 + v117 + v119 + v120 + v121);

        goto LABEL_87;
      }
      v124 = atomic_load((unsigned __int8 *)&self->_canceled);
      if ((v124 & 1) == 0)
      {
        -[MADVIFaceRequest setError:](self->_request, "setError:", v6);
LABEL_87:
        objc_msgSend(v136, "reset");
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADVIFaceTask complete", buf, 2u);
        }
        v8 = 0;
        goto LABEL_92;
      }
    }
    v8 = -128;
LABEL_92:

LABEL_93:
LABEL_94:

LABEL_95:
    goto LABEL_40;
  }
  return -128;
}

id __23__VCPMADVIFaceTask_run__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

id __23__VCPMADVIFaceTask_run__block_invoke_184(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

id __23__VCPMADVIFaceTask_run__block_invoke_188(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

id __23__VCPMADVIFaceTask_run__block_invoke_192(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

id __23__VCPMADVIFaceTask_run__block_invoke_196(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakFaceLandmarksRequest);
  objc_destroyWeak((id *)&self->_weakFaceExpressionsRequest);
  objc_destroyWeak((id *)&self->_weakFaceAttributesRequest);
  objc_destroyWeak((id *)&self->_weakFaceprintRequest);
  objc_destroyWeak((id *)&self->_weakFaceRectanglesRequest);
  objc_storeStrong((id *)&self->_cancelQueue, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
