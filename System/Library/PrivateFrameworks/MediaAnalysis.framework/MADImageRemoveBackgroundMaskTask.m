@implementation MADImageRemoveBackgroundMaskTask

- (MADImageRemoveBackgroundMaskTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  MADImageRemoveBackgroundMaskTask *v11;
  MADImageRemoveBackgroundMaskTask *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MADImageRemoveBackgroundMaskTask;
  v11 = -[MADImageRemoveBackgroundTask initWithSignpostPayload:](&v14, sel_initWithSignpostPayload_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_request, a3);
    objc_storeStrong((id *)&v12->_imageAsset, a4);
  }

  return v12;
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
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask] Incompatible request (%@) specified to %@", (uint8_t *)&v17, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int)run
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MADRemoveBackgroundMaskRequest *request;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v25;
  _BOOL4 v26;
  BOOL v27;
  void *v28;
  _BOOL4 v29;
  MADRemoveBackgroundMaskRequest *v30;
  void *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  const void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  __CVBuffer *v49;
  void *v50;
  void *v51;
  void *v52;
  MADRemoveBackgroundMaskRequest *v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  int v58;
  int v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  unsigned int v69;
  MADRemoveBackgroundCachedMaskState *v70;
  MADRemoveBackgroundCachedMaskState *v71;
  void *v72;
  MADRemoveBackgroundMaskRequest *v73;
  void *v74;
  MADRemoveBackgroundMaskRequest *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  MADRemoveBackgroundMaskRequest *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  MADRemoveBackgroundMaskRequest *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id obj;
  CVPixelBufferRef pixelBuffer;
  id location;
  unsigned int v102;
  const void *v103;
  uint8_t v104[4];
  void *v105;
  __int16 v106;
  int v107;
  __int16 v108;
  int v109;
  __int16 v110;
  unsigned int v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  __int128 buf;
  __int128 v120;
  uint64_t v121;
  _QWORD v122[4];

  v122[1] = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RemoveBackgroundMask][%@] running...", (uint8_t *)&buf, 0xCu);

  }
  v4 = _os_feature_enabled_impl();
  if ((v4 & 1) != 0)
  {
LABEL_12:
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[RemoveBackgroundMask][%@] Resetting cached mask state", (uint8_t *)&buf, 0xCu);

    }
    +[MADImageRemoveBackgroundResource sharedResource](MADImageRemoveBackgroundResource, "sharedResource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCachedMaskState:", 0);

    v103 = 0;
    v102 = 0;
    if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &v103, &v102))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Image loading failed", (uint8_t *)&buf, 0xCu);

      }
      request = self->_request;
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v121 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v122[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADRemoveBackgroundMaskRequest setError:](request, "setError:", v15);

      goto LABEL_78;
    }
    if ((v4 & 1) == 0)
    {
      -[VCPMADServiceImageAsset isSensitive](self->_imageAsset, "isSensitive");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
      {
        -[MADImageRemoveBackgroundTask computeSensitivityOfPixelBuffer:](self, "computeSensitivityOfPixelBuffer:", v103);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "BOOLValue"))
        {
          if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v19;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask][%@] Skipping for ineligible image", (uint8_t *)&buf, 0xCu);

          }
          -[MADRemoveBackgroundMaskRequest setResults:](self->_request, "setResults:", MEMORY[0x1E0C9AA60]);

          goto LABEL_78;
        }

      }
    }
    location = 0;
    buf = 0uLL;
    __asm { FMOV            V0.2D, #1.0 }
    v120 = _Q0;
    -[MADRemoveBackgroundMaskRequest imageType](self->_request, "imageType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25
      && (-[MADRemoveBackgroundMaskRequest imageType](self->_request, "imageType"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "integerValue") == 1))
    {

    }
    else
    {
      v26 = -[VCPMADServiceImageAsset isScreenshot](self->_imageAsset, "isScreenshot");
      v27 = v26;
      if (v25)
      {

        if (!v27)
          goto LABEL_40;
      }
      else if (!v26)
      {
        goto LABEL_40;
      }
    }
    v28 = (void *)MEMORY[0x1BCCA1B2C]();
    v29 = -[MADImageRemoveBackgroundTask computeRegionOfInterest:pixelBuffer:orientation:error:](self, "computeRegionOfInterest:pixelBuffer:orientation:error:", &buf, v103, v102, &location);
    if (!v29)
    {
      v30 = self->_request;
      if (location)
        -[MADRemoveBackgroundMaskRequest setError:](v30, "setError:");
      else
        -[MADRemoveBackgroundMaskRequest setResults:](v30, "setResults:", MEMORY[0x1E0C9AA60]);
    }
    objc_autoreleasePoolPop(v28);
    if (!v29)
    {
LABEL_77:

LABEL_78:
      CF<opaqueCMSampleBuffer *>::~CF(&v103);
      return 0;
    }
LABEL_40:
    +[MADImageRemoveBackgroundResource sharedResource](MADImageRemoveBackgroundResource, "sharedResource");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setMaskOnly:", 1);
    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateResource:", v98);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    VCPSignPostLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_signpost_id_generate(v32);

    VCPSignPostLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      -[MADImageRemoveBackgroundTask signpostPayload](self, "signpostPayload");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v104 = 138412290;
      v105 = v36;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "VNImageRequestHandler_init", "%@", v104, 0xCu);

    }
    v37 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v38 = v103;
    v39 = v102;
    objc_msgSend(v98, "session");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = (void *)objc_msgSend(v37, "initWithCVPixelBuffer:orientation:options:session:", v38, v39, MEMORY[0x1E0C9AA70], v40);

    VCPSignPostLog();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      -[MADImageRemoveBackgroundTask signpostPayload](self, "signpostPayload");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v104 = 138412290;
      v105 = v43;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v42, OS_SIGNPOST_INTERVAL_END, v33, "VNImageRequestHandler_init", "%@", v104, 0xCu);

    }
    -[MADImageRemoveBackgroundTask generateMaskWithRequestHandler:regionOfInterest:error:](self, "generateMaskWithRequestHandler:regionOfInterest:error:", v96, &location, buf, v120);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
    {
      CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v44, "instanceMask"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (v94)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "allInstances");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "firstIndex");

        if (v47 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_53:
          v53 = self->_request;
          v54 = objc_alloc(MEMORY[0x1E0D47758]);
          objc_msgSend(v45, "allInstances");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = buf;
          v57 = v120;
          objc_msgSend(v45, "confidence");
          v59 = v58;
          -[VCPMADServiceImageAsset animatedStickerScore](self->_imageAsset, "animatedStickerScore");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v61) = v59;
          v62 = (void *)objc_msgSend(v54, "initWithInstances:instanceMaskSurface:perInstanceMaskSurfaces:sourceRegionOfInterest:confidence:animatedStickerScore:", v55, v94, v97, v60, v56, v57, v61);
          v112 = v62;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[MADRemoveBackgroundMaskRequest setResults:](v53, "setResults:", v63);

          if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPMADServiceImageAsset resolution](self->_imageAsset, "resolution");
            v66 = v65;
            -[VCPMADServiceImageAsset resolution](self->_imageAsset, "resolution");
            v68 = v67;
            v69 = -[VCPMADServiceImageAsset orientation](self->_imageAsset, "orientation");
            *(_DWORD *)v104 = 138413058;
            v105 = v64;
            v106 = 1024;
            v107 = (int)v66;
            v108 = 1024;
            v109 = (int)v68;
            v110 = 1024;
            v111 = v69;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask][%@] Caching image handler (resolution %dx%d, orientation %d)", v104, 0x1Eu);

          }
          v70 = [MADRemoveBackgroundCachedMaskState alloc];
          v71 = -[MADRemoveBackgroundCachedMaskState initWithImageAsset:instanceMaskObservation:regionOfInterest:](v70, "initWithImageAsset:instanceMaskObservation:regionOfInterest:", self->_imageAsset, v45, *(double *)&buf, *((double *)&buf + 1), *(double *)&v120, *((double *)&v120 + 1));
          objc_msgSend(v98, "setCachedMaskState:", v71);

          objc_msgSend(v95, "reset");
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v104 = 138412290;
            v105 = v72;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RemoveBackgroundMask][%@] complete", v104, 0xCu);

          }
        }
        else
        {
          v92 = *MEMORY[0x1E0CB2F90];
          v93 = *MEMORY[0x1E0CB2D50];
          while (1)
          {
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            obj = location;
            v49 = (__CVBuffer *)objc_msgSend(v45, "createMaskForInstances:error:", v48, &obj);
            objc_storeStrong(&location, obj);
            pixelBuffer = v49;

            if (!pixelBuffer)
              break;
            CVPixelBufferGetIOSurface(pixelBuffer);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v50)
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v104 = 138412546;
                v105 = v85;
                v106 = 1024;
                v107 = v47;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Failed to obtain mask %d from Vision", v104, 0x12u);

              }
              v86 = self->_request;
              v87 = (void *)MEMORY[0x1E0CB35C8];
              v113 = v93;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to obtain image from Vision"));
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = v88;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "errorWithDomain:code:userInfo:", v92, -18, v89);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              -[MADRemoveBackgroundMaskRequest setError:](v86, "setError:", v90);

              goto LABEL_74;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v47);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "setObject:forKeyedSubscript:", v50, v51);

            objc_msgSend(v45, "allInstances");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v52, "indexGreaterThanIndex:", v47);

            CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
            if (v47 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_53;
          }
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v104 = 138412546;
            v105 = v79;
            v106 = 1024;
            v107 = v47;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Failed to obtain mask %d from Vision", v104, 0x12u);

          }
          v80 = self->_request;
          v81 = (void *)MEMORY[0x1E0CB35C8];
          v115 = v93;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to obtain image from Vision"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = v82;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "errorWithDomain:code:userInfo:", v92, -18, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[MADRemoveBackgroundMaskRequest setError:](v80, "setError:", v84);

LABEL_74:
          CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v104 = 138412290;
          v105 = v74;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RemoveBackgroundMask][%@] Failed to obtain instance mask from Vision", v104, 0xCu);

        }
        v75 = self->_request;
        v76 = (void *)MEMORY[0x1E0CB35C8];
        v117 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to obtain image from Vision"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v97;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[MADRemoveBackgroundMaskRequest setError:](v75, "setError:", v78);

      }
    }
    else
    {
      v73 = self->_request;
      if (location)
        -[MADRemoveBackgroundMaskRequest setError:](v73, "setError:");
      else
        -[MADRemoveBackgroundMaskRequest setResults:](v73, "setResults:", MEMORY[0x1E0C9AA60]);
    }

    goto LABEL_77;
  }
  -[VCPMADServiceImageAsset isSensitive](self->_imageAsset, "isSensitive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "BOOLValue"))
  {

    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[VCPMADServiceImageAsset identifier](self->_imageAsset, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RemoveBackgroundMask][%@] Skipping for ineligible image", (uint8_t *)&buf, 0xCu);

  }
  -[MADRemoveBackgroundMaskRequest setResults:](self->_request, "setResults:", MEMORY[0x1E0C9AA60]);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
