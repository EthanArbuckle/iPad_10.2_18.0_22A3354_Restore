@implementation VCPImageCaptionAnalyzer

+ (BOOL)greedySearchEnabled
{
  return 0;
}

+ (BOOL)useVCPMobileAssetAXCaptionModel
{
  return 0;
}

+ (BOOL)writeSpatialEmbeddingToFile
{
  return 0;
}

- (VCPImageCaptionAnalyzer)initWithCaptionModelType:(int64_t)a3 captionSafetyType:(int64_t)a4
{
  VCPImageCaptionAnalyzer *v6;
  VCPImageCaptionAnalyzer *v7;
  void *v8;
  id v9;
  VCPImageCaptionAnalyzer *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CSUImageCaptionerConfiguration *v19;
  const __CFString *v20;
  VCPImageCaptionAnalyzer *v21;
  CSUImageCaptionerConfiguration *captionerConfig;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  CSUImageCaptioner *imageCaptioner;
  uint64_t v39;
  CSUImageCaptioner *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  NSObject *v46;
  const char *v47;
  id v48;
  void *v49;
  void *v50;
  objc_super v51;
  uint8_t buf[4];
  int64_t v53;
  _QWORD v54[5];
  _QWORD v55[6];

  v55[5] = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)VCPImageCaptionAnalyzer;
  v6 = -[VCPImageCaptionAnalyzer init](&v51, sel_init);
  v7 = v6;
  if (!v6)
  {
    v10 = 0;
LABEL_48:
    v21 = v10;
    goto LABEL_49;
  }
  v6->_modelType = a3;
  v6->_safetyType = a4;
  v6->_rescaledImageBuffer = 0;
  switch(a3)
  {
    case 3:
      if (_os_feature_enabled_impl())
      {
        v50 = 0;
        objc_msgSend(MEMORY[0x1E0D188C0], "CSUImageCaptionerConfigurationForRevision:error:", 6, &v50);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v50;
      }
      else
      {
        v49 = 0;
        objc_msgSend(MEMORY[0x1E0D188C0], "CSUImageCaptionerConfigurationForRevision:error:", 5, &v49);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v49;
      }
      v9 = v12;
      captionerConfig = v7->_captionerConfig;
      v7->_captionerConfig = (CSUImageCaptionerConfiguration *)v11;

      if (v7->_captionerConfig)
        v23 = v9 == 0;
      else
        v23 = 0;
      if (v23)
      {
        objc_msgSend((id)objc_opt_class(), "sharedCSUCaptionerWithConfig:identifier:", v7->_captionerConfig, CFSTR("CSUImageCaptioner_MiCa"));
        v37 = objc_claimAutoreleasedReturnValue();
        imageCaptioner = v7->_imageCaptioner;
        v7->_imageCaptioner = (CSUImageCaptioner *)v37;

        v9 = 0;
      }
      goto LABEL_35;
    case 2:
      +[VCPMobileAssetManager sharedManager](VCPMobileAssetManager, "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "retrieveAssetOnce:petWatchDog:cancelBlock:", 1, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("ImageCaptioning.config.json"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0D188C0];
        objc_msgSend(v15, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        objc_msgSend(v16, "createCSUImageCaptionerConfigurationWithConfigPath:error:", v17, &v48);
        v18 = objc_claimAutoreleasedReturnValue();
        v9 = v48;
        v19 = v7->_captionerConfig;
        v7->_captionerConfig = (CSUImageCaptionerConfiguration *)v18;

        v20 = CFSTR("CSUImageCaptioner_AX_CSU");
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] CSUAXCaptioner download failed", buf, 2u);
        }
        v9 = 0;
        v20 = 0;
      }
      if (!v7->_captionerConfig)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "description");
          v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v44 = objc_msgSend(v43, "UTF8String");
          *(_DWORD *)buf = 136315138;
          v53 = v44;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to create CSUImageCaptionerConfiguration: (%s)", buf, 0xCu);

        }
LABEL_44:

        goto LABEL_45;
      }
      objc_msgSend((id)objc_opt_class(), "sharedCSUCaptionerWithConfig:identifier:", v7->_captionerConfig, v20);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v7->_imageCaptioner;
      v7->_imageCaptioner = (CSUImageCaptioner *)v39;

LABEL_35:
      if (v7->_imageCaptioner)
        goto LABEL_36;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "description");
        v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = objc_msgSend(v41, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v53 = v42;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to create CSUImageCaptioner: (%s)", buf, 0xCu);

      }
      goto LABEL_44;
    case 1:
      if (objc_msgSend((id)objc_opt_class(), "useVCPMobileAssetAXCaptionModel"))
      {
        +[VCPMobileAssetManager sharedManager](VCPMobileAssetManager, "sharedManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "retrieveAssetOnce:petWatchDog:cancelBlock:", 0, 0, 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CF3F08], "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "modelURLForType:timeout:", 0, 0.5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_45;
          *(_WORD *)buf = 0;
          v46 = MEMORY[0x1E0C81028];
          v47 = "[ImageCaption] Accessibility image caption model mobile asset not available";
          goto LABEL_59;
        }
        +[VCPMobileAssetManager sharedManager](VCPMobileAssetManager, "sharedManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "cloneAsset:to:", v8, CFSTR("ClonedImageCaptionModel"));
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "fileExistsAtPath:", v27);

        if ((v28 & 1) != 0)
        {
          v29 = *MEMORY[0x1E0D099D0];
          v54[0] = *MEMORY[0x1E0D099D8];
          v54[1] = v29;
          v55[0] = v9;
          v55[1] = CFSTR("en-US");
          v30 = *MEMORY[0x1E0D099E8];
          v54[2] = *MEMORY[0x1E0D099B0];
          v54[3] = v30;
          v31 = *MEMORY[0x1E0D099E0];
          v55[2] = &unk_1E6B74F78;
          v55[3] = v31;
          v54[4] = *MEMORY[0x1E0D099C0];
          v55[4] = MEMORY[0x1E0C9AAA0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 5);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "absoluteString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("CVNLPImageCaptionHandler"), v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = objc_msgSend((id)objc_opt_class(), "sharedCVNLPCaptionHandlerWithOptions:identifier:", v32, v35);
          v7->_captionHandlerRef = (CVNLPCaptionHandler *)v36;
          if (v36)
          {

LABEL_36:
            v10 = v7;
LABEL_47:

            goto LABEL_48;
          }
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to create CVNLPCaptionHandlerRef", buf, 2u);
          }

        }
        else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Local image caption model not exists", buf, 2u);
        }
LABEL_46:
        v10 = 0;
        goto LABEL_47;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v46 = MEMORY[0x1E0C81028];
        v47 = "[ImageCaption] Fail cloning image caption model to local path";
LABEL_59:
        _os_log_impl(&dword_1B6C4A000, v46, OS_LOG_TYPE_ERROR, v47, buf, 2u);
      }
LABEL_45:
      v9 = 0;
      goto LABEL_46;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v53 = a3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Init fails with unsupported MADImageCaptionModelType: %ld", buf, 0xCu);
  }
  v21 = 0;
LABEL_49:

  return v21;
}

- (VCPImageCaptionAnalyzer)init
{
  return -[VCPImageCaptionAnalyzer initWithCaptionModelType:captionSafetyType:](self, "initWithCaptionModelType:captionSafetyType:", 1, 0);
}

- (void)dealloc
{
  __CVBuffer *rescaledImageBuffer;
  objc_super v4;

  rescaledImageBuffer = self->_rescaledImageBuffer;
  if (rescaledImageBuffer)
  {
    CFRelease(rescaledImageBuffer);
    self->_rescaledImageBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPImageCaptionAnalyzer;
  -[VCPImageCaptionAnalyzer dealloc](&v4, sel_dealloc);
}

+ (id)sharedCSUCaptionerWithConfig:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__VCPImageCaptionAnalyzer_sharedCSUCaptionerWithConfig_identifier___block_invoke;
    v11[3] = &unk_1E6B1B8C8;
    v12 = v7;
    v13 = v5;
    objc_msgSend(v8, "sharedInstanceWithIdentifier:andCreationBlock:", v12, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Initiating captioner with nil config or identifier", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

id __67__VCPImageCaptionAnalyzer_sharedCSUCaptionerWithConfig_identifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v2;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[ImageCaption] Initiating captioner:%@ with config:%@", (uint8_t *)&v5, 0x16u);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D188B8]), "initWithConfiguration:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedCVNLPCaptionHandlerWithOptions:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__VCPImageCaptionAnalyzer_sharedCVNLPCaptionHandlerWithOptions_identifier___block_invoke;
    v11[3] = &unk_1E6B19910;
    v12 = v5;
    objc_msgSend(v8, "sharedInstanceWithIdentifier:andCreationBlock:", v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Initiating CVNLPCaptionHandler with nil options or identifier", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

id __75__VCPImageCaptionAnalyzer_sharedCVNLPCaptionHandlerWithOptions_identifier___block_invoke()
{
  uint8_t v1[16];

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[ImageCaption] Initiating CVNLPCaptionHandler", v1, 2u);
  }
  CVNLPCaptionHandlerCreate();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)containPotentialUnsafeContent:(__CVBuffer *)a3
{
  uint64_t v4;
  int v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  float v27;
  float v28;
  char v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  float v36;
  float v37;
  int v38;
  int v39;
  int v40;
  int v41;
  NSObject *v43;
  const char *v44;
  uint32_t v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id v65;
  uint8_t v66[128];
  uint8_t buf[4];
  double v68;
  __int16 v69;
  double v70;
  _BYTE v71[128];
  _QWORD v72[9];
  _QWORD v73[9];
  _QWORD v74[3];
  uint64_t v75;
  _QWORD v76[4];

  v76[1] = *MEMORY[0x1E0C80C00];
  if (self->_safetyType != 1)
    return 0;
  v75 = *MEMORY[0x1E0D8C9D8];
  v76[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C998]), "initWithOptions:error:", v54, 0);
  v4 = objc_msgSend(v52, "classifyPixelBuffer:error:", a3, &v65);
  v55 = COERCE_DOUBLE(v65);
  if (v55 != 0.0 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v55;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Error calling into SCML: %@", buf, 0xCu);
  }
  if (v4 == 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[ImageCaption] This image is sensitive per SCML. Don't caption this image.", buf, 2u);
    }
    v5 = 1;
  }
  else
  {
    v51 = objc_alloc_init(MEMORY[0x1E0CEDD88]);
    objc_msgSend(v51, "setRevision:", 2);
    v50 = objc_alloc_init(MEMORY[0x1E0CEE060]);
    v6 = objc_alloc_init(MEMORY[0x1E0CEDDE0]);
    v64 = 0;
    v7 = objc_msgSend(v6, "setRevision:error:", 3737841669, &v64);
    v48 = v64;
    if ((v7 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to set revision for meme identification", buf, 2u);
      }

      v6 = 0;
    }
    v46 = v6;
    v8 = objc_alloc(MEMORY[0x1E0CEDF70]);
    v47 = (void *)objc_msgSend(v8, "initWithCVPixelBuffer:orientation:options:", a3, 1, MEMORY[0x1E0C9AA70]);
    v74[0] = v51;
    v74[1] = v50;
    v74[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "performRequests:error:", v9, 0);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObjectsFromArray:", v10);

    objc_msgSend(v50, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObjectsFromArray:", v11);

    v12 = *MEMORY[0x1E0CEE3D8];
    v72[0] = *MEMORY[0x1E0CEE100];
    v72[1] = v12;
    v73[0] = &unk_1E6B72030;
    v73[1] = &unk_1E6B72040;
    v13 = *MEMORY[0x1E0CEE1F8];
    v72[2] = *MEMORY[0x1E0CEE130];
    v72[3] = v13;
    v73[2] = &unk_1E6B72050;
    v73[3] = &unk_1E6B72060;
    v14 = *MEMORY[0x1E0CEE0E0];
    v72[4] = *MEMORY[0x1E0CEE410];
    v72[5] = v14;
    v73[4] = &unk_1E6B72070;
    v73[5] = &unk_1E6B72070;
    v15 = *MEMORY[0x1E0CEE0F8];
    v72[6] = *MEMORY[0x1E0CEE430];
    v72[7] = v15;
    v73[6] = &unk_1E6B72080;
    v73[7] = &unk_1E6B72080;
    v72[8] = *MEMORY[0x1E0CEE218];
    v73[8] = &unk_1E6B72060;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v18 = v53;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v61;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v61 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v22, "identifier", v46);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "confidence");
          v25 = v24;
          objc_msgSend(v16, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "floatValue");
          v28 = v27;

          v29 = objc_msgSend(v17, "containsObject:", v23);
          if (v25 > v28)
            v30 = v29;
          else
            v30 = 0;
          if ((v30 & 1) != 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              v68 = v25;
              v69 = 2048;
              v70 = v28;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[ImageCaption] This image looks unsafe with confidence %f/%f. Don't caption this image.", buf, 0x16u);
            }
            obj = v18;
            goto LABEL_47;
          }

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        if (v19)
          continue;
        break;
      }
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v46, "results");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v32)
    {
      obj = v31;
      v33 = *(_QWORD *)v57;
LABEL_29:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v57 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v34);
        objc_msgSend(v35, "identifier", v46);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "confidence");
        v37 = v36;
        v38 = objc_msgSend(&unk_1E6B76A70, "containsObject:", v23);
        v39 = v37 > 0.2 ? v38 : 0;
        if (v39 == 1)
          break;
        v40 = objc_msgSend(&unk_1E6B76A88, "containsObject:", v23);
        if (v37 > 0.15)
          v41 = v40;
        else
          v41 = 0;
        if (v41 == 1)
        {
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v43 = MEMORY[0x1E0C81028];
            v44 = "[ImageCaption] The junk filter has determined that this image might be sensitive. Don't caption this image.";
            v45 = 2;
            goto LABEL_60;
          }
          goto LABEL_47;
        }

        if (v32 == ++v34)
        {
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
          if (v32)
            goto LABEL_29;
          v5 = 0;
          goto LABEL_48;
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v68 = v37;
        v43 = MEMORY[0x1E0C81028];
        v44 = "[ImageCaption] This image looks to be of low quality (confidence: %f). Don't caption this image.";
        v45 = 12;
LABEL_60:
        _os_log_impl(&dword_1B6C4A000, v43, OS_LOG_TYPE_INFO, v44, buf, v45);
      }
LABEL_47:

      v5 = 1;
LABEL_48:
      v31 = obj;
    }
    else
    {
      v5 = 0;
    }

  }
  return v5 != 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  unsigned int (**v9)(_QWORD);
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t modelType;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  int64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  VCPImageBackboneAnalyzer *v39;
  void *v40;
  VCPImageBackboneAnalyzer *v41;
  VCPImageBackboneAnalyzer *imageBackboneAnalyzer;
  NSObject *v43;
  os_signpost_id_t v44;
  NSObject *v45;
  NSObject *v46;
  VCPImageBackboneAnalyzer *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  id v51;
  __CVBuffer **p_rescaledImageBuffer;
  __CVBuffer *rescaledImageBuffer;
  void *v54;
  void *v55;
  size_t v56;
  size_t v57;
  OSType v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const __CFDictionary *v62;
  CSUImageCaptioner *v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  NSObject *v69;
  os_signpost_id_t v70;
  NSObject *v71;
  NSObject *v72;
  CSUImageCaptioner *v73;
  __CVBuffer *v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  char v81;
  id v82;
  NSObject *v83;
  const char *v84;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  int v90;
  id v91;
  void *v92;
  NSObject *v93;
  os_signpost_id_t v94;
  NSObject *v95;
  NSObject *v96;
  char v97;
  CSUImageCaptioner *imageCaptioner;
  id *v99;
  uint64_t v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  _BOOL4 v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  os_signpost_id_t spid;
  unsigned int v112;
  void *v113;
  id *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  uint8_t v122[8];
  const __CFString *v123;
  void *v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  void *v135;
  const __CFString *v136;
  void *v137;
  _QWORD v138[3];
  _QWORD v139[3];
  _BYTE buf[12];
  __int16 v141;
  void *v142;
  __int16 v143;
  void *v144;
  _QWORD v145[2];
  _QWORD v146[2];
  const __CFString *v147;
  void *v148;
  const __CFString *v149;
  void *v150;
  void *v151;
  const __CFString *v152;
  _QWORD v153[4];

  v153[1] = *MEMORY[0x1E0C80C00];
  v9 = (unsigned int (**)(_QWORD))a6;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ImageCaption] Computing image caption with pixelBuffer", buf, 2u);
  }
  if (!v9 || !v9[2](v9))
  {
    if (-[VCPImageCaptionAnalyzer containPotentialUnsafeContent:](self, "containPotentialUnsafeContent:", a3))
    {
      v152 = CFSTR("ImageCaptionResults");
      v149 = CFSTR("attributes");
      v147 = CFSTR("imageCaptionUnsafeContent");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v153[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v153, &v152, 1);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v10 = 0;
      goto LABEL_95;
    }
    modelType = self->_modelType;
    switch(modelType)
    {
      case 3:
        if (!self->_imageBackboneAnalyzer)
        {
          v39 = [VCPImageBackboneAnalyzer alloc];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[VCPVideoTransformerBackbone revision](VCPVideoTransformerBackbone, "revision"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -[VCPImageBackboneAnalyzer initWithRequestedAnalyses:andRevision:useSharedModel:](v39, "initWithRequestedAnalyses:andRevision:useSharedModel:", 0x1080000000000, v40, 1);
          imageBackboneAnalyzer = self->_imageBackboneAnalyzer;
          self->_imageBackboneAnalyzer = v41;

          if (!self->_imageBackboneAnalyzer)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              break;
            *(_WORD *)buf = 0;
            v83 = MEMORY[0x1E0C81028];
            v84 = "[ImageCaption] Failed to init VCPImageBackboneAnalyzer";
            goto LABEL_85;
          }
        }
        v114 = a5;
        VCPSignPostLog();
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = os_signpost_id_generate(v43);

        VCPSignPostLog();
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = v45;
        if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v44, "VCPImageCaptionAnalyzer_MiCa_EmbeddingInference", ", buf, 2u);
        }

        v47 = self->_imageBackboneAnalyzer;
        v119 = 0;
        v10 = -[VCPImageBackboneAnalyzer analyzePixelBuffer:flags:results:cancel:](v47, "analyzePixelBuffer:flags:results:cancel:", a3, 0, &v119, v9);
        v48 = v119;
        v49 = v48;
        if (v10)
        {

          v50 = 0;
          v51 = 0;
LABEL_93:

          v27 = 0;
          v25 = 0;
          v24 = 0;
          goto LABEL_94;
        }
        -[VCPImageBackboneAnalyzer spatialEmbedding](self->_imageBackboneAnalyzer, "spatialEmbedding");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        VCPSignPostLog();
        v77 = objc_claimAutoreleasedReturnValue();
        v78 = v77;
        if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v78, OS_SIGNPOST_INTERVAL_END, v44, "VCPImageCaptionAnalyzer_MiCa_EmbeddingInference", ", buf, 2u);
        }

        if (v76)
        {
          if (objc_msgSend((id)objc_opt_class(), "writeSpatialEmbeddingToFile"))
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/tmp/com.apple.mediaanalysisd/"), 1);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "path");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v113, "fileExistsAtPath:", v80);

            if ((v81 & 1) != 0)
            {
              v82 = 0;
            }
            else
            {
              objc_msgSend(v79, "path");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = 0;
              v87 = objc_msgSend(v113, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v86, 1, 0, &v118);
              v82 = v118;

              if ((v87 & 1) == 0)
              {
                objc_msgSend(v82, "localizedDescription");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("[ImageCaption] Failed to create directory %@ with error: %@"), v79, v88);

              }
            }
            objc_msgSend(v79, "URLByAppendingPathComponent:isDirectory:", CFSTR("imageSpatialEmbedding.dat"), 0);
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            v117 = v82;
            v90 = objc_msgSend(v76, "writeToURL:options:error:", v89, 1, &v117);
            v91 = v117;

            if (v90)
            {
              if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v89;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[ImageCaption] Image spatial embedding successfully saved to %@", buf, 0xCu);
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v91, "localizedDescription");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v89;
              v141 = 2112;
              v142 = v92;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to save image spatial embedding to %@ with error: %@", buf, 0x16u);

            }
          }
          VCPSignPostLog();
          v93 = objc_claimAutoreleasedReturnValue();
          v94 = os_signpost_id_generate(v93);

          VCPSignPostLog();
          v95 = objc_claimAutoreleasedReturnValue();
          v96 = v95;
          if (v94 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v96, OS_SIGNPOST_INTERVAL_BEGIN, v94, "VCPImageCaptionAnalyzer_MiCa_CaptionInference", ", buf, 2u);
          }

          v97 = objc_msgSend((id)objc_opt_class(), "greedySearchEnabled");
          imageCaptioner = self->_imageCaptioner;
          if ((v97 & 1) != 0)
          {
            v115 = 0;
            v99 = (id *)&v115;
            -[CSUImageCaptioner computeCaptionForEmbedding:withDecodingMethod:error:](imageCaptioner, "computeCaptionForEmbedding:withDecodingMethod:error:", v76, 0, &v115);
            v100 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v116 = 0;
            v99 = (id *)&v116;
            -[CSUImageCaptioner computeCaptionForEmbedding:withDecodingMethod:error:](imageCaptioner, "computeCaptionForEmbedding:withDecodingMethod:error:", v76, 1, &v116);
            v100 = objc_claimAutoreleasedReturnValue();
          }
          v50 = (void *)v100;
          v51 = *v99;
          VCPSignPostLog();
          v101 = objc_claimAutoreleasedReturnValue();
          v102 = v101;
          if (v94 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v102, OS_SIGNPOST_INTERVAL_END, v94, "VCPImageCaptionAnalyzer_MiCa_CaptionInference", ", buf, 2u);
          }

LABEL_120:
          if (!v50 || v51)
          {
LABEL_50:
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v51, "description");
              v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v68 = objc_msgSend(v67, "UTF8String");
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v68;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to generate CSUCaptionResults: (%s)", buf, 0xCu);

            }
            goto LABEL_92;
          }
          objc_msgSend(v50, "results");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (v103)
          {
            objc_msgSend(v50, "results");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = objc_msgSend(v104, "count") == 0;

            if (!v105)
            {
              objc_msgSend(v50, "results");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "objectAtIndexedSubscript:", 0);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "caption");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              v108 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v50, "results");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "objectAtIndexedSubscript:", 0);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "score");
              objc_msgSend(v108, "numberWithFloat:");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v27 = 0;
              v112 = 0;
              goto LABEL_23;
            }
          }
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] [ERROR] CSUCaptionResults has no results", buf, 2u);
          }
LABEL_91:
          v51 = 0;
LABEL_92:
          v10 = -18;
          goto LABEL_93;
        }
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Image embedding for caption generation is nil", buf, 2u);
        }

        break;
      case 2:
        v114 = a5;
        p_rescaledImageBuffer = &self->_rescaledImageBuffer;
        rescaledImageBuffer = self->_rescaledImageBuffer;
        if (rescaledImageBuffer)
          goto LABEL_44;
        -[CSUImageCaptionerConfiguration captioningEncoderConfiguration](self->_captionerConfig, "captioningEncoderConfiguration");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "inputPixelBufferDescriptor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = objc_msgSend(v55, "width");
        v57 = objc_msgSend(v55, "height");
        v58 = objc_msgSend(v55, "pixelFormat");
        v59 = objc_msgSend(v55, "bytesPerRowAlignment");
        objc_msgSend(v55, "isIOSurfaceBacked");
        v60 = *MEMORY[0x1E0CA8F68];
        v145[0] = *MEMORY[0x1E0CA8FF0];
        v145[1] = v60;
        v146[0] = MEMORY[0x1E0C9AA70];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v146[1] = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, v145, 2);
        v62 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        if (CVPixelBufferCreate(0, v56, v57, v58, v62, &self->_rescaledImageBuffer) && *p_rescaledImageBuffer)
        {
          CFRelease(*p_rescaledImageBuffer);
          *p_rescaledImageBuffer = 0;
        }

        rescaledImageBuffer = *p_rescaledImageBuffer;
        if (*p_rescaledImageBuffer)
        {
LABEL_44:
          v63 = self->_imageCaptioner;
          v121 = 0;
          -[CSUImageCaptioner resampleImage:intoInputImage:error:](v63, "resampleImage:intoInputImage:error:", a3, rescaledImageBuffer, &v121);
          v64 = v121;
          if (v64)
          {
            v51 = v64;
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v51, "description");
              v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v66 = objc_msgSend(v65, "UTF8String");
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v66;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Failed to resample input pixelBuffer: (%s)", buf, 0xCu);

            }
            v50 = 0;
            goto LABEL_92;
          }
          VCPSignPostLog();
          v69 = objc_claimAutoreleasedReturnValue();
          v70 = os_signpost_id_generate(v69);

          VCPSignPostLog();
          v71 = objc_claimAutoreleasedReturnValue();
          v72 = v71;
          if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v72, OS_SIGNPOST_INTERVAL_BEGIN, v70, "VCPImageCaptionAnalyzer_AX_CSU_Inference", ", buf, 2u);
          }

          v73 = self->_imageCaptioner;
          v74 = *p_rescaledImageBuffer;
          v120 = 0;
          -[CSUImageCaptioner computeCaptionForImage:withDecodingMethod:error:](v73, "computeCaptionForImage:withDecodingMethod:error:", v74, 1, &v120);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v120;
          VCPSignPostLog();
          v75 = objc_claimAutoreleasedReturnValue();
          v49 = v75;
          if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v49, OS_SIGNPOST_INTERVAL_END, v70, "VCPImageCaptionAnalyzer_AX_CSU_Inference", ", buf, 2u);
          }
          goto LABEL_120;
        }
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v83 = MEMORY[0x1E0C81028];
          v84 = "[ImageCaption] Failed to create rescaledImageBuffer";
LABEL_85:
          _os_log_impl(&dword_1B6C4A000, v83, OS_LOG_TYPE_ERROR, v84, buf, 2u);
        }
        break;
      case 1:
        v114 = a5;
        *(_QWORD *)buf = 0;
        VCPSignPostLog();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_signpost_id_generate(v16);

        VCPSignPostLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = v17 - 1;
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
        {
          *(_WORD *)v122 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPImageCaptionAnalyzer_AX_CVNLP_Inference", ", v122, 2u);
        }

        v21 = (void *)CVNLPCaptionCopyForCVPixelBuffer();
        objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D099F0]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v122 = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] No image caption result generated", v122, 2u);
          }

          v27 = 0;
          v25 = 0;
          goto LABEL_73;
        }
        spid = v17;
        objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D09A00]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D09A10]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D09A08]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = objc_msgSend(v26, "BOOLValue");

        objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0D09A18]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        VCPSignPostLog();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          *(_WORD *)v122 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v29, OS_SIGNPOST_INTERVAL_END, spid, "VCPImageCaptionAnalyzer_AX_CVNLP_Inference", ", v122, 2u);
        }

LABEL_23:
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v30 = self->_modelType;
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v30;
          v141 = 2112;
          v142 = v24;
          v143 = 2112;
          v144 = v25;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ImageCaption] image caption modelType:%lu, text:%@, score:%@", buf, 0x20u);
        }
        if (v24)
        {
          if (v25)
          {
            v138[0] = CFSTR("imageCaptionText");
            v138[1] = CFSTR("imageCaptionConfidence");
            v139[0] = v24;
            v139[1] = v25;
            v138[2] = CFSTR("imageCaptionUnsafeContent");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v139[2] = v31;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v139, v138, 3);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)objc_msgSend(v32, "mutableCopy");

            v34 = self->_modelType;
            switch(v34)
            {
              case 3:
                v126 = CFSTR("MiCaImageCaptionResults");
                v123 = CFSTR("attributes");
                v124 = v33;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v125 = v36;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v125, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v127 = v37;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 2:
                v131 = CFSTR("ImageCaptionResults");
                v128 = CFSTR("attributes");
                v129 = v33;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v130 = v36;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v132 = v37;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              case 1:
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v112);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("imageCaptionLowConfidence"));

                objc_msgSend(v33, "setObject:forKeyedSubscript:", v27, CFSTR("classificationIdentifiers"));
                v136 = CFSTR("ImageCaptionResults");
                v133 = CFSTR("attributes");
                v134 = v33;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v135 = v36;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v135, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v137 = v37;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                break;
              default:
LABEL_99:

                v10 = 0;
                goto LABEL_94;
            }
            *v114 = v38;

            goto LABEL_99;
          }
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] No caption confidence score text generated", buf, 2u);
          }
          v25 = 0;
          goto LABEL_78;
        }
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] No caption text generated", buf, 2u);
        }
LABEL_73:
        v24 = 0;
LABEL_78:
        v10 = -18;
LABEL_94:

        goto LABEL_95;
      default:
        v51 = 0;
        v50 = 0;
        goto LABEL_50;
    }
    v50 = 0;
    goto LABEL_91;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Image caption analysis cancelled", buf, 2u);
  }
  v10 = -128;
LABEL_95:

  return v10;
}

- (int)analyzeEmbedding:(id)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  id v9;
  unsigned int (**v10)(_QWORD);
  int v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  CSUImageCaptioner *imageCaptioner;
  id *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t modelType;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  id *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[3];
  _QWORD v50[3];
  const __CFString *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (unsigned int (**)(_QWORD))a6;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ImageCaption] Computing MiCa image caption with embedding", buf, 2u);
  }
  if (!v10 || !v10[2](v10))
  {
    if (v9)
    {
      if (self->_modelType == 3)
      {
        if (objc_msgSend(v9, "length") == 374784)
        {
          v44 = a5;
          VCPSignPostLog();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = os_signpost_id_generate(v12);

          VCPSignPostLog();
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPImageCaptionAnalyzer_MiCa_CaptionInference", ", buf, 2u);
          }

          v16 = objc_msgSend((id)objc_opt_class(), "greedySearchEnabled");
          imageCaptioner = self->_imageCaptioner;
          if ((v16 & 1) != 0)
          {
            v47 = 0;
            v18 = (id *)&v47;
            -[CSUImageCaptioner computeCaptionForEmbedding:withDecodingMethod:error:](imageCaptioner, "computeCaptionForEmbedding:withDecodingMethod:error:", v9, 0, &v47);
            v19 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v48 = 0;
            v18 = (id *)&v48;
            -[CSUImageCaptioner computeCaptionForEmbedding:withDecodingMethod:error:](imageCaptioner, "computeCaptionForEmbedding:withDecodingMethod:error:", v9, 1, &v48);
            v19 = objc_claimAutoreleasedReturnValue();
          }
          v46 = (void *)v19;
          v45 = *v18;
          VCPSignPostLog();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_END, v13, "VCPImageCaptionAnalyzer_MiCa_CaptionInference", ", buf, 2u);
          }

          if (!v46 || v45)
          {
            v41 = v46;
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v45, "description");
              v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v43 = objc_msgSend(v42, "UTF8String");
              *(_DWORD *)buf = 136315138;
              v57 = v43;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ERROR] Failed to generate CSUCaptionResults: (%s)", buf, 0xCu);

              v11 = -18;
LABEL_46:
              v41 = v46;
LABEL_51:

              goto LABEL_30;
            }
          }
          else
          {
            objc_msgSend(v46, "results");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              objc_msgSend(v46, "results");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "count") == 0;

              if (!v29)
              {
                objc_msgSend(v46, "results");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "caption");
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                v33 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v46, "results");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "score");
                objc_msgSend(v33, "numberWithFloat:");
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  modelType = self->_modelType;
                  *(_DWORD *)buf = 134218498;
                  v57 = modelType;
                  v58 = 2112;
                  v59 = (uint64_t)v32;
                  v60 = 2112;
                  v61 = v36;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[ImageCaption] image caption modelType:%lu, text:%@, score:%@", buf, 0x20u);
                }
                v54 = CFSTR("MiCaImageCaptionResults");
                v51 = CFSTR("attributes");
                v49[0] = CFSTR("imageCaptionText");
                v49[1] = CFSTR("imageCaptionConfidence");
                v50[0] = v32;
                v50[1] = v36;
                v49[2] = CFSTR("imageCaptionUnsafeContent");
                v50[2] = MEMORY[0x1E0C9AAA0];
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = v38;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v39;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = v40;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
                *v44 = (id)objc_claimAutoreleasedReturnValue();

                v11 = 0;
                goto LABEL_46;
              }
            }
            v41 = v46;
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ERROR] CSUCaptionResults has no results", buf, 2u);
            }
          }
          v11 = -18;
          goto LABEL_51;
        }
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
LABEL_29:
          v11 = -18;
          goto LABEL_30;
        }
        v23 = objc_msgSend(v9, "length");
        *(_DWORD *)buf = 134218240;
        v57 = v23;
        v58 = 2048;
        v59 = 374784;
        v20 = MEMORY[0x1E0C81028];
        v21 = "Embedding size mismatch (current embedding size in byte: %lu, expected size in byte with float: %lu) analy"
              "zeEmbedding only supports VCPMUBBRevision_V3 and VCPMUBBRevision_V4";
        v22 = 22;
LABEL_25:
        _os_log_impl(&dword_1B6C4A000, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);
        goto LABEL_29;
      }
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      *(_WORD *)buf = 0;
      v20 = MEMORY[0x1E0C81028];
      v21 = "analyzeEmbedding only support MADImageCaptionModelType_Mica";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      *(_WORD *)buf = 0;
      v20 = MEMORY[0x1E0C81028];
      v21 = "[ImageCaption] Image embedding for caption generation is nil";
    }
    v22 = 2;
    goto LABEL_25;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ImageCaption] Image caption analysis cancelled", buf, 2u);
  }
  v11 = -128;
LABEL_30:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBackboneAnalyzer, 0);
  objc_storeStrong((id *)&self->_captionerConfig, 0);
  objc_storeStrong((id *)&self->_imageCaptioner, 0);
}

@end
