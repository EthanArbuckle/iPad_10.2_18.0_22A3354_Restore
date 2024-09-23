@implementation VCPMADPersonIdentificationTask

- (VCPMADPersonIdentificationTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADPersonIdentificationTask *v12;
  VCPMADPersonIdentificationTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADPersonIdentificationTask;
  v12 = -[VCPMADPersonIdentificationTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
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

+ (id)taskName
{
  return CFSTR("VCPMADPersonIdentificationTask");
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
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (int)run
{
  NSObject *v2;
  id v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  MADPersonIdentificationRequest *request;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  VCPMADServiceImageAsset *imageAsset;
  MADPersonIdentificationRequest *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MADPersonIdentificationRequest *v25;
  void *v26;
  void *v27;
  int v28;
  MADPersonIdentificationRequest *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  NSString *signpostPayload;
  id v37;
  CFTypeRef v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  NSString *v42;
  NSObject *v43;
  os_signpost_id_t v44;
  NSObject *v45;
  NSObject *v46;
  NSString *v47;
  void *v48;
  char v49;
  NSObject *v50;
  NSObject *v51;
  NSString *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  NSObject *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  MADPersonIdentificationRequest *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  os_signpost_id_t v75;
  NSObject *v76;
  NSObject *v77;
  NSString *v78;
  void *v79;
  char v80;
  id v81;
  NSObject *v82;
  NSObject *v83;
  NSString *v84;
  void *v85;
  _BOOL4 v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  NSString *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  id v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  float v106;
  float v107;
  void *v108;
  float v109;
  NSObject *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  NSObject *v130;
  NSObject *v131;
  id v132;
  NSObject *v133;
  id v134;
  void *v135;
  uint64_t v136;
  NSObject *v137;
  NSObject *v138;
  NSString *v139;
  MADPersonIdentificationRequest *v140;
  void *v141;
  void *v142;
  id v143;
  uint64_t v144;
  MADPersonIdentificationRequest *v145;
  void *v146;
  void *v147;
  void *v148;
  os_signpost_id_t spid;
  void *v151;
  void *v152;
  id v153;
  id v154;
  void *v155;
  id v156;
  void *v157;
  id obj;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  void *context;
  uint64_t v166;
  void *v167;
  void *v168;
  id v170;
  id v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  id v176;
  id v177;
  id v178;
  id v179;
  int v180;
  CFTypeRef cf;
  _QWORD v182[4];
  id v183;
  VCPMADPersonIdentificationTask *v184;
  id v185;
  void *v186;
  void *v187;
  id v188;
  uint8_t buf[4];
  uint64_t v190;
  __int16 v191;
  uint64_t v192;
  __int16 v193;
  uint64_t v194;
  __int16 v195;
  double v196;
  __int16 v197;
  id v198;
  _BYTE v199[128];
  uint64_t v200;
  NSObject *v201;
  id v202;
  uint64_t v203;
  NSObject *v204;
  id v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  uint64_t v210;
  uint64_t v211;
  _QWORD v212[4];

  v212[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "taskName");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v190 = (uint64_t)v168;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] running ...", buf, 0xCu);
    }

  }
  v4 = atomic_load((unsigned __int8 *)&self->_canceled);
  if ((v4 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VCPMADServiceImageAsset asset](self->_imageAsset, "asset");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fetchPropertySetsIfNeeded");
      objc_msgSend(v5, "importProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = objc_msgSend(v6, "importedBy") == 2;

    }
    else
    {
      v166 = -1;
    }
    -[VCPMADServiceImageAsset faces](self->_imageAsset, "faces");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v167, "count"))
    {
      objc_msgSend(v167, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "librarySpecificFetchOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v182[0] = MEMORY[0x1E0C809B0];
      v182[1] = 3221225472;
      v182[2] = __37__VCPMADPersonIdentificationTask_run__block_invoke;
      v182[3] = &unk_1E6B17C28;
      v12 = v10;
      v183 = v12;
      v184 = self;
      v13 = v11;
      v185 = v13;
      objc_msgSend(v167, "enumerateObjectsUsingBlock:", v182);
      request = self->_request;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47730]), "initWithResultItems:frontCameraCaptureState:", v13, v166);
      v212[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v212, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADPersonIdentificationRequest setResults:](request, "setResults:", v16);

      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v190 = (uint64_t)v168;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);
      }

      goto LABEL_151;
    }
    if ((-[MADPersonIdentificationRequest allowOnDemand](self->_request, "allowOnDemand") & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v190 = (uint64_t)v168;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[%@] complete without on-demand process", buf, 0xCu);
      }
      -[MADPersonIdentificationRequest setResults:](self->_request, "setResults:", MEMORY[0x1E0C9AA60]);
      goto LABEL_151;
    }
    cf = 0;
    v180 = 0;
    if (-[MADPersonIdentificationRequest useLowResolutionPicture](self->_request, "useLowResolutionPicture"))
    {
      if (!-[VCPMADServiceImageAsset loadLowResPixelBuffer:orientation:](self->_imageAsset, "loadLowResPixelBuffer:orientation:", &cf, &v180))goto LABEL_33;
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v17 = MEMORY[0x1E0C81028];
        v18 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v190 = (uint64_t)v168;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] low res image loading failed", buf, 0xCu);
        }

      }
    }
    imageAsset = self->_imageAsset;
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](imageAsset, "loadPixelBuffer:orientation:", &cf, &v180))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v190 = (uint64_t)v168;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] image loading failed", buf, 0xCu);
      }
      v20 = self->_request;
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v210 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v211 = objc_claimAutoreleasedReturnValue();
      v164 = (void *)v211;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v211, &v210, 1);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADPersonIdentificationRequest setError:](v20, "setError:", v22);
      goto LABEL_150;
    }
LABEL_33:
    +[VCPMADPersonIdentificationTaskResource sharedResource](VCPMADPersonIdentificationTaskResource, "sharedResource");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateResource:", v164);
    v157 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v164, "personIdentityModel");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "faceProcessingContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v24;
    objc_msgSend(v164, "vuService");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = 0;
    LODWORD(v23) = +[VCPFaceUtils configureVNRequest:withClass:andVisionRevision:](VCPFaceUtils, "configureVNRequest:withClass:andVisionRevision:", &v179, objc_opt_class(), -[MADPersonIdentificationRequest faceDetectorVisionRevision](self->_request, "faceDetectorVisionRevision"));
    v153 = v179;
    if ((_DWORD)v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to configuate VNDetectFaceRectanglesRequest"), v168);
      v156 = (id)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v190 = (uint64_t)v156;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v25 = self->_request;
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v208 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v156);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v209 = v155;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
      v154 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v154);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADPersonIdentificationRequest setError:](v25, "setError:", v27);
      goto LABEL_148;
    }
    v178 = 0;
    v28 = +[VCPFaceUtils configureVNRequest:withClass:andProcessingVersion:](VCPFaceUtils, "configureVNRequest:withClass:andProcessingVersion:", &v178, objc_opt_class(), objc_msgSend(v24, "processingVersion"));
    v156 = v178;
    if (v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to configuate VNCreateFaceprintRequest"), v168);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v190 = (uint64_t)v155;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v29 = self->_request;
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v206 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v155);
      v207 = objc_claimAutoreleasedReturnValue();
      v154 = (id)v207;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v151);
      v31 = objc_claimAutoreleasedReturnValue();
      -[MADPersonIdentificationRequest setError:](v29, "setError:", v31);
LABEL_147:

      v27 = v151;
LABEL_148:

      v65 = v154;
LABEL_149:

      v22 = v159;
LABEL_150:

      CF<opaqueCMSampleBuffer *>::~CF(&cf);
LABEL_151:

      v7 = 0;
      goto LABEL_152;
    }
    VCPSignPostLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_signpost_id_generate(v32);

    VCPSignPostLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      signpostPayload = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v190 = (uint64_t)signpostPayload;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "VCPMADPersonIdentificationTask_createVisionImageRequest", "%@", buf, 0xCu);
    }

    v37 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v38 = cf;
    objc_msgSend(v164, "session");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = (void *)objc_msgSend(v37, "initWithCVPixelBuffer:options:session:", v38, MEMORY[0x1E0C9AA70], v39);

    VCPSignPostLog();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      v42 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v190 = (uint64_t)v42;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v41, OS_SIGNPOST_INTERVAL_END, v33, "VCPMADPersonIdentificationTask_createVisionImageRequest", "%@", buf, 0xCu);
    }

    VCPSignPostLog();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = os_signpost_id_generate(v43);

    VCPSignPostLog();
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      v47 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v190 = (uint64_t)v47;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v44, "VCPMADPersonIdentificationTask_detectFace", "%@", buf, 0xCu);
    }

    v205 = v153;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v205, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = 0;
    v49 = objc_msgSend(v155, "performRequests:error:", v48, &v177);
    v154 = v177;

    if ((v49 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to detect faces - %@"), v168, v154);
      v60 = objc_claimAutoreleasedReturnValue();
      v151 = (void *)v60;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v190 = v60;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v61 = self->_request;
      v62 = (void *)MEMORY[0x1E0CB35C8];
      v203 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v60);
      v31 = objc_claimAutoreleasedReturnValue();
      v204 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADPersonIdentificationRequest setError:](v61, "setError:", v64);

      goto LABEL_147;
    }
    VCPSignPostLog();
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      v52 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v190 = (uint64_t)v52;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v51, OS_SIGNPOST_INTERVAL_END, v44, "VCPMADPersonIdentificationTask_detectFace", "%@", buf, 0xCu);
    }

    objc_msgSend(v153, "results");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "count");

    if (!v54)
    {
      v65 = v154;
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v190 = (uint64_t)v168;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] No face detected from CVPixelBuffer", buf, 0xCu);
      }
      -[MADPersonIdentificationRequest setResults:](self->_request, "setResults:", MEMORY[0x1E0C9AA60]);
      goto LABEL_149;
    }
    if (-[MADPersonIdentificationRequest maximumFaceCount](self->_request, "maximumFaceCount")
      && v54 >= -[MADPersonIdentificationRequest maximumFaceCount](self->_request, "maximumFaceCount"))
    {
      objc_msgSend(v153, "results");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "sortedArrayUsingComparator:", &__block_literal_global_214);
      v56 = objc_claimAutoreleasedReturnValue();

      -[NSObject subarrayWithRange:](v56, "subarrayWithRange:", 0, -[MADPersonIdentificationRequest maximumFaceCount](self->_request, "maximumFaceCount"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setInputFaceObservations:", v67);

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v68 = MEMORY[0x1E0C81028];
        v69 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v153, "results");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v70, "count");
          objc_msgSend(v156, "inputFaceObservations");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_msgSend(v72, "count");
          *(_DWORD *)buf = 138412802;
          v190 = (uint64_t)v168;
          v191 = 2048;
          v192 = v71;
          v193 = 2048;
          v194 = v73;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Detected %lu faces, identifying top %lu faces (by confidence) ...", buf, 0x20u);

        }
      }
    }
    else
    {
      objc_msgSend(v153, "results");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setInputFaceObservations:", v55);

      if ((int)MediaAnalysisLogLevel() < 7)
        goto LABEL_75;
      v56 = MEMORY[0x1E0C81028];
      v57 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v153, "results");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "count");
        *(_DWORD *)buf = 138412546;
        v190 = (uint64_t)v168;
        v191 = 2048;
        v192 = v59;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Detected %lu faces, identifying ...", buf, 0x16u);

      }
    }

LABEL_75:
    VCPSignPostLog();
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = os_signpost_id_generate(v74);

    VCPSignPostLog();
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = v76;
    if (v75 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
    {
      v78 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v190 = (uint64_t)v78;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v77, OS_SIGNPOST_INTERVAL_BEGIN, v75, "VCPMADPersonIdentificationTask_generateFaceprint", "%@", buf, 0xCu);
    }

    v202 = v156;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v202, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v176 = v154;
    v80 = objc_msgSend(v155, "performRequests:error:", v79, &v176);
    v81 = v176;

    v154 = v81;
    if ((v80 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] Failed to print faces - %@"), v168, v81);
      v144 = objc_claimAutoreleasedReturnValue();
      v151 = (void *)v144;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v190 = v144;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v145 = self->_request;
      v146 = (void *)MEMORY[0x1E0CB35C8];
      v200 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v144);
      v31 = objc_claimAutoreleasedReturnValue();
      v201 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADPersonIdentificationRequest setError:](v145, "setError:", v148);

      goto LABEL_147;
    }
    VCPSignPostLog();
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = v82;
    if (v75 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v82))
    {
      v84 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v190 = (uint64_t)v84;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v83, OS_SIGNPOST_INTERVAL_END, v75, "VCPMADPersonIdentificationTask_generateFaceprint", "%@", buf, 0xCu);
    }

    objc_msgSend(v156, "results");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "count") == 0;

    if (v86)
    {
      v65 = v81;
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v190 = (uint64_t)v168;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] No face to identify from CVPixelBuffer", buf, 0xCu);
      }
      -[MADPersonIdentificationRequest setResults:](self->_request, "setResults:", MEMORY[0x1E0C9AA60]);
      goto LABEL_149;
    }
    VCPSignPostLog();
    v87 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v87);

    VCPSignPostLog();
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = v88;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
    {
      v90 = self->_signpostPayload;
      *(_DWORD *)buf = 138412290;
      v190 = (uint64_t)v90;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v89, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADPersonIdentificationTask_identifyFace", "%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "results");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v199, 16);
    if (!v91)
    {
LABEL_133:

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v133 = MEMORY[0x1E0C81028];
        v134 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v133, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v156, "results");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = objc_msgSend(v135, "count");
          *(_DWORD *)buf = 138412546;
          v190 = (uint64_t)v168;
          v191 = 2048;
          v192 = v136;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] Identified %lu faces", buf, 0x16u);

        }
      }
      VCPSignPostLog();
      v137 = objc_claimAutoreleasedReturnValue();
      v138 = v137;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
      {
        v139 = self->_signpostPayload;
        *(_DWORD *)buf = 138412290;
        v190 = (uint64_t)v139;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v138, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADPersonIdentificationTask_identifyFace", "%@", buf, 0xCu);
      }

      v140 = self->_request;
      v141 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47730]), "initWithResultItems:frontCameraCaptureState:", v151, v166);
      v186 = v141;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v186, 1);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADPersonIdentificationRequest setResults:](v140, "setResults:", v142);

      v27 = v151;
      objc_msgSend(v157, "reset");
      if ((int)MediaAnalysisLogLevel() < 6)
        goto LABEL_148;
      v31 = MEMORY[0x1E0C81028];
      v143 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v190 = (uint64_t)v168;
        _os_log_impl(&dword_1B6C4A000, v31, OS_LOG_TYPE_INFO, "[%@] complete with on-demand analysis", buf, 0xCu);
      }
      goto LABEL_147;
    }
    v162 = *(_QWORD *)v173;
LABEL_88:
    v92 = 0;
    v163 = v91;
    while (1)
    {
      if (*(_QWORD *)v173 != v162)
        objc_enumerationMutation(obj);
      v93 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * v92);
      context = (void *)MEMORY[0x1BCCA1B2C]();
      objc_msgSend(v164, "photoLibrary");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v94, "mad_useVUGallery");

      if (v95)
      {
        v171 = 0;
        objc_msgSend(v160, "recognizeIn:context:error:", v93, 0, &v171);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = v171;
        if (v97)
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v190 = (uint64_t)v168;
            v191 = 2112;
            v192 = (uint64_t)v93;
            v193 = 2112;
            v194 = (uint64_t)v97;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Failed to classify face (%@) - %@; skipping",
              buf,
              0x20u);
          }

          v96 = v97;
          goto LABEL_119;
        }
        objc_msgSend(v96, "firstObject");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v99;
        if (!v99)
        {
          if ((int)MediaAnalysisLogLevel() < 5)
            goto LABEL_119;
          v131 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_119;
          goto LABEL_126;
        }
        objc_msgSend(v99, "entityIdentifier");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "stringValue");
        v98 = (id)objc_claimAutoreleasedReturnValue();

        v102 = (void *)MEMORY[0x1E0CD16C8];
        objc_msgSend(v100, "tag");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "UUIDString");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "localIdentifierWithUUID:", v104);
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v100, "confidence");
        v107 = v106;
      }
      else
      {
        v170 = 0;
        objc_msgSend(v159, "predictPersonFromFaceObservation:limit:canceller:error:", v93, 1, 0, &v170);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v170;
        if (v98)
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v190 = (uint64_t)v168;
            v191 = 2112;
            v192 = (uint64_t)v93;
            v193 = 2112;
            v194 = (uint64_t)v98;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%@] Failed to classify face (%@) - %@; skipping",
              buf,
              0x20u);
          }

          goto LABEL_118;
        }
        objc_msgSend(v96, "firstObject");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v108;
        if (!v108)
        {
          if ((int)MediaAnalysisLogLevel() < 5)
            goto LABEL_119;
          v131 = MEMORY[0x1E0C81028];
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_119;
LABEL_126:
          *(_DWORD *)buf = 138412546;
          v190 = (uint64_t)v168;
          v191 = 2112;
          v192 = (uint64_t)v93;
          _os_log_impl(&dword_1B6C4A000, v131, OS_LOG_TYPE_DEFAULT, "[%@] No valid identification to face (%@); skipping",
            buf,
            0x16u);
          goto LABEL_119;
        }
        objc_msgSend(v108, "predictedPersonUniqueIdentifier");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "confidence");
        v107 = v109;
        v98 = 0;
      }

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v110 = MEMORY[0x1E0C81028];
        v111 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v93, "boundingBox");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{{x:%.*f, y:%.*f}, {width:%.*f, height:%.*f}} "), 3, v112, 3, v113, 3, v114, 3, v115);
          v116 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v190 = (uint64_t)v168;
          v191 = 2112;
          v192 = (uint64_t)v105;
          v193 = 2112;
          v194 = (uint64_t)v98;
          v195 = 2048;
          v196 = v107;
          v197 = 2112;
          v198 = v116;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%@] prediction: %@, (mdid: %@), confidence: %.3f at %@", buf, 0x34u);

        }
      }
      objc_msgSend(v164, "photoLibrary");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "librarySpecificFetchOptions");
      v161 = (void *)objc_claimAutoreleasedReturnValue();

      if (v98)
      {
        v118 = (void *)MEMORY[0x1E0CD16C8];
        v188 = v98;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v188, 1);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "fetchPersonsWithMdIDs:options:", v119, v161);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "firstObject");
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        if (v121)
          goto LABEL_114;
      }
      v122 = (void *)MEMORY[0x1E0CD16C8];
      v187 = v105;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v187, 1);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "fetchPersonsWithLocalIdentifiers:options:", v123, v161);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "firstObject");
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      if (v121)
      {
LABEL_114:
        if ((-[MADPersonIdentificationRequest allowUnverifiedIdentity](self->_request, "allowUnverifiedIdentity") & 1) == 0
          && !objc_msgSend(v121, "isVerified"))
        {
          goto LABEL_117;
        }
        v125 = objc_alloc(MEMORY[0x1E0D47738]);
        objc_msgSend(v121, "localIdentifier");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "name");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "mdID");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = objc_msgSend(v121, "isVerified");
        objc_msgSend(v93, "boundingBox");
        v130 = objc_msgSend(v125, "initWithPersonIdentifier:personName:mdID:verified:boundingBox:andConfidence:", v126, v127, v128, v129);

        objc_msgSend(v151, "addObject:", v130);
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 4)
        {
          v121 = 0;
          goto LABEL_117;
        }
        v130 = MEMORY[0x1E0C81028];
        v132 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v190 = (uint64_t)v168;
          v191 = 2112;
          v192 = (uint64_t)v105;
          v193 = 2112;
          v194 = (uint64_t)v98;
          _os_log_impl(&dword_1B6C4A000, v130, OS_LOG_TYPE_DEFAULT, "[%@] Failed to fetch person with identifier %@ and mdID %@; skipping",
            buf,
            0x20u);
        }
        v121 = 0;
      }

LABEL_117:
LABEL_118:
      v96 = v98;
LABEL_119:

      objc_autoreleasePoolPop(context);
      if (v163 == ++v92)
      {
        v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v199, 16);
        if (!v91)
          goto LABEL_133;
        goto LABEL_88;
      }
    }
  }
  v7 = -128;
LABEL_152:

  return v7;
}

void __37__VCPMADPersonIdentificationTask_run__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  void *v25;
  id v26;

  v26 = a2;
  objc_msgSend(v26, "personLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonWithFace:options:", v26, *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allowUnverifiedIdentity") & 1) != 0
        || (objc_msgSend(v5, "isVerified") & 1) != 0)
      {
        objc_msgSend(v26, "centerX");
        v7 = v6;
        objc_msgSend(v26, "centerY");
        v9 = v8;
        objc_msgSend(v26, "size");
        +[VCPFaceUtils faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:](VCPFaceUtils, "faceRectFromNormalizedCenterX:normalizedCenterY:normalizedSize:sourceWidth:sourceHeight:", v7, v9, v10, (double)objc_msgSend(v26, "sourceWidth"), (double)objc_msgSend(v26, "sourceHeight"));
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v19 = objc_alloc(MEMORY[0x1E0D47738]);
        objc_msgSend(v5, "localIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "mdID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v5, "isVerified");
        LODWORD(v24) = 1.0;
        v25 = (void *)objc_msgSend(v19, "initWithPersonIdentifier:personName:mdID:verified:boundingBox:andConfidence:", v20, v21, v22, v23, v12, v14, v16, v18, v24);

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);
      }

    }
  }

}

uint64_t __37__VCPMADPersonIdentificationTask_run__block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "boundingBox");
  v7 = v6;
  objc_msgSend(v4, "boundingBox");
  v9 = v8;
  objc_msgSend(v5, "boundingBox");
  v11 = v10;
  objc_msgSend(v5, "boundingBox");
  if (v7 * v9 > v11 * v12)
    v13 = -1;
  else
    v13 = v7 * v9 < v11 * v12;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
