@implementation VCPVideoStabilizer

+ (BOOL)saveStabilizationRecipe
{
  return 0;
}

- (VCPVideoStabilizer)init
{
  VCPVideoStabilizer *v2;
  VCPVideoStabilizer *v3;
  uint64_t v4;
  NSMutableArray *motionBlurVector;
  VCPVideoStabilizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPVideoStabilizer;
  v2 = -[VCPVideoStabilizer init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_cropFraction = 0.1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    motionBlurVector = v3->_motionBlurVector;
    v3->_motionBlurVector = (NSMutableArray *)v4;

    v3->_analysisConfidence = -1.0;
    v3->_validStabilization = 1;
    v3->_stabilizationFaild = 0;
    v6 = v3;
  }

  return v3;
}

- (int)convertAnalysisResult
{
  return -4;
}

+ (id)videoStabilizerforAnalysisType:(unint64_t)a3 withMetadata:(id)a4 sourceSize:(CGSize)a5 cropRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  int v12;
  id v13;
  uint64_t v14;
  VCPVideoGyroStabilizer *v15;
  __int128 v16;
  VCPVideoPixelStabilizer *v17;
  VCPVideoPixelStabilizer *v18;
  _OWORD v20[3];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.height;
  v11 = a5.width;
  v12 = a3;
  v13 = a4;
  v14 = objc_msgSend(v13, "count");
  if ((v12 & 0x10000000) != 0 && v14)
  {
    v15 = [VCPVideoGyroStabilizer alloc];
    v16 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v20[0] = *MEMORY[0x1E0CA2E40];
    v20[1] = v16;
    v20[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v17 = -[VCPVideoGyroStabilizer initWithMetadata:sourceSize:cropRect:stillImageMetadata:timeRange:](v15, "initWithMetadata:sourceSize:cropRect:stillImageMetadata:timeRange:", v13, 0, v20, v11, v10, x, y, width, height);
  }
  else
  {
    v17 = objc_alloc_init(VCPVideoPixelStabilizer);
  }
  v18 = v17;

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_analysisResultRef)
  {
    ICDestroyResult();
    self->_analysisResultRef = 0;
  }
  if (self->_correctionResultRef)
  {
    ICDestroyResult();
    self->_correctionResultRef = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)VCPVideoStabilizer;
  -[VCPVideoStabilizer dealloc](&v3, sel_dealloc);
}

- (int)finishAnalysisPass:(id *)a3
{
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  const __CFDictionary *v29;
  double x;
  double v31;
  double v32;
  double v33;
  double v34;
  double y;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat width;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double height;
  double v47;
  double v48;
  double v49;
  CFDictionaryRef v50;
  CFDictionaryRef v51;
  CFDictionaryRef v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSDictionary *v58;
  NSDictionary *v59;
  void *v60;
  void *correctionResultRef;
  int v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  NSDictionary *v67;
  NSDictionary *results;
  NSDictionary *v69;
  NSDictionary *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  NSDictionary *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  CGRect rect;
  int v82;
  _QWORD v83[3];
  _QWORD v84[3];
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  void *v102;
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[3];
  _QWORD v106[3];
  id v107;
  const __CFString *v108;
  void *v109;
  id v110;
  const __CFString *v111;
  _QWORD v112[3];
  CGSize v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;

  v112[1] = *MEMORY[0x1E0C80C00];
  if (!+[VCPVideoStabilizer saveStabilizationRecipe](VCPVideoStabilizer, "saveStabilizationRecipe", a3)
    && !self->_validStabilization)
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LOWORD(rect.origin.x) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "    Pixel Stabilization confidence doesn't pass the threshold", (uint8_t *)&rect, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_gyroStabilization);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setObject:forKeyedSubscript:", v63, CFSTR("gyroStabilization"));

    *(float *)&v64 = self->_analysisConfidence;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setObject:forKeyedSubscript:", v65, CFSTR("analysisConfidence"));

    v111 = CFSTR("VideoStabilizationResults");
    v108 = CFSTR("attributes");
    v109 = v80;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v110 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = v66;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, &v111, 1);
    v67 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    results = self->_results;
    self->_results = v67;

    goto LABEL_31;
  }
  ICGetResultConfidence();
  ICGetResultStats();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "objectForKeyedSubscript:", *MEMORY[0x1E0D3AA40]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D3AA70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v5 - 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D3AAA0]);

  if (-[VCPVideoStabilizer isPathConstraintsStabilization](self, "isPathConstraintsStabilization"))
  {
    -[VCPVideoStabilizer stillImageMetadata](self, "stillImageMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MetaStillImagePerspectiveTransformResults"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D3A9F0]);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MetaPresentationTimeResults"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D3A9F8]);

    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v107 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D3A9E8]);

    -[VCPVideoStabilizer sourceSize](self, "sourceSize");
    v114.size.width = v18;
    v114.size.height = v19;
    v114.origin.x = 0.0;
    v114.origin.y = 0.0;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v114);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D3AA10]);

    -[VCPVideoStabilizer cropRect](self, "cropRect");
    v21 = CGRectCreateDictionaryRepresentation(v115);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D3AA28]);

    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E6B72E78, *MEMORY[0x1E0D3A9E0]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D3AA88]);
    self->_cropFraction = 0.2;

  }
  if (self->_cropFraction >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D3AA68]);

  }
  if (-[NSMutableArray count](self->_motionBlurVector, "count"))
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_motionBlurVector, *MEMORY[0x1E0D3AAA8]);
  v82 = 0;
  v23 = (void *)ICCalcCinematicL1Corrections();
  self->_correctionResultRef = v23;
  if (v23)
    goto LABEL_10;
  if (!-[VCPVideoStabilizer isPathConstraintsStabilization](self, "isPathConstraintsStabilization"))
    goto LABEL_19;
  if (self->_correctionResultRef)
    goto LABEL_10;
  if (-[VCPVideoStabilizer isPathConstraintsStabilization](self, "isPathConstraintsStabilization"))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D3AA80]);
    v60 = (void *)ICCalcCinematicL1Corrections();
    self->_correctionResultRef = v60;
    if (v60)
      goto LABEL_10;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D3AA78]);
    correctionResultRef = (void *)ICCalcCinematicL1Corrections();
    self->_correctionResultRef = correctionResultRef;
  }
  else
  {
    correctionResultRef = self->_correctionResultRef;
  }
  if (!correctionResultRef)
  {
    if (-[VCPVideoStabilizer isPathConstraintsStabilization](self, "isPathConstraintsStabilization"))
      self->_stabilizationFaild = 1;
    v90 = CFSTR("PathConstraintsStabilizationResults");
    v87 = CFSTR("attributes");
    v85 = CFSTR("settlingEffectStatus");
    v83[0] = CFSTR("settlingEffectMissingMetadata");
    v83[1] = CFSTR("settlingEffectInvalidTimeRange");
    v84[0] = MEMORY[0x1E0C9AAA0];
    v84[1] = MEMORY[0x1E0C9AAA0];
    v83[2] = CFSTR("settlingEffectStabilizationFailure");
    v84[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v78;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v77;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
    v71 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v76 = self->_results;
    self->_results = v71;

LABEL_27:
    if (self->_analysisResultRef)
    {
      ICDestroyResult();
      self->_analysisResultRef = 0;
    }
    if (self->_correctionResultRef)
    {
      ICDestroyResult();
      v62 = 0;
      self->_correctionResultRef = 0;
      goto LABEL_32;
    }
LABEL_31:
    v62 = 0;
    goto LABEL_32;
  }
LABEL_10:
  ICGetResultHomographies();
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
LABEL_19:
    v62 = -18;
    goto LABEL_32;
  }
  v78 = (void *)v24;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_gyroStabilization);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("gyroStabilization"));

  *(float *)&v27 = self->_analysisConfidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("analysisConfidence"));

  +[VCPProtoMovieStabilizationRecipe resultFromLegacyDictionary:](VCPProtoMovieStabilizationRecipe, "resultFromLegacyDictionary:", v78);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "data");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v75, CFSTR("stabilizationRecipe"));
  if (v75)
  {
    objc_msgSend(v78, "objectForKeyedSubscript:", *MEMORY[0x1E0D3A9D0]);
    v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGRectMakeWithDictionaryRepresentation(v29, &rect);

    x = rect.origin.x;
    -[VCPVideoStabilizer cropRect](self, "cropRect");
    v32 = v31;
    -[VCPVideoStabilizer sourceSize](self, "sourceSize");
    v34 = v33;
    y = rect.origin.y;
    -[VCPVideoStabilizer cropRect](self, "cropRect");
    v37 = v36;
    -[VCPVideoStabilizer sourceSize](self, "sourceSize");
    v39 = v38;
    width = rect.size.width;
    -[VCPVideoStabilizer cropRect](self, "cropRect");
    v74 = v41;
    v72 = width;
    v73 = v39;
    v42 = v37;
    v43 = v34;
    -[VCPVideoStabilizer sourceSize](self, "sourceSize");
    v45 = v44;
    height = rect.size.height;
    -[VCPVideoStabilizer cropRect](self, "cropRect");
    v48 = v47;
    -[VCPVideoStabilizer sourceSize](self, "sourceSize");
    v116.origin.y = y * v42 / v73;
    v116.size.width = v72 * v74 / v45;
    v116.size.height = height * v48 / v49;
    v116.origin.x = x * v32 / v43;
    v50 = CGRectCreateDictionaryRepresentation(v116);
    objc_msgSend(v79, "setObject:forKeyedSubscript:", v50, CFSTR("StabilizationCrop"));

    -[VCPVideoStabilizer cropRect](self, "cropRect");
    v51 = CGRectCreateDictionaryRepresentation(v117);
    objc_msgSend(v79, "setObject:forKeyedSubscript:", v51, CFSTR("CleanApertureCrop"));

    -[VCPVideoStabilizer sourceSize](self, "sourceSize");
    v52 = CGSizeCreateDictionaryRepresentation(v113);
    objc_msgSend(v79, "setObject:forKeyedSubscript:", v52, CFSTR("SourceSize"));

    v105[0] = CFSTR("settlingEffectMissingMetadata");
    v105[1] = CFSTR("settlingEffectInvalidTimeRange");
    v106[0] = MEMORY[0x1E0C9AAA0];
    v106[1] = MEMORY[0x1E0C9AAA0];
    v105[2] = CFSTR("settlingEffectStabilizationFailure");
    v106[2] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setObject:forKeyedSubscript:", v53, CFSTR("settlingEffectStatus"));

    if (-[VCPVideoStabilizer isPathConstraintsStabilization](self, "isPathConstraintsStabilization"))
    {
      v103[0] = CFSTR("VideoStabilizationResults");
      v100 = CFSTR("attributes");
      v101 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v103[1] = CFSTR("PathConstraintsStabilizationResults");
      v104[0] = v55;
      v97 = CFSTR("attributes");
      v98 = v79;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = v56;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v104[1] = v57;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
      v58 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v59 = self->_results;
      self->_results = v58;

    }
    else
    {
      v95 = CFSTR("VideoStabilizationResults");
      v92 = CFSTR("attributes");
      v93 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v54;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v69 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v56 = self->_results;
      self->_results = v69;
    }

    goto LABEL_27;
  }

  v62 = -50;
LABEL_32:

  return v62;
}

- (NSDictionary)results
{
  return self->_results;
}

- (BOOL)stabilizationFaild
{
  return self->_stabilizationFaild;
}

- (void)analysisResultRef
{
  return self->_analysisResultRef;
}

- (void)setAnalysisResultRef:(void *)a3
{
  self->_analysisResultRef = a3;
}

- (void)correctionResultRef
{
  return self->_correctionResultRef;
}

- (void)setCorrectionResultRef:(void *)a3
{
  self->_correctionResultRef = a3;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (float)cropFraction
{
  return self->_cropFraction;
}

- (void)setCropFraction:(float)a3
{
  self->_cropFraction = a3;
}

- (NSMutableArray)motionBlurVector
{
  return self->_motionBlurVector;
}

- (void)setMotionBlurVector:(id)a3
{
  objc_storeStrong((id *)&self->_motionBlurVector, a3);
}

- (BOOL)gyroStabilization
{
  return self->_gyroStabilization;
}

- (void)setGyroStabilization:(BOOL)a3
{
  self->_gyroStabilization = a3;
}

- (float)analysisConfidence
{
  return self->_analysisConfidence;
}

- (void)setAnalysisConfidence:(float)a3
{
  self->_analysisConfidence = a3;
}

- (BOOL)validStabilization
{
  return self->_validStabilization;
}

- (void)setValidStabilization:(BOOL)a3
{
  self->_validStabilization = a3;
}

- (BOOL)isPathConstraintsStabilization
{
  return self->_isPathConstraintsStabilization;
}

- (void)setIsPathConstraintsStabilization:(BOOL)a3
{
  self->_isPathConstraintsStabilization = a3;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (CGSize)sourceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_sourceSize.width;
  height = self->_sourceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSourceSize:(CGSize)a3
{
  self->_sourceSize = a3;
}

- (NSArray)stillImageMetadata
{
  return self->_stillImageMetadata;
}

- (void)setStillImageMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_stillImageMetadata, a3);
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->var0.var3;
  v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.duration.timescale = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stillImageMetadata, 0);
  objc_storeStrong((id *)&self->_motionBlurVector, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
