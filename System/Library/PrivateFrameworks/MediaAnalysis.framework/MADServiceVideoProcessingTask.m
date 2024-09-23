@implementation MADServiceVideoProcessingTask

- (MADServiceVideoProcessingTask)initWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 resultHandler:(id)a7 andCompletionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  MADServiceVideoProcessingTask *v22;
  MADServiceVideoProcessingTask *v23;
  void *v24;
  id progressHandler;
  void *v26;
  id resultHandler;
  void *v28;
  id completionHandler;
  objc_super v31;
  _QWORD v32[4];
  id v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __122__MADServiceVideoProcessingTask_initWithRequests_forAsset_cancelBlock_progressHandler_resultHandler_andCompletionHandler___block_invoke;
  v32[3] = &unk_1E6B16938;
  v21 = v20;
  v33 = v21;
  v31.receiver = self;
  v31.super_class = (Class)MADServiceVideoProcessingTask;
  v22 = -[VCPMABaseTask initWithCompletionHandler:](&v31, sel_initWithCompletionHandler_, v32);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_requests, a3);
    objc_storeStrong((id *)&v23->_asset, a4);
    v24 = _Block_copy(v18);
    progressHandler = v23->_progressHandler;
    v23->_progressHandler = v24;

    v26 = _Block_copy(v19);
    resultHandler = v23->_resultHandler;
    v23->_resultHandler = v26;

    v28 = _Block_copy(v21);
    completionHandler = v23->_completionHandler;
    v23->_completionHandler = v28;

    -[VCPMABaseTask setCancelBlock:](v23, "setCancelBlock:", v17);
  }

  return v23;
}

uint64_t __122__MADServiceVideoProcessingTask_initWithRequests_forAsset_cancelBlock_progressHandler_resultHandler_andCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)taskWithRequests:(id)a3 forAsset:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 resultHandler:(id)a7 andCompletionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequests:forAsset:cancelBlock:progressHandler:resultHandler:andCompletionHandler:", v18, v17, v16, v15, v14, v13);

  return v19;
}

- (BOOL)cachesResources
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_requests;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isMemberOfClass:", objc_opt_class(), (_QWORD)v10) & 1) == 0
          && !objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
        {
          v8 = 0;
          goto LABEL_12;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_12:

  return v8;
}

- (BOOL)run:(id *)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  MADServiceVideoProcessingTask *v8;
  VCPVideoProcessor *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  NSString *signpostPayload;
  BOOL v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSString *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id progressHandler;
  BOOL v39;
  uint64_t v40;
  _QWORD *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  BOOL v47;
  id v48;
  void (**v49)(void *, void *, void *);
  id v50;
  void *v51;
  MADServiceVideoAsset *asset;
  void *v53;
  NSObject *v54;
  os_signpost_id_t v55;
  NSObject *v56;
  NSObject *v57;
  NSString *v58;
  NSObject *v59;
  id v60;
  void *v61;
  id v62;
  NSObject *v63;
  NSObject *v64;
  NSString *v65;
  unint64_t v66;
  id v67;
  _QWORD *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  MADServiceVideoAsset *v73;
  void *v74;
  NSObject *v75;
  os_signpost_id_t v76;
  NSObject *v77;
  NSObject *v78;
  NSString *v79;
  NSObject *v80;
  id v81;
  void *v82;
  id v83;
  NSObject *v84;
  NSObject *v85;
  NSString *v86;
  NSObject *v87;
  id v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  unint64_t m;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v108;
  uint64_t v109;
  uint64_t v111;
  void *v113;
  void (**v114)(void *, void *, void *);
  VCPVideoProcessor *context;
  void *contexta;
  void *contextb;
  void *v118;
  __int128 v119;
  _QWORD v120[5];
  _QWORD v121[4];
  id v122;
  void (**v123)(void *, void *, void *);
  unint64_t v124;
  _QWORD v125[5];
  id v126;
  unint64_t v127;
  _QWORD v128[5];
  _QWORD v129[4];
  id v130;
  id v131;
  void (**v132)(void *, void *, void *);
  _QWORD v133[5];
  _QWORD v134[2];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint64_t v140;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[5];
  id v147;
  _QWORD aBlock[6];
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t (*v152)(uint64_t, uint64_t);
  void (*v153)(uint64_t);
  id v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;
  void *v160;
  uint64_t v161;
  void *v162;
  uint8_t v163[128];
  uint8_t buf[16];
  uint64_t v165;
  _BYTE v166[128];
  _BYTE v167[128];
  uint64_t v168;

  v168 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v3 = self->_requests;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
  if (v4)
  {
    v119 = 0uLL;
    v5 = *(_QWORD *)v156;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v156 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * i);
        if (*((_QWORD *)&v119 + 1) || !objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
        {
          if ((_QWORD)v119 || !objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
          {
            if (+[MADServiceVideoProcessingSubtask taskClassForRequest:](MADServiceVideoProcessingSubtask, "taskClassForRequest:", v7))
            {
              objc_msgSend(v118, "addObject:", v7);
            }
            else
            {
              objc_msgSend(v113, "addObject:", v7);
            }
          }
          else
          {
            *(_QWORD *)&v119 = v7;
          }
        }
        else
        {
          *((_QWORD *)&v119 + 1) = v7;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
    }
    while (v4);
  }
  else
  {
    v119 = 0uLL;
  }

  v149 = 0;
  v150 = &v149;
  v151 = 0x3032000000;
  v152 = __Block_byref_object_copy__59;
  v153 = __Block_byref_object_dispose__59;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v154 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__MADServiceVideoProcessingTask_run___block_invoke;
  aBlock[3] = &unk_1E6B1B710;
  aBlock[4] = self;
  aBlock[5] = &v149;
  v114 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v8 = self;
  if (objc_msgSend(v113, "count"))
  {
    v9 = [VCPVideoProcessor alloc];
    -[MADServiceVideoAsset url](self->_asset, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    context = -[VCPVideoProcessor initWithURL:](v9, "initWithURL:", v10);

    if (self->_progressHandler)
    {
      v146[0] = MEMORY[0x1E0C809B0];
      v146[1] = 3221225472;
      v146[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_136;
      v146[3] = &unk_1E6B1B738;
      v146[4] = self;
      v147 = v113;
      -[VCPVideoProcessor setProgressHandler:](context, "setProgressHandler:", v146);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    v12 = v113;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v142, v166, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v143;
      v15 = MEMORY[0x1E0C81028];
      v111 = 138412290;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v143 != v14)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * j);
          +[MADServiceVideoTask taskForRequest:](MADServiceVideoTask, "taskForRequest:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "configureVideoProcessor:", context);
            objc_msgSend(v11, "addObject:", v19);
          }
          else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v17;
            _os_log_impl(&dword_1B6C4A000, v15, OS_LOG_TYPE_ERROR, "Failed to create task for request (%@)", buf, 0xCu);
          }

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v142, v166, 16);
      }
      while (v13);
    }

    VCPSignPostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);

    VCPSignPostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
    }

    v141 = 0;
    *(_OWORD *)buf = *MEMORY[0x1E0CA2E68];
    v165 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v139 = *MEMORY[0x1E0CA2E30];
    v140 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
    v25 = -[VCPVideoProcessor analyzeWithStart:andDuration:error:](context, "analyzeWithStart:andDuration:error:", buf, &v139, &v141);
    v26 = v141;
    if (!v25)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v42 = MEMORY[0x1E0C81028];
        v43 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v26, "description");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v44;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to process video (%@)", buf, 0xCu);

        }
      }
      if (a3)
      {
        v45 = (void *)objc_msgSend(v26, "copy");
        v46 = *a3;
        *a3 = v45;

      }
      v47 = 0;
      goto LABEL_117;
    }
    VCPSignPostLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      v29 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v29;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v28, OS_SIGNPOST_INTERVAL_END, v21, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
    }

    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v30 = v11;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v136;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v136 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * k);
          objc_msgSend(v34, "finalize");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "request");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v114[2](v114, v36, v35);

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
      }
      while (v31);
    }

    v8 = self;
  }
  if (v119 != 0)
  {
    v37 = (void *)MEMORY[0x1BCCA1B2C]();
    progressHandler = self->_progressHandler;
    if (progressHandler)
    {
      if ((_QWORD)v119)
        v39 = *((_QWORD *)&v119 + 1) == 0;
      else
        v39 = 1;
      if (v39)
        v40 = 1;
      else
        v40 = 2;
      v133[0] = MEMORY[0x1E0C809B0];
      v133[1] = 3221225472;
      v133[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_140;
      v133[3] = &unk_1E6B1B760;
      v41 = v133;
      v133[4] = self;
      v111 = (uint64_t)v134;
      v134[0] = v113;
      v134[1] = v40;
    }
    else
    {
      v41 = 0;
    }
    contexta = _Block_copy(v41);
    v129[0] = MEMORY[0x1E0C809B0];
    v129[1] = 3221225472;
    v129[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_2;
    v129[3] = &unk_1E6B1B788;
    v48 = *((id *)&v119 + 1);
    v130 = v48;
    v49 = v114;
    v132 = v49;
    v50 = (id)v119;
    v131 = v50;
    v51 = _Block_copy(v129);
    asset = self->_asset;
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_3;
    v128[3] = &unk_1E6B1B7B0;
    v128[4] = self;
    +[MADVideoRemoveBackgroundCropTask taskWithAsset:previewRequest:generationRequest:cancelBlock:progressHandler:resultHandler:completionHandler:](MADVideoRemoveBackgroundCropTask, "taskWithAsset:previewRequest:generationRequest:cancelBlock:progressHandler:resultHandler:completionHandler:", asset, v48, v50, v128, contexta, v49, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setSignpostPayload:", self->_signpostPayload);
    VCPSignPostLog();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_signpost_id_generate(v54);

    VCPSignPostLog();
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      v58 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v58;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v57, OS_SIGNPOST_INTERVAL_BEGIN, v55, "MADServiceVideoProcessingSubtask_Run", "%@", buf, 0xCu);
    }

    if (objc_msgSend(v53, "run") && (int)MediaAnalysisLogLevel() >= 3)
    {
      v59 = MEMORY[0x1E0C81028];
      v60 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v61 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v61;
        v62 = v61;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to perform subtask %@", buf, 0xCu);

      }
    }
    VCPSignPostLog();
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      v65 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v65;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v64, OS_SIGNPOST_INTERVAL_END, v55, "MADServiceVideoProcessingSubtask_Run", "%@", buf, 0xCu);
    }

    if (progressHandler)
    objc_autoreleasePoolPop(v37);
    v8 = self;
  }
  v66 = 0;
  v108 = *MEMORY[0x1E0CB2F90];
  v109 = *MEMORY[0x1E0CB2D50];
  while (v66 < objc_msgSend(v118, "count"))
  {
    contextb = (void *)MEMORY[0x1BCCA1B2C]();
    v67 = self->_progressHandler;
    if (v67)
    {
      v125[0] = MEMORY[0x1E0C809B0];
      v125[1] = 3221225472;
      v125[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_145;
      v125[3] = &unk_1E6B1B760;
      v125[4] = self;
      v126 = v113;
      v127 = v66;
      v68 = v125;
    }
    else
    {
      v68 = 0;
    }
    v69 = _Block_copy(v68);
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_2_146;
    v121[3] = &unk_1E6B1B7D8;
    v123 = v114;
    v70 = v118;
    v122 = v70;
    v124 = v66;
    v71 = _Block_copy(v121);
    objc_msgSend(v70, "objectAtIndexedSubscript:", v66);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = self->_asset;
    v120[0] = MEMORY[0x1E0C809B0];
    v120[1] = 3221225472;
    v120[2] = __37__MADServiceVideoProcessingTask_run___block_invoke_3_148;
    v120[3] = &unk_1E6B1B7B0;
    v120[4] = self;
    +[MADServiceVideoProcessingSubtask taskWithRequest:forAsset:cancelBlock:progressHandler:andCompletionHandler:](MADServiceVideoProcessingSubtask, "taskWithRequest:forAsset:cancelBlock:progressHandler:andCompletionHandler:", v72, v73, v120, v69, v71);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      objc_msgSend(v74, "setSignpostPayload:", self->_signpostPayload);
      VCPSignPostLog();
      v75 = objc_claimAutoreleasedReturnValue();
      v76 = os_signpost_id_generate(v75);

      VCPSignPostLog();
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = v77;
      if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
      {
        v79 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v79;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v78, OS_SIGNPOST_INTERVAL_BEGIN, v76, "MADServiceVideoProcessingSubtask_Run", "%@", buf, 0xCu);
      }

      if (objc_msgSend(v74, "run") && (int)MediaAnalysisLogLevel() >= 3)
      {
        v80 = MEMORY[0x1E0C81028];
        v81 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          v82 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v82;
          v83 = v82;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to perform subtask %@", buf, 0xCu);

        }
      }
      VCPSignPostLog();
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = v84;
      if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
      {
        v86 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v86;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v85, OS_SIGNPOST_INTERVAL_END, v76, "MADServiceVideoProcessingSubtask_Run", "%@", buf, 0xCu);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v87 = MEMORY[0x1E0C81028];
        v88 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v70, "objectAtIndexedSubscript:", v66);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v90;
          v91 = v90;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create subtask for unrecognized request %@", buf, 0xCu);

        }
      }
      if (!a3)
        goto LABEL_104;
      v92 = (void *)MEMORY[0x1E0CB35C8];
      v161 = v109;
      v93 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v70, "objectAtIndexedSubscript:", v66);
      v85 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "stringWithFormat:", CFSTR("Unable to create subtask for unrecognized request %@"), objc_opt_class());
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = v94;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "errorWithDomain:code:userInfo:", v108, -50, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = *a3;
      *a3 = v96;

    }
LABEL_104:

    if (v67)
    objc_autoreleasePoolPop(contextb);
    v8 = self;
    ++v66;
    if (!v74)
    {
      v47 = 0;
      goto LABEL_118;
    }
  }
  if (!v8->_resultHandler)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    context = (VCPVideoProcessor *)objc_claimAutoreleasedReturnValue();
    for (m = 0; m < -[NSArray count](self->_requests, "count"); ++m)
    {
      v99 = (void *)v150[5];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", m);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "objectForKeyedSubscript:", v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      if (v101)
      {
        -[VCPVideoProcessor addObject:](context, "addObject:", v101);
      }
      else
      {
        v102 = objc_alloc_init(MEMORY[0x1E0D47888]);
        v103 = (void *)MEMORY[0x1E0CB35C8];
        v159 = v109;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request produced no payload"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = v104;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "errorWithDomain:code:userInfo:", v108, -18, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "setError:", v106);

        -[VCPVideoProcessor addObject:](context, "addObject:", v102);
      }

    }
    (*((void (**)(void))self->_completionHandler + 2))();
    v47 = 1;
LABEL_117:

    goto LABEL_118;
  }
  (*((void (**)(void))v8->_completionHandler + 2))();
  v47 = 1;
LABEL_118:

  _Block_object_dispose(&v149, 8);
  return v47;
}

void __37__MADServiceVideoProcessingTask_run___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  os_log_type_t v10;
  uint32_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "indexOfObject:", v5);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v22 = 67109120;
      LODWORD(v23) = -1;
      v8 = MEMORY[0x1E0C81028];
      v9 = "Failed to find request at index %d to update increment result";
      v10 = OS_LOG_TYPE_ERROR;
      v11 = 8;
LABEL_9:
      _os_log_impl(&dword_1B6C4A000, v8, v10, v9, (uint8_t *)&v22, v11);
    }
  }
  else
  {
    v12 = v7;
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412546;
        v23 = objc_opt_class();
        v24 = 1024;
        v25 = v12;
        v8 = MEMORY[0x1E0C81028];
        v9 = "Request %@ (index %d) already has result, skip updating";
        v10 = OS_LOG_TYPE_DEFAULT;
        v11 = 18;
        goto LABEL_9;
      }
    }
    else
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      if (v16)
      {
        (*(void (**)(uint64_t, id, uint64_t))(v16 + 16))(v16, v6, v12);
        v17 = objc_alloc_init(MEMORY[0x1E0D47888]);
        v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

      }
      else
      {
        v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v6, v21);

      }
    }
  }

}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_136(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), (double)(100* (objc_msgSend(*(id *)(a1 + 40), "count")/ (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")))* a2);
}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_140(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), ((double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "count")+ (double)*(unint64_t *)(a1 + 48) * a2)/ (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")* 100.0);
}

void __37__MADServiceVideoProcessingTask_run___block_invoke_2(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x1E0D47888];
    v4 = a2;
    v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setError:", v4);

    if (a1[4])
      (*(void (**)(void))(a1[6] + 16))();
    if (a1[5])
      (*(void (**)(void))(a1[6] + 16))();

  }
}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCanceled");
}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_145(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), ((double)(unint64_t)(*(_QWORD *)(a1 + 48) + objc_msgSend(*(id *)(a1 + 40), "count")) + a2)/ (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")* 100.0);
}

void __37__MADServiceVideoProcessingTask_run___block_invoke_2_146(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v2 = a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v6, v5);

}

uint64_t __37__MADServiceVideoProcessingTask_run___block_invoke_3_148(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isCanceled");
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
