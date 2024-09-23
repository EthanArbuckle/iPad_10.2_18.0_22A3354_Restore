@implementation VCPANSTHandsDetector

- (VCPANSTHandsDetector)initWithExtendRatio:(float)a3 options:(id)a4
{
  id v6;
  VCPANSTHandsDetector *v7;
  int v8;
  VCPCNNVisionCoreDetector *v9;
  VCPCNNVisionCoreDetector *visionCoreDetector;
  VCPANSTHandsDetector *v11;
  void *v12;
  uint64_t v13;
  ANSTISPAlgorithm *anstAlgorithm;
  Rotator *v15;
  Rotator *v16;
  ANSTISPAlgorithm *v17;
  char v18;
  id v19;
  VCPANSTHandsDetector *v20;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)VCPANSTHandsDetector;
  v7 = -[VCPANSTHandsDetector init](&v23, sel_init);
  if (v7)
  {
    v8 = _os_feature_enabled_impl();
    v7->_useVisionCore = v8;
    if (v8)
    {
      v9 = -[VCPCNNVisionCoreDetector initWithOptions:]([VCPCNNVisionCoreDetector alloc], "initWithOptions:", v6);
      visionCoreDetector = v7->_visionCoreDetector;
      v7->_visionCoreDetector = v9;

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPANSTHandsDetector - using VisionCore as detector", buf, 2u);
      }
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF1810]), "initWithVersion:", 0x10000);
      objc_msgSend(v12, "setQualityOfService:", 33);
      objc_msgSend(v12, "setEnableSegmentation:", 0);
      objc_msgSend(v12, "setRunningFrameRate:", 1);
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF1808]), "initWithConfiguration:", v12);
      anstAlgorithm = v7->_anstAlgorithm;
      v7->_anstAlgorithm = (ANSTISPAlgorithm *)v13;

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPANSTHandsDetector - using ANSTKit as detector", buf, 2u);
      }

    }
    v15 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E0DE4E10]);
    if (v15)
    {
      v16 = v15;
      ma::Rotator::Rotator((uint64_t)v15, 90);
      v7->_rotator = v16;
      v7->_extendRatio = a3;
      v11 = v7;
      v17 = v7->_anstAlgorithm;
      if (v17)
      {
        v22 = 0;
        v18 = -[ANSTISPAlgorithm prepareWithError:](v17, "prepareWithError:", &v22);
        v19 = v22;
        if ((v18 & 1) == 0
          && (int)MediaAnalysisLogLevel() >= 3
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v19;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPANSTHandsDetector - prepareError = %@", buf, 0xCu);
        }

        v11 = v7;
      }
    }
    else
    {
      v11 = 0;
      v7->_rotator = 0;
      v7->_extendRatio = a3;
    }
  }
  else
  {
    v11 = 0;
  }
  v20 = v11;

  return v20;
}

+ (id)anstHandsDetectorWithExtendRatio:(float)a3 options:(id)a4
{
  id v5;
  VCPANSTHandsDetector *v6;
  double v7;
  VCPANSTHandsDetector *v8;

  v5 = a4;
  v6 = [VCPANSTHandsDetector alloc];
  *(float *)&v7 = a3;
  v8 = -[VCPANSTHandsDetector initWithExtendRatio:options:](v6, "initWithExtendRatio:options:", v5, v7);

  return v8;
}

- (void)dealloc
{
  Rotator *rotator;
  objc_super v4;

  rotator = self->_rotator;
  if (rotator)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotator);
    MEMORY[0x1BCCA12BC]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPANSTHandsDetector;
  -[VCPANSTHandsDetector dealloc](&v4, sel_dealloc);
}

- (int)handsDetection:(__CVBuffer *)a3 rotationInDegrees:(id)a4 handsRegions:(id)a5 cancel:(id)a6
{
  double extendRatio;
  double v11;
  void *v12;
  int v13;
  ma::Rotator *rotator;
  uint64_t v15;
  uint64_t v16;
  VCPCNNVisionCoreDetector *visionCoreDetector;
  id *v18;
  ANSTISPAlgorithm *anstAlgorithm;
  size_t v20;
  size_t v21;
  VCPCNNVisionCoreDetector *v22;
  ANSTISPAlgorithm *v23;
  size_t v24;
  id v25;
  double v26;
  uint64_t v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  VCPBoundingBox *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  VCPBoundingBox *v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  void *v76;
  id v77;
  uint64_t (**v78)(void);
  id obj;
  id v80;
  size_t Height;
  size_t Width;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  CFTypeRef cf;
  uint8_t buf[4];
  double v93;
  __int16 v94;
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  __int16 v100;
  int v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v77 = a4;
  v80 = a5;
  v78 = (uint64_t (**)(void))a6;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    extendRatio = self->_extendRatio;
    *(_DWORD *)buf = 134217984;
    v93 = extendRatio;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPANSTHandsDetector: extend ratio for ANST hand detection = %f", buf, 0xCu);
  }
  cf = 0;
  if (v78 && (v78[2]() & 1) != 0)
  {
    v11 = 0.0;
    v76 = 0;
    v12 = 0;
    v13 = -128;
    goto LABEL_47;
  }
  if ((int)Height >= (int)Width)
  {
    rotator = (ma::Rotator *)self->_rotator;
    if (rotator)
    {
      if (*((_DWORD *)rotator + 4) == 90)
      {
LABEL_12:
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        v13 = ma::Rotator::Rotate(rotator, a3, &cf);
        if (v13)
        {
          v11 = 0.0;
          v76 = 0;
          v12 = 0;
          goto LABEL_47;
        }
        if (self->_useVisionCore)
        {
          visionCoreDetector = self->_visionCoreDetector;
          v90 = 0;
          v18 = (id *)&v90;
          -[VCPCNNVisionCoreDetector resultForPixelBuffer:orientation:Error:](visionCoreDetector, "resultForPixelBuffer:orientation:Error:", cf, 6, &v90);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 0;
        }
        else
        {
          anstAlgorithm = self->_anstAlgorithm;
          v89 = 0;
          v18 = (id *)&v89;
          -[ANSTISPAlgorithm resultForPixelBuffer:orientation:error:](anstAlgorithm, "resultForPixelBuffer:orientation:error:", cf, 4, &v89);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
        }
        v20 = Width;
        v21 = Height;
        goto LABEL_42;
      }
      ma::Rotator::~Rotator((ma::Rotator *)self->_rotator);
      MEMORY[0x1BCCA12BC]();
    }
    rotator = (ma::Rotator *)operator new();
    ma::Rotator::Rotator((uint64_t)rotator, 90);
    self->_rotator = (Rotator *)rotator;
    goto LABEL_12;
  }
  if (!self->_useVisionCore)
  {
    if (v77)
    {
      if (objc_msgSend(v77, "intValue") == 90)
      {
        v16 = 3;
      }
      else if (objc_msgSend(v77, "intValue") == 270)
      {
        v16 = 4;
      }
      else if (objc_msgSend(v77, "intValue") == 180)
      {
        v16 = 2;
      }
      else
      {
        v16 = objc_msgSend(v77, "intValue") == 0;
      }
    }
    else
    {
      v16 = 1;
    }
    v23 = self->_anstAlgorithm;
    v87 = 0;
    v18 = (id *)&v87;
    -[ANSTISPAlgorithm resultForPixelBuffer:orientation:error:](v23, "resultForPixelBuffer:orientation:error:", a3, v16, &v87);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    goto LABEL_41;
  }
  if (!v77)
    goto LABEL_37;
  if (objc_msgSend(v77, "intValue") != 90)
  {
    if (objc_msgSend(v77, "intValue") == 270)
    {
      v15 = 6;
      goto LABEL_38;
    }
    if (objc_msgSend(v77, "intValue") == 180)
    {
      v15 = 3;
      goto LABEL_38;
    }
    objc_msgSend(v77, "intValue");
LABEL_37:
    v15 = 1;
    goto LABEL_38;
  }
  v15 = 8;
LABEL_38:
  v22 = self->_visionCoreDetector;
  v88 = 0;
  v18 = (id *)&v88;
  -[VCPCNNVisionCoreDetector resultForPixelBuffer:orientation:Error:](v22, "resultForPixelBuffer:orientation:Error:", a3, v15, &v88);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
LABEL_41:
  v20 = Height;
  v21 = Width;
LABEL_42:
  v24 = v21;
  v25 = *v18;
  if (v25)
  {
    v11 = *(double *)&v25;
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v93 = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to obtain result: %@", buf, 0xCu);
    }
    v13 = -18;
  }
  else if (v12)
  {
    *(float *)&v26 = self->_extendRatio;
    v13 = -[VCPCNNVisionCoreDetector getHandsRegions:fromVisionCorePostProcessingOutput:imageWidth:imageHeight:extendRatio:portrait_mode:](self->_visionCoreDetector, "getHandsRegions:fromVisionCorePostProcessingOutput:imageWidth:imageHeight:extendRatio:portrait_mode:", v80, v12, v24, v20, (int)Height >= (int)Width, v26);
    if (v13)
      goto LABEL_48;
    v11 = 0.0;
  }
  else
  {
    v12 = v76;
    if (v76)
    {
      objc_msgSend(v76, "detectedObjectsForCategory:", *MEMORY[0x1E0CF1800]);
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
      if (v28)
      {
        v29 = (float)(int)v24;
        v30 = (float)(int)v20;
        v31 = *(_QWORD *)v84;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v84 != v31)
              objc_enumerationMutation(obj);
            v33 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
            v34 = objc_msgSend(v33, "objectID");
            v35 = objc_msgSend(v33, "groupID");
            objc_msgSend(v33, "boundingBox");
            v37 = v36;
            v39 = v38;
            v41 = v40;
            v43 = v42;
            v44 = objc_msgSend(v33, "chirality");
            if (v44 == 1)
              v45 = 0xFFFFFFFFLL;
            else
              v45 = v44 == 2;
            v46 = objc_msgSend(v33, "confidence");
            v47 = v41 * 0.5;
            v48 = v43 * 0.5;
            v49 = v37 + v47;
            v50 = v39 + v48;
            if (v47 < v48)
              v47 = v43 * 0.5;
            v51 = v47 * (float)(self->_extendRatio + 1.0);
            v52 = v49 - v51;
            if ((float)(v49 - v51) < 0.0)
              v52 = 0.0;
            v53 = v50 - v51;
            if ((float)(v50 - v51) < 0.0)
              v53 = 0.0;
            v54 = v51 + v49;
            if (v54 > v29)
              v54 = v29;
            v55 = v51 + v50;
            v56 = v52 / v29;
            if (v55 > v30)
              v55 = v30;
            v57 = v53 / v30;
            v58 = (float)(v54 - v52) / v29;
            v59 = (float)(v55 - v53) / v30;
            if ((int)Height < (int)Width)
            {
              v61 = (float)(v54 - v52) / v29;
              v58 = v59;
            }
            else
            {
              v60 = (float)(1.0 - v56) - v58;
              v56 = v53 / v30;
              if (v60 >= 0.0)
                v57 = v60;
              else
                v57 = 0.0;
              v61 = v59;
            }
            v62 = [VCPBoundingBox alloc];
            *(float *)&v63 = (float)v46;
            *(float *)&v64 = v56;
            *(float *)&v65 = v57;
            *(float *)&v66 = v61;
            *(float *)&v67 = v58;
            v68 = -[VCPBoundingBox initWithXYAndSize:y:width:height:confidence:](v62, "initWithXYAndSize:y:width:height:confidence:", v64, v65, v66, v67, v63);
            -[VCPBoundingBox setClassIndex:](v68, "setClassIndex:", v45);
            if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              -[VCPBoundingBox minX](v68, "minX");
              v70 = v69;
              -[VCPBoundingBox minY](v68, "minY");
              v72 = v71;
              -[VCPBoundingBox maxX](v68, "maxX");
              v74 = v73;
              -[VCPBoundingBox maxY](v68, "maxY");
              *(_DWORD *)buf = 134219520;
              v93 = v70;
              v94 = 2048;
              v95 = v72;
              v96 = 2048;
              v97 = v74;
              v98 = 2048;
              v99 = v75;
              v100 = 1024;
              v101 = v45;
              v102 = 2048;
              v103 = v34;
              v104 = 2048;
              v105 = v35;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPANSTHandsDetector: box (xyxy, chirality) = [%f, %f, %f, %f, %d] trackingID = %lu, groupID = %lu", buf, 0x44u);
            }
            -[VCPBoundingBox setTrackID:](v68, "setTrackID:", v34);
            -[VCPBoundingBox setGroupID:](v68, "setGroupID:", v35);
            objc_msgSend(v80, "addObject:", v68);

          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v106, 16);
        }
        while (v28);
      }

      v11 = 0.0;
      v12 = 0;
    }
    else
    {
      v11 = 0.0;
      v76 = 0;
    }
    v13 = 0;
  }
LABEL_47:

LABEL_48:
  CF<opaqueCMSampleBuffer *>::~CF(&cf);

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionCoreDetector, 0);
  objc_storeStrong((id *)&self->_anstAlgorithm, 0);
}

@end
