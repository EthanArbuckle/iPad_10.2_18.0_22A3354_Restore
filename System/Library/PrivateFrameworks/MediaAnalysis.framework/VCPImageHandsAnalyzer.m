@implementation VCPImageHandsAnalyzer

- (VCPImageHandsAnalyzer)init
{

  return 0;
}

- (VCPImageHandsAnalyzer)initWithKeypointsOption:(int)a3 forceCPU:(BOOL)a4 sharedModel:(BOOL)a5 enableHandDetection:(BOOL)a6 enableANSTHandDetection:(BOOL)a7 enableRejectHandsNearBoundaries:(BOOL)a8 enableHandObject:(BOOL)a9 sourceWidth:(int)a10 sourceHeight:(int)a11 modelName:(id)a12 revision:(int)a13 options:(id)a14
{
  _BOOL4 v15;
  id v18;
  id v19;
  VCPImageHandsAnalyzer *v20;
  VCPImageHandsAnalyzer *v21;
  NSString *resConfig;
  double v23;
  int sourceWidth;
  int sourceHeight;
  void *v26;
  float v27;
  VCPImageHandsAnalyzer *v28;
  void *v29;
  int v30;
  float v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  VCPImageHandsAnalyzer *v35;
  void *v36;
  uint64_t v37;
  VCPCNNHandKeypointsDetector *handsKeypointsDetector;
  uint64_t v39;
  NSMutableArray *results;
  _BOOL4 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  objc_super v45;
  uint8_t buf[4];
  double v47;
  uint64_t v48;

  v42 = a7;
  v43 = a4;
  v15 = a6;
  v44 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v18 = a12;
  v19 = a14;
  v45.receiver = self;
  v45.super_class = (Class)VCPImageHandsAnalyzer;
  v20 = -[VCPImageHandsAnalyzer init](&v45, sel_init);
  v21 = v20;
  if (v20)
  {
    resConfig = v20->_resConfig;
    v20->_resConfig = (NSString *)CFSTR("res_384x384");

    v21->_inputWidth = 720;
    v21->_inputHeight = 720;
    v21->_sourceWidth = a10;
    v21->_sourceHeight = a11;
    v21->_optimizeForDistance = 0;
    v21->_enableRejectHandsNearBoundaries = a8;
    objc_msgSend((id)objc_opt_class(), "getInsetForRejectingHands");
    v21->_inset = *(float *)&v23;
    sourceWidth = v21->_sourceWidth;
    if (sourceWidth >= 1
      && (sourceHeight = v21->_sourceHeight, sourceHeight >= 1)
      && (*(float *)&v23 = (float)sourceWidth / (float)sourceHeight,
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23),
          (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v26, "floatValue");
        *(_DWORD *)buf = 134217984;
        v47 = v27;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: input image aspectRatio = %f", buf, 0xCu);
      }
      if (-[VCPImageHandsAnalyzer configForAspectRatio:](v21, "configForAspectRatio:", v26))
      {
        v28 = 0;
LABEL_24:
        v35 = v28;

        goto LABEL_25;
      }
      v29 = v26;
    }
    else
    {
      v29 = 0;
    }
    if (a3 >= 6)
      v30 = 6;
    else
      v30 = a3;
    if (v30 <= 1)
      v30 = 1;
    v21->_maxNumRegions = v30;
    objc_msgSend((id)objc_opt_class(), "getExtendRatio");
    v21->_extendRatio = v31;
    if (v15)
    {
      if (v42 && DeviceHasANE())
      {
        *(float *)&v32 = v21->_extendRatio;
        +[VCPANSTHandsDetector anstHandsDetectorWithExtendRatio:options:](VCPANSTHandsDetector, "anstHandsDetectorWithExtendRatio:options:", v19, v32);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 64;
      }
      else
      {
        +[VCPCNNHandsDetector detector:forceCPU:sharedModel:inputConfig:revision:](VCPCNNHandsDetector, "detector:forceCPU:sharedModel:inputConfig:revision:", v21->_maxNumRegions, v43, v44, v21->_resConfig, a13);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = 80;
      }
      v36 = *(Class *)((char *)&v21->super.super.isa + v34);
      *(Class *)((char *)&v21->super.super.isa + v34) = (Class)v33;

    }
    +[VCPCNNHandKeypointsDetector detector:sharedModel:modelName:enableHandObject:options:](VCPCNNHandKeypointsDetector, "detector:sharedModel:modelName:enableHandObject:options:", v43, v44, v18, a9, v19);
    v37 = objc_claimAutoreleasedReturnValue();
    handsKeypointsDetector = v21->_handsKeypointsDetector;
    v21->_handsKeypointsDetector = (VCPCNNHandKeypointsDetector *)v37;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = objc_claimAutoreleasedReturnValue();
    results = v21->_results;
    v21->_results = (NSMutableArray *)v39;

    v26 = v29;
    v28 = v21;
    goto LABEL_24;
  }
  v35 = 0;
LABEL_25:

  return v35;
}

- (int64_t)getClosestAspectRatio:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(&unk_1E6B767E8, "indexOfObject:inSortedRange:options:usingComparator:", v3, 0, objc_msgSend(&unk_1E6B767E8, "count"), 1280, &__block_literal_global_55);
  v5 = objc_msgSend(&unk_1E6B767E8, "count");
  if (v4 >= v5 - 1)
    v4 = v5 - 1;

  return v4;
}

uint64_t __47__VCPImageHandsAnalyzer_getClosestAspectRatio___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (int)configForAspectRatio:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  void *v10;
  int v11;
  float v12;
  float *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  int v19;
  int v20;
  int sourceWidth;
  float v22;
  int sourceHeight;
  int inputWidth;
  int inputHeight;
  NSString *v26;
  NSString *resConfig;
  uint8_t buf[4];
  _BYTE v30[10];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "floatValue");
    v8 = v7;
    objc_msgSend(v5, "floatValue");
    *(float *)&v9 = 1.0 / *(float *)&v9;
    if (v8 >= *(float *)&v9)
      *(float *)&v9 = v8;
    objc_msgSend(v6, "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v30 = v5;
      *(_WORD *)&v30[8] = 2112;
      v31 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: aspectRatio = %@, queryAspectRatioVal = %@", buf, 0x16u);
    }
    v11 = -[VCPImageHandsAnalyzer getClosestAspectRatio:](self, "getClosestAspectRatio:", v10);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v30 = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: feasibleShapeIndex = %d", buf, 8u);
    }
    objc_msgSend(v5, "floatValue");
    v13 = (float *)((char *)&kFeasibleInputShape + 8 * v11);
    v14 = *v13;
    v15 = v13[1];
    if (*v13 >= v15)
      v16 = v13[1];
    else
      v16 = *v13;
    if (*v13 < v15)
      v14 = v13[1];
    if (v12 <= 1.0)
      v17 = v16;
    else
      v17 = v14;
    if (v12 <= 1.0)
      v18 = v14;
    else
      v18 = v16;
    v19 = (int)v18;
    v20 = (int)v17;
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v30 = (int)v18;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = (int)v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: detectorHeight = %d, detectorWidth = %d", buf, 0xEu);
    }
    sourceWidth = self->_sourceWidth;
    v22 = 2.5;
    if (sourceWidth >= 1)
    {
      sourceHeight = self->_sourceHeight;
      if (sourceHeight >= 1 && self->_optimizeForDistance)
        v22 = fmaxf(fminf((float)sourceWidth / (float)v20, (float)sourceHeight / (float)v19), 2.5);
    }
    self->_inputWidth = (int)(float)(v22 * (float)v20);
    self->_inputHeight = (int)(float)(v22 * (float)v19);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      inputWidth = self->_inputWidth;
      inputHeight = self->_inputHeight;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v30 = inputWidth;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = inputHeight;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: preferred source width = %d, preferred source height = %d", buf, 0xEu);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("res_%dx%d"), (int)v17, (int)v18);
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    resConfig = self->_resConfig;
    self->_resConfig = v26;

  }
  return 0;
}

- (int)updateMaxNumHands:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "ImageHandAnalyzer: maxNumHands from options = %@", (uint8_t *)&v9, 0xCu);
  }
  if (v4)
  {
    v5 = objc_msgSend(v4, "intValue");
    if (v5 >= 6)
      v6 = 6;
    else
      v6 = v5;
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    self->_maxNumRegions = v7;
    -[VCPCNNHandsDetector updateMaxNumRegions:](self->_handsDetector, "updateMaxNumRegions:");
  }

  return 0;
}

- (int)updateModelForSourceWidth:(int)a3 sourceHeight:(int)a4
{
  NSString *v7;
  double v8;
  int v9;
  void *v10;
  VCPCNNHandsDetector *handsDetector;

  v7 = self->_resConfig;
  self->_sourceWidth = a3;
  self->_sourceHeight = a4;
  v9 = -50;
  if (a3 >= 1 && a4 >= 1)
  {
    *(float *)&v8 = (float)a3 / (float)a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VCPImageHandsAnalyzer configForAspectRatio:](self, "configForAspectRatio:", v10);

    if (!v9)
    {
      if (v7 != self->_resConfig)
      {
        handsDetector = self->_handsDetector;
        if (handsDetector)
          -[VCPCNNHandsDetector updateModelWithResConfig:](handsDetector, "updateModelWithResConfig:");
      }
      v9 = 0;
    }
  }

  return v9;
}

+ (float)getExtendRatio
{
  return 0.25;
}

+ (float)getInsetForRejectingHands
{
  return 0.08;
}

- (int)convertSingleResultToDict:(CGPoint)a3[21] keypointConfidence:(float *)a4 box:(id)a5 handHoldsObjectConfidence:(float)a6 results:(id)a7
{
  id v9;
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
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  uint64_t v32;
  float v33;
  CGFloat *p_y;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  double v43;
  float v44;
  float v45;
  double v46;
  float v47;
  float v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  double v66;
  double v67;
  double v68;
  double v69;
  id v71;
  void *v72;
  void *v73;
  void *v75;
  const __CFString *v76;
  void *v77;
  _QWORD v78[4];
  _QWORD v79[4];
  _QWORD v80[8];
  NSRect v81;

  v80[6] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v71 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "minX");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v11;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "minY");
  objc_msgSend(v12, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v13;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "maxX");
  objc_msgSend(v14, "numberWithFloat:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v15;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "maxY");
  objc_msgSend(v16, "numberWithFloat:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v17;
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "confidence");
  objc_msgSend(v18, "numberWithFloat:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v80[4] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "classIndex"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v80[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addObject:", v21);

  objc_msgSend(v9, "minX");
  v23 = v22;
  objc_msgSend(v9, "minY");
  v25 = v24;
  objc_msgSend(v9, "maxX");
  v27 = v26;
  objc_msgSend(v9, "minX");
  v29 = v28;
  objc_msgSend(v9, "maxY");
  v31 = v30;
  objc_msgSend(v9, "minY");
  v32 = 0;
  v68 = (float)(v27 - v29);
  v69 = v23;
  v66 = v25;
  v67 = (float)(v31 - v33);
  p_y = &a3->y;
  do
  {
    objc_msgSend(v9, "maxX", *(_QWORD *)&v66, *(_QWORD *)&v67, *(_QWORD *)&v68, *(_QWORD *)&v69);
    v36 = v35;
    objc_msgSend(v9, "minX");
    v38 = v37;
    objc_msgSend(v9, "maxY");
    v40 = v39;
    objc_msgSend(v9, "minY");
    v42 = v41;
    if (*(p_y - 1) == 0.0 && (v43 = *p_y, *p_y == 0.0))
    {
      v78[0] = &unk_1E6B71F80;
      v78[1] = &unk_1E6B71F80;
      *(float *)&v43 = a4[v32];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v78[2] = v51;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "classIndex"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v78[3] = v53;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 4);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "addObject:", v55);
    }
    else
    {
      objc_msgSend(v9, "minX");
      v45 = v44;
      v46 = *(p_y - 1);
      objc_msgSend(v9, "minY");
      v48 = v47;
      v49 = v45 + v46 / 192.0 * (float)(v36 - v38);
      *(float *)&v49 = v49;
      v50 = *p_y;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v48 + v50 / 192.0 * (float)(v40 - v42);
      *(float *)&v52 = v52;
      *(float *)&v52 = 1.0 - *(float *)&v52;
      v79[0] = v51;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v79[1] = v53;
      *(float *)&v54 = a4[v32];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v79[2] = v55;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "classIndex"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v79[3] = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "addObject:", v57);

    }
    ++v32;
    p_y += 2;
  }
  while (v32 != 21);
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v75, CFSTR("handsKeypoints"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "trackID"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v58, CFSTR("handsTrackingID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "groupID"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v59, CFSTR("handsGroupID"));

  v81.size.height = v67;
  v81.origin.y = 1.0 - v66 - v67;
  v81.size.width = v68;
  v81.origin.x = v69;
  NSStringFromRect(v81);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v60, CFSTR("handsBounds"));

  LODWORD(v61) = 0.5;
  *(float *)&v62 = a6;
  if (a6 > 0.5)
  {
    *(float *)&v61 = a6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setObject:forKeyedSubscript:", v63, CFSTR("handsHoldObject"));

  }
  v76 = CFSTR("attributes");
  v77 = v73;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1, v61, v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addObject:", v64);

  return 0;
}

- (BOOL)keypointsOutsideInset:(CGPoint)a3[21] handRegion:(id)a4
{
  id v6;
  double inset;
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
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  uint64_t v31;
  unsigned int v32;
  float v33;
  double v34;
  float v35;
  float v36;
  double x;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  double y;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  double rect;
  double v52;
  double v53;
  uint8_t buf[4];
  double v55;
  uint64_t v56;
  CGPoint v57;
  CGRect v58;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    inset = self->_inset;
    *(_DWORD *)buf = 134217984;
    v55 = inset;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPImageHandsAnalyzer - inset for rejecting hands near frame boundaries = %f", buf, 0xCu);
  }
  objc_msgSend(v6, "maxX");
  v9 = v8;
  objc_msgSend(v6, "minX");
  v11 = v10;
  objc_msgSend(v6, "maxY");
  v13 = v12;
  objc_msgSend(v6, "minY");
  v15 = v14;
  objc_msgSend(v6, "minX");
  v16 = v9 - v11;
  if (v17 == 0.0)
  {
    v18 = self->_inset;
    if ((float)(v16 * 0.1) >= (float)(v16 - v18))
      v19 = v16 * 0.1;
    else
      v19 = v16 - v18;
  }
  else
  {
    v18 = 0.0;
    v19 = v16;
  }
  objc_msgSend(v6, "maxX");
  if (v20 == 1.0)
  {
    if ((float)(v16 * 0.1) >= (float)(v19 - self->_inset))
      v19 = v16 * 0.1;
    else
      v19 = v19 - self->_inset;
  }
  objc_msgSend(v6, "minY");
  v22 = v13 - v15;
  v23 = self->_inset;
  v24 = (float)(v13 - v15) * 0.1;
  v25 = v22 - v23;
  if (v24 >= (float)(v22 - v23))
    v25 = v24;
  if (v21 >= v23)
    v26 = 0.0;
  else
    v26 = self->_inset;
  if (v21 >= v23)
    v27 = v22;
  else
    v27 = v25;
  objc_msgSend(v6, "maxY");
  if (v28 == 1.0)
  {
    if (v24 >= (float)(v27 - self->_inset))
      v27 = v24;
    else
      v27 = v27 - self->_inset;
  }
  objc_msgSend(v6, "minX");
  v30 = v29;
  objc_msgSend(v6, "minY");
  v31 = 0;
  v32 = 0;
  v52 = (float)(v26 + v33);
  v53 = (float)(v18 + v30);
  rect = v19;
  v34 = v27;
  do
  {
    objc_msgSend(v6, "minX");
    v36 = v35;
    x = a3[v31].x;
    objc_msgSend(v6, "maxX");
    v39 = v38;
    objc_msgSend(v6, "minX");
    v41 = v40;
    objc_msgSend(v6, "minY");
    v43 = v42;
    y = a3[v31].y;
    objc_msgSend(v6, "maxY");
    v46 = v45;
    objc_msgSend(v6, "minY");
    v47 = v36 + x / 192.0 * (float)(v39 - v41);
    v49 = v43 + y / 192.0 * (float)(v46 - v48);
    v57.x = v47;
    v57.y = v49;
    v58.origin.y = v52;
    v58.origin.x = v53;
    v58.size.width = rect;
    v58.size.height = v34;
    v32 += CGRectContainsPoint(v58, v57);
    ++v31;
  }
  while (v31 != 21);
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v55) = 21 - v32;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "VCPImageHandAnalyzer - number of keypoints outside inset = %d", buf, 8u);
  }

  return v32 < 0x15;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 rotationInDegrees:(id)a4 flags:(unint64_t *)a5 results:(id *)a6 cancel:(id)a7
{
  int Width;
  int Height;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  float v29;
  uint64_t i;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  VCPBoundingBox *v40;
  int v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  VCPBoundingBox *v47;
  float v48;
  double v49;
  float v50;
  double v51;
  float v52;
  double v53;
  float v54;
  double v55;
  double v56;
  double v57;
  double v58;
  int v59;
  unint64_t j;
  NSObject *v61;
  os_signpost_id_t v62;
  NSObject *v63;
  NSObject *v64;
  VCPCNNHandKeypointsDetector *handsKeypointsDetector;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  BOOL v70;
  void *v71;
  double v72;
  NSMutableArray *results;
  uint64_t v75;
  id *v76;
  NSArray *obj;
  id v78;
  id v79;
  uint8_t v80[16];
  uint8_t v81[16];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  const __CFString *v86;
  NSMutableArray *v87;
  uint8_t buf[4];
  int v89;
  __int16 v90;
  int v91;
  _BYTE v92[128];
  _OWORD v93[5];
  int v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v78 = a4;
  v79 = a7;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v76 = a6;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    v89 = Width;
    v90 = 1024;
    v91 = Height;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "HandPoseInputBuffer: width = %d,  height = %d", buf, 0xEu);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0;
  memset(v93, 0, sizeof(v93));
  -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
  if (self->_anstHandsDetector)
  {
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "HandPoseInputBuffer: running VCPANSTHandsDetector", buf, 2u);
    }
    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_generate(v14);

    VCPSignPostLog();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VCPImageHandsAnalyzer_anstHandDetection", ", buf, 2u);
    }

    v18 = -[VCPANSTHandsDetector handsDetection:rotationInDegrees:handsRegions:cancel:](self->_anstHandsDetector, "handsDetection:rotationInDegrees:handsRegions:cancel:", a3, v78, v13, v79);
    if (v18)
      goto LABEL_56;
    VCPSignPostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v20, OS_SIGNPOST_INTERVAL_END, v15, "VCPImageHandsAnalyzer_anstHandDetection", ", buf, 2u);
    }
  }
  else
  {
    if (!self->_handsDetector)
    {
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v75 = 120;
      obj = self->_handObjects;
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
      if (v26)
      {
        v27 = (float)Width;
        v28 = *(_QWORD *)v83;
        v29 = (float)Height;
        while (2)
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v83 != v28)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
            objc_msgSend(v31, "bounds", v75);
            v33 = v32;
            v35 = v34;
            v37 = v36;
            v39 = v38;
            v40 = [VCPBoundingBox alloc];
            objc_msgSend(v31, "confidence");
            LODWORD(v42) = v41;
            *(float *)&v43 = v39;
            *(float *)&v44 = v37;
            v45 = 1.0 - v35 - v39;
            *(float *)&v46 = v45;
            *(float *)&v45 = v33;
            v47 = -[VCPBoundingBox initWithXYAndSize:y:width:height:confidence:](v40, "initWithXYAndSize:y:width:height:confidence:", v45, v46, v44, v43, v42);
            -[VCPBoundingBox setClassIndex:](v47, "setClassIndex:", objc_msgSend(v31, "chirality"));
            -[VCPBoundingBox setTrackID:](v47, "setTrackID:", objc_msgSend(v31, "handID"));
            -[VCPBoundingBox setGroupID:](v47, "setGroupID:", objc_msgSend(v31, "groupID"));
            -[VCPBoundingBox minX](v47, "minX");
            *(float *)&v49 = v48 * v27;
            -[VCPBoundingBox setMinX:](v47, "setMinX:", v49);
            -[VCPBoundingBox maxX](v47, "maxX");
            *(float *)&v51 = v50 * v27;
            -[VCPBoundingBox setMaxX:](v47, "setMaxX:", v51);
            -[VCPBoundingBox minY](v47, "minY");
            *(float *)&v53 = v52 * v29;
            -[VCPBoundingBox setMinY:](v47, "setMinY:", v53);
            -[VCPBoundingBox maxY](v47, "maxY");
            *(float *)&v55 = v54 * v29;
            -[VCPBoundingBox setMaxY:](v47, "setMaxY:", v55);
            *(float *)&v56 = self->_extendRatio;
            *(float *)&v57 = v27;
            *(float *)&v58 = v29;
            v18 = -[VCPBoundingBox extendBoxBy:scaleX:scaleY:](v47, "extendBoxBy:scaleX:scaleY:", v56, v57, v58);
            if (v18)
            {

              goto LABEL_56;
            }
            objc_msgSend(v13, "addObject:", v47);

          }
          v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
          if (v26)
            continue;
          break;
        }
      }

      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v59 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v75), "count");
        *(_DWORD *)buf = 67109120;
        v89 = v59;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPImageHandAnalyzer - analyze %d handObjects", buf, 8u);
      }
      goto LABEL_39;
    }
    if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "HandPoseInputBuffer: running VCPCNNHandsDetector", buf, 2u);
    }
    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_signpost_id_generate(v21);

    VCPSignPostLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "VCPImageHandsAnalyzer_handDetection", ", buf, 2u);
    }

    v18 = -[VCPCNNHandsDetector handsDetection:handsRegions:cancel:](self->_handsDetector, "handsDetection:handsRegions:cancel:", a3, v13, v79);
    if (v18)
      goto LABEL_56;
    VCPSignPostLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v20 = v25;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v20, OS_SIGNPOST_INTERVAL_END, v22, "VCPImageHandsAnalyzer_handDetection", ", buf, 2u);
    }
  }

LABEL_39:
  for (j = 0; objc_msgSend(v13, "count", v75) > j; ++j)
  {
    VCPSignPostLog();
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = os_signpost_id_generate(v61);

    VCPSignPostLog();
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_WORD *)v81 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v64, OS_SIGNPOST_INTERVAL_BEGIN, v62, "VCPImageHandsAnalyzer_keypointsPerHand", ", v81, 2u);
    }

    *(_DWORD *)v81 = 0;
    handsKeypointsDetector = self->_handsKeypointsDetector;
    objc_msgSend(v13, "objectAtIndexedSubscript:", j);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[VCPCNNHandKeypointsDetector handKeypointsDetection:box:keypoints:keypointConfidence:handHoldsObjectConfidence:](handsKeypointsDetector, "handKeypointsDetection:box:keypoints:keypointConfidence:handHoldsObjectConfidence:", a3, v66, buf, v93, v81);

    if (v18)
      goto LABEL_56;
    VCPSignPostLog();
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = v67;
    if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      *(_WORD *)v80 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v68, OS_SIGNPOST_INTERVAL_END, v62, "VCPImageHandsAnalyzer_keypointsPerHand", ", v80, 2u);
    }

    if (self->_enableRejectHandsNearBoundaries)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", j);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = -[VCPImageHandsAnalyzer keypointsOutsideInset:handRegion:](self, "keypointsOutsideInset:handRegion:", buf, v69);

      if (v70)
        continue;
    }
    objc_msgSend(v13, "objectAtIndexedSubscript:", j);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v72) = *(_DWORD *)v81;
    -[VCPImageHandsAnalyzer convertSingleResultToDict:keypointConfidence:box:handHoldsObjectConfidence:results:](self, "convertSingleResultToDict:keypointConfidence:box:handHoldsObjectConfidence:results:", buf, v93, v71, self->_results, v72);

  }
  results = self->_results;
  if (results)
  {
    v86 = CFSTR("HandsResults");
    v87 = results;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
    v18 = 0;
    *v76 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_56:

  return v18;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  return -[VCPImageHandsAnalyzer analyzePixelBuffer:rotationInDegrees:flags:results:cancel:](self, "analyzePixelBuffer:rotationInDegrees:flags:results:cancel:", a3, 0, a4, a5, a6);
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result;
  int inputWidth;
  int inputHeight;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = -50;
  if (a3 && a4 && a5)
  {
    *a3 = self->_inputWidth;
    *a4 = self->_inputHeight;
    *a5 = 1111970369;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (!result)
        return result;
      inputWidth = self->_inputWidth;
      inputHeight = self->_inputHeight;
      v9[0] = 67109376;
      v9[1] = inputWidth;
      v10 = 1024;
      v11 = inputHeight;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "preferredInputFormat:  width = %d,  height = %d", (uint8_t *)v9, 0xEu);
    }
    return 0;
  }
  return result;
}

- (NSArray)handObjects
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHandObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)optimizeForDistance
{
  return self->_optimizeForDistance;
}

- (void)setOptimizeForDistance:(BOOL)a3
{
  self->_optimizeForDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handObjects, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_handsKeypointsDetector, 0);
  objc_storeStrong((id *)&self->_handsDetector, 0);
  objc_storeStrong((id *)&self->_anstHandsDetector, 0);
}

@end
