@implementation VCPPreAnalyzer

+ (BOOL)_allowANE
{
  return 1;
}

+ (BOOL)_includeNSFW
{
  return 1;
}

+ (BOOL)_includeLM
{
  return 1;
}

+ (BOOL)_includeSE
{
  return 1;
}

+ (BOOL)_includeSDG
{
  return 1;
}

+ (BOOL)_includeWP
{
  return 1;
}

+ (BOOL)_includeDO
{
  return 1;
}

+ (BOOL)_includeSO
{
  return 1;
}

+ (BOOL)_includeMeme
{
  return 1;
}

+ (BOOL)_includeRotation
{
  return 1;
}

+ (BOOL)_includeDocument
{
  return 1;
}

+ (BOOL)_includeIVS
{
  return 1;
}

+ (BOOL)_includePA
{
  return 1;
}

+ (BOOL)_includeCN
{
  return 1;
}

+ (BOOL)_useR14J9
{
  return 1;
}

+ (unint64_t)_getSHRevision
{
  unsigned __int8 v2;
  __objc2_class **p_superclass;
  int v5;

  p_superclass = &OBJC_METACLASS___VCPVideoCaptionEncoder.superclass;
  if ((v2 & 1) == 0)
  {
    p_superclass = &OBJC_METACLASS___VCPVideoCaptionEncoder.superclass;
    if (v5)
    {
      +[VCPPreAnalyzer _getSHRevision]::revision = 2;
      p_superclass = (__objc2_class **)(&OBJC_METACLASS___VCPVideoCaptionEncoder + 8);
    }
  }
  return (unint64_t)p_superclass[504];
}

+ (BOOL)_enableSceneAssetConcurrency
{
  return 0;
}

+ (BOOL)_includeDMF
{
  return 1;
}

+ (BOOL)_isPanoWithMediaType:(int64_t)a3 andMediaSubtypes:(unint64_t)a4
{
  return (a3 == 1) & a4;
}

+ (BOOL)_isSDOFWithMediaType:(int64_t)a3 andMediaSubtypes:(unint64_t)a4
{
  return a3 == 1 && (a4 & 0x10) != 0;
}

+ (BOOL)_isMovieWithMediaType:(int64_t)a3
{
  return a3 == 2;
}

+ (id)_nonPanoPreWarmDimensions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCPPreAnalyzer__nonPanoPreWarmDimensions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VCPPreAnalyzer _nonPanoPreWarmDimensions]::once != -1)
    dispatch_once(&+[VCPPreAnalyzer _nonPanoPreWarmDimensions]::once, block);
  return (id)+[VCPPreAnalyzer _nonPanoPreWarmDimensions]::cachedDimensions;
}

void __43__VCPPreAnalyzer__nonPanoPreWarmDimensions__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 299.0, 299.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v1);

  if (objc_msgSend((id)objc_opt_class(), "_includeMeme"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 360.0, 360.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v2);

  }
  if (objc_msgSend((id)objc_opt_class(), "_includeDocument"))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 256.0, 256.0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v3);

  }
  v4 = (void *)+[VCPPreAnalyzer _nonPanoPreWarmDimensions]::cachedDimensions;
  +[VCPPreAnalyzer _nonPanoPreWarmDimensions]::cachedDimensions = (uint64_t)v0;

}

- (VCPPreAnalyzer)init
{
  VCPPreAnalyzer *v2;
  dispatch_group_t v3;
  OS_dispatch_group *processingGroup;
  dispatch_queue_t v5;
  OS_dispatch_queue *processingQueue;
  uint64_t v7;
  VCPObjectPool *sessionPool;
  VCPPoolBasedPixelBufferCreator *v9;
  VCPPoolBasedPixelBufferCreator *monochromeBufferCreator;
  VCPPreAnalysisImageLoader *v11;
  VCPPreAnalysisImageLoader *imageLoader;
  uint64_t v13;
  VCPMAMLModel *rotationModel;
  VCPPoolBasedPixelBufferCreator *v15;
  VCPPoolBasedPixelBufferCreator *rotationBufferCreator;
  uint64_t v17;
  VCPObjectPool *ivsPool;
  VCPPreAnalyzer *v19;
  NSObject *v20;
  const char *v21;
  VCPPreAnalyzer *v22;
  objc_super v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VCPPreAnalyzer;
  v2 = -[VCPPreAnalyzer init](&v24, sel_init);
  if (!v2)
    goto LABEL_14;
  +[VCPPreAnalysisRequests asyncCacheRequestIdealDimension](VCPPreAnalysisRequests, "asyncCacheRequestIdealDimension");
  +[VCPPreAnalysisRequests asyncLoadSharedPhotoFormatsObjects](VCPPreAnalysisRequests, "asyncLoadSharedPhotoFormatsObjects");
  v3 = dispatch_group_create();
  processingGroup = v2->_processingGroup;
  v2->_processingGroup = (OS_dispatch_group *)v3;

  v5 = dispatch_queue_create("com.apple.mediaanalysis.SceneProcessingGroup", 0);
  processingQueue = v2->_processingQueue;
  v2->_processingQueue = (OS_dispatch_queue *)v5;

  +[VCPObjectPool objectPoolWithAllocator:](VCPObjectPool, "objectPoolWithAllocator:", &__block_literal_global_60);
  v7 = objc_claimAutoreleasedReturnValue();
  sessionPool = v2->_sessionPool;
  v2->_sessionPool = (VCPObjectPool *)v7;

  v9 = -[VCPPoolBasedPixelBufferCreator initWithBufferWidth:bufferHeight:andPixelFormat:]([VCPPoolBasedPixelBufferCreator alloc], "initWithBufferWidth:bufferHeight:andPixelFormat:", 299, 299, 1278226488);
  monochromeBufferCreator = v2->_monochromeBufferCreator;
  v2->_monochromeBufferCreator = v9;

  if (!v2->_monochromeBufferCreator)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v20 = MEMORY[0x1E0C81028];
    v21 = "[VCPPreAnalyzer] Failed to create VCPPoolBasedPixelBufferCreator for monochrome";
    goto LABEL_10;
  }
  v11 = -[VCPPreAnalysisImageLoader initWithMonochromeBufferCreator:]([VCPPreAnalysisImageLoader alloc], "initWithMonochromeBufferCreator:", v2->_monochromeBufferCreator);
  imageLoader = v2->_imageLoader;
  v2->_imageLoader = v11;

  if (objc_msgSend((id)objc_opt_class(), "_includeRotation"))
  {
    +[VCPMAMLModel vcp_sharedModelWithModelName:](VCPMAMLModel, "vcp_sharedModelWithModelName:", CFSTR("MonzaV4_1"));
    v13 = objc_claimAutoreleasedReturnValue();
    rotationModel = v2->_rotationModel;
    v2->_rotationModel = (VCPMAMLModel *)v13;

    if (v2->_rotationModel)
    {
      v15 = -[VCPPoolBasedPixelBufferCreator initWithBufferWidth:bufferHeight:andPixelFormat:]([VCPPoolBasedPixelBufferCreator alloc], "initWithBufferWidth:bufferHeight:andPixelFormat:", -[VCPMAMLModel inputSize](v2->_rotationModel, "inputSize"), -[VCPMAMLModel inputSize](v2->_rotationModel, "inputSize"), 1111970369);
      rotationBufferCreator = v2->_rotationBufferCreator;
      v2->_rotationBufferCreator = v15;

      if (v2->_rotationBufferCreator)
        goto LABEL_6;
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_19:
        v22 = 0;
        goto LABEL_20;
      }
      *(_WORD *)buf = 0;
      v20 = MEMORY[0x1E0C81028];
      v21 = "[VCPPreAnalyzer] Failed to create VCPPoolBasedPixelBufferCreator for rotation";
LABEL_10:
      _os_log_impl(&dword_1B6C4A000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
      goto LABEL_19;
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = CFSTR("MonzaV4_1");
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, " [ProbableRotation] Failed to load %@", buf, 0xCu);
    }
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
LABEL_6:
  +[VCPObjectPool objectPoolWithAllocator:](VCPObjectPool, "objectPoolWithAllocator:", &__block_literal_global_165);
  v17 = objc_claimAutoreleasedReturnValue();
  ivsPool = v2->_ivsPool;
  v2->_ivsPool = (VCPObjectPool *)v17;

  v19 = v2;
LABEL_15:
  v22 = v19;
LABEL_20:

  return v22;
}

id __22__VCPPreAnalyzer_init__block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0CEE040]);
}

id __22__VCPPreAnalyzer_init__block_invoke_163()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0D8C998]);
  v12 = *MEMORY[0x1E0D8C9D8];
  v13[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v2 = (void *)objc_msgSend(v0, "initWithOptions:error:", v1, &v7);
  v3 = v7;

  if (v3 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (id)objc_opt_class();
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create %@: %@", buf, 0x16u);

  }
  return v2;
}

- (void)_configureRequest:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setMetalContextPriority:", 1);
  objc_msgSend(v4, "setPreferBackgroundProcessing:", 1);
  if (DeviceHasANE() && objc_msgSend((id)objc_opt_class(), "_allowANE"))
  {
    objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProcessingDevice:", v3);

  }
}

- (void)_configureRequest:(id)a3 withRevision:(unint64_t)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setRevision:", a4);
  -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v6);

}

- (int)_createRequests:(id)a3 withMediaType:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  const char *v39;
  int v40;
  uint32_t v42;
  NSObject *v43;
  const char *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  id v50;
  void *v51;
  void *v52;
  char v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  uint8_t buf[4];
  uint64_t v109;
  __int16 v110;
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0CEDDD0]);
  objc_msgSend(v6, "setAestheticsRequest:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0CEE020]);
  objc_msgSend(v6, "setClassificationRequest:", v8);

  v9 = objc_alloc_init(MEMORY[0x1E0CEDE40]);
  objc_msgSend(v6, "setSceneprintRequest:", v9);

  v10 = objc_alloc_init(MEMORY[0x1E0CEDDE0]);
  objc_msgSend(v6, "setJunkImageRequest:", v10);

  v11 = objc_alloc_init(MEMORY[0x1E0CEDF08]);
  objc_msgSend(v6, "setSaliencyRequest:", v11);

  objc_msgSend(v6, "aestheticsRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v38 = MEMORY[0x1E0C81028];
    v39 = "Failed to create VNClassifyImageAestheticsRequest";
    goto LABEL_30;
  }
  objc_msgSend(v6, "classificationRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v38 = MEMORY[0x1E0C81028];
    v39 = "Failed to create VNSceneClassificationRequest";
    goto LABEL_30;
  }
  objc_msgSend(v6, "sceneprintRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v38 = MEMORY[0x1E0C81028];
    v39 = "Failed to create VNCreateSceneprintRequest";
    goto LABEL_30;
  }
  objc_msgSend(v6, "junkImageRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v38 = MEMORY[0x1E0C81028];
    v39 = "Failed to create VNClassifyJunkImageRequest";
    goto LABEL_30;
  }
  objc_msgSend(v6, "saliencyRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v6, "aestheticsRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v17);

    objc_msgSend(v6, "classificationRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v18);

    objc_msgSend(v6, "sceneprintRequest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v19);

    objc_msgSend(v6, "junkImageRequest");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v20);

    objc_msgSend(v6, "saliencyRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v21);

    objc_msgSend(v6, "classificationRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMaximumLeafObservations:", 15);

    objc_msgSend(v6, "classificationRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMaximumHierarchicalObservations:", 15);

    objc_msgSend(v6, "aestheticsRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = 0;
    v25 = objc_msgSend(v24, "setRevision:error:", 3737841667, &v107);
    v26 = v107;

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v6, "classificationRequest");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v26;
      v28 = objc_msgSend(v27, "setRevision:error:", 3737841665, &v106);
      v29 = v106;

      if ((v28 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_135;
        *(_DWORD *)buf = 134218242;
        v109 = 3737841665;
        v110 = 2112;
        v111 = v29;
        v43 = MEMORY[0x1E0C81028];
        v44 = "Failed to set VNSceneClassificationRequest::setRevision %lu: %@";
        goto LABEL_41;
      }
      objc_msgSend(v6, "sceneprintRequest");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v29;
      v31 = objc_msgSend(v30, "setRevision:error:", 3737841671, &v105);
      v26 = v105;

      if ((v31 & 1) != 0)
      {
        objc_msgSend(v6, "saliencyRequest");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v26;
        v33 = objc_msgSend(v32, "setRevision:error:", 3737841667, &v104);
        v29 = v104;

        if ((v33 & 1) == 0)
        {
          if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_135;
          *(_DWORD *)buf = 134218242;
          v109 = 3737841667;
          v110 = 2112;
          v111 = v29;
          v43 = MEMORY[0x1E0C81028];
          v44 = "Failed to set VNGenerateAttentionBasedSaliencyImageRequest::setRevision %lu: %@";
          goto LABEL_41;
        }
        if (objc_msgSend((id)objc_opt_class(), "_useR14J9"))
        {
          objc_msgSend(v6, "junkImageRequest");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = v29;
          v35 = objc_msgSend(v34, "setRevision:error:", 3737841669, &v103);
          v26 = v103;

          if ((v35 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_141;
            *(_DWORD *)buf = 134218242;
            v109 = 3737841669;
            v110 = 2112;
            v111 = v26;
            v36 = MEMORY[0x1E0C81028];
            v37 = "Failed to set VNClassifyJunkImageRequest::setRevision %lu: %@";
            goto LABEL_36;
          }
        }
        else
        {
          v26 = v29;
        }
        if (objc_msgSend((id)objc_opt_class(), "_includeDO"))
        {
          v45 = objc_alloc_init(MEMORY[0x1E0CEDFE8]);
          objc_msgSend(v6, "setObjectRequest:", v45);

          objc_msgSend(v6, "objectRequest");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v45) = v46 == 0;

          if ((_DWORD)v45)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_141;
            v89 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v109 = v89;
            v36 = MEMORY[0x1E0C81028];
            v37 = "Failed to create %@";
            goto LABEL_140;
          }
          objc_msgSend(v6, "objectRequest");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v47);

          objc_msgSend(v6, "objectRequest");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v26;
          v49 = objc_msgSend(v48, "setRevision:error:", 3737841667, &v102);
          v29 = v102;

          if ((v49 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_135;
            *(_DWORD *)buf = 134218242;
            v109 = 3737841667;
            v110 = 2112;
            v111 = v29;
            v43 = MEMORY[0x1E0C81028];
            v44 = "Failed to set VNRecognizeObjectsRequest::setRevision %lu: %@";
            goto LABEL_41;
          }
          v26 = v29;
        }
        if (objc_msgSend((id)objc_opt_class(), "_includeSO"))
        {
          v50 = objc_alloc_init(MEMORY[0x1E0CEDF28]);
          objc_msgSend(v6, "setSaliencyObjectnessRequest:", v50);

          objc_msgSend(v6, "saliencyObjectnessRequest");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v50) = v51 == 0;

          if ((_DWORD)v50)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_141;
            v90 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v109 = v90;
            v36 = MEMORY[0x1E0C81028];
            v37 = "Failed to create %@";
            goto LABEL_140;
          }
          objc_msgSend(v6, "saliencyObjectnessRequest");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v26;
          v53 = objc_msgSend(v52, "setRevision:error:", 3737841666, &v101);
          v29 = v101;

          if ((v53 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_135;
            *(_DWORD *)buf = 134218242;
            v109 = 3737841666;
            v110 = 2112;
            v111 = v29;
            v43 = MEMORY[0x1E0C81028];
            v44 = "Failed to set VNGenerateObjectnessBasedSaliencyImageRequest::setRevision %lu: %@";
            goto LABEL_41;
          }
          v26 = v29;
        }
        if (objc_msgSend((id)objc_opt_class(), "_includeSE"))
        {
          v54 = objc_alloc_init(MEMORY[0x1E0CEDD88]);
          objc_msgSend(v6, "setTabooRequest:", v54);

          objc_msgSend(v6, "tabooRequest");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v54) = v55 == 0;

          if ((_DWORD)v54)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_141;
            v91 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v109 = v91;
            v36 = MEMORY[0x1E0C81028];
            v37 = "Failed to create %@";
            goto LABEL_140;
          }
          objc_msgSend(v6, "tabooRequest");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v56);

          objc_msgSend(v6, "tabooRequest");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = v26;
          v58 = objc_msgSend(v57, "setRevision:error:", 2, &v100);
          v29 = v100;

          if ((v58 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_135;
            *(_DWORD *)buf = 134218242;
            v109 = 2;
            v110 = 2112;
            v111 = v29;
            v43 = MEMORY[0x1E0C81028];
            v44 = "Failed to set VNClassifySignificantEventRequest::setRevision %lu: %@";
            goto LABEL_41;
          }
          v26 = v29;
        }
        if (objc_msgSend((id)objc_opt_class(), "_includeSDG"))
        {
          v59 = objc_alloc_init(MEMORY[0x1E0CEDD80]);
          objc_msgSend(v6, "setSemanticRequest:", v59);

          objc_msgSend(v6, "semanticRequest");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v59) = v60 == 0;

          if ((_DWORD)v59)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_141;
            v92 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v109 = v92;
            v36 = MEMORY[0x1E0C81028];
            v37 = "Failed to create %@";
            goto LABEL_140;
          }
          objc_msgSend(v6, "semanticRequest");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v61);

          objc_msgSend(v6, "semanticRequest");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = v26;
          v63 = objc_msgSend(v62, "setRevision:error:", 3737841667, &v99);
          v29 = v99;

          if ((v63 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_135;
            *(_DWORD *)buf = 134218242;
            v109 = 3737841667;
            v110 = 2112;
            v111 = v29;
            v43 = MEMORY[0x1E0C81028];
            v44 = "Failed to set VNClassifySemanticDevelopmentGatingRequest::setRevision %lu: %@";
            goto LABEL_41;
          }
          v26 = v29;
        }
        if (objc_msgSend((id)objc_opt_class(), "_includeMeme"))
        {
          v64 = objc_alloc_init(MEMORY[0x1E0CEDDE8]);
          objc_msgSend(v6, "setMemeRequest:", v64);

          objc_msgSend(v6, "memeRequest");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v64) = v65 == 0;

          if ((_DWORD)v64)
          {
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_141;
            goto LABEL_119;
          }
          objc_msgSend(v6, "memeRequest");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPPreAnalyzer _configureRequest:withRevision:](self, "_configureRequest:withRevision:", v66, 3);

        }
        if (!objc_msgSend((id)objc_opt_class(), "_includeDocument"))
          goto LABEL_70;
        objc_msgSend(MEMORY[0x1E0CEDFD8], "vcp_sceneRequest");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setDocumentRequest:", v67);

        objc_msgSend(v6, "documentRequest");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v67) = v68 == 0;

        if ((_DWORD)v67)
        {
          if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_141;
        }
        else
        {
LABEL_70:
          if (!objc_msgSend((id)objc_opt_class(), "_includePA"))
            goto LABEL_74;
          v69 = objc_alloc_init(MEMORY[0x1E0CEDD78]);
          objc_msgSend(v6, "setAdjustmentsRequest:", v69);

          objc_msgSend(v6, "adjustmentsRequest");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v69) = v70 == 0;

          if (!(_DWORD)v69)
          {
            objc_msgSend(v6, "adjustmentsRequest");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v71);

            objc_msgSend(v6, "adjustmentsRequest");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = v26;
            v73 = objc_msgSend(v72, "setRevision:error:", 3737841664, &v98);
            v29 = v98;

            if ((v73 & 1) == 0)
            {
              if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                goto LABEL_135;
              *(_DWORD *)buf = 134218242;
              v109 = 3737841664;
              v110 = 2112;
              v111 = v29;
              v43 = MEMORY[0x1E0C81028];
              v44 = "Failed to set VNGeneratePhotosAdjustmentsRequest::setRevision %lu: %@";
              goto LABEL_41;
            }
            v26 = v29;
LABEL_74:
            if (objc_msgSend((id)objc_opt_class(), "_includeCN"))
            {
              v74 = objc_alloc_init(MEMORY[0x1E0CEDDC0]);
              objc_msgSend(v6, "setCityNatureRequest:", v74);

              objc_msgSend(v6, "cityNatureRequest");
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v74) = v75 == 0;

              if ((_DWORD)v74)
              {
                if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  goto LABEL_141;
                v94 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                v109 = v94;
                v36 = MEMORY[0x1E0C81028];
                v37 = "Failed to create %@";
                goto LABEL_140;
              }
              objc_msgSend(v6, "cityNatureRequest");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v76);

              objc_msgSend(v6, "cityNatureRequest");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = v26;
              v78 = objc_msgSend(v77, "setRevision:error:", 2, &v97);
              v29 = v97;

              if ((v78 & 1) == 0)
              {
                if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  goto LABEL_135;
                *(_DWORD *)buf = 134218242;
                v109 = 2;
                v110 = 2112;
                v111 = v29;
                v43 = MEMORY[0x1E0C81028];
                v44 = "Failed to set VNClassifyCityNatureImageRequest::setRevision %lu: %@";
                goto LABEL_41;
              }
              v26 = v29;
            }
            if (objc_msgSend((id)objc_opt_class(), "_includeDMF")
              && (objc_msgSend((id)objc_opt_class(), "_isMovieWithMediaType:", a4) & 1) == 0)
            {
              v79 = objc_alloc_init(MEMORY[0x1E0CEDE30]);
              objc_msgSend(v6, "setImagefingerprintsRequest:", v79);

              objc_msgSend(v6, "imagefingerprintsRequest");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v79) = v80 == 0;

              if ((_DWORD)v79)
              {
                if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  goto LABEL_141;
LABEL_139:
                v95 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                v109 = v95;
                v36 = MEMORY[0x1E0C81028];
                v37 = "Failed to create %@";
                goto LABEL_140;
              }
              objc_msgSend(v6, "imagefingerprintsRequest");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              -[VCPPreAnalyzer _configureRequest:withRevision:](self, "_configureRequest:withRevision:", v81, 1);

            }
            if (!objc_msgSend(MEMORY[0x1E0CEE018], "mad_includeEntityNet"))
            {
              v40 = 0;
LABEL_142:

              goto LABEL_32;
            }
            v82 = objc_alloc_init(MEMORY[0x1E0CEDDD8]);
            objc_msgSend(v6, "setClassifyImageRequest:", v82);

            objc_msgSend(v6, "classifyImageRequest");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v82) = v83 == 0;

            if (!(_DWORD)v82)
            {
              objc_msgSend(v6, "classifyImageRequest");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              -[VCPPreAnalyzer _configureRequest:](self, "_configureRequest:", v84);

              objc_msgSend(v6, "classifyImageRequest");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = v26;
              v86 = objc_msgSend(v85, "setRevision:error:", 3737841667, &v96);
              v29 = v96;

              if ((v86 & 1) != 0)
              {
                objc_msgSend(v6, "classifyImageRequest");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v87, "setMaximumLeafObservations:", 15);

                objc_msgSend(v6, "classifyImageRequest");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "setMaximumHierarchicalObservations:", 15);

                v40 = 0;
LABEL_136:
                v26 = v29;
                goto LABEL_142;
              }
              if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
LABEL_135:
                v40 = -18;
                goto LABEL_136;
              }
              *(_DWORD *)buf = 134218242;
              v109 = 3737841667;
              v110 = 2112;
              v111 = v29;
              v43 = MEMORY[0x1E0C81028];
              v44 = "Failed to set VNClassifyImageRequest::setRevision %lu: %@";
LABEL_41:
              _os_log_impl(&dword_1B6C4A000, v43, OS_LOG_TYPE_ERROR, v44, buf, 0x16u);
              goto LABEL_135;
            }
            if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_141;
            goto LABEL_139;
          }
          if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_141;
        }
LABEL_119:
        v93 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v109 = v93;
        v36 = MEMORY[0x1E0C81028];
        v37 = "Failed to create %@";
LABEL_140:
        v42 = 12;
        goto LABEL_37;
      }
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_141;
      *(_DWORD *)buf = 134218242;
      v109 = 3737841671;
      v110 = 2112;
      v111 = v26;
      v36 = MEMORY[0x1E0C81028];
      v37 = "Failed to set VNCreateSceneprintRequest::setRevision %lu: %@";
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_141;
      *(_DWORD *)buf = 134218242;
      v109 = 3737841667;
      v110 = 2112;
      v111 = v26;
      v36 = MEMORY[0x1E0C81028];
      v37 = "Failed to set VNClassifyImageAestheticsRequest::setRevision %lu: %@";
    }
LABEL_36:
    v42 = 22;
LABEL_37:
    _os_log_impl(&dword_1B6C4A000, v36, OS_LOG_TYPE_ERROR, v37, buf, v42);
LABEL_141:
    v40 = -18;
    goto LABEL_142;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v38 = MEMORY[0x1E0C81028];
    v39 = "Failed to create VNGenerateAttentionBasedSaliencyImageRequest";
LABEL_30:
    _os_log_impl(&dword_1B6C4A000, v38, OS_LOG_TYPE_ERROR, v39, buf, 2u);
  }
LABEL_31:
  v40 = -18;
LABEL_32:

  return v40;
}

- (void)_parseClassificationObservations:(id)a3 toClassificationResults:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  const __CFString *v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v23;
    *(_QWORD *)&v9 = 138412290;
    v21 = v9;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "confidence", v21);
        if (v13 >= 0.01)
        {
          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          VCPSpecialLabelToExtendedSceneClassificationID(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v28 = CFSTR("Confidence");
            v16 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v12, "confidence");
            objc_msgSend(v16, "numberWithFloat:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v19);

          }
          else
          {
            objc_msgSend(v12, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              v20 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v21;
                v27 = v17;
                _os_log_impl(&dword_1B6C4A000, v20, OS_LOG_TYPE_ERROR, "Unsupported observation label in VCPSpecialLabelToExtendedSceneClassificationID %@", buf, 0xCu);
              }
            }
          }

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v8);
  }

}

- (void)_parseClassificationObservations:(id)a3 withPrefix:(id)a4 toClassificationResults:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  float v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "confidence");
        if (v15 >= 0.01)
        {
          if (v8 && (objc_msgSend(v14, "hasPrefix:", v8) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v8, v14);
            v16 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v16;
          }
          VCPSpecialLabelToExtendedSceneClassificationID(v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v30 = CFSTR("Confidence");
            v18 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "confidence");
            objc_msgSend(v18, "numberWithFloat:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringValue");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v21);

          }
          else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v29 = v22;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unsupported observation label %@", buf, 0xCu);

          }
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }

}

- (void)_parsePhotosTaxonomyClassificationObservations:(id)a3 toClassificationResults:(id)a4 andDetectorSceneClassIds:(id)a5 isEntityNet:(BOOL)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _BOOL4 v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  const __CFString *v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v37 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = a4;
  v38 = a5;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1BCCA1B2C]();
        objc_msgSend(v13, "confidence");
        if (v15 >= 0.01)
        {
          objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "nodeForName:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v18, "highPrecisionThreshold");
            v20 = v19;
            objc_msgSend(v18, "highRecallThreshold");
            v22 = v21;
            objc_msgSend(v18, "searchThreshold");
            v24 = v23;
            objc_msgSend(v13, "confidence");
            if (v22 >= v20)
              v26 = v20;
            else
              v26 = v22;
            if (v24 < v26)
              v26 = v24;
            v27 = v25;
            if (v26 < 0.00999999978)
              v26 = 0.00999999978;
            if (v26 <= v27)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v18, "extendedSceneClassId"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringValue");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              v47 = CFSTR("Confidence");
              v30 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "confidence");
              objc_msgSend(v30, "numberWithFloat:");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = v31;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v32, v29);

              if (v38)
              {
                objc_msgSend(v18, "detectors");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v39[0] = MEMORY[0x1E0C809B0];
                v39[1] = 3221225472;
                v39[2] = __126__VCPPreAnalyzer__parsePhotosTaxonomyClassificationObservations_toClassificationResults_andDetectorSceneClassIds_isEntityNet___block_invoke;
                v39[3] = &unk_1E6B19BD8;
                v40 = v38;
                objc_msgSend(v33, "enumerateObjectsUsingBlock:", v39);

              }
            }
          }
          else if (v37)
          {
            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v13, "identifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v46 = v34;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Unsupported EntityNet label in PFSceneTaxonomyNode: %@", buf, 0xCu);

            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "identifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v46 = v35;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported SceneNet label in PFSceneTaxonomyNode: %@", buf, 0xCu);

          }
        }
        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v10);
  }

}

void __126__VCPPreAnalyzer__parsePhotosTaxonomyClassificationObservations_toClassificationResults_andDetectorSceneClassIds_isEntityNet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "extendedSceneClassId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

- (id)_processBoundingBoxFromDetectedObjects:(id)a3 forSceneClassID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  uint64_t i;
  void *v27;
  float v28;
  float v29;
  double v30;
  id v31;
  uint64_t v32;
  float v33;
  void *v34;
  uint64_t v35;
  float v36;
  float v37;
  uint64_t j;
  void *v39;
  void *v40;
  float v41;
  float v42;
  void *v43;
  float v44;
  float v45;
  uint64_t v47;
  double v48;
  void *v49;
  void *v50;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[3];
  _QWORD v63[3];
  uint8_t buf[4];
  double v65;
  __int16 v66;
  double v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _QWORD v72[3];
  _QWORD v73[6];

  v73[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v52 = a4;
  v53 = v5;
  if (!objc_msgSend(v5, "count"))
  {
    if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v19 = MEMORY[0x1E0C81028];
    v20 = "[DO] detectedObjects count is 0; skip detectedObjects";
    v21 = 2;
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Confidence"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("size"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    v73[0] = v52;
    v72[0] = CFSTR("classID");
    v72[1] = CFSTR("BoundingBox");
    objc_msgSend(v5, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BoundingBox"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v73[1] = v15;
    v72[2] = CFSTR("score");
    *(float *)&v16 = v9 * v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v73[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_47;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v22 = v5;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v59;
    v25 = -1.0;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v59 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("Confidence"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v29 = v28;

        if (v29 > v25)
          v25 = v29;
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (v23);
  }
  else
  {
    v25 = -1.0;
  }

  v30 = v25;
  if (v25 < 0.01)
  {
    if ((int)MediaAnalysisLogLevel() < 4 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_DWORD *)buf = 134217984;
    v65 = v25;
    v19 = MEMORY[0x1E0C81028];
    v20 = "[DO] invalid confidenceMax: %f; skip detectedObjects";
    v21 = 12;
LABEL_22:
    _os_log_impl(&dword_1B6C4A000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
LABEL_23:
    v18 = 0;
    goto LABEL_47;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v31 = v22;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
  v33 = v25 * 0.8;
  v34 = 0;
  if (v32)
  {
    v35 = *(_QWORD *)v55;
    v36 = -1.0;
    v37 = -1.0;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v55 != v35)
          objc_enumerationMutation(v31);
        v39 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Confidence"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "floatValue");
        v42 = v41;

        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("size"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "floatValue");
        v45 = v44;

        if (v42 >= v33 && v45 > v36)
        {
          objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("BoundingBox"));
          v47 = objc_claimAutoreleasedReturnValue();

          v36 = v45;
          v37 = v42;
          v34 = (void *)v47;
        }
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    }
    while (v32);
  }
  else
  {
    v36 = -1.0;
    v37 = -1.0;
  }

  if (v36 == -1.0 || v37 == -1.0 || !v34)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v31, "description");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v65 = v30;
      v66 = 2048;
      v67 = v33;
      v68 = 2112;
      v69 = v50;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[DO] Failed to choose the best bounding box c_max: %f, c_threshold (0.8x): %f from %@", buf, 0x20u);

    }
    v18 = 0;
  }
  else
  {
    v62[0] = CFSTR("classID");
    v62[1] = CFSTR("BoundingBox");
    v63[0] = v52;
    v63[1] = v34;
    v62[2] = CFSTR("score");
    *(float *)&v48 = v36 * v37;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_47:

  return v18;
}

- (void)_insertBoundingBox:(id)a3 toSortedBoundingBoxes:(id)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  unint64_t i;
  void *v10;
  void *v11;
  float v12;
  float v13;
  id v14;

  v14 = a3;
  v5 = a4;
  if (v14 && v5)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("score"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    for (i = 0; i < objc_msgSend(v5, "count"); ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("score"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v13 = v12;

      if (v13 < v8)
        break;
    }
    objc_msgSend(v5, "insertObject:atIndex:", v14, i);
  }

}

- (id)_extractAndSortBoundingBoxFromDetectedObjects:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__VCPPreAnalyzer__extractAndSortBoundingBoxFromDetectedObjects___block_invoke;
  v14[3] = &unk_1E6B19C00;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __64__VCPPreAnalyzer__extractAndSortBoundingBoxFromDetectedObjects___block_invoke_199;
  v12[3] = &unk_1E6B19C28;
  v12[4] = self;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = v13;
  v10 = v8;

  return v10;
}

void __64__VCPPreAnalyzer__extractAndSortBoundingBoxFromDetectedObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[4];
  NSRect v29;

  v28[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nodeForName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "extendedSceneClassId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v10);

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = CFSTR("Confidence");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "confidence");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v27[1] = CFSTR("BoundingBox");
    objc_msgSend(v3, "boundingBox");
    NSStringFromRect(v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v16;
    v27[2] = CFSTR("size");
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "boundingBox");
    v19 = v18;
    objc_msgSend(v3, "boundingBox");
    objc_msgSend(v17, "numberWithDouble:", v19 * v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v22);

  }
  else
  {
    objc_msgSend(v3, "labels");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v25 = 138412290;
      v26 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[DO] Unsupported observation label in PFSceneTaxonomyNode %@", (uint8_t *)&v25, 0xCu);
    }
  }

}

void __64__VCPPreAnalyzer__extractAndSortBoundingBoxFromDetectedObjects___block_invoke_199(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_processBoundingBoxFromDetectedObjects:forSceneClassID:", a3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_insertBoundingBox:toSortedBoundingBoxes:");

}

- (void)_generateSceneClassifications:(id)a3 fromRequests:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD *v45;
  _QWORD v46[4];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "_includeDO");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "classificationRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v12 = v9;
  else
    v12 = 0;
  -[VCPPreAnalyzer _parsePhotosTaxonomyClassificationObservations:toClassificationResults:andDetectorSceneClassIds:isEntityNet:](self, "_parsePhotosTaxonomyClassificationObservations:toClassificationResults:andDetectorSceneClassIds:isEntityNet:", v11, v6, v12, 0);

  if (v8)
  {
    objc_msgSend(v7, "objectRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[VCPPreAnalyzer _extractAndSortBoundingBoxFromDetectedObjects:](self, "_extractAndSortBoundingBoxFromDetectedObjects:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    v46[3] = 0;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __61__VCPPreAnalyzer__generateSceneClassifications_fromRequests___block_invoke;
    v42[3] = &unk_1E6B19C50;
    v43 = v9;
    v44 = v6;
    v45 = v46;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v42);

    _Block_object_dispose(v46, 8);
  }
  objc_msgSend(v7, "classifyImageRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "results");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPreAnalyzer _parsePhotosTaxonomyClassificationObservations:toClassificationResults:andDetectorSceneClassIds:isEntityNet:](self, "_parsePhotosTaxonomyClassificationObservations:toClassificationResults:andDetectorSceneClassIds:isEntityNet:", v17, v6, 0, 1);

  objc_msgSend(v7, "junkImageRequest");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "results");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPreAnalyzer _parseClassificationObservations:toClassificationResults:](self, "_parseClassificationObservations:toClassificationResults:", v19, v6);

  objc_msgSend(v7, "landmarkRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "results");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPreAnalyzer _parseClassificationObservations:toClassificationResults:](self, "_parseClassificationObservations:toClassificationResults:", v21, v6);

  objc_msgSend(v7, "nsfwRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "results");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPreAnalyzer _parseClassificationObservations:toClassificationResults:](self, "_parseClassificationObservations:toClassificationResults:", v23, v6);

  objc_msgSend(v7, "tabooRequest");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "results");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPreAnalyzer _parseClassificationObservations:toClassificationResults:](self, "_parseClassificationObservations:toClassificationResults:", v25, v6);

  objc_msgSend(v7, "semanticRequest");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "results");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPreAnalyzer _parseClassificationObservations:toClassificationResults:](self, "_parseClassificationObservations:toClassificationResults:", v27, v6);

  objc_msgSend(v7, "memeRequest");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "results");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPreAnalyzer _parseClassificationObservations:withPrefix:toClassificationResults:](self, "_parseClassificationObservations:withPrefix:toClassificationResults:", v29, CFSTR("meme_"), v6);

  objc_msgSend(v7, "cityNatureRequest");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "results");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPPreAnalyzer _parseClassificationObservations:toClassificationResults:](self, "_parseClassificationObservations:toClassificationResults:", v31, v6);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v7, "documentRequest", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "results");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v39;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v33);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v36), "labels");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPPreAnalyzer _parseClassificationObservations:toClassificationResults:](self, "_parseClassificationObservations:toClassificationResults:", v37, v6);

        ++v36;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v34);
  }

}

void __61__VCPPreAnalyzer__generateSceneClassifications_fromRequests___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("classID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BoundingBox"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("BoundingBox"));
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v7);

    }
    else
    {
      v13[0] = CFSTR("Confidence");
      v13[1] = CFSTR("BoundingBox");
      v14[0] = &unk_1E6B72420;
      v14[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v7);

    }
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 5uLL)
      *a4 = 1;
  }

}

- (int)_collectSceneAnalysisResults:(id *)a3 fromRequests:(id)a4 wpResults:(id)a5 ivsResults:(id)a6 abnormalDimension:(unint64_t)a7
{
  char v7;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  BOOL v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i;
  void *v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  BOOL v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  BOOL v111;
  void *v112;
  BOOL v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  BOOL v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t j;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  _BOOL4 v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  id obja;
  id obj;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  id v164;
  id v165;
  void *v166;
  void *v167;
  char v168;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  id v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  _QWORD v184[4];
  id v185;
  _QWORD v186[2];
  _QWORD v187[2];
  _QWORD v188[9];
  _QWORD v189[9];
  const __CFString *v190;
  void *v191;
  void *v192;
  const __CFString *v193;
  void *v194;
  _BYTE v195[128];
  _QWORD v196[2];
  _QWORD v197[2];
  const __CFString *v198;
  void *v199;
  uint8_t v200[128];
  uint8_t buf[4];
  void *v202;
  _QWORD v203[22];
  _QWORD v204[25];
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  NSRect v212;
  CGRect v213;
  NSRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  NSRect v222;
  CGRect v223;
  NSRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  NSRect v233;
  NSRect v234;

  v7 = a7;
  v204[22] = *MEMORY[0x1E0C80C00];
  v175 = a4;
  v172 = a5;
  v10 = a6;
  v173 = v10;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = v7;
  if ((v7 & 1) != 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Ignoring SceneNet result for tiny image", buf, 2u);
    }
  }
  else
  {
    -[VCPPreAnalyzer _generateSceneClassifications:fromRequests:](self, "_generateSceneClassifications:fromRequests:", v174, v175);
  }
  if (v10)
  {
    v184[0] = MEMORY[0x1E0C809B0];
    v184[1] = 3221225472;
    v184[2] = __99__VCPPreAnalyzer__collectSceneAnalysisResults_fromRequests_wpResults_ivsResults_abnormalDimension___block_invoke;
    v184[3] = &unk_1E6B19C78;
    v185 = v174;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v184);

  }
  objc_msgSend(v175, "aestheticsRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") == 1;

  if (!v13)
  {
    v57 = -18;
    goto LABEL_23;
  }
  objc_msgSend(v175, "aestheticsRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  v203[0] = CFSTR("overallScore");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "aestheticScore");
  objc_msgSend(v16, "numberWithFloat:");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v204[0] = v166;
  v203[1] = CFSTR("wellFramedSubjectScore");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "wellFramedSubjectScore");
  objc_msgSend(v17, "numberWithFloat:");
  v164 = (id)objc_claimAutoreleasedReturnValue();
  v204[1] = v164;
  v203[2] = CFSTR("wellChosenBackgroundScore");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "wellChosenBackgroundScore");
  objc_msgSend(v18, "numberWithFloat:");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v204[2] = v162;
  v203[3] = CFSTR("tastefullyBlurredScore");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "tastefullyBlurredScore");
  objc_msgSend(v19, "numberWithFloat:");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v204[3] = v160;
  v203[4] = CFSTR("sharplyFocusedSubjectScore");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "sharplyFocusedSubjectScore");
  objc_msgSend(v20, "numberWithFloat:");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v204[4] = obja;
  v203[5] = CFSTR("wellTimedShotScore");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "wellTimedShotScore");
  objc_msgSend(v21, "numberWithFloat:");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v204[5] = v156;
  v203[6] = CFSTR("pleasantLightingScore");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "pleasantLightingScore");
  objc_msgSend(v22, "numberWithFloat:");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v204[6] = v155;
  v203[7] = CFSTR("pleasantReflectionsScore");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "pleasantReflectionsScore");
  objc_msgSend(v23, "numberWithFloat:");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v204[7] = v154;
  v203[8] = CFSTR("harmoniousColorScore");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "harmoniousColorScore");
  objc_msgSend(v24, "numberWithFloat:");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v204[8] = v153;
  v203[9] = CFSTR("livelyColorScore");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "livelyColorScore");
  objc_msgSend(v25, "numberWithFloat:");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v204[9] = v152;
  v203[10] = CFSTR("pleasantSymmetryScore");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "pleasantSymmetryScore");
  objc_msgSend(v26, "numberWithFloat:");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v204[10] = v151;
  v203[11] = CFSTR("pleasantPatternScore");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "pleasantPatternScore");
  objc_msgSend(v27, "numberWithFloat:");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v204[11] = v150;
  v203[12] = CFSTR("immersivenessScore");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "immersivenessScore");
  objc_msgSend(v28, "numberWithFloat:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v204[12] = v29;
  v203[13] = CFSTR("pleasantPerspectiveScore");
  v30 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "pleasantPerspectiveScore");
  objc_msgSend(v30, "numberWithFloat:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v204[13] = v31;
  v203[14] = CFSTR("pleasantPostProcessingScore");
  v32 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "pleasantPostProcessingScore");
  objc_msgSend(v32, "numberWithFloat:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v204[14] = v33;
  v203[15] = CFSTR("noiseScore");
  v34 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "noiseScore");
  objc_msgSend(v34, "numberWithFloat:");
  v35 = objc_claimAutoreleasedReturnValue();
  v204[15] = v35;
  v203[16] = CFSTR("failureScore");
  v36 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "failureScore");
  objc_msgSend(v36, "numberWithFloat:");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v204[16] = v37;
  v203[17] = CFSTR("pleasantCompositionScore");
  v38 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "pleasantCompositionScore");
  objc_msgSend(v38, "numberWithFloat:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v204[17] = v39;
  v203[18] = CFSTR("interestingSubjectScore");
  v40 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "interestingSubjectScore");
  objc_msgSend(v40, "numberWithFloat:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v204[18] = v41;
  v203[19] = CFSTR("intrusiveObjectPresenceScore");
  v42 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "intrusiveObjectPresenceScore");
  objc_msgSend(v42, "numberWithFloat:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v204[19] = v43;
  v203[20] = CFSTR("pleasantCameraTiltScore");
  v44 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "pleasantCameraTiltScore");
  objc_msgSend(v44, "numberWithFloat:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v204[20] = v45;
  v203[21] = CFSTR("lowKeyLightingScore");
  v46 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v171, "lowKeyLightingScore");
  objc_msgSend(v46, "numberWithFloat:");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v204[21] = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v204, v203, 22);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v175, "saliencyRequest");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "results");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = objc_msgSend(v49, "count") == 1;

  if ((v35 & 1) == 0)
    goto LABEL_20;
  objc_msgSend(v175, "saliencyRequest");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "results");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "firstObject");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "boundingBox");
  x = v205.origin.x;
  y = v205.origin.y;
  width = v205.size.width;
  height = v205.size.height;
  if (CGRectGetMinX(v205) < 0.0)
    goto LABEL_17;
  v206.origin.x = x;
  v206.origin.y = y;
  v206.size.width = width;
  v206.size.height = height;
  if (CGRectGetMinX(v206) > 1.0)
    goto LABEL_17;
  v207.origin.x = x;
  v207.origin.y = y;
  v207.size.width = width;
  v207.size.height = height;
  if (CGRectGetMinY(v207) < 0.0)
    goto LABEL_17;
  v208.origin.x = x;
  v208.origin.y = y;
  v208.size.width = width;
  v208.size.height = height;
  if (CGRectGetMinY(v208) > 1.0)
    goto LABEL_17;
  v209.origin.x = x;
  v209.origin.y = y;
  v209.size.width = width;
  v209.size.height = height;
  if (CGRectGetMaxX(v209) < 0.0)
    goto LABEL_17;
  v210.origin.x = x;
  v210.origin.y = y;
  v210.size.width = width;
  v210.size.height = height;
  if (CGRectGetMaxX(v210) > 1.0
    || (v211.origin.x = x,
        v211.origin.y = y,
        v211.size.width = width,
        v211.size.height = height,
        CGRectGetMaxY(v211) < 0.0))
  {
LABEL_17:

    goto LABEL_18;
  }
  v213.origin.x = x;
  v213.origin.y = y;
  v213.size.width = width;
  v213.size.height = height;
  v63 = CGRectGetMaxY(v213) > 1.0;

  if (!v63)
  {
    objc_msgSend(v175, "saliencyRequest");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "results");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "firstObject");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "boundingBox");
    NSStringFromRect(v214);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v175, "saliencyRequest");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "results");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "firstObject");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "narrowedBoundingBox");
    v71 = v215.origin.x;
    v72 = v215.origin.y;
    v73 = v215.size.width;
    v74 = v215.size.height;
    if (CGRectGetMinX(v215) < 0.0)
      goto LABEL_32;
    v216.origin.x = v71;
    v216.origin.y = v72;
    v216.size.width = v73;
    v216.size.height = v74;
    if (CGRectGetMinX(v216) > 1.0)
      goto LABEL_32;
    v217.origin.x = v71;
    v217.origin.y = v72;
    v217.size.width = v73;
    v217.size.height = v74;
    if (CGRectGetMinY(v217) < 0.0)
      goto LABEL_32;
    v218.origin.x = v71;
    v218.origin.y = v72;
    v218.size.width = v73;
    v218.size.height = v74;
    if (CGRectGetMinY(v218) > 1.0)
      goto LABEL_32;
    v219.origin.x = v71;
    v219.origin.y = v72;
    v219.size.width = v73;
    v219.size.height = v74;
    if (CGRectGetMaxX(v219) < 0.0)
      goto LABEL_32;
    v220.origin.x = v71;
    v220.origin.y = v72;
    v220.size.width = v73;
    v220.size.height = v74;
    if (CGRectGetMaxX(v220) > 1.0
      || (v221.origin.x = v71,
          v221.origin.y = v72,
          v221.size.width = v73,
          v221.size.height = v74,
          CGRectGetMaxY(v221) < 0.0))
    {
LABEL_32:

LABEL_33:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v175, "saliencyRequest");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "results");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "firstObject");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "narrowedBoundingBox");
        NSStringFromRect(v222);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v202 = v78;
        _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unnormalized saliencyRequest narrowed bounding box %@; skip",
          buf,
          0xCu);

      }
      v57 = -18;
      goto LABEL_36;
    }
    v223.origin.x = v71;
    v223.origin.y = v72;
    v223.size.width = v73;
    v223.size.height = v74;
    v79 = CGRectGetMaxY(v223) > 1.0;

    if (v79)
      goto LABEL_33;
    objc_msgSend(v175, "saliencyRequest");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "results");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "firstObject");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "narrowedBoundingBox");
    NSStringFromRect(v224);
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)objc_opt_class(), "_includeSO"))
    {
      objc_msgSend(v175, "saliencyObjectnessRequest");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "results");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = objc_msgSend(v84, "count") == 1;

      if (!v85)
        goto LABEL_65;
      objc_msgSend(v175, "saliencyObjectnessRequest");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "results");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "firstObject");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "salientObjects");
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      v182 = 0u;
      v183 = 0u;
      v180 = 0u;
      v181 = 0u;
      obj = v89;
      v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v180, v200, 16);
      if (v90)
      {
        v91 = *(_QWORD *)v181;
        while (2)
        {
          for (i = 0; i != v90; ++i)
          {
            if (*(_QWORD *)v181 != v91)
              objc_enumerationMutation(obj);
            v93 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * i);
            objc_msgSend(v93, "boundingBox");
            v94 = v225.origin.x;
            v95 = v225.origin.y;
            v96 = v225.size.width;
            v97 = v225.size.height;
            if (CGRectGetMinX(v225) < 0.0)
              goto LABEL_113;
            v226.origin.x = v94;
            v226.origin.y = v95;
            v226.size.width = v96;
            v226.size.height = v97;
            if (CGRectGetMinX(v226) > 1.0)
              goto LABEL_113;
            v227.origin.x = v94;
            v227.origin.y = v95;
            v227.size.width = v96;
            v227.size.height = v97;
            if (CGRectGetMinY(v227) < 0.0)
              goto LABEL_113;
            v228.origin.x = v94;
            v228.origin.y = v95;
            v228.size.width = v96;
            v228.size.height = v97;
            if (CGRectGetMinY(v228) > 1.0)
              goto LABEL_113;
            v229.origin.x = v94;
            v229.origin.y = v95;
            v229.size.width = v96;
            v229.size.height = v97;
            if (CGRectGetMaxX(v229) < 0.0)
              goto LABEL_113;
            v230.origin.x = v94;
            v230.origin.y = v95;
            v230.size.width = v96;
            v230.size.height = v97;
            if (CGRectGetMaxX(v230) > 1.0)
              goto LABEL_113;
            v231.origin.x = v94;
            v231.origin.y = v95;
            v231.size.width = v96;
            v231.size.height = v97;
            if (CGRectGetMaxY(v231) < 0.0
              || (v232.origin.x = v94,
                  v232.origin.y = v95,
                  v232.size.width = v96,
                  v232.size.height = v97,
                  CGRectGetMaxY(v232) > 1.0))
            {
LABEL_113:
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v93, "boundingBox");
                NSStringFromRect(v234);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                -[VCPPreAnalyzer _collectSceneAnalysisResults:fromRequests:wpResults:ivsResults:abnormalDimension:].cold.1(v116, buf);
              }
              v57 = -18;
              v161 = obj;
              goto LABEL_70;
            }
            objc_msgSend(v93, "boundingBox");
            NSStringFromRect(v233);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v93, "confidence");
            objc_msgSend(v99, "numberWithFloat:");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v198 = CFSTR("attributes");
            v196[0] = CFSTR("saliencyBounds");
            v196[1] = CFSTR("saliencyConfidence");
            v197[0] = v98;
            v197[1] = v100;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v197, v196, 2);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v199 = v101;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1);
            v102 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v167, "addObject:", v102);
          }
          v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v180, v200, 16);
          if (v90)
            continue;
          break;
        }
      }

    }
    objc_msgSend(v175, "sceneprintRequest");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "results");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "count") == 1;

    if (v105)
    {
      objc_msgSend(v175, "sceneprintRequest");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "results");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "firstObject");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "sceneprints");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "firstObject");
      v161 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v161, "elementType") != 1
        || objc_msgSend(v161, "elementCount") != 768
        || (objc_msgSend(v161, "descriptorData"),
            v110 = (void *)objc_claimAutoreleasedReturnValue(),
            v111 = objc_msgSend(v110, "length") == 3072,
            v110,
            !v111))
      {
        v57 = -18;
LABEL_71:

        goto LABEL_72;
      }
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v161, 1, 0);
      obj = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)objc_opt_class(), "_includeWP"))
      {
        objc_msgSend(v172, "objectForKeyedSubscript:", CFSTR("WPResults"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend(v112, "count") == 1;

        if (!v113
          || (objc_msgSend(v172, "objectForKeyedSubscript:", CFSTR("WPResults")),
              v114 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v114, "objectAtIndexedSubscript:", 0),
              v115 = (void *)objc_claimAutoreleasedReturnValue(),
              v114,
              !v115))
        {
          v57 = -18;

LABEL_70:
          goto LABEL_71;
        }
        objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("wallpaperScore"));
        v157 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v157)
        {
          v157 = 0;
LABEL_103:
          v57 = -18;
LABEL_108:

          goto LABEL_70;
        }
      }
      else
      {
        v157 = &unk_1E6B72430;
      }
      if (objc_msgSend((id)objc_opt_class(), "_includePA"))
      {
        objc_msgSend(v175, "adjustmentsRequest");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "results");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = objc_msgSend(v118, "count") == 0;

        if (v119)
          goto LABEL_103;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = 0u;
        v179 = 0u;
        v176 = 0u;
        v177 = 0u;
        objc_msgSend(v175, "adjustmentsRequest");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v121, "results");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "objectAtIndexedSubscript:", 0);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v123, "adjustmentKeys");
        v165 = (id)objc_claimAutoreleasedReturnValue();

        v124 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v176, v195, 16);
        if (v124)
        {
          v125 = *(_QWORD *)v177;
          do
          {
            for (j = 0; j != v124; ++j)
            {
              if (*(_QWORD *)v177 != v125)
                objc_enumerationMutation(v165);
              v127 = *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * j);
              objc_msgSend(v175, "adjustmentsRequest");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "results");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "objectAtIndexedSubscript:", 0);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "adjustmentValuesForKey:", v127);
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "setObject:forKeyedSubscript:", v131, v127);

            }
            v124 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v176, v195, 16);
          }
          while (v124);
        }

        MEMORY[0x1BCCA0D34](v120, 0);
        v132 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v132 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "imagefingerprintsRequest");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = (v168 & 1) == 0 && v135 != 0;

      if (v137)
      {
        objc_msgSend(v175, "imagefingerprintsRequest");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "results");
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v139, "count"))
        {
          v57 = -18;
          goto LABEL_107;
        }
        objc_msgSend(v139, "firstObject");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "fingerprintHashes");
        v141 = (id)objc_claimAutoreleasedReturnValue();

        if (v141 && objc_msgSend(v141, "count") == 2)
        {
          objc_msgSend(v141, "objectAtIndexedSubscript:", 0);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v142, "hashData");
          v143 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v143, "length") == 24)
          {
            objc_msgSend(v141, "objectAtIndexedSubscript:", 1);
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v144, "hashData");
            v145 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v145, "length") == 24)
            {
              objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", &-[VCPPreAnalyzer _collectSceneAnalysisResults:fromRequests:wpResults:ivsResults:abnormalDimension:]::kPrefixByte, 1);
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v134, "appendData:", v145);

              v133 = v143;
              goto LABEL_99;
            }
            v57 = -18;
            v133 = v143;
            v134 = v145;
          }
          else
          {
            v57 = -18;
            v133 = v143;
          }
        }
        else
        {
          v57 = -18;
        }
LABEL_105:

LABEL_107:
        goto LABEL_108;
      }
LABEL_99:
      v193 = CFSTR("ClassificationResults");
      v190 = CFSTR("attributes");
      v188[0] = CFSTR("aesthetic");
      v188[1] = CFSTR("sceneClassification");
      v189[0] = v149;
      v189[1] = v174;
      v188[2] = CFSTR("saliency");
      v186[0] = CFSTR("preferredCrop");
      v186[1] = CFSTR("acceptableCrop");
      v187[0] = v67;
      v187[1] = v163;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v187, v186, 2);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v189[2] = v139;
      v189[3] = obj;
      v188[3] = CFSTR("sceneprint");
      v188[4] = CFSTR("saliencyObjectness");
      v189[4] = v167;
      v189[5] = v157;
      v188[5] = CFSTR("wallpaperScore");
      v188[6] = CFSTR("colorNormalizationData");
      v141 = v132;
      if (!v132)
        v141 = objc_alloc_init(MEMORY[0x1E0C99D50]);
      v189[6] = v141;
      v189[7] = v133;
      v188[7] = CFSTR("duplicateMatchingFeature");
      v188[8] = CFSTR("duplicateMatchingAlternateFeature");
      v189[8] = v134;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v189, v188, 9);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v191 = v146;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = v147;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v192, 1);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v194 = v148;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v194, &v193, 1);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v57 = 0;
      if (v132)
        goto LABEL_107;
      goto LABEL_105;
    }
LABEL_65:
    v57 = -18;
LABEL_72:

LABEL_36:
    goto LABEL_21;
  }
LABEL_18:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v175, "saliencyRequest");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "results");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "firstObject");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "boundingBox");
    NSStringFromRect(v212);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v202 = v62;
    _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unnormalized saliencyRequest bounding box %@; skip",
      buf,
      0xCu);

  }
LABEL_20:
  v57 = -18;
LABEL_21:

LABEL_23:
  return v57;
}

void __99__VCPPreAnalyzer__collectSceneAnalysisResults_fromRequests_wpResults_ivsResults_abnormalDimension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "doubleValue");
  if (v7 >= 0.00999999978)
  {
    VCPSpecialLabelToExtendedSceneClassificationID(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v14 = CFSTR("Confidence");
      v15[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v8, "stringValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unsupported observation label in VCPSpecialLabelToExtendedSceneClassificationID %@", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (int)_performSceneAnalysis:(id *)a3 image:(id)a4 mediaType:(int64_t)a5 mediaSubtypes:(unint64_t)a6 abnormalDimension:(unint64_t)a7
{
  VCPPreAnalysisRequests *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double Width;
  double Height;
  double v51;
  double v52;
  id v53;
  CFTypeRef v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  os_signpost_id_t v59;
  NSObject *v60;
  NSObject *v61;
  char v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  int v67;
  char v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  _BOOL4 v73;
  NSObject *v74;
  os_signpost_id_t v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  NSObject *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  int v87;
  VCPPreAnalysisRequests *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v95;
  id obj;
  VCPPreAnalyzer *v97;
  uint64_t v99;
  VCPPreAnalysisRequests *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  _QWORD v108[4];
  id v109;
  double v110;
  double v111;
  _QWORD block[4];
  id v113;
  void *v114;
  double v115;
  double v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  CFTypeRef cf;
  id v122;
  id v123;
  uint8_t v124[128];
  uint8_t buf[4];
  _BYTE v126[10];
  void *v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v104 = a4;
  v9 = objc_alloc_init(VCPPreAnalysisRequests);
  v101 = v9;
  v10 = -[VCPPreAnalyzer _createRequests:withMediaType:](self, "_createRequests:withMediaType:", v9, a5);
  if (!v10)
  {
    -[VCPObjectPool getObject](self->_sessionPool, "getObject");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = self;
    if (a7)
    {
      v11 = objc_alloc(MEMORY[0x1E0CEDF70]);
      v12 = objc_msgSend(v104, "sourcePixelBuffer");
      objc_msgSend(v102, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v11, "initWithCVPixelBuffer:options:session:", v12, MEMORY[0x1E0C9AA70], v13);

      VCPSignPostLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_signpost_id_generate(v15);

      VCPSignPostLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPSceneAnalyzerImageRequestHandlerPerformRequest", ", buf, 2u);
      }

      -[VCPPreAnalysisRequests gatherAvailableRequests](v9, "gatherAvailableRequests");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = 0;
      v20 = objc_msgSend(v14, "performRequests:error:", v19, &v123);
      v21 = v123;

      VCPSignPostLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_END, v16, "VCPSceneAnalyzerImageRequestHandlerPerformRequest", ", buf, 2u);
      }

      if ((v20 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v126 = v21;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to run VNImageRequestHandler::performRequests: %@", buf, 0xCu);
        }
        v40 = 0;
        v10 = -18;
        goto LABEL_76;
      }
      if (objc_msgSend((id)objc_opt_class(), "_includeIVS"))
      {
        v24 = (void *)MEMORY[0x1BCCA1B2C]();
        -[VCPObjectPool getObject](v97->_ivsPool, "getObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "object");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        if (v27)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v69 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v126 = v69;
            v70 = v69;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ unavailable for IVS", buf, 0xCu);

          }
          v40 = 0;
          v10 = -18;
          v41 = 1;
        }
        else
        {
          VCPSignPostLog();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = os_signpost_id_generate(v28);

          VCPSignPostLog();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "CommSafetyHandler_IVS", ", buf, 2u);
          }

          objc_msgSend(v25, "object");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = v21;
          objc_msgSend(v32, "analyzePixelBuffer:error:", objc_msgSend(v104, "sourcePixelBuffer"), &v122);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v122;

          VCPSignPostLog();
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v36, OS_SIGNPOST_INTERVAL_END, v29, "CommSafetyHandler_IVS", ", buf, 2u);
          }

          if (v34)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v37 = v24;
              v38 = (id)objc_opt_class();
              objc_msgSend(v34, "description");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v126 = v38;
              *(_WORD *)&v126[8] = 2112;
              v127 = v39;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to run %@::analyzePixelBuffer:error: %@", buf, 0x16u);

              v24 = v37;
            }
            v40 = 0;
            v10 = -18;
            v41 = 1;
          }
          else
          {
            objc_msgSend(v33, "scoresForLabels");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = 0;
            v10 = 0;
          }

          v21 = v34;
        }

        objc_autoreleasePoolPop(v24);
        if (v41)
        {
LABEL_76:

LABEL_105:
          goto LABEL_106;
        }
      }
      else
      {
        v40 = 0;
      }

LABEL_101:
      v87 = objc_msgSend((id)objc_opt_class(), "_includeWP");
      v88 = v101;
      if (v87)
      {
        -[VCPPreAnalysisRequests sceneprintRequest](v101, "sceneprintRequest");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "results");
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v90, "firstObject");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "sceneprints");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "firstObject");
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        v105 = 0;
        -[VCPPreAnalyzer _performWallpaperAnalysis:withSceneprint:](v97, "_performWallpaperAnalysis:withSceneprint:", &v105, v93);
        v14 = v105;

        v88 = v101;
      }
      else
      {
        v14 = 0;
      }
      v10 = -[VCPPreAnalyzer _collectSceneAnalysisResults:fromRequests:wpResults:ivsResults:abnormalDimension:](v97, "_collectSceneAnalysisResults:fromRequests:wpResults:ivsResults:abnormalDimension:", a3, v88, v14, v40, a7);
      goto LABEL_105;
    }
    cf = 0;
    -[VCPPreAnalysisRequests mapAvailableRequestsToResolution](v9, "mapAvailableRequestsToResolution");
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "allKeys");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v117, v124, 16);
    if (v44)
    {
      v99 = *(_QWORD *)v118;
      *(_QWORD *)&v45 = 67109376;
      v95 = v45;
      obj = v42;
      while (2)
      {
        v46 = 0;
        v47 = v43;
        do
        {
          if (*(_QWORD *)v118 != v99)
            objc_enumerationMutation(obj);
          v48 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v46);
          if (+[VCPPreAnalysisRequests isDimensionUnknown:](VCPPreAnalysisRequests, "isDimensionUnknown:", v48, v95))
          {
            Width = (double)CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v104, "sourcePixelBuffer"));
            Height = (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v104, "sourcePixelBuffer"));
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __88__VCPPreAnalyzer__performSceneAnalysis_image_mediaType_mediaSubtypes_abnormalDimension___block_invoke;
            block[3] = &unk_1E6B19CA0;
            v113 = v103;
            v114 = v48;
            v115 = Width;
            v116 = Height;
            if (-[VCPPreAnalyzer _performSceneAnalysis:image:mediaType:mediaSubtypes:abnormalDimension:]::once != -1)
              dispatch_once(&-[VCPPreAnalyzer _performSceneAnalysis:image:mediaType:mediaSubtypes:abnormalDimension:]::once, block);

          }
          else
          {
            objc_msgSend(v48, "sizeValue");
            Width = v51;
            Height = v52;
          }
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v10 = objc_msgSend(v104, "pixelBuffer:width:height:", &cf, (unint64_t)Width, (unint64_t)Height);
          if (v10)
          {
            v43 = v47;
LABEL_67:

            v40 = 0;
            v68 = 0;
            v65 = v103;
            goto LABEL_100;
          }
          v53 = objc_alloc(MEMORY[0x1E0CEDF70]);
          v54 = cf;
          objc_msgSend(v102, "object");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(v53, "initWithCVPixelBuffer:options:session:", v54, MEMORY[0x1E0C9AA70], v55);

          objc_msgSend(v103, "objectForKeyedSubscript:", v48);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v57, "count") == 1)
          {
            v108[0] = MEMORY[0x1E0C809B0];
            v108[1] = 3221225472;
            v108[2] = __88__VCPPreAnalyzer__performSceneAnalysis_image_mediaType_mediaSubtypes_abnormalDimension___block_invoke_214;
            v108[3] = &unk_1E6B19CC8;
            v109 = v57;
            v110 = Width;
            v111 = Height;
            if (-[VCPPreAnalyzer _performSceneAnalysis:image:mediaType:mediaSubtypes:abnormalDimension:]::once != -1)
              dispatch_once(&-[VCPPreAnalyzer _performSceneAnalysis:image:mediaType:mediaSubtypes:abnormalDimension:]::once, v108);

          }
          VCPSignPostLog();
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = os_signpost_id_generate(v58);

          VCPSignPostLog();
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = v60;
          if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
          {
            *(_DWORD *)buf = v95;
            *(_DWORD *)v126 = (int)Width;
            *(_WORD *)&v126[4] = 1024;
            *(_DWORD *)&v126[6] = (int)Height;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "VCPSceneAnalyzerImageRequestHandlerPerformRequest", "%dx%d", buf, 0xEu);
          }

          v107 = v47;
          v62 = objc_msgSend(v56, "performRequests:error:", v57, &v107);
          v43 = v107;

          VCPSignPostLog();
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = v63;
          if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
          {
            *(_DWORD *)buf = v95;
            *(_DWORD *)v126 = (int)Width;
            *(_WORD *)&v126[4] = 1024;
            *(_DWORD *)&v126[6] = (int)Height;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v64, OS_SIGNPOST_INTERVAL_END, v59, "VCPSceneAnalyzerImageRequestHandlerPerformRequest", "%dx%d", buf, 0xEu);
          }

          if ((v62 & 1) == 0)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v126 = v43;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to run VNImageRequestHandler::performRequests: %@", buf, 0xCu);
            }

            v10 = -18;
            goto LABEL_67;
          }

          ++v46;
          v47 = v43;
        }
        while (v44 != v46);
        v42 = obj;
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v124, 16);
        if (v44)
          continue;
        break;
      }
    }

    v65 = v103;
    if (objc_msgSend((id)objc_opt_class(), "_includeIVS"))
    {
      v66 = (void *)MEMORY[0x1BCCA1B2C]();
      v65 = v103;
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v10 = objc_msgSend(v104, "pixelBuffer:width:height:", &cf, 299, 299);
      if (v10)
      {
        v40 = 0;
        v67 = 1;
      }
      else
      {
        -[VCPObjectPool getObject](v97->_ivsPool, "getObject");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "object");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v72 == 0;

        if (v73)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v85 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v126 = v85;
            v86 = v85;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ unavailable for IVS", buf, 0xCu);

          }
          v40 = 0;
          v10 = -18;
          v67 = 1;
        }
        else
        {
          VCPSignPostLog();
          v74 = objc_claimAutoreleasedReturnValue();
          v75 = os_signpost_id_generate(v74);

          VCPSignPostLog();
          v76 = objc_claimAutoreleasedReturnValue();
          v77 = v76;
          if (v75 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v77, OS_SIGNPOST_INTERVAL_BEGIN, v75, "CommSafetyHandler_IVS", ", buf, 2u);
          }

          objc_msgSend(v71, "object");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v43;
          objc_msgSend(v78, "analyzePixelBuffer:error:", cf, &v106);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v106;

          VCPSignPostLog();
          v81 = objc_claimAutoreleasedReturnValue();
          v82 = v81;
          if (v75 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v82, OS_SIGNPOST_INTERVAL_END, v75, "CommSafetyHandler_IVS", ", buf, 2u);
          }

          if (v80)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v83 = (id)objc_opt_class();
              objc_msgSend(v80, "description");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v126 = v83;
              *(_WORD *)&v126[8] = 2112;
              v127 = v84;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to run %@::analyzePixelBuffer:error: %@", buf, 0x16u);

            }
            v40 = 0;
            v10 = -18;
            v67 = 1;
          }
          else
          {
            objc_msgSend(v79, "scoresForLabels");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = 0;
            v10 = 0;
          }

          v43 = v80;
        }

        v65 = v103;
      }
      objc_autoreleasePoolPop(v66);
      if (v67)
      {
        v68 = 0;
        goto LABEL_100;
      }
    }
    else
    {
      v40 = 0;
      v10 = 0;
    }
    v68 = 1;
LABEL_100:

    CF<opaqueCMSampleBuffer *>::~CF(&cf);
    if ((v68 & 1) == 0)
    {
LABEL_106:

      v9 = v101;
      goto LABEL_107;
    }
    goto LABEL_101;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error creating VNRequest", buf, 2u);
  }
LABEL_107:

  return v10;
}

void __88__VCPPreAnalyzer__performSceneAnalysis_image_mediaType_mediaSubtypes_abnormalDimension___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  int v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(double *)(a1 + 56);
    v4 = (int)*(double *)(a1 + 48);
    v5 = 138412802;
    v6 = v2;
    v7 = 1024;
    v8 = v4;
    v9 = 1024;
    v10 = (int)v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unknown ideal dimension for VNRequests (%@), using image dimension %dx%d", (uint8_t *)&v5, 0x18u);

  }
}

void __88__VCPPreAnalyzer__performSceneAnalysis_image_mediaType_mediaSubtypes_abnormalDimension___block_invoke_214(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_opt_class();
    v4 = (int)*(double *)(a1 + 40);
    v5 = (int)*(double *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 1024;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    v6 = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Only one VNRequest (%@) for dimension %dx%d; consider coalescing to common resolution",
      (uint8_t *)&v7,
      0x18u);

  }
}

- (int)_performBlurAnalysis:(id *)a3 withPixelBuffer:(__CVBuffer *)a4 usingAnalyzer:(id)a5
{
  id v8;
  size_t Width;
  size_t Height;
  size_t v11;
  size_t v12;
  int v13;
  char *BaseAddress;
  uint64_t v16;
  uint64_t v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  size_t BytesPerRow;
  unint64_t v47;
  vImage_Buffer dest;
  int v49;
  CVPixelBufferRef v50;
  CVPixelBufferLockFlags unlockFlags;
  int v52;
  CVPixelBufferRef v53;
  CVPixelBufferLockFlags v54;
  CVPixelBufferRef pixelBuffer;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  vImage_Buffer buf;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v11 = Height;
  if (Width <= Height)
    v12 = Height / Width;
  else
    v12 = Width / Height;
  pixelBuffer = 0;
  v13 = -[VCPPoolBasedPixelBufferCreator createPixelBuffer:](self->_monochromeBufferCreator, "createPixelBuffer:", &pixelBuffer);
  if (!v13)
  {
    v52 = 0;
    v53 = a4;
    v54 = 1;
    if (a4)
    {
      v13 = CVPixelBufferLockBaseAddress(a4, 1uLL);
      v52 = v13;
      if (!v13
        || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
        && (LODWORD(buf.data) = 134218240,
            *(void **)((char *)&buf.data + 4) = v53,
            WORD2(buf.height) = 1024,
            *(_DWORD *)((char *)&buf.height + 6) = v13,
            _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (v13 = v52) == 0))
      {
        v49 = 0;
        v50 = pixelBuffer;
        unlockFlags = 0;
        if (pixelBuffer)
        {
          v13 = CVPixelBufferLockBaseAddress(pixelBuffer, 0);
          v49 = v13;
          if (!v13
            || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
            && (LODWORD(buf.data) = 134218240,
                *(void **)((char *)&buf.data + 4) = v50,
                WORD2(buf.height) = 1024,
                *(_DWORD *)((char *)&buf.height + 6) = v13,
                _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (v13 = v49) == 0))
          {
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
            BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
            if (v12)
            {
              v47 = 0;
              v16 = BytesPerRow;
              if (Width > v11)
                v16 = 1;
              v17 = 299 * v16;
              v18 = 0.0;
              while (1)
              {
                buf.data = BaseAddress;
                buf.height = 299;
                buf.width = 299;
                buf.rowBytes = BytesPerRow;
                dest.data = CVPixelBufferGetBaseAddress(pixelBuffer);
                dest.height = CVPixelBufferGetHeight(pixelBuffer);
                dest.width = CVPixelBufferGetWidth(pixelBuffer);
                dest.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
                v13 = vImageScale_Planar8(&buf, &dest, 0, 0);
                if (v13)
                  break;
                v13 = objc_msgSend(v8, "analyzePixelBuffer:flags:results:cancel:", pixelBuffer, 0, a3, &__block_literal_global_216);
                if (v13)
                  break;
                objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("BlurResults"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "firstObject");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("attributes"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("sharpness"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v22;
                if (v22)
                {
                  objc_msgSend(v22, "floatValue");
                  v18 = v18 + v24;
                  ++v47;
                }

                BaseAddress += v17;
                if (!--v12)
                  goto LABEL_41;
              }
            }
            else
            {
              v47 = 0;
              v18 = 0.0;
LABEL_41:
              v13 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v49);
              if (!v13)
              {
                v13 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v52);
                if (!v13)
                {
                  v61 = CFSTR("BlurResults");
                  v58 = CFSTR("attributes");
                  v56 = CFSTR("sharpness");
                  *(float *)&v41 = v18 / (float)v47;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = v42;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = v43;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = v44;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = v45;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
                  *a3 = (id)objc_claimAutoreleasedReturnValue();

                  v13 = 0;
                }
              }
            }
          }
        }
        else
        {
          v33 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v33)
            -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v33, v34, v35, v36, v37, v38, v39, v40);
          v13 = -50;
          v49 = -50;
        }
        if (v50
          && !v49
          && CVPixelBufferUnlockBaseAddress(v50, unlockFlags)
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
        }
        if (v53
          && !v52
          && CVPixelBufferUnlockBaseAddress(v53, v54)
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
        }
      }
    }
    else
    {
      v25 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v25)
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
      v13 = -50;
    }
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);

  return v13;
}

uint64_t __69__VCPPreAnalyzer__performBlurAnalysis_withPixelBuffer_usingAnalyzer___block_invoke()
{
  return 0;
}

- (int)_performBlurAnalysis:(id *)a3 withLumaPixelBuffer:(__CVBuffer *)a4 abnormalDimension:(unint64_t)a5 isSDOF:(BOOL)a6
{
  _BOOL8 v7;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  VCPImageBlurAnalyzer *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  int v20;
  NSObject *v21;
  uint8_t v23[16];
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v29 = CFSTR("BlurResults");
    v26 = CFSTR("attributes");
    v24 = CFSTR("sharpness");
    v25 = &unk_1E6B71FA0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v18 = objc_claimAutoreleasedReturnValue();
    v28 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  v7 = a6;
  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  VCPSignPostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VCPSceneAnalyzerImageBlurAnalysis", ", v23, 2u);
  }

  v15 = -[VCPImageBlurAnalyzer initWithFaceResults:sdof:revision:]([VCPImageBlurAnalyzer alloc], "initWithFaceResults:sdof:revision:", 0, v7, objc_msgSend((id)objc_opt_class(), "_getSHRevision"));
  v16 = v15;
  if (a5)
    v17 = -[VCPPreAnalyzer _performBlurAnalysis:withPixelBuffer:usingAnalyzer:](self, "_performBlurAnalysis:withPixelBuffer:usingAnalyzer:", a3, a4, v15);
  else
    v17 = -[VCPImageBlurAnalyzer analyzePixelBuffer:flags:results:cancel:](v15, "analyzePixelBuffer:flags:results:cancel:", a4, 0, a3, &__block_literal_global_218);
  v20 = v17;
  if (!v17)
  {
    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v18 = v21;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v18, OS_SIGNPOST_INTERVAL_END, v12, "VCPSceneAnalyzerImageBlurAnalysis", ", v23, 2u);
    }
    goto LABEL_13;
  }
LABEL_14:

  return v20;
}

uint64_t __84__VCPPreAnalyzer__performBlurAnalysis_withLumaPixelBuffer_abnormalDimension_isSDOF___block_invoke()
{
  return 0;
}

- (int)_performExposureAnalysis:(id *)a3 withLumaPixelBuffer:(__CVBuffer *)a4
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  VCPImageExposurePreAnalyzer *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];
  const __CFString *v16;
  void *v17;
  VCPImageExposurePreAnalyzer *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v19 = CFSTR("ExposureResults");
    v16 = CFSTR("quality");
    v17 = &unk_1E6B71FA0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (VCPImageExposurePreAnalyzer *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPSceneAnalyzerExposureAnalysis", ", v15, 2u);
  }

  v10 = objc_alloc_init(VCPImageExposurePreAnalyzer);
  v11 = -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:](v10, "analyzePixelBuffer:flags:results:cancel:", a4, 0, a3, &__block_literal_global_221);
  if (!v11)
  {
    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v7, "VCPSceneAnalyzerExposureAnalysis", ", v15, 2u);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

uint64_t __63__VCPPreAnalyzer__performExposureAnalysis_withLumaPixelBuffer___block_invoke()
{
  return 0;
}

- (int)_performRotationAnalysis:(id *)a3 withColorPixelBuffer:(__CVBuffer *)a4
{
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  CVPixelBufferRef v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int16 v29;
  float v30;
  void *v31;
  float v32;
  float v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  os_signpost_id_t spid;
  void *v52;
  id v53;
  uint8_t v54[16];
  int v55;
  CVPixelBufferRef v56;
  CVPixelBufferLockFlags v57;
  int v58;
  CVPixelBufferRef v59;
  CVPixelBufferLockFlags unlockFlags;
  CVPixelBufferRef pixelBuffer;
  _QWORD v62[2];
  _QWORD v63[2];
  const __CFString *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  vImage_Buffer v69;
  vImage_Buffer buf;
  _QWORD v71[2];
  _QWORD v72[2];
  const __CFString *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    VCPSignPostLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);

    VCPSignPostLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(buf.data) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPSceneAnalyzerRotationAnalysisScaling", ", (uint8_t *)&buf, 2u);
    }

    pixelBuffer = 0;
    v11 = -[VCPPoolBasedPixelBufferCreator createPixelBuffer:](self->_rotationBufferCreator, "createPixelBuffer:", &pixelBuffer);
    if (!v11)
    {
      v59 = a4;
      unlockFlags = 1;
      v11 = CVPixelBufferLockBaseAddress(a4, 1uLL);
      v58 = v11;
      if (!v11
        || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
        && (LODWORD(buf.data) = 134218240,
            *(void **)((char *)&buf.data + 4) = v59,
            WORD2(buf.height) = 1024,
            *(_DWORD *)((char *)&buf.height + 6) = v11,
            _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (v11 = v58) == 0))
      {
        buf.data = CVPixelBufferGetBaseAddress(a4);
        buf.height = CVPixelBufferGetHeight(a4);
        buf.width = CVPixelBufferGetWidth(a4);
        buf.rowBytes = CVPixelBufferGetBytesPerRow(a4);
        v55 = 0;
        v56 = pixelBuffer;
        v57 = 0;
        if (pixelBuffer)
        {
          v11 = CVPixelBufferLockBaseAddress(pixelBuffer, 0);
          v55 = v11;
          if (!v11
            || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
            && (LODWORD(v69.data) = 134218240,
                *(void **)((char *)&v69.data + 4) = v56,
                WORD2(v69.height) = 1024,
                *(_DWORD *)((char *)&v69.height + 6) = v11,
                _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&v69, 0x12u), (v11 = v55) == 0))
          {
            v69.data = CVPixelBufferGetBaseAddress(pixelBuffer);
            v69.height = CVPixelBufferGetHeight(pixelBuffer);
            v69.width = CVPixelBufferGetWidth(pixelBuffer);
            v69.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
            v11 = vImageScale_ARGB8888(&buf, &v69, 0, 0x20u);
            if (!v11)
            {
              v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v55);
              if (!v11)
              {
                v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v58);
                if (!v11)
                {
                  VCPSignPostLog();
                  v16 = objc_claimAutoreleasedReturnValue();
                  v17 = v16;
                  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
                  {
                    *(_WORD *)v54 = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_END, v8, "VCPSceneAnalyzerRotationAnalysisScaling", ", v54, 2u);
                  }

                  VCPSignPostLog();
                  v18 = objc_claimAutoreleasedReturnValue();
                  spid = os_signpost_id_generate(v18);

                  VCPSignPostLog();
                  v19 = objc_claimAutoreleasedReturnValue();
                  v20 = v19;
                  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
                  {
                    *(_WORD *)v54 = 0;
                    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPSceneAnalyzerRotationAnalysisInference", ", v54, 2u);
                  }

                  v21 = pixelBuffer;
                  -[VCPMAMLModel inputFeatureName](self->_rotationModel, "inputFeatureName");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  +[VCPMAMLFeatureProvider featureProviderWithCVPixelBuffer:andFeatureName:](VCPMAMLFeatureProvider, "featureProviderWithCVPixelBuffer:andFeatureName:", v21, v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  -[VCPMAMLModel model](self->_rotationModel, "model");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = 0;
                  objc_msgSend(v24, "predictionFromFeatures:error:", v23, &v53);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = v53;

                  -[VCPMAMLModel outputFeatureName](self->_rotationModel, "outputFeatureName");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "featureValueForName:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v26, "multiArrayValue");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v27, "count") == 4)
                  {
                    v28 = 0;
                    v29 = 0;
                    v30 = 0.0;
                    do
                    {
                      objc_msgSend(v27, "objectAtIndexedSubscript:", v28);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "floatValue");
                      v33 = v32;

                      if (v33 > v30)
                      {
                        v30 = v33;
                        v29 = v28;
                      }
                      ++v28;
                    }
                    while (v28 != 4);
                    v67 = CFSTR("RotationAnalysisResults");
                    v64 = CFSTR("attributes");
                    v62[0] = CFSTR("probableRotation");
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v29);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v63[0] = v34;
                    v62[1] = CFSTR("probableRotationConfidence");
                    *(float *)&v35 = v30;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v63[1] = v36;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v65 = v37;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v66 = v38;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v68 = v39;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
                    *a3 = (id)objc_claimAutoreleasedReturnValue();

                    VCPSignPostLog();
                    v40 = objc_claimAutoreleasedReturnValue();
                    v41 = v40;
                    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
                    {
                      *(_WORD *)v54 = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v41, OS_SIGNPOST_INTERVAL_END, spid, "VCPSceneAnalyzerRotationAnalysisInference", ", v54, 2u);
                    }

                    v11 = 0;
                  }
                  else
                  {
                    if ((int)MediaAnalysisLogLevel() >= 3
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)v54 = 0;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[ProbableRotation] invalid coreML results", v54, 2u);
                    }
                    v11 = -18;
                  }

                }
              }
            }
            if (v56
              && !v55
              && CVPixelBufferUnlockBaseAddress(v56, v57)
              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
            }
          }
        }
        else
        {
          v42 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          if (v42)
            -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v42, v43, v44, v45, v46, v47, v48, v49);
          v11 = -50;
        }
        if (v59
          && !v58
          && CVPixelBufferUnlockBaseAddress(v59, unlockFlags)
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
        }
      }
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
  }
  else
  {
    v76 = CFSTR("RotationAnalysisResults");
    v73 = CFSTR("attributes");
    v71[0] = CFSTR("probableRotation");
    v71[1] = CFSTR("probableRotationConfidence");
    v72[0] = &unk_1E6B74810;
    v72[1] = &unk_1E6B71FB0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    return 0;
  }
  return v11;
}

- (int)_performWallpaperAnalysis:(id *)a3 withSceneprint:(id)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  VCPWallpaperAnalyzer *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];
  const __CFString *v16;
  void *v17;
  VCPWallpaperAnalyzer *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "No sceneprint data for WP analysis; return default value",
        v15,
        2u);
    }
    v19 = CFSTR("WPResults");
    v16 = CFSTR("wallpaperScore");
    v17 = &unk_1E6B71FA0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (VCPWallpaperAnalyzer *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v20[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  VCPSignPostLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  VCPSignPostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPWallpaperAnalysis", ", v15, 2u);
  }

  v10 = objc_alloc_init(VCPWallpaperAnalyzer);
  v11 = -[VCPWallpaperAnalyzer analyzeWithSceneprint:results:cancel:](v10, "analyzeWithSceneprint:results:cancel:", v5, a3, &__block_literal_global_229);
  if (!v11)
  {
    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v7, "VCPWallpaperAnalysis", ", v15, 2u);
    }
LABEL_13:

  }
  return v11;
}

uint64_t __59__VCPPreAnalyzer__performWallpaperAnalysis_withSceneprint___block_invoke()
{
  return 0;
}

- (int)_performAnalysis:(id *)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5 abnormalDimension:(unint64_t)a6 colorPixelBuffer:(__CVBuffer *)a7 andLumaPixelBuffer:(__CVBuffer *)a8 image:(id)a9
{
  id v15;
  id v16;
  int v17;
  void *v19;
  id v20;
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  int64_t v32;
  unint64_t v33;
  unint64_t v34;
  __CVBuffer *v35;
  __CVBuffer *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  int v76;

  v15 = a9;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__38;
  v59 = __Block_byref_object_dispose__38;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__38;
  v53 = __Block_byref_object_dispose__38;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__38;
  v47 = __Block_byref_object_dispose__38;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__38;
  v41 = __Block_byref_object_dispose__38;
  v42 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__VCPPreAnalyzer__performAnalysis_mediaType_mediaSubtypes_abnormalDimension_colorPixelBuffer_andLumaPixelBuffer_image___block_invoke;
  block[3] = &unk_1E6B19CF0;
  v24 = &v65;
  v25 = &v43;
  block[4] = self;
  v33 = a5;
  v34 = a6;
  v16 = v15;
  v23 = v16;
  v26 = &v73;
  v27 = &v55;
  v28 = &v69;
  v29 = &v49;
  v30 = &v61;
  v31 = &v37;
  v32 = a4;
  v35 = a8;
  v36 = a7;
  dispatch_apply(4uLL, 0, block);
  if (*((_DWORD *)v74 + 6) || *((_DWORD *)v70 + 6) || *((_DWORD *)v66 + 6) || *((_DWORD *)v62 + 6))
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addEntriesFromDictionary:", v56[5]);
    objc_msgSend(v19, "addEntriesFromDictionary:", v50[5]);
    objc_msgSend(v19, "addEntriesFromDictionary:", v44[5]);
    if (objc_msgSend((id)objc_opt_class(), "_includeRotation"))
      objc_msgSend(v19, "addEntriesFromDictionary:", v38[5]);
    v20 = objc_retainAutorelease(v19);
    *a3 = v20;

    v17 = 0;
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);

  return v17;
}

void __119__VCPPreAnalyzer__performAnalysis_mediaType_mediaSubtypes_abnormalDimension_colorPixelBuffer_andLumaPixelBuffer_image___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v19 = v2;
  v20 = v3;
  v21 = v4;
  switch(a2)
  {
    case 0:
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v6 + 40);
      v7 = objc_msgSend(*(id *)(a1 + 32), "_performSceneAnalysis:image:mediaType:mediaSubtypes:abnormalDimension:", &obj, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128));
      objc_storeStrong((id *)(v6 + 40), obj);
      v8 = *(_QWORD *)(a1 + 48);
      goto LABEL_6;
    case 1:
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v17 = *(id *)(v14 + 40);
      LODWORD(v13) = objc_msgSend(v13, "_performBlurAnalysis:withLumaPixelBuffer:abnormalDimension:isSDOF:", &v17, *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 128), objc_msgSend((id)objc_opt_class(), "_isSDOFWithMediaType:andMediaSubtypes:", *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120)));
      objc_storeStrong((id *)(v14 + 40), v17);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (_DWORD)v13;
      return;
    case 2:
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v16 = *(id *)(v10 + 40);
      v7 = objc_msgSend(v9, "_performExposureAnalysis:withLumaPixelBuffer:", &v16, *(_QWORD *)(a1 + 136));
      objc_storeStrong((id *)(v10 + 40), v16);
      v8 = *(_QWORD *)(a1 + 80);
      goto LABEL_6;
    case 3:
      if (!objc_msgSend((id)objc_opt_class(), "_includeRotation"))
        return;
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v15 = *(id *)(v12 + 40);
      v7 = objc_msgSend(v11, "_performRotationAnalysis:withColorPixelBuffer:", &v15, *(_QWORD *)(a1 + 144));
      objc_storeStrong((id *)(v12 + 40), v15);
      v8 = *(_QWORD *)(a1 + 96);
LABEL_6:
      *(_DWORD *)(*(_QWORD *)(v8 + 8) + 24) = v7;
      return;
    default:
      return;
  }
}

- (void)analyzeWithImageURL:(id)a3 mediaType:(int64_t)a4 mediaSubtypes:(unint64_t)a5 abnormalDimension:(unint64_t)a6 completionHandler:(id)a7
{
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  VCPPreAnalysisImageLoader *imageLoader;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  CFTypeRef v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  CFTypeRef v33;
  NSObject *processingQueue;
  NSObject *processingGroup;
  int64_t v36;
  void *context;
  id v38;
  _QWORD block[5];
  id v40;
  void (**v41)(id, uint64_t, _QWORD);
  int64_t v42;
  unint64_t v43;
  unint64_t v44;
  CFTypeRef v45;
  CFTypeRef v46;
  id v47;
  const void *v48;
  const void *v49;
  uint8_t buf[4];
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (void (**)(id, uint64_t, _QWORD))a7;
  context = (void *)MEMORY[0x1BCCA1B2C]();
  VCPSignPostLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  VCPSignPostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v36 = a4;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VCPSceneAnalyzerLoadImageRequestHandler", ", buf, 2u);
  }

  v48 = 0;
  v49 = 0;
  imageLoader = self->_imageLoader;
  objc_msgSend((id)objc_opt_class(), "_nonPanoPreWarmDimensions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v20 = -[VCPPreAnalysisImageLoader loadImageURL:abnormalDimension:withNonPanoPreWarmSizes:toColorPixelBuffer:lumaPixelBuffer:andImage:](imageLoader, "loadImageURL:abnormalDimension:withNonPanoPreWarmSizes:toColorPixelBuffer:lumaPixelBuffer:andImage:", v12, a6, v19, &v48, &v49, &v47);
  v21 = v47;

  VCPSignPostLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_END, v15, "VCPSceneAnalyzerLoadImageRequestHandler", ", buf, 2u);
  }

  if ((_DWORD)v20)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load imageURL: %@", buf, 0xCu);
    }
    v13[2](v13, v20, 0);
  }
  else if (objc_msgSend((id)objc_opt_class(), "_enableSceneAssetConcurrency"))
  {
    if (v49)
      v24 = CFRetain(v49);
    else
      v24 = 0;
    if (v48)
      v33 = CFRetain(v48);
    else
      v33 = 0;
    dispatch_group_wait((dispatch_group_t)self->_processingGroup, 0xFFFFFFFFFFFFFFFFLL);
    processingGroup = self->_processingGroup;
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__VCPPreAnalyzer_analyzeWithImageURL_mediaType_mediaSubtypes_abnormalDimension_completionHandler___block_invoke;
    block[3] = &unk_1E6B19D18;
    block[4] = self;
    v42 = v36;
    v43 = a5;
    v44 = a6;
    v45 = v33;
    v46 = v24;
    v40 = v21;
    v41 = v13;
    dispatch_group_async(processingGroup, processingQueue, block);

  }
  else
  {
    VCPSignPostLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_signpost_id_generate(v25);

    VCPSignPostLog();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VCPSceneAnalyzerPerformAnalysis", ", buf, 2u);
    }

    v38 = 0;
    v29 = -[VCPPreAnalyzer _performAnalysis:mediaType:mediaSubtypes:abnormalDimension:colorPixelBuffer:andLumaPixelBuffer:image:](self, "_performAnalysis:mediaType:mediaSubtypes:abnormalDimension:colorPixelBuffer:andLumaPixelBuffer:image:", &v38, v36, a5, a6, v48, v49, v21);
    v30 = v38;
    VCPSignPostLog();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v32, OS_SIGNPOST_INTERVAL_END, v26, "VCPSceneAnalyzerPerformAnalysis", ", buf, 2u);
    }

    ((void (**)(id, uint64_t, id))v13)[2](v13, v29, v30);
  }

  CF<opaqueCMSampleBuffer *>::~CF(&v48);
  CF<opaqueCMSampleBuffer *>::~CF(&v49);
  objc_autoreleasePoolPop(context);

}

void __98__VCPPreAnalyzer_analyzeWithImageURL_mediaType_mediaSubtypes_abnormalDimension_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const void *v9;
  const void *v10;
  uint8_t v11[8];
  id v12;
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "VCPSceneAnalyzerPerformAnalysis", ", buf, 2u);
  }

  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_performAnalysis:mediaType:mediaSubtypes:abnormalDimension:colorPixelBuffer:andLumaPixelBuffer:image:", &v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 40));
  v6 = v12;
  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_END, v3, "VCPSceneAnalyzerPerformAnalysis", ", v11, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v9 = *(const void **)(a1 + 88);
  if (v9)
    CFRelease(v9);
  v10 = *(const void **)(a1 + 80);
  if (v10)
    CFRelease(v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ivsPool, 0);
  objc_storeStrong((id *)&self->_rotationBufferCreator, 0);
  objc_storeStrong((id *)&self->_rotationModel, 0);
  objc_storeStrong((id *)&self->_sessionPool, 0);
  objc_storeStrong((id *)&self->_monochromeBufferCreator, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_processingGroup, 0);
}

- (void)_collectSceneAnalysisResults:(void *)a1 fromRequests:(uint8_t *)buf wpResults:ivsResults:abnormalDimension:.cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unnormalized salientObject narrowed bounding box %@; skip",
    buf,
    0xCu);

}

@end
