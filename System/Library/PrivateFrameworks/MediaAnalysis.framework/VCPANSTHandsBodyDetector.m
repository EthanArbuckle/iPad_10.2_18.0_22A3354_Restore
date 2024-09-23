@implementation VCPANSTHandsBodyDetector

- (VCPANSTHandsBodyDetector)initWithHandExtendRatio:(float)a3 inputRatio:(float)a4 maxNumPersonRegions:(int)a5
{
  VCPANSTHandsBodyDetector *v8;
  int v9;
  VCPCNNVisionCoreDetector *v10;
  VCPCNNVisionCoreDetector *visionCoreDetector;
  VCPANSTHandsBodyDetector *v12;
  void *v13;
  uint64_t v14;
  ANSTISPAlgorithm *anstAlgorithm;
  Rotator *v16;
  Rotator *v17;
  ANSTISPAlgorithm *v18;
  char v19;
  id v20;
  VCPANSTHandsBodyDetector *v21;
  id v23;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VCPANSTHandsBodyDetector;
  v8 = -[VCPANSTHandsBodyDetector init](&v24, sel_init);
  if (v8)
  {
    v9 = _os_feature_enabled_impl();
    v8->_useVisionCore = v9;
    if (v9)
    {
      v10 = -[VCPCNNVisionCoreDetector initWithOptions:]([VCPCNNVisionCoreDetector alloc], "initWithOptions:", 0);
      visionCoreDetector = v8->_visionCoreDetector;
      v8->_visionCoreDetector = v10;

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPANSTHandsBodyDetector - using VisionCore as detector", buf, 2u);
      }
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF1810]), "initWithVersion:", 0x10000);
      objc_msgSend(v13, "setQualityOfService:", 33);
      objc_msgSend(v13, "setEnableSegmentation:", 0);
      objc_msgSend(v13, "setRunningFrameRate:", 1);
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF1808]), "initWithConfiguration:", v13);
      anstAlgorithm = v8->_anstAlgorithm;
      v8->_anstAlgorithm = (ANSTISPAlgorithm *)v14;

      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPANSTHandsBodyDetector - using ANSTKit as detector", buf, 2u);
      }

    }
    v16 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E0DE4E10]);
    if (v16)
    {
      v17 = v16;
      ma::Rotator::Rotator((uint64_t)v16, 90);
      v8->_rotator = v17;
      v8->_extendRatio = a3;
      v8->_inputRatio = a4;
      v8->_maxNumPersonRegions = a5;
      v12 = v8;
      v18 = v8->_anstAlgorithm;
      if (v18)
      {
        v23 = 0;
        v19 = -[ANSTISPAlgorithm prepareWithError:](v18, "prepareWithError:", &v23);
        v20 = v23;
        if ((v19 & 1) == 0
          && (int)MediaAnalysisLogLevel() >= 3
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v20;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPANSTHandsBodyDetector - prepareError = %@", buf, 0xCu);
        }

        v12 = v8;
      }
    }
    else
    {
      v12 = 0;
      v8->_rotator = 0;
      v8->_extendRatio = a3;
      v8->_inputRatio = a4;
      v8->_maxNumPersonRegions = a5;
    }
  }
  else
  {
    v12 = 0;
  }
  v21 = v12;

  return v21;
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
  v4.super_class = (Class)VCPANSTHandsBodyDetector;
  -[VCPANSTHandsBodyDetector dealloc](&v4, sel_dealloc);
}

- (int)updateMaxNumPersonRegions:(int)a3
{
  self->_maxNumPersonRegions = a3;
  return 0;
}

- (int)getTopKLargestPersonBoxes:(int)a3 personRegions:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_29);
  while (objc_msgSend(v5, "count") > (unint64_t)a3)
    objc_msgSend(v5, "removeLastObject");

  return 0;
}

uint64_t __68__VCPANSTHandsBodyDetector_getTopKLargestPersonBoxes_personRegions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  float v27;
  float v28;
  float v29;
  uint64_t v30;
  float v32;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "maxX");
  v32 = v8;
  objc_msgSend(v6, "minX");
  v10 = v9;
  objc_msgSend(v6, "maxY");
  v12 = v11;
  objc_msgSend(v6, "minY");
  v14 = v13;
  objc_msgSend(v7, "maxX");
  v16 = v15;
  objc_msgSend(v7, "minX");
  v18 = v17;
  objc_msgSend(v7, "maxY");
  v20 = v19;
  objc_msgSend(v7, "minY");
  v22 = v21;
  objc_msgSend(v6, "flag");
  v24 = v23;
  objc_msgSend(v7, "flag");
  if (v24 <= v25)
  {
    objc_msgSend(v6, "flag");
    v28 = v27;
    objc_msgSend(v7, "flag");
    v30 = -1;
    if ((float)((float)(v32 - v10) * (float)(v12 - v14)) <= (float)((float)(v16 - v18) * (float)(v20 - v22)))
      v30 = 1;
    if (v28 >= v29)
      v26 = v30;
    else
      v26 = 1;
  }
  else
  {
    v26 = -1;
  }

  return v26;
}

- (int)updateHandBoxes:(id)a3 withPersonRegions:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v16;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v16 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v16;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "groupID");
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = v18;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if (objc_msgSend(v14, "groupID") == v9)
                objc_msgSend(v5, "addObject:", v14);
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  return 0;
}

- (int)anstDetection:(__CVBuffer *)a3 rotationInDegrees:(id)a4 detectingFullbody:(BOOL)a5 detectingHands:(BOOL)a6 handsRegions:(id)a7 personRegions:(id)a8 cancel:(id)a9
{
  _BOOL4 v11;
  size_t Width;
  size_t Height;
  double v15;
  double v16;
  void *v17;
  int v18;
  ma::Rotator *rotator;
  VCPCNNVisionCoreDetector *visionCoreDetector;
  id *v21;
  uint64_t v22;
  ANSTISPAlgorithm *anstAlgorithm;
  id *v24;
  uint64_t v25;
  VCPCNNVisionCoreDetector *v26;
  id v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  ANSTISPAlgorithm *v31;
  id v32;
  uint64_t v33;
  float v34;
  float v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  VCPBoundingBox *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  VCPBoundingBox *v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  void *v76;
  int v77;
  int v78;
  uint64_t v79;
  float v80;
  float v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  VCPBoundingBox *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  VCPBoundingBox *v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  _BOOL4 v128;
  double v129;
  id v130;
  uint64_t (**v131)(void);
  id obj;
  id obja;
  id v134;
  id v135;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  CFTypeRef cf;
  uint8_t buf[4];
  double v151;
  __int16 v152;
  double v153;
  __int16 v154;
  double v155;
  __int16 v156;
  double v157;
  __int16 v158;
  _BYTE v159[24];
  _BYTE v160[128];
  _BYTE v161[128];
  uint64_t v162;

  v128 = a6;
  v11 = a5;
  v162 = *MEMORY[0x1E0C80C00];
  v130 = a4;
  v134 = a7;
  v135 = a8;
  v131 = (uint64_t (**)(void))a9;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  cf = 0;
  if (!v131 || (v131[2]() & 1) == 0)
  {
    if ((int)Height < (int)Width)
    {
      if (self->_useVisionCore)
      {
        visionCoreDetector = self->_visionCoreDetector;
        v146 = 0;
        v21 = (id *)&v146;
        -[VCPCNNVisionCoreDetector resultForPixelBuffer:orientation:Error:](visionCoreDetector, "resultForPixelBuffer:orientation:Error:", a3, 1, &v146);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v17 = (void *)v22;
        v27 = *v21;
        if (*(double *)&v27 != 0.0)
        {
          v16 = *(double *)&v27;
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v151 = v16;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to obtain result: %@", buf, 0xCu);
          }
          v15 = 0.0;
          v129 = 0.0;
LABEL_48:
          v18 = -18;
          goto LABEL_133;
        }
        if (v17)
        {
          if (v11)
          {
            LODWORD(v28) = 1036831949;
            v18 = -[VCPCNNVisionCoreDetector getBodyRegions:fromVisionCorePostProcessingOutput:imageWidth:imageHeight:extendRatio:portrait_mode:](self->_visionCoreDetector, "getBodyRegions:fromVisionCorePostProcessingOutput:imageWidth:imageHeight:extendRatio:portrait_mode:", v135, v17, Width, Height, (int)Height >= (int)Width, v28);
            if (v18)
            {
LABEL_41:
              v15 = 0.0;
              v129 = 0.0;
              v16 = 0.0;
              goto LABEL_133;
            }
          }
          if (v135)
            -[VCPANSTHandsBodyDetector getTopKLargestPersonBoxes:personRegions:](self, "getTopKLargestPersonBoxes:personRegions:", self->_maxNumPersonRegions, v135);
          if (v128)
          {
            if ((int)Height >= (int)Width)
              v29 = Width;
            else
              v29 = Height;
            if ((int)Height <= (int)Width)
              v30 = Width;
            else
              v30 = Height;
            *(float *)&v28 = self->_extendRatio;
            v18 = -[VCPCNNVisionCoreDetector getHandsRegions:fromVisionCorePostProcessingOutput:imageWidth:imageHeight:extendRatio:portrait_mode:](self->_visionCoreDetector, "getHandsRegions:fromVisionCorePostProcessingOutput:imageWidth:imageHeight:extendRatio:portrait_mode:", v134, v17, v30, v29, (int)Height >= (int)Width, v28);
            if (v18)
              goto LABEL_41;
            v15 = 0.0;
            if (!v134 || !v135)
            {
              v129 = 0.0;
              v16 = 0.0;
              goto LABEL_133;
            }
            -[VCPANSTHandsBodyDetector updateHandBoxes:withPersonRegions:](self, "updateHandBoxes:withPersonRegions:", v134);
          }
        }
        v15 = 0.0;
        v129 = 0.0;
        v16 = 0.0;
LABEL_132:
        v18 = 0;
        goto LABEL_133;
      }
      if (v130
        && objc_msgSend(v130, "intValue") != 90
        && objc_msgSend(v130, "intValue") != 270
        && objc_msgSend(v130, "intValue") != 180)
      {
        objc_msgSend(v130, "intValue");
      }
      anstAlgorithm = self->_anstAlgorithm;
      v145 = 0;
      v24 = (id *)&v145;
      -[ANSTISPAlgorithm resultForPixelBuffer:orientation:error:](anstAlgorithm, "resultForPixelBuffer:orientation:error:", a3, 0, &v145);
      *(double *)&v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
LABEL_43:
      v16 = *(double *)&v25;
      v32 = *v24;
      if (*(double *)&v32 != 0.0)
      {
        v15 = *(double *)&v32;
        v129 = v16;
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v151 = v15;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to obtain result: %@", buf, 0xCu);
        }
        v16 = 0.0;
        v17 = 0;
        goto LABEL_48;
      }
      if (v16 == 0.0)
      {
        v15 = 0.0;
        v129 = 0.0;
      }
      else
      {
        v129 = v16;
        if (v11)
        {
          objc_msgSend(*(id *)&v16, "detectedObjectsForCategory:", *MEMORY[0x1E0CF17F8]);
          v143 = 0u;
          v144 = 0u;
          v141 = 0u;
          v142 = 0u;
          obj = (id)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v161, 16);
          if (v33)
          {
            v34 = (float)(int)Height;
            v35 = (float)(int)Width;
            v36 = *(_QWORD *)v142;
            do
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v142 != v36)
                  objc_enumerationMutation(obj);
                v38 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
                v39 = objc_msgSend(v38, "objectID");
                v40 = objc_msgSend(v38, "groupID");
                objc_msgSend(v38, "boundingBox");
                v42 = v41;
                v44 = v43;
                v46 = v45;
                v48 = v47;
                v49 = (float)(unint64_t)objc_msgSend(v38, "confidence");
                v50 = v46;
                v51 = v42;
                v52 = v44;
                if ((int)Height >= (int)Width)
                  v53 = v48;
                else
                  v53 = v46;
                if ((int)Height >= (int)Width)
                  v54 = v46;
                else
                  v54 = v48;
                if ((int)Height >= (int)Width)
                  v55 = v44;
                else
                  v55 = v51;
                if ((int)Height >= (int)Width)
                  v56 = (float)(v34 - v51) - v50;
                else
                  v56 = v52;
                v57 = [VCPBoundingBox alloc];
                *(float *)&v60 = (float)(v54 * 0.5) + v56;
                *(float *)&v61 = (float)(v54 * 0.5) * 1.1;
                *(float *)&v62 = *(float *)&v61 + *(float *)&v60;
                if ((float)(*(float *)&v61 + *(float *)&v60) > v34)
                  *(float *)&v62 = (float)(int)Height;
                v63 = *(float *)&v60 - *(float *)&v61;
                v64 = 0.0;
                if (v63 >= 0.0)
                  *(float *)&v58 = v63;
                else
                  *(float *)&v58 = 0.0;
                v65 = (float)(v53 * 0.5) + v55;
                v66 = (float)(v53 * 0.5) * 1.1;
                *(float *)&v59 = v66 + v65;
                if ((float)(v66 + v65) > v35)
                  *(float *)&v59 = (float)(int)Width;
                v67 = v65 - v66;
                if (v67 >= 0.0)
                  v64 = v67;
                *(float *)&v60 = *(float *)&v58 / v34;
                *(float *)&v61 = v64 / v35;
                *(float *)&v58 = (float)(*(float *)&v62 - *(float *)&v58) / v34;
                *(float *)&v62 = (float)(*(float *)&v59 - v64) / v35;
                *(float *)&v59 = v49;
                v68 = -[VCPBoundingBox initWithXYAndSize:y:width:height:confidence:](v57, "initWithXYAndSize:y:width:height:confidence:", v61, v60, v62, v58, v59);
                -[VCPBoundingBox setTrackID:](v68, "setTrackID:", v39);
                -[VCPBoundingBox setGroupID:](v68, "setGroupID:", v40);
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  -[VCPBoundingBox minX](v68, "minX");
                  v70 = v69;
                  -[VCPBoundingBox minY](v68, "minY");
                  v72 = v71;
                  -[VCPBoundingBox maxX](v68, "maxX");
                  v74 = v73;
                  -[VCPBoundingBox maxY](v68, "maxY");
                  *(_DWORD *)buf = 134219264;
                  v151 = v70;
                  v152 = 2048;
                  v153 = v72;
                  v154 = 2048;
                  v155 = v74;
                  v156 = 2048;
                  v157 = v75;
                  v158 = 2048;
                  *(_QWORD *)v159 = v39;
                  *(_WORD *)&v159[8] = 2048;
                  *(_QWORD *)&v159[10] = v40;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPANSTHandsBodyDetector: person fullbody box (xyxy) = [%f, %f, %f, %f], trackingID = %lu, groupID = %lu", buf, 0x3Eu);
                }
                objc_msgSend(v135, "addObject:", v68);

              }
              v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v161, 16);
            }
            while (v33);
          }

          if (v135)
            -[VCPANSTHandsBodyDetector getTopKLargestPersonBoxes:personRegions:](self, "getTopKLargestPersonBoxes:personRegions:", self->_maxNumPersonRegions);

        }
        if (v128)
        {
          objc_msgSend(*(id *)&v16, "detectedObjectsForCategory:", *MEMORY[0x1E0CF1800]);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)Height >= (int)Width)
            v77 = Width;
          else
            v77 = Height;
          v139 = 0u;
          v140 = 0u;
          if ((int)Height <= (int)Width)
            v78 = Width;
          else
            v78 = Height;
          v137 = 0uLL;
          v138 = 0uLL;
          obja = v76;
          v79 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v137, v160, 16);
          if (v79)
          {
            v80 = (float)v78;
            v81 = (float)v77;
            v82 = *(_QWORD *)v138;
            do
            {
              for (j = 0; j != v79; ++j)
              {
                if (*(_QWORD *)v138 != v82)
                  objc_enumerationMutation(obja);
                v84 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * j);
                v85 = objc_msgSend(v84, "objectID");
                v86 = objc_msgSend(v84, "groupID");
                objc_msgSend(v84, "boundingBox");
                v88 = v87;
                v90 = v89;
                v92 = v91;
                v94 = v93;
                v95 = objc_msgSend(v84, "chirality");
                if (v95 == 1)
                  v96 = 0xFFFFFFFFLL;
                else
                  v96 = v95 == 2;
                v97 = objc_msgSend(v84, "confidence");
                v98 = v92 * 0.5;
                v99 = v94 * 0.5;
                v100 = v88 + v98;
                v101 = v90 + v99;
                if (v98 < v99)
                  v98 = v94 * 0.5;
                v102 = v98 * (float)(self->_extendRatio + 1.0);
                v103 = v100 - v102;
                if ((float)(v100 - v102) < 0.0)
                  v103 = 0.0;
                v104 = v101 - v102;
                if ((float)(v101 - v102) < 0.0)
                  v104 = 0.0;
                v105 = v102 + v100;
                if (v105 > v80)
                  v105 = v80;
                v106 = v102 + v101;
                v107 = v103 / v80;
                if (v106 > v81)
                  v106 = v81;
                v108 = v104 / v81;
                v109 = (float)(v105 - v103) / v80;
                v110 = (float)(v106 - v104) / v81;
                if ((int)Height < (int)Width)
                {
                  v112 = (float)(v105 - v103) / v80;
                  v109 = v110;
                }
                else
                {
                  v111 = (float)(1.0 - v107) - v109;
                  v107 = v104 / v81;
                  if (v111 >= 0.0)
                    v108 = v111;
                  else
                    v108 = 0.0;
                  v112 = v110;
                }
                v113 = [VCPBoundingBox alloc];
                *(float *)&v114 = (float)v97;
                *(float *)&v115 = v107;
                *(float *)&v116 = v108;
                *(float *)&v117 = v112;
                *(float *)&v118 = v109;
                v119 = -[VCPBoundingBox initWithXYAndSize:y:width:height:confidence:](v113, "initWithXYAndSize:y:width:height:confidence:", v115, v116, v117, v118, v114);
                -[VCPBoundingBox setClassIndex:](v119, "setClassIndex:", v96);
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  -[VCPBoundingBox minX](v119, "minX");
                  v121 = v120;
                  -[VCPBoundingBox minY](v119, "minY");
                  v123 = v122;
                  -[VCPBoundingBox maxX](v119, "maxX");
                  v125 = v124;
                  -[VCPBoundingBox maxY](v119, "maxY");
                  *(_DWORD *)buf = 134219520;
                  v151 = v121;
                  v152 = 2048;
                  v153 = v123;
                  v154 = 2048;
                  v155 = v125;
                  v156 = 2048;
                  v157 = v126;
                  v158 = 1024;
                  *(_DWORD *)v159 = v96;
                  *(_WORD *)&v159[4] = 2048;
                  *(_QWORD *)&v159[6] = v85;
                  *(_WORD *)&v159[14] = 2048;
                  *(_QWORD *)&v159[16] = v86;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPANSTHandsBodyDetector: hands box (xyxy, chirality) = [%f, %f, %f, %f, %d] trackingID = %lu, groupID = %lu", buf, 0x44u);
                }
                -[VCPBoundingBox setTrackID:](v119, "setTrackID:", v85);
                -[VCPBoundingBox setGroupID:](v119, "setGroupID:", v86);
                objc_msgSend(v134, "addObject:", v119);

              }
              v79 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v137, v160, 16);
            }
            while (v79);
          }

          if (v134 && v135)
            -[VCPANSTHandsBodyDetector updateHandBoxes:withPersonRegions:](self, "updateHandBoxes:withPersonRegions:", v134, v135);

        }
        v15 = 0.0;
        v16 = 0.0;
      }
      v17 = 0;
      goto LABEL_132;
    }
    rotator = (ma::Rotator *)self->_rotator;
    if (rotator)
    {
      if (*((_DWORD *)rotator + 4) == 90)
      {
LABEL_9:
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        v18 = ma::Rotator::Rotate(rotator, a3, &cf);
        if (v18)
        {
          v15 = 0.0;
          v129 = 0.0;
          v16 = 0.0;
          v17 = 0;
          goto LABEL_133;
        }
        if (self->_useVisionCore)
        {
          v26 = self->_visionCoreDetector;
          v148 = 0;
          v21 = (id *)&v148;
          -[VCPCNNVisionCoreDetector resultForPixelBuffer:orientation:Error:](v26, "resultForPixelBuffer:orientation:Error:", cf, 6, &v148);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        v31 = self->_anstAlgorithm;
        v147 = 0;
        v24 = (id *)&v147;
        -[ANSTISPAlgorithm resultForPixelBuffer:orientation:error:](v31, "resultForPixelBuffer:orientation:error:", cf, 4, &v147);
        *(double *)&v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        goto LABEL_43;
      }
      ma::Rotator::~Rotator((ma::Rotator *)self->_rotator);
      MEMORY[0x1BCCA12BC]();
    }
    rotator = (ma::Rotator *)operator new();
    ma::Rotator::Rotator((uint64_t)rotator, 90);
    self->_rotator = (Rotator *)rotator;
    goto LABEL_9;
  }
  v15 = 0.0;
  v129 = 0.0;
  v16 = 0.0;
  v17 = 0;
  v18 = -128;
LABEL_133:

  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visionCoreDetector, 0);
  objc_storeStrong((id *)&self->_anstAlgorithm, 0);
}

@end
