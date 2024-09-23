@implementation VCPMovieHighlightAnalyzer

+ (float)getMinimumHighlightInSec
{
  return 2.5;
}

+ (BOOL)isHeuristicStickerScoreEnabled
{
  return 0;
}

- (VCPMovieHighlightAnalyzer)initWithAnalysisType:(unint64_t)a3 isLivePhoto:(BOOL)a4 photoOffset:(float)a5 hadFlash:(BOOL)a6 hadZoom:(BOOL)a7 settlingHadZoom:(BOOL)a8 isTimelapse:(BOOL)a9 preferredTimeRange:(id *)a10 asset:(id)a11
{
  __int16 v17;
  id v19;
  VCPMovieHighlightAnalyzer *v20;
  VCPMovieHighlightAnalyzer *v21;
  float v22;
  NSArray *junkResults;
  NSArray *qualityResults;
  NSArray *faceResults;
  NSArray *petsResults;
  NSArray *saliencyResults;
  NSArray *actionResults;
  NSArray *subtleMotionResults;
  NSArray *voiceResults;
  NSArray *featureResults;
  NSArray *keyFrameResults;
  NSArray *sceneResults;
  NSArray *humanActionResults;
  NSArray *humanPoseResults;
  NSArray *cameraMotionResults;
  NSArray *orientationResults;
  NSArray *mlHighlightScoreResults;
  NSArray *mlQualityResults;
  NSArray *audioQualityResults;
  void *v41;
  uint64_t v42;
  NSMutableArray *expressionSegments;
  uint64_t v44;
  NSMutableArray *internalResults;
  uint64_t v46;
  NSMutableArray *highlightResults;
  uint64_t v48;
  NSMutableArray *internalConstraintResults;
  void *v50;
  __int128 v51;
  __int128 v52;
  VCPColorNormalizationAnalyzer *v53;
  void *v54;
  uint64_t v55;
  void *epoch;
  void *v57;
  __int128 *v58;
  VCPMovieHighlightAnalyzer *v59;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  uint8_t buf[16];
  objc_super v66;

  v17 = a3;
  v19 = a11;
  v66.receiver = self;
  v66.super_class = (Class)VCPMovieHighlightAnalyzer;
  v20 = -[VCPMovieHighlightAnalyzer init](&v66, sel_init);
  v21 = v20;
  if (!v20)
  {
LABEL_12:
    v59 = 0;
    goto LABEL_15;
  }
  v20->_maxDurationInSeconds = 10.0;
  +[VCPMovieHighlightAnalyzer getMinimumHighlightInSec](VCPMovieHighlightAnalyzer, "getMinimumHighlightInSec");
  v21->_minDurationInSeconds = v22;
  if ((~v17 & 0x890) != 0 || (v17 & 0xC) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Not all needed analysis are available for video highlights.", buf, 2u);
    }
    goto LABEL_12;
  }
  junkResults = v21->_junkResults;
  v21->_junkResults = 0;

  qualityResults = v21->_qualityResults;
  v21->_qualityResults = 0;

  faceResults = v21->_faceResults;
  v21->_faceResults = 0;

  petsResults = v21->_petsResults;
  v21->_petsResults = 0;

  saliencyResults = v21->_saliencyResults;
  v21->_saliencyResults = 0;

  actionResults = v21->_actionResults;
  v21->_actionResults = 0;

  subtleMotionResults = v21->_subtleMotionResults;
  v21->_subtleMotionResults = 0;

  voiceResults = v21->_voiceResults;
  v21->_voiceResults = 0;

  featureResults = v21->_featureResults;
  v21->_featureResults = 0;

  keyFrameResults = v21->_keyFrameResults;
  v21->_keyFrameResults = 0;

  sceneResults = v21->_sceneResults;
  v21->_sceneResults = 0;

  humanActionResults = v21->_humanActionResults;
  v21->_humanActionResults = 0;

  humanPoseResults = v21->_humanPoseResults;
  v21->_humanPoseResults = 0;

  cameraMotionResults = v21->_cameraMotionResults;
  v21->_cameraMotionResults = 0;

  orientationResults = v21->_orientationResults;
  v21->_orientationResults = 0;

  mlHighlightScoreResults = v21->_mlHighlightScoreResults;
  v21->_mlHighlightScoreResults = 0;

  mlQualityResults = v21->_mlQualityResults;
  v21->_mlQualityResults = 0;

  audioQualityResults = v21->_audioQualityResults;
  v21->_audioQualityResults = 0;

  v21->_frameSize.width = 0.0;
  v21->_frameSize.height = 0.0;
  v21->_contextResults = (NSArray *)0x3F80000000000000;
  v41 = *(void **)&v21->_numberOfFrames;
  *(_QWORD *)&v21->_numberOfFrames = 0;

  v21->_animatedStickerGating = 0;
  *(_QWORD *)v21->_sumScores = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = objc_claimAutoreleasedReturnValue();
  expressionSegments = v21->_expressionSegments;
  v21->_expressionSegments = (NSMutableArray *)v42;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = objc_claimAutoreleasedReturnValue();
  internalResults = v21->_internalResults;
  v21->_internalResults = (NSMutableArray *)v44;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = objc_claimAutoreleasedReturnValue();
  highlightResults = v21->_highlightResults;
  v21->_highlightResults = (NSMutableArray *)v46;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = objc_claimAutoreleasedReturnValue();
  internalConstraintResults = v21->_internalConstraintResults;
  v21->_internalConstraintResults = (NSMutableArray *)v48;

  v50 = v21->_expressionSegments;
  if (v50)
  {
    v50 = v21->_internalResults;
    if (v50)
    {
      v50 = v21->_internalConstraintResults;
      if (v50)
      {
        LOBYTE(v21->_maxHighlightScore) = a4;
        v21->_minHighlightScore = a5;
        v21->_isLivePhoto = 0;
        *(&v21->_isLivePhoto + 1) = a6;
        *(&v21->_isLivePhoto + 2) = a7;
        *(&v21->_isLivePhoto + 3) = a8;
        LOBYTE(v21->_photoOffset) = a9;
        v51 = *(_OWORD *)&a10->var0.var0;
        v52 = *(_OWORD *)&a10->var1.var1;
        *(_OWORD *)&v21->_preferredTimeRange.start.timescale = *(_OWORD *)&a10->var0.var3;
        *(_OWORD *)&v21->_preferredTimeRange.duration.value = v52;
        *(_OWORD *)&v21->_verbose = v51;
        v53 = objc_alloc_init(VCPColorNormalizationAnalyzer);
        v54 = *(void **)&v21->_diffFlipCount.__elems_[4];
        *(_QWORD *)&v21->_diffFlipCount.__elems_[4] = v53;

        objc_msgSend(MEMORY[0x1E0C8AFC8], "assetImageGeneratorWithAsset:", v19);
        v55 = objc_claimAutoreleasedReturnValue();
        epoch = (void *)v21->_preferredTimeRange.duration.epoch;
        v21->_preferredTimeRange.duration.epoch = v55;

        v57 = (void *)v21->_preferredTimeRange.duration.epoch;
        if (v57)
        {
          objc_msgSend(v57, "setAppliesPreferredTrackTransform:", 1);
          objc_msgSend((id)v21->_preferredTimeRange.duration.epoch, "setMaximumSize:", (double)0x12BuLL, (double)0x12BuLL);
          v58 = (__int128 *)MEMORY[0x1E0CA2E68];
          v63 = *MEMORY[0x1E0CA2E68];
          v64 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          objc_msgSend((id)v21->_preferredTimeRange.duration.epoch, "setRequestedTimeToleranceAfter:", &v63);
          v61 = *v58;
          v62 = *((_QWORD *)v58 + 2);
          objc_msgSend((id)v21->_preferredTimeRange.duration.epoch, "setRequestedTimeToleranceBefore:", &v61);
          LODWORD(v21->_imageGenerator) = 0;
          *(_QWORD *)&v21->_diffFlipCount.__elems_[2] = 0;
          *(_OWORD *)&v21->_sumScores[2] = 0u;
          *(_OWORD *)&v21->_prevMotionParamDiff.__elems_[2] = 0u;
          *(_OWORD *)v21->_sumMotionParam.__elems_ = 0u;
          *(_OWORD *)&v21->_sumMotionParam.__elems_[4] = 0u;
          v50 = v21;
        }
        else
        {
          v50 = 0;
        }
      }
    }
  }
  v59 = v50;
LABEL_15:

  return v59;
}

- (VCPMovieHighlightAnalyzer)initWithPostProcessOptions:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;
  VCPMovieHighlightAnalyzer *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  VCPColorNormalizationAnalyzer *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  CMTimeRange v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  objc_super v52;

  v6 = a3;
  v7 = a4;
  v52.receiver = self;
  v52.super_class = (Class)VCPMovieHighlightAnalyzer;
  v8 = -[VCPMovieHighlightAnalyzer init](&v52, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightFullResult"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightFullResult"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8[270] = objc_msgSend(v10, "BOOLValue");

    }
    else
    {
      v8[270] = 1;
    }

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightContexts"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v8 + 34);
    *((_QWORD *)v8 + 34) = v12;

    v14 = objc_msgSend(*((id *)v8 + 34), "count");
    if (v7 && v14)
    {
      +[VCPPhotosAsset assetWithPHAsset:](VCPPhotosAsset, "assetWithPHAsset:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8[300] = objc_msgSend(v15, "isTimelapse");
      v16 = objc_msgSend(v15, "isLivePhoto");
      v8[288] = v16;
      if ((v16 & 1) == 0)
      {
        v17 = objc_alloc_init(VCPColorNormalizationAnalyzer);
        v18 = (void *)*((_QWORD *)v8 + 58);
        *((_QWORD *)v8 + 58) = v17;

        v19 = (void *)MEMORY[0x1E0C8AFC8];
        objc_msgSend(v15, "movie");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "assetImageGeneratorWithAsset:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)*((_QWORD *)v8 + 44);
        *((_QWORD *)v8 + 44) = v21;

        v23 = (void *)*((_QWORD *)v8 + 44);
        if (!v23)
        {

          v45 = 0;
LABEL_27:
          v11 = v45;
          goto LABEL_28;
        }
        objc_msgSend(v23, "setAppliesPreferredTrackTransform:", 1);
        objc_msgSend(*((id *)v8 + 44), "setMaximumSize:", (double)0x12BuLL, (double)0x12BuLL);
        v24 = (__int128 *)MEMORY[0x1E0CA2E68];
        v50 = *MEMORY[0x1E0CA2E68];
        v51 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        objc_msgSend(*((id *)v8 + 44), "setRequestedTimeToleranceAfter:", &v50);
        v48 = *v24;
        v49 = *((_QWORD *)v24 + 2);
        objc_msgSend(*((id *)v8 + 44), "setRequestedTimeToleranceBefore:", &v48);
      }

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightMaxDuration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v8[268] = 1;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightMaxDuration"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "floatValue");
      *((_DWORD *)v8 + 50) = v27;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightBestTrim"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightBestTrim"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v8[269] = objc_msgSend(v29, "BOOLValue");

      }
      else
      {
        v8[269] = 0;
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightIndex"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        *((_DWORD *)v8 + 54) = -1;
        goto LABEL_23;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightIndex"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v8 + 54) = objc_msgSend(v36, "intValue");
    }
    else
    {
      v8[268] = 0;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightTargetDuration"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "floatValue");
      *((_DWORD *)v8 + 52) = v31;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightTolerance"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      *((_DWORD *)v8 + 53) = v33;

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightIndex"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)v8 + 54) = objc_msgSend(v34, "intValue");

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightStartRange"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
        v38 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
        *(_OWORD *)&v47.start.value = *MEMORY[0x1E0CA2E40];
        *(_OWORD *)&v47.start.epoch = v38;
        *(_OWORD *)&v47.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
        v39 = *(_OWORD *)&v47.duration.timescale;
        *(_OWORD *)(v8 + 220) = *(_OWORD *)&v47.start.value;
        *(_OWORD *)(v8 + 236) = v38;
        *(_OWORD *)(v8 + 252) = v39;
        goto LABEL_23;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HighlightStartRange"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeRangeMakeFromDictionary(&v47, (CFDictionaryRef)v36);
      v37 = *(_OWORD *)&v47.start.epoch;
      *(_OWORD *)(v8 + 220) = *(_OWORD *)&v47.start.value;
      *(_OWORD *)(v8 + 236) = v37;
      *(_OWORD *)(v8 + 252) = *(_OWORD *)&v47.duration.timescale;
    }

LABEL_23:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v8 + 20);
    *((_QWORD *)v8 + 20) = v40;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)*((_QWORD *)v8 + 22);
    *((_QWORD *)v8 + 22) = v42;

    +[VCPMovieHighlightAnalyzer getMinimumHighlightInSec](VCPMovieHighlightAnalyzer, "getMinimumHighlightInSec");
    *((_DWORD *)v8 + 51) = v44;
    v45 = (void *)*((_QWORD *)v8 + 20);
    if (v45)
    {
      v45 = (void *)*((_QWORD *)v8 + 22);
      if (v45)
      {
        v8[296] = 0;
        v45 = v8;
      }
    }
    goto LABEL_27;
  }
  v11 = 0;
LABEL_28:

  return v11;
}

- (void)setMaxHighlightDuration:(float)a3
{
  self->_maxDurationInSeconds = a3;
}

- (int)prepareRequiredQualityResult:(id)a3 junkDetectionResult:(id)a4 descriptorResult:(id)a5 faceResult:(id)a6 petsResult:(id)a7 saliencyResult:(id)a8 actionResult:(id)a9 subtleMotionResult:(id)a10 voiceResult:(id)a11 keyFrameResult:(id)a12 sceneResults:(id)a13 humanActionResults:(id)a14 humanPoseResults:(id)a15 cameraMotionResults:(id)a16 orientationResults:(id)a17 mlHighlightScoreResults:(id)a18 mlQualityResults:(id)a19 frameSize:(CGSize)a20
{
  CGFloat height;
  CGFloat width;
  NSArray *v28;
  NSArray *v29;
  NSArray *v30;
  NSArray *v31;
  NSArray *v32;
  NSArray *v33;
  NSArray *v34;
  NSArray *v35;
  NSArray *qualityResults;
  NSArray *junkResults;
  NSArray *featureResults;
  NSArray *faceResults;
  NSArray *petsResults;
  NSArray *saliencyResults;
  NSArray *actionResults;
  NSArray *subtleMotionResults;
  NSArray *voiceResults;
  NSArray *v45;
  NSArray *keyFrameResults;
  NSArray *v47;
  NSArray *sceneResults;
  NSArray *v49;
  NSArray *humanActionResults;
  NSArray *v51;
  NSArray *humanPoseResults;
  NSArray *v53;
  NSArray *cameraMotionResults;
  NSArray *v55;
  NSArray *orientationResults;
  NSArray *v57;
  NSArray *mlHighlightScoreResults;
  NSArray *v59;
  NSArray *mlQualityResults;
  NSArray *v62;
  NSArray *v63;
  NSArray *v64;
  NSArray *v65;
  NSArray *v66;
  NSArray *v67;
  NSArray *v68;
  NSArray *v69;
  NSArray *v70;
  NSArray *v71;
  NSArray *v72;
  NSArray *v73;
  NSArray *v74;
  NSArray *v75;
  NSArray *v76;
  NSArray *v77;
  NSArray *v78;

  height = a20.height;
  width = a20.width;
  v28 = (NSArray *)a3;
  v29 = (NSArray *)a4;
  v30 = (NSArray *)a5;
  v31 = (NSArray *)a6;
  v32 = (NSArray *)a7;
  v33 = (NSArray *)a8;
  v68 = (NSArray *)a9;
  v63 = (NSArray *)a10;
  v62 = (NSArray *)a11;
  v65 = (NSArray *)a12;
  v66 = (NSArray *)a13;
  v67 = (NSArray *)a14;
  v34 = (NSArray *)a15;
  v35 = (NSArray *)a16;
  v71 = (NSArray *)a17;
  v72 = (NSArray *)a18;
  v73 = (NSArray *)a19;
  qualityResults = self->_qualityResults;
  self->_qualityResults = v28;
  v78 = v28;

  junkResults = self->_junkResults;
  self->_junkResults = v29;
  v77 = v29;

  featureResults = self->_featureResults;
  self->_featureResults = v30;
  v76 = v30;

  faceResults = self->_faceResults;
  self->_faceResults = v31;
  v75 = v31;

  petsResults = self->_petsResults;
  self->_petsResults = v32;
  v74 = v32;

  saliencyResults = self->_saliencyResults;
  self->_saliencyResults = v33;
  v70 = v33;

  actionResults = self->_actionResults;
  self->_actionResults = v68;
  v69 = v68;

  subtleMotionResults = self->_subtleMotionResults;
  self->_subtleMotionResults = v63;
  v64 = v63;

  voiceResults = self->_voiceResults;
  self->_voiceResults = v62;
  v45 = v62;

  keyFrameResults = self->_keyFrameResults;
  self->_keyFrameResults = v65;
  v47 = v65;

  sceneResults = self->_sceneResults;
  self->_sceneResults = v66;
  v49 = v66;

  humanActionResults = self->_humanActionResults;
  self->_humanActionResults = v67;
  v51 = v67;

  humanPoseResults = self->_humanPoseResults;
  self->_humanPoseResults = v34;
  v53 = v34;

  cameraMotionResults = self->_cameraMotionResults;
  self->_cameraMotionResults = v35;
  v55 = v35;

  orientationResults = self->_orientationResults;
  self->_orientationResults = v71;
  v57 = v71;

  mlHighlightScoreResults = self->_mlHighlightScoreResults;
  self->_mlHighlightScoreResults = v72;
  v59 = v72;

  mlQualityResults = self->_mlQualityResults;
  self->_mlQualityResults = v73;

  self->_frameSize.width = width;
  self->_frameSize.height = height;
  return 0;
}

- (int)generateHighlights
{
  int v3;
  unsigned int v4;
  float v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[VCPMovieHighlightAnalyzer computeHighlightScoreResults](self, "computeHighlightScoreResults");
  if (!v3)
  {
    v3 = -[VCPMovieHighlightAnalyzer postProcessMLHighlightScore](self, "postProcessMLHighlightScore");
    if (!v3)
    {
      v3 = -[VCPMovieHighlightAnalyzer combineMLHighlightScore](self, "combineMLHighlightScore");
      if (!v3)
      {
        self->_contextResults = (NSArray *)0x3E19999A3E4CCCCDLL;
        v4 = LOBYTE(self->_photoOffset)
           ? -[VCPMovieHighlightAnalyzer selectHighlightsForTimelapse](self, "selectHighlightsForTimelapse")
           : -[VCPMovieHighlightAnalyzer selectHighlights](self, "selectHighlights");
        v3 = v4;
        if (!v4)
        {
          v5 = *(float *)&self->_contextResults * 0.5;
          if (v5 >= *((float *)&self->_contextResults + 1))
            v5 = *((float *)&self->_contextResults + 1);
          *((float *)&self->_contextResults + 1) = fmaxf(v5, 0.15);
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          v6 = self->_highlightResults;
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          v8 = v7;
          if (v7)
          {
            v9 = *(_QWORD *)v15;
            while (2)
            {
              v10 = 0;
              do
              {
                if (*(_QWORD *)v15 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
                v12 = (void *)MEMORY[0x1BCCA1B2C](v7);
                v3 = -[VCPMovieHighlightAnalyzer evaluateSegment:](self, "evaluateSegment:", v11, (_QWORD)v14);
                objc_autoreleasePoolPop(v12);
                if (v3)
                {

                  return v3;
                }
                ++v10;
              }
              while (v8 != v10);
              v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
              v8 = v7;
              if (v7)
                continue;
              break;
            }
          }

          if (LOBYTE(self->_maxHighlightScore))
            return 0;
          v3 = -[VCPMovieHighlightAnalyzer computeColorNormalization](self, "computeColorNormalization");
          if (!v3)
            return 0;
        }
      }
    }
  }
  return v3;
}

- (BOOL)isGoodQuality:(id *)a3
{
  CMTime *v5;
  __int128 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  float v12;
  __int128 v13;
  BOOL v14;
  CMTime v16;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v19;
  CMTimeRange time1;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CMTimeRange range;
  CMTime v26;
  CMTime v27;
  CMTime time2;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  time1.start = (CMTime)a3->var1;
  v5 = (CMTime *)MEMORY[0x1E0CA2E68];
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (!CMTimeCompare(&time1.start, &time2))
    return 1;
  memset(&v26, 0, sizeof(v26));
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v26, &range);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_internalResults;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "score");
        if (v12 < 0.0)
        {
          if (v11)
            objc_msgSend(v11, "timerange");
          else
            memset(&time1, 0, sizeof(time1));
          time2 = time1.start;
          v27 = v26;
          if (CMTimeCompare(&time2, &v27) > 0)
            goto LABEL_24;
          memset(&time1, 0, sizeof(time1));
          if (v11)
            objc_msgSend(v11, "timerange");
          else
            memset(&v19, 0, sizeof(v19));
          v13 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&otherRange.start.epoch = v13;
          *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
          CMTimeRangeGetIntersection(&time1, &v19, &otherRange);
          if ((time1.start.flags & 1) == 0
            || (time1.duration.flags & 1) == 0
            || time1.duration.epoch
            || time1.duration.value < 0
            || (duration = time1.duration, v16 = *v5, CMTimeCompare(&duration, &v16)))
          {
            v14 = 0;
            goto LABEL_26;
          }
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      v14 = 1;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
LABEL_24:
    v14 = 1;
  }
LABEL_26:

  return v14;
}

- (id)postProcessMovieHighlight:(id)a3 frameSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  void *v7;
  NSArray *v8;
  NSArray *sceneResults;
  NSArray *v10;
  NSArray *qualityResults;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  VCPVideoKeyFrame *v16;
  void *v17;
  void *v18;
  float v19;
  uint64_t v20;
  NSArray *orientationResults;
  uint64_t v22;
  NSArray *featureResults;
  uint64_t v24;
  NSArray *faceResults;
  uint64_t v26;
  NSArray *petsResults;
  uint64_t v28;
  NSArray *saliencyResults;
  uint64_t v30;
  NSArray *humanPoseResults;
  uint64_t v32;
  NSArray *audioQualityResults;
  uint64_t v34;
  NSMutableArray *highlightResults;
  uint64_t v36;
  unint64_t targetHighlightIndex;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  NSMutableArray *v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  float v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  float v57;
  float v58;
  id v59;
  __int128 v60;
  __int128 v61;
  const __CFDictionary *v62;
  const __CFDictionary *v63;
  VCPMovieHighlightAnalyzer *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  float v68;
  uint64_t k;
  const __CFDictionary *v70;
  __int128 v71;
  void *v72;
  void *v73;
  float v74;
  float v75;
  NSMutableArray *internalConstraintResults;
  CFDictionaryRef v77;
  CFDictionaryRef v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t m;
  void *v82;
  CFDictionaryRef v83;
  CFDictionaryRef v84;
  void *v85;
  void *v86;
  void *v87;
  unint64_t v88;
  VCPMovieHighlightAnalyzer *v89;
  void *v90;
  void *v91;
  void *v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  void *v96;
  NSMutableArray *v97;
  unint64_t v99;
  const __CFDictionary *v100;
  void *v101;
  void *v102;
  void *v103;
  __int128 v104;
  void *v105;
  void *v106;
  NSMutableArray *v107;
  void *v108;
  void *v109;
  id v110;
  NSMutableArray *v111;
  VCPMovieHighlightAnalyzer *v112;
  id obj;
  id obja;
  id v115;
  CMTimeRange v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  CMTimeRange v121;
  _OWORD v122[3];
  CMTimeRange otherRange;
  CMTimeRange v124;
  CMTimeRange lhs;
  CMTime v126;
  CMTimeRange v127;
  CMTime v128;
  CMTimeRange v129;
  CMTimeRange v130;
  CMTime v131;
  CMTime time;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  CMTime end;
  CMTime start;
  CMTimeRange v139;
  CMTimeRange range;
  CMTime v141;
  CMTime v142;
  CMTimeRange v143[2];
  _OWORD v144[3];
  _OWORD v145[3];
  CMTimeRange v146;
  CMTimeRange v147;
  _OWORD v148[3];
  CMTime v149;
  CMTime v150;
  CMTimeRange v151;
  CMTimeRange v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  CMTimeEpoch epoch;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  CMTime rhs;
  CMTimeRange v164;
  _QWORD v165[2];
  _QWORD v166[2];
  _QWORD v167[3];
  _QWORD v168[3];
  _BYTE v169[128];
  const __CFString *v170;
  NSMutableArray *v171;
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  uint64_t v175;

  height = a4.height;
  width = a4.width;
  v175 = *MEMORY[0x1E0C80C00];
  v110 = a3;
  objc_msgSend(v110, "objectForKeyedSubscript:");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPMovieHighlightAnalyzer loadHighlightScoreResults:](self, "loadHighlightScoreResults:", v7);

  v112 = self;
  if (objc_msgSend(*(id *)&self->_isMaxTrim, "count"))
  {
    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("SceneResults"));
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sceneResults = self->_sceneResults;
    self->_sceneResults = v8;

    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("QualityResults"));
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    qualityResults = self->_qualityResults;
    self->_qualityResults = v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v115 = (id)objc_claimAutoreleasedReturnValue();
    v162 = 0u;
    v161 = 0u;
    v160 = 0u;
    v159 = 0u;
    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("KeyFrameResults"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v174, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v160;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v160 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
          v16 = objc_alloc_init(VCPVideoKeyFrame);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("attributes"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("timestamp"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            memset(&v164, 0, 24);
            objc_msgSend(v18, "floatValue");
            CMTimeMakeWithSeconds(&v164.start, v19, 600);
            v157 = *(_OWORD *)&v164.start.value;
            epoch = v164.start.epoch;
            -[VCPVideoKeyFrame loadKeyFrameResult:timestamp:](v16, "loadKeyFrameResult:timestamp:", v15, &v157);
            -[VCPVideoKeyFrame computeCurationScore](v16, "computeCurationScore");
            objc_msgSend(v115, "addObject:", v16);
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v174, 16);
      }
      while (v12);
    }

    objc_storeStrong((id *)&v112->_keyFrameResults, v115);
    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("OrientationResults"));
    v20 = objc_claimAutoreleasedReturnValue();
    orientationResults = v112->_orientationResults;
    v112->_orientationResults = (NSArray *)v20;

    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("FeatureVectorResults"));
    v22 = objc_claimAutoreleasedReturnValue();
    featureResults = v112->_featureResults;
    v112->_featureResults = (NSArray *)v22;

    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("FaceResults"));
    v24 = objc_claimAutoreleasedReturnValue();
    faceResults = v112->_faceResults;
    v112->_faceResults = (NSArray *)v24;

    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("PetsResults"));
    v26 = objc_claimAutoreleasedReturnValue();
    petsResults = v112->_petsResults;
    v112->_petsResults = (NSArray *)v26;

    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("SaliencyResults"));
    v28 = objc_claimAutoreleasedReturnValue();
    saliencyResults = v112->_saliencyResults;
    v112->_saliencyResults = (NSArray *)v28;

    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
    v30 = objc_claimAutoreleasedReturnValue();
    humanPoseResults = v112->_humanPoseResults;
    v112->_humanPoseResults = (NSArray *)v30;

    objc_msgSend(v110, "objectForKeyedSubscript:", CFSTR("AudioQualityResults"));
    v32 = objc_claimAutoreleasedReturnValue();
    audioQualityResults = v112->_audioQualityResults;
    v112->_audioQualityResults = (NSArray *)v32;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = objc_claimAutoreleasedReturnValue();
    highlightResults = v112->_highlightResults;
    v112->_highlightResults = (NSMutableArray *)v34;

    v112->_frameSize.width = width;
    v112->_frameSize.height = height;
    -[VCPMovieHighlightAnalyzer adjustHighlightScoreWithContext](v112, "adjustHighlightScoreWithContext");
    -[VCPMovieHighlightAnalyzer adjustHighlightWithContext:](v112, "adjustHighlightWithContext:", v109);
    v36 = objc_claimAutoreleasedReturnValue();

    v109 = (void *)v36;
    self = v112;
    if (!v36)
    {
      v109 = 0;
      goto LABEL_20;
    }
  }
  -[NSMutableArray removeAllObjects](self->_internalConstraintResults, "removeAllObjects");
  if (!-[NSMutableArray count](self->_internalResults, "count"))
  {
LABEL_20:
    v40 = 0;
    goto LABEL_83;
  }
  if (BYTE4(self->_startRange.duration.epoch))
  {
    targetHighlightIndex = self->_targetHighlightIndex;
    if ((targetHighlightIndex & 0x80000000) != 0)
    {
      v156 = 0u;
      v155 = 0u;
      v154 = 0u;
      v153 = 0u;
      v47 = v109;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
      if (v48)
      {
        v49 = 0;
        v50 = *(_QWORD *)v154;
        v51 = -1.0;
        do
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v154 != v50)
              objc_enumerationMutation(v47);
            v53 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * j);
            v54 = (void *)MEMORY[0x1BCCA1B2C]();
            -[VCPMovieHighlightAnalyzer maxTrimMovieHighlight:](v112, "maxTrimMovieHighlight:", v53);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v55)
            {
              if (BYTE6(v112->_startRange.duration.epoch))
              {
                -[NSMutableArray addObject:](v112->_internalConstraintResults, "addObject:", v55);
              }
              else
              {
                objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("quality"));
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "floatValue");
                v58 = v57;

                if (v51 < v58)
                {
                  v59 = v55;

                  v51 = v58;
                  v49 = v59;
                }
              }
            }

            objc_autoreleasePoolPop(v54);
          }
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
        }
        while (v48);

        if (v49)
          -[NSMutableArray addObject:](v112->_internalConstraintResults, "addObject:", v49);
      }
      else
      {

        v49 = 0;
      }

    }
    else
    {
      if (objc_msgSend(v109, "count") <= targetHighlightIndex)
        goto LABEL_62;
      objc_msgSend(v109, "objectAtIndexedSubscript:", self->_targetHighlightIndex);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPMovieHighlightAnalyzer maxTrimMovieHighlight:](self, "maxTrimMovieHighlight:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
        -[NSMutableArray addObject:](v112->_internalConstraintResults, "addObject:", v39);

    }
  }
  else if ((self->_startRange.start.timescale & 1) == 0
         || (self->_startRange.duration.timescale & 1) == 0
         || *(_QWORD *)&self->_startRange.duration.flags
         || *(int64_t *)((_BYTE *)&self->_startRange.start.epoch + 4) < 0)
  {
    v41 = self->_targetHighlightIndex;
    if ((v41 & 0x80000000) != 0)
    {
      v60 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)&v152.start.value = *MEMORY[0x1E0CA2E40];
      *(_OWORD *)&v152.start.epoch = v60;
      *(_OWORD *)&v152.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      v61 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
      *(_OWORD *)&v143[0].start.value = *MEMORY[0x1E0CA2E50];
      *(_OWORD *)&v143[0].start.epoch = v61;
      *(_OWORD *)&v143[0].duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
      objc_msgSend(v109, "objectAtIndexedSubscript:", 0);
      v62 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeRangeMakeFromDictionary(&v164, v62);
      v142 = v164.start;

      memset(&v141, 0, sizeof(v141));
      objc_msgSend(v109, "lastObject");
      v63 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeRangeMakeFromDictionary(&range, v63);
      CMTimeRangeGetEnd(&v141, &range);

      memset(&v139, 0, sizeof(v139));
      start = v142;
      end = v141;
      CMTimeRangeFromTimeToTime(&v139, &start, &end);
      v64 = v112;
      v135 = 0u;
      v136 = 0u;
      v133 = 0u;
      v134 = 0u;
      v65 = v109;
      v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v133, v172, 16);
      if (v66)
      {
        v67 = *(_QWORD *)v134;
        v68 = 0.0;
        do
        {
          for (k = 0; k != v66; ++k)
          {
            if (*(_QWORD *)v134 != v67)
              objc_enumerationMutation(v65);
            v70 = *(const __CFDictionary **)(*((_QWORD *)&v133 + 1) + 8 * k);
            memset(&v164, 0, sizeof(v164));
            CMTimeRangeMakeFromDictionary(&v164, v70);
            v130 = v143[0];
            CMTimeRangeGetEnd(&v131, &v130);
            *(_OWORD *)&lhs.start.value = *(_OWORD *)&v164.start.value;
            lhs.start.epoch = v164.start.epoch;
            rhs = v131;
            CMTimeSubtract(&time, &lhs.start, &rhs);
            if (CMTimeGetSeconds(&time) < 0.200000003
              && (v127 = v143[0],
                  CMTimeRangeGetEnd(&v128, &v127),
                  v126 = v164.start,
                  CMTimeRangeFromTimeToTime(&v129, &v128, &v126),
                  -[VCPMovieHighlightAnalyzer isGoodQuality:](v64, "isGoodQuality:", &v129)))
            {
              v124 = v143[0];
              otherRange = v164;
              CMTimeRangeGetUnion(&lhs, &v124, &otherRange);
              *(_OWORD *)&v143[0].start.value = *(_OWORD *)&lhs.start.value;
              *(_OWORD *)&v143[0].start.epoch = *(_OWORD *)&lhs.start.epoch;
              v71 = *(_OWORD *)&lhs.duration.timescale;
            }
            else
            {
              *(_OWORD *)&v143[0].start.value = *(_OWORD *)&v164.start.value;
              *(_OWORD *)&v143[0].start.epoch = *(_OWORD *)&v164.start.epoch;
              v71 = *(_OWORD *)&v164.duration.timescale;
            }
            *(_OWORD *)&v143[0].duration.timescale = v71;
            v122[0] = *(_OWORD *)&v143[0].start.value;
            v122[1] = *(_OWORD *)&v143[0].start.epoch;
            v122[2] = v71;
            v121 = v139;
            -[VCPMovieHighlightAnalyzer targetMovieHighlight:mergedRange:maxRange:](v64, "targetMovieHighlight:mergedRange:maxRange:", v70, v122, &v121);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = v72;
            if (v72)
            {
              objc_msgSend(v72, "score");
              if (v74 > v68)
              {
                objc_msgSend(v73, "timerange");
                v152 = lhs;
                objc_msgSend(v73, "score");
                v68 = v75;
              }
            }

            v64 = v112;
          }
          v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v133, v172, 16);
        }
        while (v66);
      }

      internalConstraintResults = v112->_internalConstraintResults;
      v164 = v152;
      v77 = CMTimeRangeCopyAsDictionary(&v164, 0);
      -[NSMutableArray addObject:](internalConstraintResults, "addObject:", v77);

    }
    else
    {
      if (objc_msgSend(v109, "count") <= v41)
        goto LABEL_62;
      objc_msgSend(v109, "objectAtIndexedSubscript:", self->_targetHighlightIndex);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
      v145[0] = *MEMORY[0x1E0CA2E50];
      v145[1] = v43;
      v145[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
      v44 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      v144[0] = *MEMORY[0x1E0CA2E40];
      v144[1] = v44;
      v144[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      -[VCPMovieHighlightAnalyzer targetMovieHighlight:mergedRange:maxRange:](self, "targetMovieHighlight:mergedRange:maxRange:", v42, v145, v144);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = v112->_internalConstraintResults;
      if (v45)
        objc_msgSend(v45, "timerange");
      else
        memset(&v143[1], 0, sizeof(CMTimeRange));
      v164 = v143[1];
      v78 = CMTimeRangeCopyAsDictionary(&v164, 0);
      -[NSMutableArray addObject:](v46, "addObject:", v78);

    }
  }
  else
  {
    v99 = self->_targetHighlightIndex;
    if ((v99 & 0x80000000) != 0 || objc_msgSend(v109, "count") <= v99)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v101;
      if (v101)
        objc_msgSend(v101, "timerange");
      else
        memset(&v152, 0, sizeof(v152));
      *(_OWORD *)&v143[0].start.value = *(_OWORD *)&v152.start.value;
      v143[0].start.epoch = v152.start.epoch;
      -[NSMutableArray lastObject](self->_internalResults, "lastObject");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      memset(&v139, 0, 24);
      if (v103)
        objc_msgSend(v103, "timerange");
      else
        memset(&v151, 0, sizeof(v151));
      CMTimeRangeGetEnd(&v139.start, &v151);
      v150 = v143[0].start;
      v149 = v139.start;
      CMTimeRangeFromTimeToTime(&v152, &v150, &v149);
      v164 = v152;

    }
    else
    {
      objc_msgSend(v109, "objectAtIndexedSubscript:", self->_targetHighlightIndex);
      v100 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeRangeMakeFromDictionary(&v152, v100);
      v164 = v152;

    }
    v104 = *(_OWORD *)&v112->_startRange.start.flags;
    v148[0] = *(_OWORD *)(&v112->_targetHighlightIndex + 1);
    v148[1] = v104;
    v148[2] = *(_OWORD *)((char *)&v112->_startRange.duration.value + 4);
    v147 = v164;
    -[VCPMovieHighlightAnalyzer targetProcessRange:maxRange:](v112, "targetProcessRange:maxRange:", v148, &v147);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v105;
    v107 = v112->_internalConstraintResults;
    if (v105)
      objc_msgSend(v105, "timerange");
    else
      memset(&v146, 0, sizeof(v146));
    CMTimeRangeToNSDictionary(&v146);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v107, "addObject:", v108);

  }
  self = v112;
LABEL_62:
  if (BYTE6(self->_startRange.duration.epoch))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v111 = self->_internalResults;
    v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v117, v169, 16);
    if (v79)
    {
      v80 = *(_QWORD *)v118;
      do
      {
        for (m = 0; m != v79; ++m)
        {
          if (*(_QWORD *)v118 != v80)
            objc_enumerationMutation(v111);
          v82 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * m);
          v167[0] = CFSTR("start");
          if (v82)
            objc_msgSend(v82, "timerange");
          else
            memset(&v164, 0, sizeof(v164));
          *(_OWORD *)&v152.start.value = *(_OWORD *)&v164.start.value;
          v152.start.epoch = v164.start.epoch;
          v83 = CMTimeCopyAsDictionary(&v152.start, 0);
          v168[0] = v83;
          v167[1] = CFSTR("duration");
          if (v82)
            objc_msgSend(v82, "timerange");
          else
            memset(&v152, 0, sizeof(v152));
          v143[0].start = v152.duration;
          v84 = CMTimeCopyAsDictionary(&v143[0].start, 0);
          v168[1] = v84;
          v167[2] = CFSTR("quality");
          v85 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v82, "score");
          objc_msgSend(v85, "numberWithFloat:");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v168[2] = v86;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v167, 3);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obja, "addObject:", v87);

        }
        v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v117, v169, 16);
      }
      while (v79);
    }

    v88 = 0;
    v89 = v112;
    while (v88 < -[NSMutableArray count](v89->_internalConstraintResults, "count"))
    {
      v90 = (void *)MEMORY[0x1BCCA1B2C]();
      -[NSMutableArray objectAtIndexedSubscript:](v112->_internalConstraintResults, "objectAtIndexedSubscript:", v88);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("quality"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v92 == 0;

      if (v93)
      {
        v94 = (void *)objc_msgSend(v91, "mutableCopy");
        v95 = (void *)MEMORY[0x1E0CB37E8];
        CMTimeRangeMakeFromDictionary(&v116, (CFDictionaryRef)v91);
        -[VCPMovieHighlightAnalyzer highlightScoreForTimeRange:average:](v112, "highlightScoreForTimeRange:average:", &v116, 0);
        objc_msgSend(v95, "numberWithFloat:");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setObject:forKeyedSubscript:", v96, CFSTR("quality"));

        -[NSMutableArray replaceObjectAtIndex:withObject:](v112->_internalConstraintResults, "replaceObjectAtIndex:withObject:", v88, v94);
      }

      objc_autoreleasePoolPop(v90);
      v89 = v112;
      ++v88;
    }
    v97 = v89->_internalConstraintResults;
    v165[0] = CFSTR("MovieHighlightResults");
    v165[1] = CFSTR("MovieHighlightScoreResults");
    v166[0] = v97;
    v166[1] = obja;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v165, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v170 = CFSTR("MovieHighlightResults");
    v171 = self->_internalConstraintResults;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_83:

  return v40;
}

- (id)targetMovieHighlight:(id)a3 mergedRange:(id *)a4 maxRange:(id *)a5
{
  const __CFDictionary *v8;
  float Seconds;
  float targetDurationInSeconds;
  VCPMovieHighlight *v11;
  CMTimeRange *v12;
  CMTimeRange *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  int32_t v18;
  _OWORD *p_var0;
  __int128 v20;
  __int128 v21;
  CMTimeRange v22;
  CMTimeRange v23;
  CMTimeRange v24;
  _OWORD v25[3];
  _OWORD v26[3];
  _OWORD v27[3];
  _OWORD v28[2];
  __int128 v29;
  CMTime var1;
  CMTime time;
  CMTimeRange v32;
  CMTime time2;
  CMTime time1;

  v8 = (const __CFDictionary *)a3;
  memset(&v32, 0, sizeof(v32));
  CMTimeRangeMakeFromDictionary(&v32, v8);
  time = v32.duration;
  Seconds = CMTimeGetSeconds(&time);
  targetDurationInSeconds = self->_targetDurationInSeconds;
  if ((float)(targetDurationInSeconds - self->_toleranceInSeconds) <= Seconds)
  {
    if (targetDurationInSeconds >= Seconds)
    {
      v11 = objc_alloc_init(VCPMovieHighlight);
      v24 = v32;
      -[VCPMovieHighlight setTimerange:](v11, "setTimerange:", &v24);
      -[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("quality"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      -[VCPMovieHighlight setScore:](v11, "setScore:");

      goto LABEL_14;
    }
    v23 = v32;
    v22 = v32;
    v12 = &v22;
    v13 = &v23;
    goto LABEL_11;
  }
  if ((a4->var0.var2 & 1) != 0
    && (a4->var1.var2 & 1) != 0
    && !a4->var1.var3
    && (a4->var1.var0 & 0x8000000000000000) == 0)
  {
    var1 = (CMTime)a4->var1;
    if (CMTimeGetSeconds(&var1) >= (float)(self->_targetDurationInSeconds - self->_toleranceInSeconds))
    {
      v17 = *(_OWORD *)&a4->var0.var3;
      v28[0] = *(_OWORD *)&a4->var0.var0;
      v28[1] = v17;
      v29 = *(_OWORD *)&a4->var1.var1;
      v27[0] = v28[0];
      v27[1] = v17;
      v27[2] = v29;
      v12 = (CMTimeRange *)v27;
      v13 = (CMTimeRange *)v28;
LABEL_11:
      -[VCPMovieHighlightAnalyzer targetTrimRange:searchRange:](self, "targetTrimRange:searchRange:", v13, v12, *(_OWORD *)&v22.start.value, *(_OWORD *)&v22.start.epoch, *(_OWORD *)&v22.duration.timescale, *(_OWORD *)&v23.start.value, *(_OWORD *)&v23.start.epoch, *(_OWORD *)&v23.duration.timescale);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v11 = (VCPMovieHighlight *)v14;
      goto LABEL_14;
    }
  }
  if ((a5->var0.var2 & 1) != 0
    && (a5->var1.var2 & 1) != 0
    && !a5->var1.var3
    && (a5->var1.var0 & 0x8000000000000000) == 0)
  {
    time1 = v32.duration;
    time2 = (CMTime)a4->var1;
    v18 = CMTimeCompare(&time1, &time2);
    p_var0 = &v32;
    if (v18 <= 0)
      p_var0 = &a4->var0.var0;
    v20 = p_var0[1];
    v26[0] = *p_var0;
    v26[1] = v20;
    v26[2] = p_var0[2];
    v21 = *(_OWORD *)&a5->var0.var3;
    v25[0] = *(_OWORD *)&a5->var0.var0;
    v25[1] = v21;
    v25[2] = *(_OWORD *)&a5->var1.var1;
    -[VCPMovieHighlightAnalyzer targetExtendRange:maxRange:](self, "targetExtendRange:maxRange:", v26, v25);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (id)targetProcessRange:(id *)a3 maxRange:(id *)a4
{
  __int128 v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  VCPMovieHighlight *v12;
  __int128 v13;
  _OWORD v14[3];
  _OWORD v15[3];
  _OWORD v16[3];
  CMTime var1;
  _OWORD v18[3];
  _OWORD v19[2];
  __int128 v20;
  CMTime time;

  time = (CMTime)a3->var1;
  if (CMTimeGetSeconds(&time) > (float)(self->_targetDurationInSeconds + self->_toleranceInSeconds))
  {
    v7 = *(_OWORD *)&a3->var0.var3;
    v19[0] = *(_OWORD *)&a3->var0.var0;
    v19[1] = v7;
    v20 = *(_OWORD *)&a3->var1.var1;
    v18[0] = v19[0];
    v18[1] = v7;
    v18[2] = v20;
    -[VCPMovieHighlightAnalyzer targetTrimRange:searchRange:](self, "targetTrimRange:searchRange:", v19, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  var1 = (CMTime)a3->var1;
  if (CMTimeGetSeconds(&var1) < (float)(self->_targetDurationInSeconds - self->_toleranceInSeconds))
  {
    v9 = *(_OWORD *)&a3->var0.var3;
    v16[0] = *(_OWORD *)&a3->var0.var0;
    v16[1] = v9;
    v16[2] = *(_OWORD *)&a3->var1.var1;
    v10 = *(_OWORD *)&a4->var0.var3;
    v15[0] = *(_OWORD *)&a4->var0.var0;
    v15[1] = v10;
    v15[2] = *(_OWORD *)&a4->var1.var1;
    -[VCPMovieHighlightAnalyzer targetExtendRange:maxRange:](self, "targetExtendRange:maxRange:", v16, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  v12 = objc_alloc_init(VCPMovieHighlight);
  v13 = *(_OWORD *)&a3->var0.var3;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlight setTimerange:](v12, "setTimerange:", v14);
  return v12;
}

- (id)targetExtendRange:(id *)a3 maxRange:(id *)a4
{
  __int128 v7;
  __int128 v8;
  CMTimeRange v10;
  CMTimeRange v11;
  CMTimeRange v12;
  _OWORD v13[2];
  __int128 v14;
  CMTimeRange range;
  CMTime v16;
  CMTime end;
  CMTime start;
  CMTimeRange lhs;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime rhs;

  memset(&v21, 0, sizeof(v21));
  CMTimeMake(&v22, (uint64_t)(float)((float)(self->_targetDurationInSeconds - self->_toleranceInSeconds) * 600.0), 600);
  lhs.start = v22;
  rhs = (CMTime)a3->var1;
  CMTimeSubtract(&v21, &lhs.start, &rhs);
  memset(&v20, 0, sizeof(v20));
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
  lhs.start.epoch = a3->var0.var3;
  rhs = v21;
  if (CMTimeCompare(&lhs.start, &rhs) < 1)
  {
    v20 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  }
  else
  {
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
    lhs.start.epoch = a3->var0.var3;
    rhs = v21;
    CMTimeSubtract(&v20, &lhs.start, &rhs);
  }
  memset(&lhs, 0, sizeof(lhs));
  start = v20;
  v7 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v16, &range);
  rhs = v16;
  v22 = v21;
  CMTimeAdd(&end, &rhs, &v22);
  CMTimeRangeFromTimeToTime(&lhs, &start, &end);
  v8 = *(_OWORD *)&a4->var0.var3;
  v13[0] = *(_OWORD *)&a4->var0.var0;
  v13[1] = v8;
  v14 = *(_OWORD *)&a4->var1.var1;
  v11 = lhs;
  *(_OWORD *)&v10.start.epoch = v8;
  *(_OWORD *)&v10.duration.timescale = v14;
  *(_OWORD *)&v10.start.value = v13[0];
  CMTimeRangeGetIntersection(&v12, &v11, &v10);
  -[VCPMovieHighlightAnalyzer targetTrimRange:searchRange:](self, "targetTrimRange:searchRange:", v13, &v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)targetTrimRange:(id *)a3 searchRange:(id *)a4
{
  __int128 v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  float targetDurationInSeconds;
  float toleranceInSeconds;
  float v18;
  float v19;
  float v20;
  float v21;
  __int128 v22;
  float Seconds;
  float v24;
  float v25;
  float v26;
  float v27;
  __int128 v28;
  float v29;
  id v30;
  CMTimeRange v32;
  CMTime end;
  CMTime start;
  CMTimeRange v35;
  CMTimeRange v36;
  CMTime v37;
  CMTimeRange v38;
  CMTimeRange v39;
  CMTime v40;
  CMTime v41;
  CMTime v42;
  CMTimeRange otherRange;
  CMTimeRange v44;
  CMTime duration;
  CMTimeRange v46;
  CMTime v47;
  CMTimeRange v48;
  CMTime time;
  CMTimeRange v50;
  CMTimeRange range;
  CMTime v52;
  CMTimeRange v53;
  CMTime v54;
  _OWORD v55[3];
  CMTime rhs;
  CMTime lhs;

  v6 = *(_OWORD *)&a4->var0.var3;
  v55[0] = *(_OWORD *)&a4->var0.var0;
  v55[1] = v6;
  v55[2] = *(_OWORD *)&a4->var1.var1;
  -[VCPMovieHighlightAnalyzer findBestHighlightSegment:targetTrim:](self, "findBestHighlightSegment:targetTrim:", v55, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "timerange");
    v54 = v53.start;
    memset(&v52, 0, sizeof(v52));
    objc_msgSend(v8, "timerange");
  }
  else
  {
    memset(&v54, 0, sizeof(v54));
    memset(&v52, 0, sizeof(v52));
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v52, &range);
  v9 = 0;
  v10 = 0;
  v11 = -1;
  while (1)
  {
    if (-[NSMutableArray count](self->_internalResults, "count") <= v9)
    {
      v15 = 0;
      goto LABEL_26;
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v11 & 0x80000000) == 0)
    {
      if (!v12)
        goto LABEL_18;
      goto LABEL_8;
    }
    if (v12)
    {
      objc_msgSend(v12, "timerange");
      if (v8)
        goto LABEL_12;
    }
    else
    {
      memset(&v50, 0, sizeof(v50));
      if (v8)
      {
LABEL_12:
        objc_msgSend(v8, "timerange");
        goto LABEL_15;
      }
    }
    memset(&v53, 0, sizeof(v53));
LABEL_15:
    time = v53.start;
    if (!CMTimeRangeContainsTime(&v50, &time))
      goto LABEL_21;
    -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v9);
    v14 = objc_claimAutoreleasedReturnValue();

    if ((v9 & 0x80000000) == 0)
      break;
    v11 = v9;
LABEL_22:

    ++v9;
    v10 = (void *)v14;
  }
  v10 = (void *)v14;
  v11 = v9;
  if (!v13)
  {
LABEL_18:
    memset(&v48, 0, sizeof(v48));
    if (!v8)
      goto LABEL_19;
LABEL_9:
    objc_msgSend(v8, "timerange");
    goto LABEL_20;
  }
LABEL_8:
  objc_msgSend(v13, "timerange");
  if (v8)
    goto LABEL_9;
LABEL_19:
  memset(&v46, 0, sizeof(v46));
LABEL_20:
  CMTimeRangeGetEnd(&v47, &v46);
  if (!CMTimeRangeContainsTime(&v48, &v47))
  {
LABEL_21:
    v14 = (uint64_t)v10;
    goto LABEL_22;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
  targetDurationInSeconds = self->_targetDurationInSeconds;
  toleranceInSeconds = self->_toleranceInSeconds;
  if (v8)
    objc_msgSend(v8, "timerange");
  else
    memset(&v53, 0, sizeof(v53));
  duration = v53.duration;
  v18 = (float)(targetDurationInSeconds + toleranceInSeconds) - CMTimeGetSeconds(&duration);
  if (v10)
  {
    objc_msgSend(v10, "score");
    v20 = v19;
    objc_msgSend(v8, "averageScore");
    if (v20 >= v21 && v18 > 0.0)
    {
      memset(&v53, 0, sizeof(v53));
      v22 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v44.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v44.start.epoch = v22;
      *(_OWORD *)&v44.duration.timescale = *(_OWORD *)&a3->var1.var1;
      objc_msgSend(v10, "timerange");
      CMTimeRangeGetIntersection(&v53, &v44, &otherRange);
      lhs = v54;
      rhs = v53.start;
      CMTimeSubtract(&v42, &lhs, &rhs);
      Seconds = CMTimeGetSeconds(&v42);
      if (v18 >= Seconds)
        v24 = Seconds;
      else
        v24 = v18;
      CMTimeMake(&v40, (uint64_t)(float)(v24 * 600.0), 600);
      lhs = v54;
      rhs = v40;
      CMTimeSubtract(&v41, &lhs, &rhs);
      v54 = v41;
      v18 = v18 - v24;
    }
  }
  if (v15)
  {
    objc_msgSend(v15, "score");
    v26 = v25;
    objc_msgSend(v8, "averageScore");
    if (v26 >= v27 && v18 > 0.0)
    {
      memset(&v53, 0, sizeof(v53));
      v28 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v39.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v39.start.epoch = v28;
      *(_OWORD *)&v39.duration.timescale = *(_OWORD *)&a3->var1.var1;
      objc_msgSend(v15, "timerange");
      CMTimeRangeGetIntersection(&v53, &v39, &v38);
      v36 = v53;
      CMTimeRangeGetEnd(&v41, &v36);
      lhs = v41;
      rhs = v52;
      CMTimeSubtract(&v37, &lhs, &rhs);
      v29 = CMTimeGetSeconds(&v37);
      if (v18 < v29)
        v29 = v18;
      CMTimeMake(&v40, (uint64_t)(float)(v29 * 600.0), 600);
      lhs = v52;
      rhs = v40;
      CMTimeAdd(&v41, &lhs, &rhs);
      v52 = v41;
    }
  }
  start = v54;
  end = v52;
  CMTimeRangeFromTimeToTime(&v35, &start, &end);
  v32 = v35;
  objc_msgSend(v8, "setTimerange:", &v32);
  v30 = v8;

  return v30;
}

- (id)maxTrimMovieHighlight:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTimeValue v9;
  CMTimeScale v10;
  CMTimeFlags v11;
  CMTimeEpoch v12;
  void *v13;
  void *v14;
  CFDictionaryRef v15;
  CFDictionaryRef v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CFDictionaryRef v27;
  CFDictionaryRef v28;
  void *v29;
  CMTime v30;
  CMTimeRange v31;
  CMTime duration;
  CMTimeValue v33;
  CMTimeScale v34;
  CMTimeFlags v35;
  CMTimeEpoch v36;
  CMTimeValue v37;
  CMTimeScale v38;
  CMTimeFlags v39;
  uint64_t v40;
  CMTime v41;
  CMTimeRange v42;
  CMTime v43;
  CMTime v44;
  CMTime time;
  CMTimeRange v46;
  CMTime v47;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  memset(&v46, 0, sizeof(v46));
  CMTimeRangeMakeFromDictionary(&v46, (CFDictionaryRef)v4);
  time = v46.duration;
  if (CMTimeGetSeconds(&time) >= self->_minDurationInSeconds)
  {
    value = *MEMORY[0x1E0CA2E40];
    timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
    if (BYTE5(self->_startRange.duration.epoch))
    {
      v42 = v46;
      -[VCPMovieHighlightAnalyzer findBestTrim:](self, "findBestTrim:", &v42);
      value = v43.value;
      flags = v43.flags;
      timescale = v43.timescale;
      epoch = v43.epoch;
      v9 = v44.value;
      v10 = v44.timescale;
      v11 = v44.flags;
      v12 = v44.epoch;
      if ((v43.flags & 1) == 0)
        goto LABEL_11;
    }
    else
    {
      flags = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 12);
      epoch = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 16);
      v9 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 24);
      v10 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 32);
      v11 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 36);
      v12 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 40);
      if ((flags & 1) == 0)
        goto LABEL_11;
    }
    if ((v11 & 1) != 0 && !v12 && (v9 & 0x8000000000000000) == 0)
    {
      v41.value = v9;
      v41.timescale = v10;
      v41.flags = v11;
      v41.epoch = 0;
      if (CMTimeGetSeconds(&v41) <= self->_maxDurationInSeconds)
      {
        v43.value = value;
        v43.timescale = timescale;
        v43.flags = flags;
        v43.epoch = epoch;
        v27 = CMTimeCopyAsDictionary(&v43, 0);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("start"));

        v43.value = v9;
        v43.timescale = v10;
        v43.flags = v11;
        v43.epoch = 0;
        v28 = CMTimeCopyAsDictionary(&v43, 0);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("duration"));

        v29 = (void *)MEMORY[0x1E0CB37E8];
        v33 = value;
        v34 = timescale;
        v35 = flags;
        v36 = epoch;
        v37 = v9;
        v38 = v10;
        v39 = v11;
        v40 = 0;
        -[VCPMovieHighlightAnalyzer highlightScoreForTimeRange:average:](self, "highlightScoreForTimeRange:average:", &v33, 0);
        objc_msgSend(v29, "numberWithFloat:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("quality"));
        goto LABEL_17;
      }
    }
LABEL_11:
    duration = v46.duration;
    if (CMTimeGetSeconds(&duration) <= self->_maxDurationInSeconds && !BYTE5(self->_startRange.duration.epoch))
    {
LABEL_21:
      v6 = v5;
      goto LABEL_22;
    }
    v31 = v46;
    -[VCPMovieHighlightAnalyzer findBestHighlightSegment:targetTrim:](self, "findBestHighlightSegment:targetTrim:", &v31, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "timerange");
      v47 = v43;
      v15 = CMTimeCopyAsDictionary(&v47, 0);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("start"));

      objc_msgSend(v14, "timerange");
      v47 = v44;
      v16 = CMTimeCopyAsDictionary(&v47, 0);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("duration"));

      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v14, "score");
      objc_msgSend(v17, "numberWithFloat:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("quality"));
    }
    else
    {
      CMTimeMake(&v30, (uint64_t)(float)(self->_maxDurationInSeconds * 600.0), 600);
      v43 = v30;
      v18 = CMTimeCopyAsDictionary(&v43, 0);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("duration"));
    }

LABEL_17:
    if (BYTE5(self->_startRange.duration.epoch))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20 == 0;

        if (!v21)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "mutableCopy");

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("maxHighlightStart"));

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("maxHighlightDuration"));

          objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("attributes"));
        }
      }
    }
    goto LABEL_21;
  }
  v6 = 0;
LABEL_22:

  return v6;
}

- (void)loadHighlightScoreResults:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  VCPMovieHighlight *v10;
  VCPMovieHighlight *v11;
  double v12;
  CMTimeRange v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableArray removeAllObjects](self->_internalResults, "removeAllObjects");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(const __CFDictionary **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [VCPMovieHighlight alloc];
        CMTimeRangeMakeFromDictionary(&v13, v9);
        v11 = -[VCPMovieHighlight initWithTimeRange:](v10, "initWithTimeRange:", &v13);
        -[__CFDictionary vcp_quality](v9, "vcp_quality");
        *(float *)&v12 = v12;
        -[VCPMovieHighlight setScore:](v11, "setScore:", v12);
        -[NSMutableArray addObject:](self->_internalResults, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (id)getHighlightAttributes:(id)a3 withHighlightResults:(id)a4
{
  id v6;
  int maxHighlightScore_low;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  CFDictionaryRef v15;
  double v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  __int128 v23;
  id v24;
  uint64_t v25;
  const __CFDictionary *v26;
  uint64_t v27;
  uint64_t i;
  const __CFDictionary *v29;
  const __CFDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v39;
  id v40;
  id v41;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v44;
  CMTimeRange time;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CMTime duration;
  _OWORD v51[3];
  CMTime time2;
  CMTime time1;
  _BYTE v54[128];
  uint64_t v55;
  NSRect v56;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v40 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  maxHighlightScore_low = LOBYTE(self->_maxHighlightScore);
  objc_msgSend(v6, "bestPlaybackCrop");
  NSStringFromRect(v56);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v8, CFSTR("bestPlaybackCrop"));

  objc_msgSend(v6, "keyFrame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    memset(&v44, 0, 24);
    objc_msgSend(v6, "keyFrame");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "timestamp");
    else
      memset(&v44, 0, 24);

    objc_msgSend(v6, "keyFrame");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "score");
    v14 = v13;

    *(_OWORD *)&time.start.value = *(_OWORD *)&v44.start.value;
    time.start.epoch = v44.start.epoch;
    v15 = CMTimeCopyAsDictionary(&time.start, 0);
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v15, CFSTR("keyFrameTime"));

    LODWORD(v16) = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v17, CFSTR("keyFrameScore"));

  }
  v18 = maxHighlightScore_low == 0;
  if (LOBYTE(self->_maxHighlightScore))
  {
    v19 = maxHighlightScore_low == 0;
    goto LABEL_16;
  }
  objc_msgSend(v6, "colorNormalization");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = maxHighlightScore_low == 0;
  if (!v20)
  {
    objc_msgSend(v41, "setObject:forKeyedSubscript:", 0, CFSTR("colorNormalizationData"));
    v21 = 0;
    if (v6)
      goto LABEL_10;
LABEL_12:
    v19 = v21;
    memset(v51, 0, sizeof(v51));
    goto LABEL_13;
  }
  if (!v6)
    goto LABEL_12;
LABEL_10:
  v19 = v21;
  objc_msgSend(v6, "timerange");
LABEL_13:
  -[VCPMovieHighlightAnalyzer audioQualityScore:](self, "audioQualityScore:", v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v41, "setObject:forKeyedSubscript:", v22, CFSTR("audioQuality"));
    v18 = 0;
  }

LABEL_16:
  if (v18 || !v9 || v19)
  {
    v23 = *MEMORY[0x1E0CA2E68];
    duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    *(_OWORD *)&duration.value = v23;
    v24 = v40;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v25)
    {
      v39 = v19;
      v26 = 0;
      v27 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v47 != v27)
            objc_enumerationMutation(v24);
          v29 = *(const __CFDictionary **)(*((_QWORD *)&v46 + 1) + 8 * i);
          memset(&time, 0, sizeof(time));
          CMTimeRangeMakeFromDictionary(&time, v29);
          memset(&v44, 0, sizeof(v44));
          if (v6)
            objc_msgSend(v6, "timerange");
          else
            memset(&range, 0, sizeof(range));
          otherRange = time;
          CMTimeRangeGetIntersection(&v44, &range, &otherRange);
          time1 = v44.duration;
          time2 = duration;
          if (CMTimeCompare(&time1, &time2) >= 1)
          {
            duration = v44.duration;
            v30 = v29;

            v26 = v30;
          }
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v25);

      if (!v26)
        goto LABEL_40;
      if (!v9)
      {
        -[__CFDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("attributes"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("keyFrameTime"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v32, CFSTR("keyFrameTime"));

        -[__CFDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("attributes"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("keyFrameScore"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v34, CFSTR("keyFrameScore"));

      }
      if (v39)
      {
        -[__CFDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("attributes"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("colorNormalizationData"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v36, CFSTR("colorNormalizationData"));

      }
      if (!v18)
        goto LABEL_40;
      -[__CFDictionary objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("attributes"));
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("audioQuality"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v37, CFSTR("audioQuality"));

    }
    else
    {
      v26 = 0;
    }

LABEL_40:
  }

  return v41;
}

- (id)audioQualityScore:(id *)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  CMTime *v10;
  float v11;
  uint64_t i;
  const __CFDictionary *v13;
  void *v14;
  float v15;
  float v16;
  __int128 v17;
  float Seconds;
  double v19;
  CMTime duration;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v26;
  CMTimeRange v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = -[NSArray count](self->_audioQualityResults, "count");
  if (!v5)
    return v5;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_audioQualityResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v7)
  {

LABEL_20:
    v5 = 0;
    return v5;
  }
  v8 = *(_QWORD *)v29;
  v9 = 0.0;
  v10 = (CMTime *)MEMORY[0x1E0CA2E68];
  v11 = 0.0;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v29 != v8)
        objc_enumerationMutation(v6);
      v13 = *(const __CFDictionary **)(*((_QWORD *)&v28 + 1) + 8 * i);
      memset(&v27, 0, sizeof(v27));
      CMTimeRangeMakeFromDictionary(&v27, v13);
      -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("quality"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v16 = v15;

      range = v27;
      memset(&v26, 0, sizeof(v26));
      v17 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v17;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&v26, &range, &otherRange);
      if ((v26.start.flags & 1) != 0
        && (v26.duration.flags & 1) != 0
        && !v26.duration.epoch
        && (v26.duration.value & 0x8000000000000000) == 0)
      {
        time1 = v26.duration;
        time2 = *v10;
        if (!CMTimeCompare(&time1, &time2))
          continue;
      }
      duration = v26.duration;
      Seconds = CMTimeGetSeconds(&duration);
      v9 = v9 + (float)(v16 * Seconds);
      v11 = v11 + Seconds;
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  }
  while (v7);

  LODWORD(v19) = 1.0;
  if (v11 < 1.0)
    goto LABEL_20;
  if ((float)(v9 / v11) < 0.8)
    *(float *)&v19 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)adjustHighlightWithContext:(id)a3
{
  int v4;
  id v5;
  void *v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  CMTimeValue value;
  CMTimeFlags flags;
  CMTimeScale timescale;
  CMTimeEpoch epoch;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  const __CFDictionary *v25;
  int v26;
  int v27;
  void *v28;
  CFDictionaryRef v29;
  CFDictionaryRef v30;
  double v31;
  void *v32;
  void *v33;
  NSMutableArray *obj;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  VCPMovieHighlightAnalyzer *v40;
  uint64_t v41;
  CMTime v42;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v46;
  CMTimeRange buf;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CMTime time2;
  _QWORD v61[4];
  _QWORD v62[4];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  self->_contextResults = (NSArray *)0x3E19999A3E4CCCCDLL;
  if (-[NSArray count](self->_sceneResults, "count") && -[NSArray count](self->_qualityResults, "count"))
  {
    if (LOBYTE(self->_photoOffset))
      v4 = -[VCPMovieHighlightAnalyzer selectHighlightsForTimelapse](self, "selectHighlightsForTimelapse");
    else
      v4 = -[VCPMovieHighlightAnalyzer selectHighlights](self, "selectHighlights");
    if (v4)
      goto LABEL_11;
    v7 = *(float *)&self->_contextResults * 0.5;
    if (v7 >= *((float *)&self->_contextResults + 1))
      v7 = *((float *)&self->_contextResults + 1);
    *((float *)&self->_contextResults + 1) = fmaxf(v7, 0.0);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = self->_highlightResults;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v57 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1BCCA1B2C]();
          LODWORD(v11) = -[VCPMovieHighlightAnalyzer evaluateSegment:](self, "evaluateSegment:", v11);
          objc_autoreleasePoolPop(v12);
          if ((_DWORD)v11)
          {
            v6 = 0;
            goto LABEL_54;
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        if (v8)
          continue;
        break;
      }
    }

    if (!LOBYTE(self->_maxHighlightScore)
      && *(_QWORD *)&self->_diffFlipCount.__elems_[4]
      && -[VCPMovieHighlightAnalyzer computeColorNormalization](self, "computeColorNormalization"))
    {
LABEL_11:
      v6 = 0;
    }
    else
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      obj = self->_internalConstraintResults;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      if (v13)
      {
        v38 = *(_QWORD *)v53;
        v40 = self;
        do
        {
          v14 = 0;
          v39 = v13;
          do
          {
            if (*(_QWORD *)v53 != v38)
              objc_enumerationMutation(obj);
            v41 = v14;
            v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
            v16 = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 12);
            value = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 24);
            timescale = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 32);
            flags = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 36);
            epoch = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 40);
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v21 = *(id *)&self->_isMaxTrim;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
            if (v22)
            {
              v23 = *(_QWORD *)v49;
              while (2)
              {
                for (j = 0; j != v22; ++j)
                {
                  if (*(_QWORD *)v49 != v23)
                    objc_enumerationMutation(v21);
                  v25 = *(const __CFDictionary **)(*((_QWORD *)&v48 + 1) + 8 * j);
                  memset(&buf, 0, sizeof(buf));
                  CMTimeRangeMakeFromDictionary(&buf, v25);
                  if (v15)
                    objc_msgSend(v15, "timerange");
                  else
                    memset(&range, 0, sizeof(range));
                  otherRange = buf;
                  CMTimeRangeGetIntersection(&v46, &range, &otherRange);
                  LOBYTE(v16) = v46.start.flags;
                  value = v46.duration.value;
                  timescale = v46.duration.timescale;
                  flags = v46.duration.flags;
                  epoch = v46.duration.epoch;
                  v46.start = v46.duration;
                  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
                  if (CMTimeCompare(&v46.start, &time2) > 0)
                  {
                    self = v40;
                    goto LABEL_41;
                  }
                }
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
                self = v40;
                if (v22)
                  continue;
                break;
              }
            }
LABEL_41:

            if ((v16 & 1) == 0
              || (flags & 1) == 0
              || epoch
              || value < 0
              || (time1.value = value,
                  time1.timescale = timescale,
                  time1.flags = flags,
                  time1.epoch = 0,
                  v42 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
                  CMTimeCompare(&time1, &v42)))
            {
              if (v15)
              {
                objc_msgSend(v15, "timerange");
                *(_OWORD *)&v46.start.value = *(_OWORD *)&buf.start.value;
                v46.start.epoch = buf.start.epoch;
                objc_msgSend(v15, "timerange");
              }
              else
              {
                memset(&v46, 0, 24);
                memset(&buf, 0, sizeof(buf));
              }
              time2 = buf.duration;
              objc_msgSend(v15, "score");
              v27 = v26;
              -[VCPMovieHighlightAnalyzer getHighlightAttributes:withHighlightResults:](self, "getHighlightAttributes:withHighlightResults:", v15, v36);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v61[0] = CFSTR("start");
              *(_OWORD *)&buf.start.value = *(_OWORD *)&v46.start.value;
              buf.start.epoch = v46.start.epoch;
              v29 = CMTimeCopyAsDictionary(&buf.start, 0);
              v62[0] = v29;
              v61[1] = CFSTR("duration");
              buf.start = time2;
              v30 = CMTimeCopyAsDictionary(&buf.start, 0);
              v62[1] = v30;
              v61[2] = CFSTR("quality");
              LODWORD(v31) = v27;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v61[3] = CFSTR("attributes");
              v62[2] = v32;
              v62[3] = v28;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 4);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v33);

            }
            v14 = v41 + 1;
          }
          while (v41 + 1 != v39);
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        }
        while (v13);
      }
      v6 = v37;
LABEL_54:

    }
    v5 = v6;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No scene or quality results exist for highlight generation!", (uint8_t *)&buf, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (void)adjustHighlightScoreWithContext
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  uint64_t i;
  double v8;
  float v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  CMTime *v13;
  uint64_t j;
  const __CFDictionary *v15;
  unint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  float v21;
  double Seconds;
  double v23;
  float v24;
  double v25;
  CMTime duration;
  CMTime time;
  CMTime v28;
  CMTime v29;
  CMTimeRange otherRange;
  CMTimeRange v31;
  CMTimeRange time1;
  CMTimeRange range;
  CMTime v34;
  CMTimeRange v35;
  CMTimeRange v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CMTime time2;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v3 = *(id *)&self->_isMaxTrim;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v42;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v42 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "vcp_quality");
        v9 = v8;
        if (v6 <= v9)
          v6 = v9;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = *(id *)&self->_isMaxTrim;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v38;
    v13 = (CMTime *)MEMORY[0x1E0CA2E68];
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v10);
        v15 = *(const __CFDictionary **)(*((_QWORD *)&v37 + 1) + 8 * j);
        memset(&v36, 0, sizeof(v36));
        CMTimeRangeMakeFromDictionary(&v36, v15);
        -[__CFDictionary vcp_quality](v15, "vcp_quality");
        v16 = 0;
        *(float *)&v17 = v17;
        v18 = (float)(*(float *)&v17 / v6);
        while (v16 < -[NSMutableArray count](self->_internalResults, "count"))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          memset(&v35, 0, sizeof(v35));
          if (v19)
            objc_msgSend(v19, "timerange");
          range = v36;
          CMTimeRangeGetEnd(&v34, &range);
          *(_OWORD *)&time1.start.value = *(_OWORD *)&v35.start.value;
          time1.start.epoch = v35.start.epoch;
          time2 = v34;
          if (CMTimeCompare(&time1.start, &time2) >= 1)
          {

            break;
          }
          objc_msgSend(v20, "score");
          if (v21 >= 0.0)
          {
            v31 = v36;
            memset(&time1, 0, sizeof(time1));
            otherRange = v35;
            CMTimeRangeGetIntersection(&time1, &v31, &otherRange);
            if ((time1.start.flags & 1) == 0
              || (time1.duration.flags & 1) == 0
              || time1.duration.epoch
              || time1.duration.value < 0
              || (v29 = time1.duration, v28 = *v13, CMTimeCompare(&v29, &v28)))
            {
              time = time1.duration;
              Seconds = CMTimeGetSeconds(&time);
              duration = v35.duration;
              v23 = CMTimeGetSeconds(&duration);
              objc_msgSend(v20, "score");
              v25 = Seconds * v18 / v23 + v24;
              *(float *)&v25 = v25;
              objc_msgSend(v20, "setScore:", v25);
              -[NSMutableArray replaceObjectAtIndex:withObject:](self->_internalResults, "replaceObjectAtIndex:withObject:", v16, v20);
            }
          }

          ++v16;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v11);
  }

}

- (int)selectHighlightsForTimelapse
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CMTime *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  _OWORD v11[3];
  _OWORD v12[3];
  CMTimeRange v13;
  CMTimeRange v14;
  CMTimeRange time1;
  CMTime end;
  CMTime start;
  CMTimeRange v18;
  CMTimeRange range;
  CMTime v20;
  CMTimeRange v21;
  CMTime v22;
  CMTime v23;
  CMTime time2;

  if (-[NSArray count](self->_sceneResults, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_sceneResults, "objectAtIndexedSubscript:", 0);
    v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&v21, v3);
    v22 = v21.start;

    memset(&v20, 0, sizeof(v20));
    -[NSArray objectAtIndexedSubscript:](self->_sceneResults, "objectAtIndexedSubscript:", -[NSArray count](self->_sceneResults, "count") - 1);
    v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&range, v4);
    CMTimeRangeGetEnd(&v20, &range);

    memset(&v21, 0, sizeof(v21));
    start = v22;
    end = v20;
    CMTimeRangeFromTimeToTime(&v18, &start, &end);
    -[VCPMovieHighlightAnalyzer computeQualityTrimFor:withKeyFrame:](self, "computeQualityTrimFor:withKeyFrame:", &v18, 0);
    v14 = v21;
    -[VCPMovieHighlightAnalyzer computeTrimWithHighlightScoreFor:](self, "computeTrimWithHighlightScoreFor:", &v14);
    v21 = time1;
    time1.start = time1.duration;
    v5 = (CMTime *)MEMORY[0x1E0CA2E68];
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (CMTimeCompare(&time1.start, &time2) >= 1)
    {
      v13 = v21;
      -[VCPMovieHighlightAnalyzer findBestHighlightSegment:targetTrim:](self, "findBestHighlightSegment:targetTrim:", &v13, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        objc_msgSend(v6, "timerange");
      else
        memset(v12, 0, sizeof(v12));
      -[VCPMovieHighlightAnalyzer pickKeyFramesInRange:](self, "pickKeyFramesInRange:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setKeyFrame:", v8);

      -[VCPMovieHighlightAnalyzer searchFeatureVectorOfSegment:](self, "searchFeatureVectorOfSegment:", v7);
      if (v7)
        objc_msgSend(v7, "timerange");
      else
        memset(v11, 0, sizeof(v11));
      -[VCPMovieHighlightAnalyzer computeBestPlaybackCrop:](self, "computeBestPlaybackCrop:", v11);
      objc_msgSend(v7, "setBestPlaybackCrop:");
      objc_msgSend(v7, "score");
      if (*(float *)&self->_contextResults >= v9)
        v9 = *(float *)&self->_contextResults;
      *(float *)&self->_contextResults = v9;
      if (v7)
      {
        objc_msgSend(v7, "timerange");
        time2 = time1.duration;
        v23 = *v5;
        if (CMTimeCompare(&time2, &v23) >= 1)
          -[NSMutableArray addObject:](self->_highlightResults, "addObject:", v7);
      }

    }
  }
  return 0;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)computeTrimWithHighlightScoreFor:(SEL)a3
{
  __int128 v7;
  __int128 v8;
  CMTime *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  float v20;
  CMTime v22;
  CMTime start;
  CMTimeRange v24;
  CMTime v25;
  CMTime v26;
  CMTimeRange v27;
  CMTimeRange v28;
  CMTimeRange v29;
  CMTime v30;
  CMTime v31;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v34;
  CMTimeRange time1;
  CMTimeRange v36;
  CMTime v37;
  CMTime v38;
  CMTimeRange range;
  CMTime v40;
  CMTime v41;
  CMTime time2;

  v7 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&v41.value = *(_OWORD *)&a4->var0.var0;
  v8 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&range.start.epoch = v7;
  v41.epoch = a4->var0.var3;
  memset(&v40, 0, sizeof(v40));
  *(_OWORD *)&range.duration.timescale = v8;
  CMTimeRangeGetEnd(&v40, &range);
  v9 = (CMTime *)MEMORY[0x1E0CA2E68];
  v38 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v37 = v38;
  if (-[NSMutableArray count](self->_internalResults, "count"))
  {
    v10 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      memset(&v36, 0, sizeof(v36));
      if (v11)
        objc_msgSend(v11, "timerange");
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v36.start.value;
      time1.start.epoch = v36.start.epoch;
      time2 = v40;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v34 = v36;
      memset(&time1, 0, sizeof(time1));
      v13 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v13;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v34, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, v31 = *v9, CMTimeCompare(&duration, &v31)))
      {
        objc_msgSend(v12, "score");
        if (v14 >= 0.0)
        {
          v38 = time1.start;
          break;
        }
      }

      if (++v10 >= (unint64_t)-[NSMutableArray count](self->_internalResults, "count"))
        goto LABEL_16;
    }

  }
LABEL_16:
  v15 = -[NSMutableArray count](self->_internalResults, "count");
  if (v15 - 1 >= 0)
  {
    v16 = v15;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", --v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      memset(&v36, 0, sizeof(v36));
      if (v17)
        objc_msgSend(v17, "timerange");
      v29 = v36;
      CMTimeRangeGetEnd(&v30, &v29);
      time1.start = v30;
      time2 = v41;
      if (CMTimeCompare(&time1.start, &time2) < 0)
        break;
      memset(&time1, 0, sizeof(time1));
      v28 = v36;
      v19 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&v27.start.value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&v27.start.epoch = v19;
      *(_OWORD *)&v27.duration.timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v28, &v27);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v26 = time1.duration, v25 = *v9, CMTimeCompare(&v26, &v25)))
      {
        objc_msgSend(v18, "score");
        if (v20 >= 0.0)
        {
          v24 = time1;
          CMTimeRangeGetEnd(&time2, &v24);
          v37 = time2;
          break;
        }
      }

      if (v16 <= 0)
        goto LABEL_31;
    }

  }
LABEL_31:
  start = v38;
  v22 = v37;
  return ($C7CBA4C8288BA02ADCCB8E56B4665FF4 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v22);
}

- (int)selectHighlights
{
  unint64_t v3;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTimeValue v6;
  CMTimeScale v7;
  CMTimeFlags v8;
  CMTimeEpoch v9;
  const __CFDictionary *v10;
  void *v11;
  float v12;
  BOOL v13;
  void *v14;
  float v15;
  BOOL v16;
  __int128 v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  float v22;
  uint64_t v23;
  void *v24;
  float v25;
  char v27;
  BOOL v28;
  unint64_t v29;
  void *v30;
  _OWORD v31[3];
  _OWORD v32[3];
  CMTimeRange v33;
  CMTimeRange v34;
  CMTime end;
  CMTime time2;
  CMTime start;
  CMTimeRange v38;
  CMTime v39;
  CMTimeRange v40;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v43;
  CMTimeRange v44;
  CMTime v45;
  CMTime v46;
  CMTimeRange v47;
  CMTimeRange time1;
  CMTimeRange v49[2];
  CMTimeRange v50;
  CMTime v51;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v54;

  v3 = 0;
  v30 = 0;
  v27 = 0;
  v54 = *MEMORY[0x1E0C80C00];
  value = *MEMORY[0x1E0CA2E50];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 16);
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 24);
  v7 = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 32);
  v8 = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 36);
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 40);
  while (-[NSArray count](self->_sceneResults, "count") > v3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_sceneResults, "objectAtIndexedSubscript:", v3);
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    memset(&v50, 0, sizeof(v50));
    CMTimeRangeMakeFromDictionary(&v50, v10);
    memset(&v49[1], 0, sizeof(CMTimeRange));
    v49[0] = v50;
    -[VCPMovieHighlightAnalyzer computeQualityTrimFor:withKeyFrame:](self, "computeQualityTrimFor:withKeyFrame:", v49, 0);
    v47 = v49[1];
    -[VCPMovieHighlightAnalyzer computeTrimWithHighlightScoreFor:](self, "computeTrimWithHighlightScoreFor:", &v47);
    v49[1] = time1;
    time1.start = time1.duration;
    time2 = v50.duration;
    v29 = v3;
    if (CMTimeCompare(&time1.start, &time2))
      goto LABEL_48;
    CMTimeMake(&v51, 1200, 600);
    time1.start = v50.duration;
    time2 = v51;
    if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0
      || (-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("quality")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "floatValue"),
          v13 = v12 < 0.5,
          v11,
          v13))
    {
LABEL_48:
      if ((v27 & 1) != 0
        && (-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("quality")),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "floatValue"),
            v16 = v15 < 0.5,
            v14,
            !v16))
      {
        range.start.value = value;
        range.start.timescale = timescale;
        range.start.flags = flags;
        range.start.epoch = epoch;
        range.duration.value = v6;
        range.duration.timescale = v7;
        range.duration.flags = v8;
        range.duration.epoch = v9;
        otherRange = v49[1];
        CMTimeRangeGetUnion(&time1, &range, &otherRange);
        v27 = 0;
        *(_OWORD *)&v50.start.value = *(_OWORD *)&time1.start.value;
        *(_OWORD *)&v50.start.epoch = *(_OWORD *)&time1.start.epoch;
        v17 = *(_OWORD *)&time1.duration.timescale;
      }
      else
      {
        v27 = 0;
        *(_OWORD *)&v50.start.value = *(_OWORD *)&v49[1].start.value;
        *(_OWORD *)&v50.start.epoch = *(_OWORD *)&v49[1].start.epoch;
        v17 = *(_OWORD *)&v49[1].duration.timescale;
      }
      *(_OWORD *)&v50.duration.timescale = v17;
    }
    else
    {
      if ((flags & 1) == 0
        || (v8 & 1) == 0
        || v9
        || v6 < 0
        || (v46.value = v6,
            v46.timescale = v7,
            v46.flags = v8,
            v46.epoch = 0,
            v45 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
            CMTimeCompare(&v46, &v45)))
      {
        if (v29 == -[NSArray count](self->_sceneResults, "count") - 1)
          goto LABEL_30;
        -[NSArray objectAtIndexedSubscript:](self->_sceneResults, "objectAtIndexedSubscript:", v29 + 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("quality"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        v28 = v22 > 0.3;

        if (!v28)
        {
LABEL_30:
          v44.start.value = value;
          v44.start.timescale = timescale;
          v44.start.flags = flags;
          v44.start.epoch = epoch;
          v44.duration.value = v6;
          v44.duration.timescale = v7;
          v44.duration.flags = v8;
          v44.duration.epoch = v9;
          v43 = v49[1];
          CMTimeRangeGetUnion(&time1, &v44, &v43);
          v50 = time1;
        }
      }
      v27 = 1;
    }
    time1.start = v50.duration;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (CMTimeCompare(&time1.start, &time2) < 1)
    {
      v18 = v30;
      goto LABEL_44;
    }
    v40 = v50;
    -[VCPMovieHighlightAnalyzer findBestHighlightSegment:targetTrim:](self, "findBestHighlightSegment:targetTrim:", &v40, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v30)
      goto LABEL_19;
    objc_msgSend(v30, "qualityScore");
    if (v19 < 0.5)
      goto LABEL_19;
    if (v18)
      objc_msgSend(v18, "timerange");
    else
      memset(&time1, 0, sizeof(time1));
    objc_msgSend(v30, "timerange");
    CMTimeRangeGetEnd(&v39, &v38);
    time2 = time1.start;
    v51 = v39;
    if (!CMTimeCompare(&time2, &v51))
    {
      memset(&time1, 0, sizeof(time1));
      objc_msgSend(v30, "timerange");
      start = time2;
      if (v18)
        objc_msgSend(v18, "timerange");
      else
        memset(&v34, 0, sizeof(v34));
      CMTimeRangeGetEnd(&end, &v34);
      CMTimeRangeFromTimeToTime(&time1, &start, &end);
      v33 = time1;
      -[VCPMovieHighlightAnalyzer findBestHighlightSegment:targetTrim:](self, "findBestHighlightSegment:targetTrim:", &v33, 0);
      v23 = objc_claimAutoreleasedReturnValue();

      -[NSMutableArray removeLastObject](self->_highlightResults, "removeLastObject");
      v18 = (void *)v23;
      if (!v23)
      {
LABEL_34:
        memset(v32, 0, sizeof(v32));
        goto LABEL_35;
      }
    }
    else
    {
LABEL_19:
      if (!v18)
        goto LABEL_34;
    }
    objc_msgSend(v18, "timerange");
LABEL_35:
    -[VCPMovieHighlightAnalyzer pickKeyFramesInRange:](self, "pickKeyFramesInRange:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setKeyFrame:", v24);

    -[VCPMovieHighlightAnalyzer searchFeatureVectorOfSegment:](self, "searchFeatureVectorOfSegment:", v18);
    if (v18)
      objc_msgSend(v18, "timerange");
    else
      memset(v31, 0, sizeof(v31));
    -[VCPMovieHighlightAnalyzer computeBestPlaybackCrop:](self, "computeBestPlaybackCrop:", v31);
    objc_msgSend(v18, "setBestPlaybackCrop:");
    objc_msgSend(v18, "score");
    if (*(float *)&self->_contextResults >= v25)
      v25 = *(float *)&self->_contextResults;
    *(float *)&self->_contextResults = v25;
    if (v18)
    {
      objc_msgSend(v18, "timerange");
      time2 = time1.duration;
      v51 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (CMTimeCompare(&time2, &v51) >= 1)
        -[NSMutableArray addObject:](self->_highlightResults, "addObject:", v18);
    }

LABEL_44:
    value = v49[1].start.value;
    flags = v49[1].start.flags;
    timescale = v49[1].start.timescale;
    v6 = v49[1].duration.value;
    epoch = v49[1].start.epoch;
    v7 = v49[1].duration.timescale;
    v8 = v49[1].duration.flags;
    v9 = v49[1].duration.epoch;

    v3 = v29 + 1;
    v30 = v18;
  }

  return 0;
}

- (int)computeColorNormalization
{
  int v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *epoch;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  NSMutableArray *obj;
  id v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_internalConstraintResults;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v30;
    v19 = CFSTR("colorNormalizationData");
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v5)
        objc_enumerationMutation(obj);
      v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
      if (v7)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v6), "timerange");
      }
      else
      {
        v25 = 0u;
        v26 = 0u;
        v24 = 0u;
      }
      v27 = v24;
      v28 = v25;
      epoch = (void *)self->_preferredTimeRange.duration.epoch;
      v22 = v24;
      v23 = v25;
      v9 = objc_msgSend(epoch, "copyCGImageAtTime:actualTime:error:", &v22, 0, 0, v19);
      *(_QWORD *)&v24 = v9;
      if (v9)
      {
        v10 = *(void **)&self->_diffFlipCount.__elems_[4];
        v21 = 0;
        v11 = objc_msgSend(v10, "analyzeCGImage:results:", v9, &v21);
        v12 = v21;
        v13 = v12;
        if (v11)
        {
          v14 = 1;
          v2 = v11;
        }
        else
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ColorNormalizationResults"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v19);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v7, "setColorNormalization:", v17);
              v14 = 0;
            }
            else
            {
              v2 = -18;
              v14 = 1;
            }

          }
          else
          {
            v2 = -18;
            v14 = 1;
          }

        }
      }
      else
      {
        v13 = 0;
        v2 = -18;
        v14 = 1;
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v24);

      if (v14)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_23;
      }
    }
  }
  else
  {
LABEL_23:
    v2 = 0;
  }

  return v2;
}

- (float)highlightScoreForTimeRange:(id *)a3 average:(BOOL)a4
{
  _BOOL4 v4;
  unsigned __int8 v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  CMTime *v12;
  float v13;
  float v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  float v18;
  float v19;
  double Seconds;
  double v21;
  float v22;
  float v23;
  float result;
  CMTime duration;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CMTime v37;
  CMTime v38;
  _BYTE v39[128];
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  if ((v7 & 1) == 0
  {
    CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer highlightScoreForTimeRange:average:]::kMeaningfulLength, 600, 600);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = self->_internalResults;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v34;
    v11 = 0.0;
    v12 = (CMTime *)MEMORY[0x1E0CA2E68];
    v13 = 0.0;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        memset(&v32, 0, sizeof(v32));
        if (v16)
          objc_msgSend(v16, "timerange");
        else
          memset(&range, 0, sizeof(range));
        v17 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&otherRange.start.epoch = v17;
        *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v32, &range, &otherRange);
        if ((v32.start.flags & 1) != 0
          && (v32.duration.flags & 1) != 0
          && !v32.duration.epoch
          && (v32.duration.value & 0x8000000000000000) == 0)
        {
          time1 = v32.duration;
          time2 = *v12;
          if (!CMTimeCompare(&time1, &time2))
            continue;
        }
        objc_msgSend(v16, "score");
        v19 = v18;
        time = v32.duration;
        Seconds = CMTimeGetSeconds(&time);
        duration = v32.duration;
        v21 = CMTimeGetSeconds(&duration);
        v38 = v32.duration;
        v37 = *(CMTime *)-[VCPMovieHighlightAnalyzer highlightScoreForTimeRange:average:]::kMeaningfulLength;
        v11 = v11 + v19 * Seconds;
        v14 = v21 + v14;
        if (CMTimeCompare(&v38, &v37) >= 1)
        {
          objc_msgSend(v16, "score");
          if (v13 < v22)
          {
            objc_msgSend(v16, "score");
            v13 = v23;
          }
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
  }

  result = v11 / v14;
  if (v14 <= 0.0)
    result = 0.0;
  if (v13 > result && !v4)
    return (float)(v13 + result) * 0.5;
  return result;
}

- (id)findBestHighlightSegment:(id *)a3 targetTrim:(BOOL)a4
{
  _BOOL4 v4;
  unsigned __int8 v7;
  float minDurationInSeconds;
  float maxDurationInSeconds;
  VCPMovieHighlight *v10;
  __int128 v11;
  VCPMovieHighlight *v12;
  VCPMovieHighlight *v13;
  VCPMovieHighlight *v14;
  float v15;
  float v16;
  float v17;
  VCPMovieHighlight *v18;
  _OWORD v20[3];
  CMTimeRange v21;
  CMTimeRange v22;
  CMTimeRange v23;
  CMTimeRange rhs;
  CMTime duration;
  CMTime start;
  CMTimeRange lhs;
  CMTime v28;
  CMTime var0;
  _OWORD v30[3];
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;

  v4 = a4;
  if ((v7 & 1) == 0
  {
    CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer findBestHighlightSegment:targetTrim:]::kHalfSecond, 300, 600);
  }
  if (v4)
    minDurationInSeconds = self->_targetDurationInSeconds - self->_toleranceInSeconds;
  else
    minDurationInSeconds = self->_minDurationInSeconds;
  memset(&v33, 0, sizeof(v33));
  CMTimeMake(&v33, (uint64_t)(float)(minDurationInSeconds * 600.0), 600);
  if (v4)
    maxDurationInSeconds = self->_targetDurationInSeconds - self->_toleranceInSeconds;
  else
    maxDurationInSeconds = self->_maxDurationInSeconds;
  memset(&v32, 0, sizeof(v32));
  CMTimeMake(&v32, (uint64_t)(float)(maxDurationInSeconds * 600.0), 600);
  var0 = (CMTime)a3->var0;
  memset(&v31, 0, sizeof(v31));
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
  lhs.start.epoch = a3->var0.var3;
  *(_OWORD *)&rhs.start.value = *(_OWORD *)&a3->var1.var0;
  rhs.start.epoch = a3->var1.var3;
  CMTimeAdd(&v31, &lhs.start, &rhs.start);
  v10 = [VCPMovieHighlight alloc];
  v11 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  v30[0] = *MEMORY[0x1E0CA2E50];
  v30[1] = v11;
  v30[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
  v12 = -[VCPMovieHighlight initWithTimeRange:](v10, "initWithTimeRange:", v30);
  do
  {
    memset(&v28, 0, sizeof(v28));
    lhs.start = var0;
    rhs.start = v32;
    CMTimeAdd(&v35, &lhs.start, &rhs.start);
    lhs.start = v35;
    rhs.start = v31;
    if (CMTimeCompare(&lhs.start, &rhs.start) < 1)
    {
      v28 = v32;
    }
    else
    {
      lhs.start = v31;
      rhs.start = var0;
      CMTimeSubtract(&v28, &lhs.start, &rhs.start);
    }
    lhs.start = v28;
    rhs.start = v33;
    if (CMTimeCompare(&lhs.start, &rhs.start) < 0)
      break;
    memset(&lhs, 0, sizeof(lhs));
    start = var0;
    duration = v28;
    CMTimeRangeMake(&lhs, &start, &duration);
    if (BYTE5(self->_startRange.duration.epoch) && !v4)
    {
      v23 = lhs;
      -[VCPMovieHighlightAnalyzer findBestTrim:](self, "findBestTrim:", &v23);
      lhs = rhs;
    }
    v13 = [VCPMovieHighlight alloc];
    v22 = lhs;
    v14 = -[VCPMovieHighlight initWithTimeRange:](v13, "initWithTimeRange:", &v22);
    v21 = lhs;
    -[VCPMovieHighlightAnalyzer highlightScoreForTimeRange:average:](self, "highlightScoreForTimeRange:average:", &v21, 0);
    -[VCPMovieHighlight setScore:](v14, "setScore:");
    if (v12)
    {
      -[VCPMovieHighlight score](v14, "score");
      v16 = v15;
      -[VCPMovieHighlight score](v12, "score");
      if (v16 <= v17)
        continue;
    }
    v18 = v14;

    v12 = v18;
    v35 = var0;
    v34 = *(CMTime *)-[VCPMovieHighlightAnalyzer findBestHighlightSegment:targetTrim:]::kHalfSecond;
    CMTimeAdd(&rhs.start, &v35, &v34);
    var0 = rhs.start;

    lhs.start = v31;
    rhs.start = v32;
    CMTimeSubtract(&v35, &lhs.start, &rhs.start);
    lhs.start = var0;
    rhs.start = v35;
  }
  while (CMTimeCompare(&lhs.start, &rhs.start) < 0);
  if (v12)
    -[VCPMovieHighlight timerange](v12, "timerange");
  else
    memset(v20, 0, sizeof(v20));
  -[VCPMovieHighlightAnalyzer highlightScoreForTimeRange:average:](self, "highlightScoreForTimeRange:average:", v20, 1);
  -[VCPMovieHighlight setAverageScore:](v12, "setAverageScore:");
  return v12;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)findBestTrim:(SEL)a3
{
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  unsigned __int8 v8;
  NSMutableArray *v9;
  uint64_t v10;
  CMTime *v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  float v18;
  float v19;
  float v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  float v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  float v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  CMTimeRange *v42;
  CMTime end;
  CMTime start;
  CMTime v45;
  CMTime v46;
  CMTimeRange v47;
  CMTime v48;
  CMTimeRange v49;
  CMTime v50;
  CMTime v51;
  CMTimeRange v52;
  CMTimeRange v53;
  CMTimeRange v54;
  CMTime v55;
  CMTime duration;
  CMTimeRange v57;
  CMTimeRange v58;
  CMTime v59;
  CMTime v60;
  CMTimeRange v61;
  CMTime v62;
  CMTime var0;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  CMTime time;
  CMTime v74;
  CMTime rhs;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  time = (CMTime)a4->var1;
  if (CMTimeGetSeconds(&time) <= self->_minDurationInSeconds)
  {
    v21 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&retstr->var0.var3 = v21;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&a4->var1.var1;
    return result;
  }
  if ((v8 & 1) == 0
  {
    CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer findBestTrim:]::kMeaningfulLength, 600, 600);
  }
  v72 = 0u;
  v71 = 0u;
  v69 = 0u;
  v70 = 0u;
  v9 = self->_internalResults;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  v42 = (CMTimeRange *)retstr;
  v11 = (CMTime *)MEMORY[0x1E0CA2E68];
  if (v10)
  {
    v12 = *(_QWORD *)v70;
    v13 = 0.0;
    v14 = 1.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v70 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        memset(&v68, 0, sizeof(v68));
        if (v16)
          objc_msgSend(v16, "timerange");
        else
          memset(&range, 0, sizeof(range));
        v17 = *(_OWORD *)&a4->var0.var3;
        *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a4->var0.var0;
        *(_OWORD *)&otherRange.start.epoch = v17;
        *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a4->var1.var1;
        CMTimeRangeGetIntersection(&v68, &range, &otherRange);
        if ((v68.start.flags & 1) != 0
          && (v68.duration.flags & 1) != 0
          && !v68.duration.epoch
          && (v68.duration.value & 0x8000000000000000) == 0)
        {
          time1 = v68.duration;
          time2 = *v11;
          if (!CMTimeCompare(&time1, &time2))
            continue;
        }
        rhs = v68.duration;
        v74 = *(CMTime *)-[VCPMovieHighlightAnalyzer findBestTrim:]::kMeaningfulLength;
        if (CMTimeCompare(&rhs, &v74) >= 1)
        {
          objc_msgSend(v16, "score");
          v19 = v18;
          objc_msgSend(v16, "score");
          if (v13 < v19)
            v13 = v19;
          if (v20 < v14)
            v14 = v20;
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v10);
  }
  else
  {
    v13 = 0.0;
    v14 = 1.0;
  }

  v22 = *(_OWORD *)&a4->var0.var3;
  var0 = (CMTime)a4->var0;
  memset(&v62, 0, sizeof(v62));
  v23 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)&v61.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&v61.start.epoch = v22;
  *(_OWORD *)&v61.duration.timescale = v23;
  CMTimeRangeGetEnd(&v62, &v61);
  v60 = var0;
  v59 = v62;
  v24 = fminf((float)(v14 + v13) * 0.5, 0.4);
  if (-[NSMutableArray count](self->_internalResults, "count"))
  {
    v25 = 0;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
        objc_msgSend(v26, "timerange");
      else
        memset(&v68, 0, sizeof(v68));
      rhs = v68.start;
      v74 = v62;
      if ((CMTimeCompare(&rhs, &v74) & 0x80000000) == 0)
      {
        v25 = -1;
        goto LABEL_45;
      }
      memset(&v68, 0, sizeof(v68));
      if (v27)
        objc_msgSend(v27, "timerange");
      else
        memset(&v58, 0, sizeof(v58));
      v28 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&v57.start.value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&v57.start.epoch = v28;
      *(_OWORD *)&v57.duration.timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&v68, &v58, &v57);
      if ((v68.start.flags & 1) == 0
        || (v68.duration.flags & 1) == 0
        || v68.duration.epoch
        || v68.duration.value < 0
        || (duration = v68.duration, v55 = *v11, CMTimeCompare(&duration, &v55)))
      {
        objc_msgSend(v27, "score");
        if (v29 >= v24)
          break;
      }

      if (++v25 >= (unint64_t)-[NSMutableArray count](self->_internalResults, "count"))
        goto LABEL_42;
    }
    v60 = v68.start;
LABEL_45:

  }
  else
  {
LABEL_42:
    v25 = -1;
  }
  v30 = -[NSMutableArray count](self->_internalResults, "count");
  if (v30 - 1 < 0)
  {
LABEL_61:
    v30 = -1;
  }
  else
  {
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", --v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
        objc_msgSend(v31, "timerange");
      else
        memset(&v54, 0, sizeof(v54));
      CMTimeRangeGetEnd(&v74, &v54);
      v68.start = v74;
      rhs = var0;
      if (CMTimeCompare(&v68.start, &rhs) < 0)
      {
        v30 = -1;
        goto LABEL_64;
      }
      memset(&v68, 0, sizeof(v68));
      if (v32)
        objc_msgSend(v32, "timerange");
      else
        memset(&v53, 0, sizeof(v53));
      v33 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&v52.start.value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&v52.start.epoch = v33;
      *(_OWORD *)&v52.duration.timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&v68, &v53, &v52);
      if ((v68.start.flags & 1) == 0
        || (v68.duration.flags & 1) == 0
        || v68.duration.epoch
        || v68.duration.value < 0
        || (v51 = v68.duration, v50 = *v11, CMTimeCompare(&v51, &v50)))
      {
        objc_msgSend(v32, "score");
        if (v34 >= v24)
          break;
      }

      if (v30 <= 0)
        goto LABEL_61;
    }
    v49 = v68;
    CMTimeRangeGetEnd(&rhs, &v49);
    v59 = rhs;
LABEL_64:

  }
  if (v25 < 0)
  {
    v35 = 0;
    if ((v30 & 0x8000000000000000) == 0)
      goto LABEL_67;
LABEL_69:
    v36 = 0;
    goto LABEL_70;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v25);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 < 0)
    goto LABEL_69;
LABEL_67:
  -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v30);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_70:
  memset(&v74, 0, sizeof(v74));
  CMTimeMake(&v74, (uint64_t)(float)(self->_minDurationInSeconds * 600.0), 600);
  while (1)
  {
    v68.start = v59;
    rhs = v60;
    CMTimeSubtract(&v48, &v68.start, &rhs);
    v68.start = v48;
    rhs = v74;
    if ((CMTimeCompare(&v68.start, &rhs) & 0x80000000) == 0)
      break;
    if (v36)
    {
      if (v35)
      {
        objc_msgSend(v36, "score");
        v38 = v37;
        objc_msgSend(v35, "score");
        if (v38 <= v39)
          goto LABEL_85;
      }
      memset(&v48, 0, sizeof(v48));
      objc_msgSend(v36, "timerange");
      CMTimeRangeGetEnd(&v48, &v47);
      v68.start = v48;
      rhs = v60;
      CMTimeSubtract(&v45, &v68.start, &rhs);
      v68.start = v45;
      rhs = v74;
      if (CMTimeCompare(&v68.start, &rhs) < 0)
      {
        v46 = v48;
      }
      else
      {
        v68.start = v60;
        rhs = v74;
        CMTimeAdd(&v46, &v68.start, &rhs);
      }
      v59 = v46;
      v68.start = v46;
      rhs = v62;
      if (CMTimeCompare(&v68.start, &rhs) < 0)
      {
        if (v30 + 1 >= (unint64_t)-[NSMutableArray count](self->_internalResults, "count"))
        {
          v40 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v30 + 1);
          v40 = objc_claimAutoreleasedReturnValue();
          ++v30;
        }
      }
      else
      {
        v40 = 0;
        v59 = v62;
      }

      v36 = (void *)v40;
    }
    else
    {
      if (!v35)
      {
        v36 = 0;
        break;
      }
LABEL_85:
      memset(&v48, 0, sizeof(v48));
      objc_msgSend(v35, "timerange");
      v48 = v68.start;
      v68.start = v59;
      rhs = v48;
      CMTimeSubtract(&v45, &v68.start, &rhs);
      v68.start = v45;
      rhs = v74;
      if (CMTimeCompare(&v68.start, &rhs) < 0)
      {
        v46 = v48;
      }
      else
      {
        v68.start = v59;
        rhs = v74;
        CMTimeSubtract(&v46, &v68.start, &rhs);
      }
      v60 = v46;
      v68.start = v46;
      rhs = var0;
      if (CMTimeCompare(&v68.start, &rhs) <= 0)
      {
        v41 = 0;
        v60 = var0;
      }
      else if (v25 < 1)
      {
        v41 = 0;
      }
      else
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v25 - 1);
        v41 = objc_claimAutoreleasedReturnValue();
        --v25;
      }

      v35 = (void *)v41;
    }
  }
  start = v60;
  end = v59;
  CMTimeRangeFromTimeToTime(v42, &start, &end);

  return result;
}

- (id)movieSummary
{
  void *v3;
  double v4;
  double v5;
  VCPMovieHighlight *v6;
  CMTimeRange *v7;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTimeValue v10;
  CMTimeScale v11;
  CMTimeFlags v12;
  CMTimeEpoch v13;
  _BOOL4 v14;
  double Seconds;
  VCPMovieHighlight *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  VCPMovieHighlight *v21;
  void *v22;
  void *v23;
  int v25;
  CMTimeValue v26;
  CMTimeScale v27;
  CMTimeFlags v28;
  CMTimeEpoch v29;
  CMTimeValue v30;
  CMTimeScale v31;
  CMTimeFlags v32;
  CMTimeEpoch v33;
  CMTimeValue v34;
  CMTimeScale v35;
  CMTimeFlags v36;
  CMTimeEpoch v37;
  CMTimeValue v38;
  CMTimeScale v39;
  CMTimeFlags v40;
  CMTimeEpoch v41;
  CMTimeValue v42;
  CMTimeScale v43;
  CMTimeFlags v44;
  CMTimeEpoch v45;
  CMTimeValue v46;
  CMTimeScale v47;
  CMTimeFlags v48;
  CMTimeEpoch v49;
  CMTime v50;
  CMTime v51;
  _OWORD v52[3];
  CMTimeValue v53;
  CMTimeScale v54;
  CMTimeFlags v55;
  CMTimeEpoch v56;
  CMTimeValue v57;
  CMTimeScale v58;
  CMTimeFlags v59;
  CMTimeEpoch v60;
  CMTimeValue v61;
  CMTimeScale v62;
  CMTimeFlags v63;
  CMTimeEpoch v64;
  CMTimeValue v65;
  CMTimeScale v66;
  CMTimeFlags v67;
  CMTimeEpoch v68;
  CMTime v69;
  CMTime time;
  CMTimeRange v71;
  CMTimeValue v72;
  CMTimeScale v73;
  CMTimeFlags v74;
  CMTimeEpoch v75;
  CMTimeValue v76;
  CMTimeScale v77;
  CMTimeFlags v78;
  CMTimeEpoch v79;
  CMTime v80;
  CMTime v81;
  CMTimeRange otherRange;
  CMTimeRange v83;
  CMTimeRange v84;
  CMTime v85;
  CMTime duration;
  CMTime time2;
  CMTime time1;
  CMTimeRange v89[2];
  CMTimeRange v90;
  CMTimeRange v91;
  CMTimeRange v92;
  CMTimeRange v93;
  CMTimeRange range;
  CMTime end;
  CMTime start;
  CMTimeRange v97;
  CMTimeRange v98;
  CMTimeRange v99;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_qualityResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSince1970");
    v5 = v4;

    v6 = objc_alloc_init(VCPMovieHighlight);
    memset(&v99, 0, sizeof(v99));
    CMTimeRangeMakeFromDictionary(&v99, (CFDictionaryRef)-[NSArray firstObject](self->_qualityResults, "firstObject"));
    memset(&v98, 0, sizeof(v98));
    CMTimeRangeMakeFromDictionary(&v98, (CFDictionaryRef)-[NSArray lastObject](self->_qualityResults, "lastObject"));
    memset(&v97, 0, sizeof(v97));
    start = v99.start;
    range = v98;
    CMTimeRangeGetEnd(&end, &range);
    CMTimeRangeFromTimeToTime(&v97, &start, &end);
    memset(&v93, 0, sizeof(v93));
    v92 = v97;
    -[VCPMovieHighlightAnalyzer computeQualityTrimFor:withKeyFrame:](self, "computeQualityTrimFor:withKeyFrame:", &v92, 1);
    v90 = v93;
    memset(&v91, 0, sizeof(v91));
    -[VCPMovieHighlightAnalyzer computeActionFaceTrimFor:](self, "computeActionFaceTrimFor:", &v90);
    v89[0] = v93;
    memset(&v89[1], 0, sizeof(CMTimeRange));
    -[VCPMovieHighlightAnalyzer computeSteadyTranslationTrimFor:](self, "computeSteadyTranslationTrimFor:", v89);
    if ((v89[1].start.flags & 1) == 0
      || (v89[1].duration.flags & 1) == 0
      || v89[1].duration.epoch
      || v89[1].duration.value < 0
      || (time1 = v89[1].duration, time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&time1, &time2)))
    {
      if ((v91.start.flags & 1) == 0
        || (v91.duration.flags & 1) == 0
        || v91.duration.epoch
        || v91.duration.value < 0
        || (duration = v91.duration, v85 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&duration, &v85)))
      {
        v83 = v91;
        otherRange = v89[1];
        CMTimeRangeGetUnion(&v84, &v83, &otherRange);
        v91 = v84;
      }
      else
      {
        v91 = v89[1];
        v93 = v89[1];
      }
    }
    v7 = &v93;
    if (!LOBYTE(self->_maxHighlightScore))
      v7 = &v91;
    value = v7->start.value;
    flags = v7->start.flags;
    timescale = v7->start.timescale;
    epoch = v7->start.epoch;
    v10 = v7->duration.value;
    v11 = v7->duration.timescale;
    v12 = v7->duration.flags;
    v13 = v7->duration.epoch;
    if ((flags & 1) != 0 && (v12 & 1) != 0 && !v13 && (v10 & 0x8000000000000000) == 0)
    {
      v81.value = v7->duration.value;
      v81.timescale = v11;
      v81.flags = v12;
      v81.epoch = 0;
      v80 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (!CMTimeCompare(&v81, &v80))
        goto LABEL_28;
    }
    v25 = *((unsigned __int8 *)&self->_isLivePhoto + 2);
    v72 = value;
    v73 = timescale;
    v74 = flags;
    v75 = epoch;
    v76 = v10;
    v77 = v11;
    v78 = v12;
    v79 = v13;
    v14 = -[VCPMovieHighlightAnalyzer checkCameraZoom:](self, "checkCameraZoom:", &v72);
    v71 = v97;
    -[VCPMovieHighlightAnalyzer generateExpressionSegments:](self, "generateExpressionSegments:", &v71);
    time.value = v10;
    time.timescale = v11;
    time.flags = v12;
    time.epoch = v13;
    Seconds = CMTimeGetSeconds(&time);
    v69 = v97.duration;
    -[VCPMovieHighlight setIsTrimmed:](v6, "setIsTrimmed:", Seconds < CMTimeGetSeconds(&v69));
    v61 = value;
    v62 = timescale;
    v63 = flags;
    v64 = epoch;
    v65 = v10;
    v66 = v11;
    v67 = v12;
    v68 = v13;
    -[VCPMovieHighlightAnalyzer analyzeOverallQuality:isSettlingEffect:isAnimatedSticker:](self, "analyzeOverallQuality:isSettlingEffect:isAnimatedSticker:", &v61, 0, 0);
    -[VCPMovieHighlight setScore:](v6, "setScore:");
    v53 = value;
    v54 = timescale;
    v55 = flags;
    v56 = epoch;
    v57 = v10;
    v58 = v11;
    v59 = v12;
    v60 = v13;
    -[VCPMovieHighlight setTimerange:](v6, "setTimerange:", &v53);
    if (v6)
      -[VCPMovieHighlight timerange](v6, "timerange");
    else
      memset(v52, 0, sizeof(v52));
    -[VCPMovieHighlightAnalyzer pickKeyFramesInRange:](self, "pickKeyFramesInRange:", v52);
    v17 = objc_claimAutoreleasedReturnValue();
    -[VCPMovieHighlight setKeyFrame:](v6, "setKeyFrame:", v17);

    -[VCPMovieHighlight keyFrame](v6, "keyFrame");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = v18 == 0;

    if ((v17 & 1) != 0)
    {
LABEL_28:
      v16 = 0;
LABEL_46:

      return v16;
    }
    if (LOBYTE(self->_maxHighlightScore))
    {
      if (v6)
        -[VCPMovieHighlight timerange](v6, "timerange");
      else
        memset(&v84, 0, sizeof(v84));
      v51 = v84.duration;
      v19 = CMTimeGetSeconds(&v51) > 2.0 && (*((unsigned __int8 *)&self->_isLivePhoto + 1) | v25 | v14) == 0;
      if (LOBYTE(self->_maxHighlightScore))
      {
        v20 = 0;
LABEL_40:
        -[VCPMovieHighlight setIsAutoPlayable:](v6, "setIsAutoPlayable:", v19 | v20);
        v42 = value;
        v43 = timescale;
        v44 = flags;
        v45 = epoch;
        v46 = v10;
        v47 = v11;
        v48 = v12;
        v49 = v13;
        -[VCPMovieHighlightAnalyzer computeBestPlaybackCrop:](self, "computeBestPlaybackCrop:", &v42);
        -[VCPMovieHighlight setBestPlaybackCrop:](v6, "setBestPlaybackCrop:");
        if (LOBYTE(self->_maxHighlightScore))
        {
          v21 = objc_alloc_init(VCPMovieHighlight);
          v22 = *(void **)&self->_numberOfFrames;
          *(_QWORD *)&self->_numberOfFrames = v21;

          if (+[VCPMovieHighlightAnalyzer isHeuristicStickerScoreEnabled](VCPMovieHighlightAnalyzer, "isHeuristicStickerScoreEnabled"))
          {
            v34 = value;
            v35 = timescale;
            v36 = flags;
            v37 = epoch;
            v38 = v10;
            v39 = v11;
            v40 = v12;
            v41 = v13;
            -[VCPMovieHighlightAnalyzer analyzeOverallQuality:isSettlingEffect:isAnimatedSticker:](self, "analyzeOverallQuality:isSettlingEffect:isAnimatedSticker:", &v34, 0, 1);
          }
          else
          {
            -[VCPMovieHighlight score](v6, "score");
          }
          objc_msgSend(*(id *)&self->_numberOfFrames, "setScore:");
          v26 = value;
          v23 = *(void **)&self->_numberOfFrames;
          v27 = timescale;
          v28 = flags;
          v29 = epoch;
          v30 = v10;
          v31 = v11;
          v32 = v12;
          v33 = v13;
          objc_msgSend(v23, "setTimerange:", &v26);
          MADPLLogAnimatedStickerScoring(v5);
        }
        v16 = v6;
        goto LABEL_46;
      }
    }
    else
    {
      v19 = 0;
    }
    if (v6)
      -[VCPMovieHighlight timerange](v6, "timerange");
    else
      memset(&v84, 0, sizeof(v84));
    v50 = v84.duration;
    v20 = CMTimeGetSeconds(&v50) > 2.0;
    goto LABEL_40;
  }
  v16 = 0;
  return v16;
}

- (id)animatedStickerGating
{
  return *(id *)&self->_numberOfFrames;
}

- (float)settlingMotionScore:(id *)a3
{
  uint64_t v4;
  int imageGenerator;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  float *v12;
  float result;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v4 = 0;
  v18 = *MEMORY[0x1E0C80C00];
  imageGenerator = (int)self->_imageGenerator;
  if (imageGenerator <= 1)
    imageGenerator = 1;
  v6 = (float)imageGenerator;
  do
  {
    v7 = *(float *)&-[VCPMovieHighlightAnalyzer settlingMotionScore:]::paramsWeights[v4]
       * (float)(self->_prevMotionParamDiff.__elems_[v4 + 4] / v6);
    if (v7 >= 20.0)
      v8 = 2.0;
    else
      v8 = v7 * 0.1;
    v9 = expf(-(float)(v8 + (float)((float)((float)(self->_sumMotionParam.__elems_[v4 + 4] * 30.0) / v6) * 0.1)));
    *(float *)((char *)&v16 + v4 * 4) = (float)(v9 + v9) / (float)(v9 + 1.0);
    ++v4;
  }
  while (v4 != 6);
  v10 = *(float *)&v16;
  v14 = v16;
  v15 = v17;
  v11 = 4;
  v12 = (float *)&v14;
  do
  {
    if (*(float *)((char *)&v14 + v11) < v10)
    {
      v10 = *(float *)((char *)&v14 + v11);
      v12 = (float *)((char *)&v14 + v11);
    }
    v11 += 4;
  }
  while (v11 != 24);
  result = 1.0;
  if (*v12 < 0.5)
    return 0.0;
  return result;
}

- (float)settlingSubjectScore:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  double width;
  double height;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  int v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSString *v24;
  const __CFDictionary *v25;
  const __CFDictionary *v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  double Seconds;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  CMTimeValue v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  CMTimeValue value;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  unint64_t v51;
  CMTimeValue v52;
  CMTimeValue v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  CMTimeValue v58;
  int *v59;
  int v60;
  int v61;
  BOOL v62;
  float result;
  int v64;
  int v65;
  NSArray *v66;
  NSArray *obj;
  uint64_t v69;
  uint64_t v70;
  CMTime v71;
  CMTime v72;
  CMTime v73;
  CMTime v74;
  CMTimeRange v75;
  CMTimeRange v76;
  CMTime v77;
  CMTimeRange v78;
  CMTimeRange v79;
  CMTimeRange v80;
  CMTimeRange v81;
  CMTimeRange v82;
  CMTimeRange v83;
  CMTimeRange v84;
  CMTimeRange v85;
  CMTime v86;
  CMTime v87;
  CMTime v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  CMTime time2;
  CMTimeRange v94;
  CMTimeRange v95;
  CMTimeRange v96;
  CMTime time1;
  CMTimeRange v98;
  CMTimeRange v99;
  CMTimeRange v100;
  CMTimeRange v101;
  CMTimeRange v102;
  CMTimeRange v103;
  CMTimeRange v104;
  CMTimeRange v105;
  CMTimeRange v106;
  CMTimeRange otherRange;
  CMTimeRange v108;
  CMTimeRange v109;
  CMTime time;
  CMTimeRange range;
  CMTime duration;
  CMTime start;
  CMTimeRange v114;
  CMTime v115;
  CMTime v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  CMTime v121;
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;
  NSRect v125;
  NSRect v126;

  v124 = *MEMORY[0x1E0C80C00];
  memset(&v121, 0, sizeof(v121));
  CMTimeMake(&v121, 0, 600);
  v120 = 0u;
  v119 = 0u;
  v118 = 0u;
  v117 = 0u;
  obj = self->_humanPoseResults;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
  if (v4)
  {
    v64 = 0;
    v65 = 0;
    v69 = *(_QWORD *)v118;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v118 != v69)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v5);
        objc_msgSend(v6, "objectForKey:", CFSTR("attributes"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("humanBounds"));
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("start"));
        v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("duration"));
        v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        memset(&v116, 0, sizeof(v116));
        CMTimeMakeFromDictionary(&v116, v9);
        memset(&v115, 0, sizeof(v115));
        CMTimeMakeFromDictionary(&v115, v10);
        memset(&v114, 0, sizeof(v114));
        start = v116;
        duration = v115;
        CMTimeRangeMake(&v114, &start, &duration);
        v125 = NSRectFromString(v8);
        width = v125.size.width;
        height = v125.size.height;
        *(_OWORD *)&v125.origin.y = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.epoch = *(_OWORD *)&v125.origin.y;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
        time = v116;
        if (!CMTimeRangeContainsTime(&range, &time))
        {

          goto LABEL_25;
        }
        v13 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v108.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v108.start.epoch = v13;
        *(_OWORD *)&v108.duration.timescale = *(_OWORD *)&a3->var1.var1;
        otherRange = v114;
        CMTimeRangeGetIntersection(&v109, &v108, &otherRange);
        if ((v109.start.flags & 1) == 0)
          goto LABEL_10;
        v14 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v105.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v105.start.epoch = v14;
        *(_OWORD *)&v105.duration.timescale = *(_OWORD *)&a3->var1.var1;
        v104 = v114;
        CMTimeRangeGetIntersection(&v106, &v105, &v104);
        if ((v106.duration.flags & 1) == 0)
          goto LABEL_10;
        v15 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v102.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v102.start.epoch = v15;
        *(_OWORD *)&v102.duration.timescale = *(_OWORD *)&a3->var1.var1;
        v101 = v114;
        CMTimeRangeGetIntersection(&v103, &v102, &v101);
        if (v103.duration.epoch)
          goto LABEL_10;
        v17 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v99.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v99.start.epoch = v17;
        *(_OWORD *)&v99.duration.timescale = *(_OWORD *)&a3->var1.var1;
        v98 = v114;
        CMTimeRangeGetIntersection(&v100, &v99, &v98);
        if (v100.duration.value < 0)
          goto LABEL_10;
        v18 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v95.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v95.start.epoch = v18;
        *(_OWORD *)&v95.duration.timescale = *(_OWORD *)&a3->var1.var1;
        v94 = v114;
        CMTimeRangeGetIntersection(&v96, &v95, &v94);
        time1 = v96.duration;
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (CMTimeCompare(&time1, &time2))
        {
LABEL_10:
          v121 = v116;
          v109.start = v116;
          v106.start = v116;
          if (CMTimeCompare(&v109.start, &v106.start) >= 1)
          {
            v121 = v116;
            v16 = v64;
            if (v64 <= v65)
              v16 = v65;
            v64 = v16;
            v65 = 0;
          }
          if (width * height > 0.0500000007)
            ++v65;
        }

        ++v5;
      }
      while (v4 != v5);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v117, v123, 16);
      v4 = v19;
    }
    while (v19);
  }
  else
  {
    v64 = 0;
    v65 = 0;
  }
LABEL_25:

  CMTimeMake(&v114.start, 0, 600);
  v121 = v114.start;
  memset(&v116, 0, sizeof(v116));
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v66 = self->_faceResults;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v89, v122, 16);
  if (v20)
  {
    v70 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v90 != v70)
          objc_enumerationMutation(v66);
        v22 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        objc_msgSend(v22, "objectForKey:", CFSTR("attributes"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", CFSTR("faceBounds"));
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", CFSTR("start"));
        v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", CFSTR("duration"));
        v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        memset(&v115, 0, sizeof(v115));
        CMTimeMakeFromDictionary(&v115, v25);
        memset(&v88, 0, sizeof(v88));
        CMTimeMakeFromDictionary(&v88, v26);
        memset(&v114, 0, sizeof(v114));
        v87 = v115;
        v86 = v88;
        CMTimeRangeMake(&v114, &v87, &v86);
        v126 = NSRectFromString(v24);
        v27 = v126.size.width;
        v28 = v126.size.height;
        *(_OWORD *)&v126.origin.y = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v85.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v85.start.epoch = *(_OWORD *)&v126.origin.y;
        *(_OWORD *)&v85.duration.timescale = *(_OWORD *)&a3->var1.var1;
        v84 = v114;
        CMTimeRangeGetIntersection(&v109, &v85, &v84);
        if ((v109.start.flags & 1) == 0)
          goto LABEL_35;
        v29 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v83.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v83.start.epoch = v29;
        *(_OWORD *)&v83.duration.timescale = *(_OWORD *)&a3->var1.var1;
        v82 = v114;
        CMTimeRangeGetIntersection(&v106, &v83, &v82);
        if ((v106.duration.flags & 1) == 0)
          goto LABEL_35;
        v30 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v81.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v81.start.epoch = v30;
        *(_OWORD *)&v81.duration.timescale = *(_OWORD *)&a3->var1.var1;
        v80 = v114;
        CMTimeRangeGetIntersection(&v103, &v81, &v80);
        if (v103.duration.epoch)
          goto LABEL_35;
        v31 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v79.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v79.start.epoch = v31;
        *(_OWORD *)&v79.duration.timescale = *(_OWORD *)&a3->var1.var1;
        v78 = v114;
        CMTimeRangeGetIntersection(&v100, &v79, &v78);
        if (v100.duration.value < 0)
          goto LABEL_35;
        v32 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v76.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v76.start.epoch = v32;
        *(_OWORD *)&v76.duration.timescale = *(_OWORD *)&a3->var1.var1;
        v75 = v114;
        CMTimeRangeGetIntersection(&v96, &v76, &v75);
        v77 = v96.duration;
        v74 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (CMTimeCompare(&v77, &v74))
        {
LABEL_35:
          if (v27 * v28 > 0.00749999983)
          {
            v73 = v115;
            Seconds = CMTimeGetSeconds(&v73);
            v72 = v88;
            v34 = CMTimeGetSeconds(&v72);
            v71 = v115;
            v35 = (int)(Seconds + v34);
            v36 = (int)CMTimeGetSeconds(&v71);
            v37 = *(_QWORD *)&v116.timescale;
            if (*(_QWORD *)&v116.timescale >= v116.epoch)
            {
              v39 = (*(_QWORD *)&v116.timescale - v116.value) >> 3;
              if ((unint64_t)(v39 + 1) >> 61)
                std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
              v40 = (v116.epoch - v116.value) >> 2;
              if (v40 <= v39 + 1)
                v40 = v39 + 1;
              if (v116.epoch - v116.value >= 0x7FFFFFFFFFFFFFF8uLL)
                v41 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v41 = v40;
              if (v41)
                v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&v116.epoch, v41);
              else
                v42 = 0;
              v43 = &v42[8 * v39];
              *(_QWORD *)v43 = v35 | (v36 << 32);
              v38 = v43 + 8;
              v44 = *(char **)&v116.timescale;
              value = v116.value;
              if (*(_QWORD *)&v116.timescale != v116.value)
              {
                do
                {
                  v46 = *((_QWORD *)v44 - 1);
                  v44 -= 8;
                  *((_QWORD *)v43 - 1) = v46;
                  v43 -= 8;
                }
                while (v44 != (char *)value);
                v44 = (char *)v116.value;
              }
              v116.value = (CMTimeValue)v43;
              *(_QWORD *)&v116.timescale = v38;
              v116.epoch = (CMTimeEpoch)&v42[8 * v41];
              if (v44)
                operator delete(v44);
            }
            else
            {
              **(_QWORD **)&v116.timescale = v35 | (v36 << 32);
              v38 = (_QWORD *)(v37 + 8);
            }
            *(_QWORD *)&v116.timescale = v38;
          }
        }

      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v89, v122, 16);
    }
    while (v20);
  }

  v47 = 126 - 2 * __clz((*(_QWORD *)&v116.timescale - v116.value) >> 3);
  if (*(_QWORD *)&v116.timescale == v116.value)
    v48 = 0;
  else
    v48 = v47;
  std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::tuple<int,int> *,false>(v116.value, *(int **)&v116.timescale, (uint64_t)&v114, v48, 1);
  if (*(_QWORD *)&v116.timescale == v116.value)
  {
    v50 = 0;
    if (v116.value)
    {
LABEL_74:
      *(_QWORD *)&v116.timescale = v116.value;
      operator delete((void *)v116.value);
    }
  }
  else
  {
    v49 = 0;
    v50 = 0;
    v51 = (*(_QWORD *)&v116.timescale - v116.value) >> 3;
    if (v51 <= 1)
      v52 = 1;
    else
      v52 = (*(_QWORD *)&v116.timescale - v116.value) >> 3;
    v53 = v116.value + 12;
    v54 = 1;
    do
    {
      v55 = v49 + 1;
      if (v51 <= v49 + 1)
      {
        v56 = 0;
      }
      else
      {
        v56 = 0;
        v57 = *(_DWORD *)(v116.value + 8 * v49);
        v58 = (*(_QWORD *)&v116.timescale - v116.value) >> 3;
        v59 = (int *)v53;
        do
        {
          v60 = *v59;
          v59 += 2;
          if (v60 < v57)
            ++v56;
          --v58;
        }
        while (v54 != v58);
      }
      if (v56 > v50)
        v50 = v56;
      ++v54;
      v53 += 8;
      v49 = v55;
    }
    while (v55 != v52);
    if (v116.value)
      goto LABEL_74;
  }
  v61 = v64;
  if (v64 <= v65)
    v61 = v65;
  v62 = v50 <= 2 && v61 <= 2;
  result = 1.0;
  if (!v62)
    return 0.0;
  return result;
}

- (float)settlingExposureChangeScore:(id *)a3
{
  __int128 v5;
  NSArray *v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  CMTime v18;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v21;
  CMTimeRange time1;
  CMTimeRange v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTimeRange range;
  CMTime v29;
  CMTime time2;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  memset(&v29, 0, sizeof(v29));
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v29, &range);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = self->_cameraMotionResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  v8 = 1.0;
  if (v7)
  {
    v9 = *(_QWORD *)v25;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(v6);
      v11 = *(const __CFDictionary **)(*((_QWORD *)&v24 + 1) + 8 * v10);
      memset(&v23, 0, sizeof(v23));
      CMTimeRangeMakeFromDictionary(&v23, v11);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v23.start.value;
      time1.start.epoch = v23.start.epoch;
      time2 = v29;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v21 = v23;
      memset(&time1, 0, sizeof(time1));
      v12 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v12;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v21, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, v18 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&duration, &v18)))
      {
        -[__CFDictionary objectForKey:](v11, "objectForKey:", CFSTR("flags"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");
        v15 = (v14 & 0x2FFC0) != 0 && (v14 & 0x1FFC0) == 98304;
        v16 = !v15;

        if (!v16)
        {
          v8 = 0.0;
          break;
        }
      }
      if (v7 == ++v10)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  return v8;
}

- (float)settlingSharpnessScore:(id *)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  float v11;
  float v12;
  float result;
  CMTime time;
  CMTimeRange range;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_keyFrameResults;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    v7 = 1.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.epoch = v10;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
        if (v9)
          objc_msgSend(v9, "timestamp");
        else
          memset(&time, 0, sizeof(time));
        if (CMTimeRangeContainsTime(&range, &time))
        {
          objc_msgSend(v9, "sharpness");
          if (v11 < v7)
          {
            objc_msgSend(v9, "sharpness");
            v7 = v12;
          }
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1.0;
  }

  result = 1.0;
  if (v7 < 0.2)
    return 0.0;
  return result;
}

- (int)analyzeRankingScores:(float)a3 subtleMotion:(float)a4 humanAction:(float)a5
{
  float32x2_t v11;
  int v13;
  float v14;

  __asm { FMOV            V1.2S, #10.0 }
  v11 = vdiv_f32(*(float32x2_t *)&a3, _D1);
  __asm { FMOV            V3.2S, #1.0 }
  self->_animatedStickerGating = (VCPMovieHighlight *)vadd_f32((float32x2_t)vbic_s8(vbsl_s8((int8x8_t)vcge_f32(v11, _D3), (int8x8_t)_D3, (int8x8_t)v11), (int8x8_t)vclez_f32(v11)), (float32x2_t)self->_animatedStickerGating);
  v13 = LODWORD(self->_sumScores[1]);
  if (v13 >= 7)
  {
    v14 = 1.0;
    if (a5 < 1.0)
      v14 = a5;
    if (a5 <= 0.0)
      v14 = 0.0;
    self->_sumScores[0] = v14 + self->_sumScores[0];
  }
  LODWORD(self->_sumScores[1]) = v13 + 1;
  return 0;
}

- (int)analyzeMotionStability:()array<float motionParamDiff:(6UL> *)a3
{
  uint64_t v4;
  float *v5;
  float v6;
  float *v7;

  v4 = 0;
  v5 = &self->_sumMotionParam.__elems_[4];
  do
  {
    v6 = a4->__elems_[v4];
    v7 = &v5[v4];
    if ((float)(v6 * v5[v4 - 12]) < 0.0)
    {
      v5[v4] = v5[v4] + 1.0;
      v6 = a4->__elems_[v4];
    }
    *(v7 - 12) = v6;
    *(v7 - 6) = *(v7 - 6) + fabsf(a3->__elems_[v4++]);
  }
  while (v4 != 6);
  ++LODWORD(self->_imageGenerator);
  return 0;
}

- (float)rankingLevel
{
  float v2;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  uint64_t v16;
  float v17;
  float v18;
  uint64_t v20;
  float v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = 0.0;
  if (SLODWORD(self->_sumScores[1]) >= 8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    do
    {
      *(float *)&v5 = *(float *)((char *)&self->_animatedStickerGating + v6) / (float)SLODWORD(self->_sumScores[1]);
      objc_msgSend(v7, "numberWithFloat:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      v7 = (void *)MEMORY[0x1E0CB37E8];
      v6 += 4;
    }
    while (v6 != 8);
    *(float *)&v5 = self->_sumScores[0] / (float)(LODWORD(self->_sumScores[1]) - 7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

    v10 = 0;
    v21 = 0.0;
    v20 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v13 = v12;

      v14 = flt_1B6FBEA8C[v10];
      if (v13 < v14)
        v15 = 0.0;
      else
        v15 = 1.0;
      *((float *)&v20 + v10) = flt_1B6FBEA98[v10] * (float)((float)(v13 - v14) * v15);
      ++v10;
    }
    while (v10 != 3);
    v16 = 0;
    v17 = *(float *)&v20;
    if (*(float *)&v20 < *((float *)&v20 + 1))
      v17 = *((float *)&v20 + 1);
    if (v17 < v21)
      v17 = v21;
    v2 = 0.0;
    do
    {
      if (v17 <= *(float *)&dword_1B6FBEAA4[v16])
        v18 = 0.0;
      else
        v18 = 1.0;
      v2 = v2 + (float)(v18 / 5.0);
      ++v16;
    }
    while (v16 != 5);

  }
  return v2;
}

- (id)settlingEffects
{
  VCPMovieHighlight *v3;
  double Seconds;
  double v5;
  double v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  double v16;
  float v17;
  CMTimeRange v19;
  CMTimeRange v20;
  CMTimeRange v21;
  CMTimeRange v22;
  CMTimeRange v23;
  CMTimeRange v24;
  CMTime duration;
  CMTime time;
  CMTime end;
  CMTime start;
  CMTimeRange v29;
  CMTimeRange v30;

  if (LOBYTE(self->_maxHighlightScore) && -[NSArray count](self->_qualityResults, "count"))
  {
    v3 = objc_alloc_init(VCPMovieHighlight);
    memset(&v30, 0, sizeof(v30));
    CMTimeRangeMakeFromDictionary(&v30, (CFDictionaryRef)-[NSArray firstObject](self->_qualityResults, "firstObject"));
    memset(&v29, 0, sizeof(v29));
    CMTimeMakeWithSeconds(&start, (float)(self->_minHighlightScore + -0.5), 600);
    CMTimeMakeWithSeconds(&end, self->_minHighlightScore, 600);
    CMTimeRangeFromTimeToTime(&v29, &start, &end);
    time = v29.duration;
    Seconds = CMTimeGetSeconds(&time);
    duration = v29.duration;
    -[VCPMovieHighlight setIsTrimmed:](v3, "setIsTrimmed:", Seconds < CMTimeGetSeconds(&duration));
    v24 = v29;
    -[VCPMovieHighlightAnalyzer analyzeOverallQuality:isSettlingEffect:isAnimatedSticker:](self, "analyzeOverallQuality:isSettlingEffect:isAnimatedSticker:", &v24, 1, 0);
    -[VCPMovieHighlight setAutoplayScore:](v3, "setAutoplayScore:");
    v23 = v29;
    -[VCPMovieHighlightAnalyzer settlingMotionScore:](self, "settlingMotionScore:", &v23);
    -[VCPMovieHighlight setMotionScore:](v3, "setMotionScore:");
    v22 = v29;
    -[VCPMovieHighlightAnalyzer settlingSubjectScore:](self, "settlingSubjectScore:", &v22);
    -[VCPMovieHighlight setSubjectScore:](v3, "setSubjectScore:");
    v21 = v29;
    -[VCPMovieHighlightAnalyzer settlingExposureChangeScore:](self, "settlingExposureChangeScore:", &v21);
    -[VCPMovieHighlight setExposureChangeScore:](v3, "setExposureChangeScore:");
    v20 = v29;
    -[VCPMovieHighlightAnalyzer settlingSharpnessScore:](self, "settlingSharpnessScore:", &v20);
    -[VCPMovieHighlight setSharpnessScore:](v3, "setSharpnessScore:");
    if (*(&self->_isLivePhoto + 3))
      *(float *)&v5 = 0.0;
    else
      *(float *)&v5 = 1.0;
    -[VCPMovieHighlight setZoomChangeScore:](v3, "setZoomChangeScore:", v5);
    if (*(&self->_isLivePhoto + 1))
      *(float *)&v6 = 0.0;
    else
      *(float *)&v6 = 1.0;
    -[VCPMovieHighlight setFlashScore:](v3, "setFlashScore:", v6);
    v19 = v29;
    -[VCPMovieHighlight setTimerange:](v3, "setTimerange:", &v19);
    -[VCPMovieHighlight autoplayScore](v3, "autoplayScore");
    v8 = v7;
    -[VCPMovieHighlight exposureChangeScore](v3, "exposureChangeScore");
    v10 = v9;
    -[VCPMovieHighlight sharpnessScore](v3, "sharpnessScore");
    v12 = v11;
    -[VCPMovieHighlight zoomChangeScore](v3, "zoomChangeScore");
    v14 = v13;
    -[VCPMovieHighlight flashScore](v3, "flashScore");
    *(float *)&v16 = (float)((float)((float)(v8 * v10) * v12) * v14) * v15;
    -[VCPMovieHighlight setScore:](v3, "setScore:", v16);
    -[VCPMovieHighlight score](v3, "score");
    -[VCPMovieHighlight setIsSettlingOK:](v3, "setIsSettlingOK:", v17 > 0.8);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)updateCropHeatMap:(float *)a3 withResults:(id)a4 timeRange:(id *)a5 resultsKey:(id)a6
{
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  uint64_t i;
  const __CFDictionary *v14;
  __int128 v15;
  void *v16;
  void *v17;
  NSString *v18;
  CGFloat y;
  double width;
  double height;
  void *v22;
  float v23;
  NSString *v24;
  float v25;
  NSString *v26;
  void *v27;
  float v28;
  NSString *v29;
  uint64_t v30;
  float *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double Seconds;
  Float64 v37;
  float v38;
  __CFString *v41;
  id obj;
  float v43;
  CGRect r2;
  CMTime duration;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v51;
  CMTimeRange v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;
  NSRect v59;
  NSRect v60;
  NSRect v61;
  NSRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v41 = (__CFString *)a6;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v8;
  v9 = 0;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v54;
    v12 = 10.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v54 != v11)
          objc_enumerationMutation(obj);
        v14 = *(const __CFDictionary **)(*((_QWORD *)&v53 + 1) + 8 * i);
        memset(&v52, 0, sizeof(v52));
        CMTimeRangeMakeFromDictionary(&v52, v14);
        range = v52;
        memset(&v51, 0, sizeof(v51));
        v15 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
        *(_OWORD *)&otherRange.start.epoch = v15;
        *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
        CMTimeRangeGetIntersection(&v51, &range, &otherRange);
        if ((v51.start.flags & 1) != 0
          && (v51.duration.flags & 1) != 0
          && !v51.duration.epoch
          && (v51.duration.value & 0x8000000000000000) == 0)
        {
          time1 = v51.duration;
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          if (!CMTimeCompare(&time1, &time2))
            continue;
        }
        time = v51.duration;
        if (CMTimeGetSeconds(&time) < 10.0)
        {
          -[__CFDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("attributes"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (CFSTR("FaceResults") == v41)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("faceBounds"));
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v60 = NSRectFromString(v24);
            r2.origin.x = v60.origin.x;
            y = v60.origin.y;
            width = v60.size.width;
            height = v60.size.height;

            v25 = 1.0;
            if (width * height > 0.0149999997)
              v25 = 4.0;
            v43 = v25;
          }
          else if (CFSTR("PetsResults") == v41)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("petsBounds"));
            v26 = (NSString *)objc_claimAutoreleasedReturnValue();
            v61 = NSRectFromString(v26);
            r2.origin.x = v61.origin.x;
            y = v61.origin.y;
            width = v61.size.width;
            height = v61.size.height;

            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("petsConfidence"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "floatValue");
            v43 = v28;

          }
          else
          {
            if (CFSTR("SaliencyResults") == v41)
            {
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("saliencyBounds"));
              v29 = (NSString *)objc_claimAutoreleasedReturnValue();
              v62 = NSRectFromString(v29);
              r2.origin.x = v62.origin.x;
              y = v62.origin.y;
              width = v62.size.width;
              height = v62.size.height;

              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("saliencyConfidence"));
            }
            else
            {
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("humanBounds"));
              v18 = (NSString *)objc_claimAutoreleasedReturnValue();
              v59 = NSRectFromString(v18);
              r2.origin.x = v59.origin.x;
              y = v59.origin.y;
              width = v59.size.width;
              height = v59.size.height;

              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("humanConfidence"));
            }
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "floatValue");
            v43 = v23;

          }
          v30 = 0;
          v31 = a3;
          do
          {
            v32 = 0;
            v33 = (float)((float)(int)v30 / v12);
            do
            {
              v63.origin.x = (float)((float)(int)v32 / v12);
              v63.origin.y = v33;
              v63.size.width = 0.1;
              v63.size.height = 0.1;
              v65.origin.x = r2.origin.x;
              v65.origin.y = y;
              v65.size.width = width;
              v65.size.height = height;
              v64 = CGRectIntersection(v63, v65);
              v34 = v64.size.width;
              v35 = v64.size.height;
              if (!CGRectIsNull(v64))
              {
                duration = v51.duration;
                Seconds = CMTimeGetSeconds(&duration);
                *(_OWORD *)&r2.origin.y = *(_OWORD *)&a5->var1.var0;
                *(_QWORD *)&r2.size.height = a5->var1.var3;
                v37 = CMTimeGetSeconds((CMTime *)&r2.origin.y);
                v38 = v34 * v35 * 10.0 * 10.0;
                *(float *)&v37 = Seconds / v37;
                v31[v32] = v31[v32] + (float)((float)(v38 * *(float *)&v37) * v43);
                v12 = 10.0;
              }
              ++v32;
            }
            while (v32 != 10);
            ++v30;
            v31 += 10;
          }
          while (v30 != 10);

          v9 = 1;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v10);
  }

  return v9 & 1;
}

- (CGRect)computeBestPlaybackCrop:(id *)a3
{
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSArray *faceResults;
  __int128 v11;
  unsigned int v12;
  NSArray *petsResults;
  __int128 v14;
  unsigned int v15;
  NSArray *saliencyResults;
  __int128 v17;
  unsigned int v18;
  NSArray *humanPoseResults;
  __int128 v20;
  float v21;
  float v22;
  uint64_t v23;
  double v24;
  float v25;
  _OWORD *v26;
  _OWORD *v27;
  _OWORD *v28;
  _OWORD *v29;
  double v30;
  uint64_t i;
  float v32;
  double v33;
  float v34;
  double width;
  double height;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  double v42;
  double v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  double v49;
  double v50;
  BOOL v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _OWORD v58[3];
  _OWORD v59[3];
  _OWORD v60[3];
  _OWORD v61[3];
  uint8_t buf[16];
  _OWORD v63[25];
  _OWORD v64[25];
  _OWORD v65[25];
  _OWORD v66[25];
  uint64_t v67;
  CGRect result;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = self->_frameSize.width == *MEMORY[0x1E0C9D820];
  memset(v66, 0, sizeof(v66));
  memset(v65, 0, sizeof(v65));
  memset(v64, 0, sizeof(v64));
  memset(v63, 0, sizeof(v63));
  if (v5 && self->_frameSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v6 = 1.0;
    v7 = 0.0;
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalid Frame Size for Playback crop", buf, 2u);
    }
    v8 = 0.0;
    v9 = 1.0;
  }
  else
  {
    faceResults = self->_faceResults;
    v11 = *(_OWORD *)&a3->var0.var3;
    v61[0] = *(_OWORD *)&a3->var0.var0;
    v61[1] = v11;
    v61[2] = *(_OWORD *)&a3->var1.var1;
    v12 = -[VCPMovieHighlightAnalyzer updateCropHeatMap:withResults:timeRange:resultsKey:](self, "updateCropHeatMap:withResults:timeRange:resultsKey:", v66, faceResults, v61, CFSTR("FaceResults"));
    petsResults = self->_petsResults;
    v14 = *(_OWORD *)&a3->var0.var3;
    v60[0] = *(_OWORD *)&a3->var0.var0;
    v60[1] = v14;
    v60[2] = *(_OWORD *)&a3->var1.var1;
    v15 = -[VCPMovieHighlightAnalyzer updateCropHeatMap:withResults:timeRange:resultsKey:](self, "updateCropHeatMap:withResults:timeRange:resultsKey:", v65, petsResults, v60, CFSTR("PetsResults"));
    saliencyResults = self->_saliencyResults;
    v17 = *(_OWORD *)&a3->var0.var3;
    v59[0] = *(_OWORD *)&a3->var0.var0;
    v59[1] = v17;
    v59[2] = *(_OWORD *)&a3->var1.var1;
    v18 = -[VCPMovieHighlightAnalyzer updateCropHeatMap:withResults:timeRange:resultsKey:](self, "updateCropHeatMap:withResults:timeRange:resultsKey:", v64, saliencyResults, v59, CFSTR("SaliencyResults"));
    humanPoseResults = self->_humanPoseResults;
    v20 = *(_OWORD *)&a3->var0.var3;
    v58[0] = *(_OWORD *)&a3->var0.var0;
    v58[1] = v20;
    v58[2] = *(_OWORD *)&a3->var1.var1;
    v21 = (float)((float)((float)((float)v18 * 0.2) + (float)((float)v12 * 0.5))
                + (float)((float)-[VCPMovieHighlightAnalyzer updateCropHeatMap:withResults:timeRange:resultsKey:](self, "updateCropHeatMap:withResults:timeRange:resultsKey:", v63, humanPoseResults, v58, CFSTR("HumanPoseResults"))* 0.3))+ (float)((float)v15 * 0.25);
    v22 = 5.5;
    if (v21 == 0.0)
    {
      v34 = 5.5;
    }
    else
    {
      v23 = 0;
      v24 = 0.0;
      v25 = 0.0;
      v26 = v63;
      v27 = v64;
      v28 = v65;
      v29 = v66;
      v30 = 0.0;
      do
      {
        for (i = 0; i != 10; ++i)
        {
          v32 = (float)((float)((float)((float)(*((float *)v28 + i) * 0.25) + (float)(*((float *)v29 + i) * 0.5))
                              + (float)(*((float *)v27 + i) * 0.2))
                      + (float)(*((float *)v26 + i) * 0.3))
              / v21;
          v25 = v25 + v32;
          v33 = v32;
          v30 = v30 + v33 * ((double)(int)i + 0.5);
          v24 = v24 + v33 * ((double)(int)v23 + 0.5);
        }
        ++v23;
        v26 = (_OWORD *)((char *)v26 + 40);
        v27 = (_OWORD *)((char *)v27 + 40);
        v28 = (_OWORD *)((char *)v28 + 40);
        v29 = (_OWORD *)((char *)v29 + 40);
      }
      while (v23 != 10);
      v34 = 5.5;
      if (v25 != 0.0)
      {
        v22 = v30 / v25;
        v34 = v24 / v25;
      }
    }
    width = self->_frameSize.width;
    height = self->_frameSize.height;
    v37 = height / width;
    v38 = v37 * 0.5;
    v39 = 1.0 - (float)(v37 * 0.5);
    v40 = v22 / 10.0;
    if (v40 < v39)
      v39 = v40;
    if (v40 <= v38)
      v41 = v37 * 0.5;
    else
      v41 = v39;
    v42 = (float)(v41 * 10.0) / 10.0 - v38;
    v43 = v37;
    v44 = width / height;
    v45 = v44 * 0.5;
    v46 = 1.0 - (float)(v44 * 0.5);
    v47 = v34 / 10.0;
    if (v47 < v46)
      v46 = v47;
    if (v47 <= v45)
      v48 = v44 * 0.5;
    else
      v48 = v46;
    v49 = (float)(v48 * 10.0) / 10.0 - v45;
    v50 = v44;
    v51 = width < height;
    if (width >= height)
      v49 = 0.0;
    else
      v42 = 0.0;
    if (width < height)
      v52 = 1.0;
    else
      v52 = v43;
    if (!v51)
      v50 = 1.0;
    if (v42 < 1.0)
      v53 = v42;
    else
      v53 = 1.0;
    if (v42 <= 0.0)
      v7 = 0.0;
    else
      v7 = v53;
    if (v49 < 1.0)
      v8 = v49;
    else
      v8 = 1.0;
    if (v49 <= 0.0)
      v8 = 0.0;
    v54 = 1.0 - v7;
    if (v52 < 1.0 - v7)
      v54 = v52;
    if (v52 <= 0.0)
      v6 = 0.0;
    else
      v6 = v54;
    v55 = 1.0 - v8;
    if (v50 < 1.0 - v8)
      v55 = v50;
    if (v50 <= 0.0)
      v9 = 0.0;
    else
      v9 = v55;
  }
  v56 = v7;
  v57 = v6;
  result.size.height = v9;
  result.size.width = v57;
  result.origin.y = v8;
  result.origin.x = v56;
  return result;
}

- (id)results
{
  return self->_internalConstraintResults;
}

- (id)highlightScoreResults
{
  return self->_internalResults;
}

- (void)generateExpressionSegments:(id *)a3
{
  void *v5;
  VCPExpressionSegment *v6;
  __int128 v7;
  double v8;
  uint64_t v9;
  CMTime *v10;
  uint64_t i;
  const __CFDictionary *v12;
  float v13;
  unint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  void *v19;
  void *v20;
  VCPExpressionSegment *v21;
  VCPExpressionSegment *v22;
  double v23;
  NSMutableArray *v24;
  NSMutableArray *expressionSegments;
  VCPExpressionSegment *v26;
  NSArray *obj;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSString *aString;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  CMTimeRange v41;
  CMTimeRange v42;
  CMTimeRange v43;
  CMTime v44;
  CMTimeRange v45;
  CMTime v46;
  CMTimeRange v47;
  CMTimeRange v48;
  CMTime end;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CMTime start;
  CMTimeRange v54;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v59;
  CMTimeRange v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _OWORD v65[3];
  _BYTE v66[128];
  uint64_t v67;
  NSRect v68;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(VCPExpressionSegment);
  v7 = *(_OWORD *)&a3->var0.var3;
  v65[0] = *(_OWORD *)&a3->var0.var0;
  v65[1] = v7;
  v65[2] = *(_OWORD *)&a3->var1.var1;
  v26 = v6;
  -[VCPExpressionSegment setTimeRange:](v6, "setTimeRange:", v65);
  LODWORD(v8) = 0;
  -[VCPExpressionSegment setScore:](v6, "setScore:", v8);
  -[NSMutableArray addObject:](self->_expressionSegments, "addObject:", v6);
  v64 = 0u;
  v63 = 0u;
  v62 = 0u;
  v61 = 0u;
  obj = self->_faceResults;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v9)
  {
    v28 = *(_QWORD *)v62;
    v10 = (CMTime *)MEMORY[0x1E0CA2E68];
    do
    {
      v29 = v9;
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v62 != v28)
          objc_enumerationMutation(obj);
        v12 = *(const __CFDictionary **)(*((_QWORD *)&v61 + 1) + 8 * i);
        memset(&v60, 0, sizeof(v60));
        CMTimeRangeMakeFromDictionary(&v60, v12);
        -[__CFDictionary objectForKey:](v12, "objectForKey:", CFSTR("attributes"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", CFSTR("faceBounds"));
        aString = (NSString *)objc_claimAutoreleasedReturnValue();
        -[__CFDictionary objectForKey:](v12, "objectForKey:", CFSTR("flags"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = objc_msgSend(v31, "intValue");
        v68 = NSRectFromString(aString);
        *(float *)&v68.origin.x = v68.size.width * v68.size.height + -0.170000002;
        v13 = expf((float)-(float)(*(float *)&v68.origin.x * *(float *)&v68.origin.x)/ -[VCPMovieHighlightAnalyzer computeExpressionScoreInTimerange:]::kAreaSigma[*(float *)&v68.origin.x > 0.0]);
        v14 = 0;
        if ((v12 & 2) != 0)
          v15 = 0.3;
        else
          v15 = 0.0;
        v16 = v15 + v13;
        if (v16 < 1.0)
          v17 = v16;
        else
          v17 = 1.0;
        if (v16 <= 0.0)
          v18 = 0.0;
        else
          v18 = v17;
        while (v14 < -[NSMutableArray count](self->_expressionSegments, "count"))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_expressionSegments, "objectAtIndexedSubscript:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          memset(&v59, 0, sizeof(v59));
          range = v60;
          if (v19)
            objc_msgSend(v19, "timeRange");
          else
            memset(&otherRange, 0, sizeof(otherRange));
          CMTimeRangeGetIntersection(&v59, &range, &otherRange);
          if ((v59.start.flags & 1) == 0
            || (v59.duration.flags & 1) == 0
            || v59.duration.epoch
            || v59.duration.value < 0
            || (time1 = v59.duration, time2 = *v10, CMTimeCompare(&time1, &time2)))
          {
            v21 = objc_alloc_init(VCPExpressionSegment);
            if (v20)
            {
              objc_msgSend(v20, "timeRange");
            }
            else
            {
              v51 = 0u;
              v52 = 0u;
              v50 = 0u;
            }
            *(_OWORD *)&start.value = v50;
            start.epoch = v51;
            end = v59.start;
            CMTimeRangeFromTimeToTime(&v54, &start, &end);
            v48 = v54;
            -[VCPExpressionSegment setTimeRange:](v21, "setTimeRange:", &v48);
            objc_msgSend(v20, "score");
            -[VCPExpressionSegment setScore:](v21, "setScore:");
            v22 = objc_alloc_init(VCPExpressionSegment);
            v45 = v59;
            CMTimeRangeGetEnd(&v46, &v45);
            if (v20)
              objc_msgSend(v20, "timeRange");
            else
              memset(&v43, 0, sizeof(v43));
            CMTimeRangeGetEnd(&v44, &v43);
            CMTimeRangeFromTimeToTime(&v47, &v46, &v44);
            v42 = v47;
            -[VCPExpressionSegment setTimeRange:](v22, "setTimeRange:", &v42);
            objc_msgSend(v20, "score");
            -[VCPExpressionSegment setScore:](v22, "setScore:");
            v41 = v59;
            objc_msgSend(v20, "setTimeRange:", &v41);
            objc_msgSend(v20, "score");
            if (v18 >= *(float *)&v23)
              *(float *)&v23 = v18;
            objc_msgSend(v20, "setScore:", v23);
            if (!v21
              || (-[VCPExpressionSegment timeRange](v21, "timeRange"), (BYTE12(v50) & 1) == 0)
              || (-[VCPExpressionSegment timeRange](v21, "timeRange"), (v40 & 1) == 0)
              || (-[VCPExpressionSegment timeRange](v21, "timeRange"), v39)
              || (-[VCPExpressionSegment timeRange](v21, "timeRange"), v38 < 0)
              || (-[VCPExpressionSegment timeRange](v21, "timeRange"), v37 = v36, v35 = *v10, CMTimeCompare(&v37, &v35)))
            {
              objc_msgSend(v5, "addObject:", v21);
            }
            objc_msgSend(v5, "addObject:", v20);
            if (!v22
              || (-[VCPExpressionSegment timeRange](v22, "timeRange"), (BYTE12(v50) & 1) == 0)
              || (-[VCPExpressionSegment timeRange](v22, "timeRange"), (v40 & 1) == 0)
              || (-[VCPExpressionSegment timeRange](v22, "timeRange"), v39)
              || (-[VCPExpressionSegment timeRange](v22, "timeRange"), v38 < 0)
              || (-[VCPExpressionSegment timeRange](v22, "timeRange"), v34 = v36, v33 = *v10, CMTimeCompare(&v34, &v33)))
            {
              objc_msgSend(v5, "addObject:", v22);
            }

          }
          else
          {
            objc_msgSend(v5, "addObject:", v20);
          }

          ++v14;
        }
        v24 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
        expressionSegments = self->_expressionSegments;
        self->_expressionSegments = v24;

        objc_msgSend(v5, "removeAllObjects");
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v9);
  }

}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)computeQualityTrimFor:(SEL)a3 withKeyFrame:(id *)a4
{
  __int128 v8;
  __int128 v9;
  CMTime *v10;
  uint64_t v11;
  const __CFDictionary *v12;
  __int128 v13;
  void *v14;
  float v15;
  BOOL v16;
  uint64_t v17;
  const __CFDictionary *v18;
  __int128 v19;
  void *v20;
  float v21;
  BOOL v22;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  uint64_t v24;
  void *v25;
  float v26;
  uint64_t v27;
  void *v28;
  float v29;
  __int128 v30;
  __int128 v31;
  NSArray *orientationResults;
  __int128 v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  const __CFDictionary *v38;
  __int128 v39;
  __int128 v40;
  CMTimeRange *p_time2;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BOOL4 v45;
  CMTime v46;
  CMTime v47;
  CMTimeRange v48;
  CMTimeRange v49;
  CMTimeRange time2;
  CMTimeRange v51;
  CMTimeRange v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CMTimeRange v57;
  CMTimeRange v58;
  CMTime v59;
  CMTime v60;
  CMTime end;
  CMTime start;
  CMTimeRange v63;
  CMTime v64;
  CMTime v65;
  CMTimeRange v66;
  CMTimeRange v67;
  CMTimeRange v68;
  CMTime v69;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v72;
  CMTimeRange time1;
  CMTimeRange v74;
  CMTime v75;
  CMTime v76;
  CMTimeRange range;
  CMTime v78;
  __int128 v79;
  CMTimeEpoch var3;
  CMTime v81;
  CMTime v82;
  _BYTE v83[128];
  uint64_t v84;

  v45 = a5;
  v84 = *MEMORY[0x1E0C80C00];
  v8 = *(_OWORD *)&a4->var0.var3;
  v79 = *(_OWORD *)&a4->var0.var0;
  v9 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&range.start.epoch = v8;
  var3 = a4->var0.var3;
  memset(&v78, 0, sizeof(v78));
  *(_OWORD *)&range.duration.timescale = v9;
  CMTimeRangeGetEnd(&v78, &range);
  v10 = (CMTime *)MEMORY[0x1E0CA2E68];
  v76 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v75 = v76;
  if (-[NSArray count](self->_qualityResults, "count"))
  {
    v11 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_qualityResults, "objectAtIndexedSubscript:", v11);
      v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      memset(&v74, 0, sizeof(v74));
      CMTimeRangeMakeFromDictionary(&v74, v12);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v74.start.value;
      time1.start.epoch = v74.start.epoch;
      time2.start = v78;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0)
        break;
      v72 = v74;
      memset(&time1, 0, sizeof(time1));
      v13 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v13;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v72, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, v69 = *v10, CMTimeCompare(&duration, &v69)))
      {
        -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("quality"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        v16 = v15 < 0.3;

        if (!v16)
        {
          v76 = time1.start;
          break;
        }
      }

      if (++v11 >= -[NSArray count](self->_qualityResults, "count"))
        goto LABEL_14;
    }

  }
LABEL_14:
  v17 = -[NSArray count](self->_qualityResults, "count");
  if (v17 - 1 >= 0)
  {
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_qualityResults, "objectAtIndexedSubscript:", --v17);
      v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      memset(&v74, 0, sizeof(v74));
      CMTimeRangeMakeFromDictionary(&v74, v18);
      v68 = v74;
      CMTimeRangeGetEnd(&v82, &v68);
      time1.start = v82;
      *(_OWORD *)&time2.start.value = v79;
      time2.start.epoch = var3;
      if (CMTimeCompare(&time1.start, &time2.start) < 0)
        break;
      memset(&time1, 0, sizeof(time1));
      v67 = v74;
      v19 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)&v66.start.value = *(_OWORD *)&a4->var0.var0;
      *(_OWORD *)&v66.start.epoch = v19;
      *(_OWORD *)&v66.duration.timescale = *(_OWORD *)&a4->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v67, &v66);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v65 = time1.duration, v64 = *v10, CMTimeCompare(&v65, &v64)))
      {
        -[__CFDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", CFSTR("quality"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "floatValue");
        v22 = v21 < 0.3;

        if (!v22)
        {
          v63 = time1;
          CMTimeRangeGetEnd(&time2.start, &v63);
          v75 = time2.start;
          break;
        }
      }

      if (v17 <= 0)
        goto LABEL_26;
    }

  }
LABEL_26:
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  start = v76;
  end = v75;
  result = ($C7CBA4C8288BA02ADCCB8E56B4665FF4 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &end);
  if (v45)
  {
    if (-[NSArray count](self->_keyFrameResults, "count"))
    {
      v24 = 0;
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_keyFrameResults, "objectAtIndexedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sharpness");
        if (v26 >= 0.2)
          break;

        if (++v24 >= -[NSArray count](self->_keyFrameResults, "count"))
          goto LABEL_36;
      }
      if (v25)
        objc_msgSend(v25, "timestamp");
      else
        memset(&v74, 0, 24);
      v76 = v74.start;

    }
LABEL_36:
    v27 = -[NSArray count](self->_keyFrameResults, "count");
    if (v27 - 1 >= 0)
    {
      while (1)
      {
        -[NSArray objectAtIndexedSubscript:](self->_keyFrameResults, "objectAtIndexedSubscript:", --v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sharpness");
        if (v29 >= 0.2)
          break;

        if (v27 <= 0)
          goto LABEL_46;
      }
      if (v27 < -[NSArray count](self->_keyFrameResults, "count") - 1)
      {
        if (v28)
          objc_msgSend(v28, "timestamp");
        else
          memset(&v74, 0, 24);
        v75 = v74.start;
      }

    }
LABEL_46:
    memset(&v74, 0, sizeof(v74));
    v60 = v76;
    v59 = v75;
    CMTimeRangeFromTimeToTime(&v74, &v60, &v59);
    v30 = *(_OWORD *)&retstr->var0.var3;
    *(_OWORD *)&v58.start.value = *(_OWORD *)&retstr->var0.var0;
    *(_OWORD *)&v58.start.epoch = v30;
    *(_OWORD *)&v58.duration.timescale = *(_OWORD *)&retstr->var1.var1;
    v57 = v74;
    result = ($C7CBA4C8288BA02ADCCB8E56B4665FF4 *)CMTimeRangeGetIntersection(&time1, &v58, &v57);
    v31 = *(_OWORD *)&time1.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&time1.start.value;
    *(_OWORD *)&retstr->var0.var3 = v31;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&time1.duration.timescale;
  }
  orientationResults = self->_orientationResults;
  if (orientationResults)
  {
    v33 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)&v74.start.value = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)&v74.start.epoch = v33;
    *(_OWORD *)&v74.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v34 = orientationResults;
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v53, v83, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v54;
      while (2)
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v54 != v36)
            objc_enumerationMutation(v34);
          v38 = *(const __CFDictionary **)(*((_QWORD *)&v53 + 1) + 8 * i);
          memset(&time1, 0, sizeof(time1));
          CMTimeRangeMakeFromDictionary(&time1, v38);
          v52 = time1;
          v39 = *(_OWORD *)&retstr->var0.var3;
          *(_OWORD *)&v51.start.value = *(_OWORD *)&retstr->var0.var0;
          *(_OWORD *)&v51.start.epoch = v39;
          *(_OWORD *)&v51.duration.timescale = *(_OWORD *)&retstr->var1.var1;
          if (CMTimeRangeContainsTimeRange(&v52, &v51))
          {

            return result;
          }
          v49 = time1;
          memset(&time2, 0, sizeof(time2));
          v40 = *(_OWORD *)&retstr->var0.var3;
          *(_OWORD *)&v48.start.value = *(_OWORD *)&retstr->var0.var0;
          *(_OWORD *)&v48.start.epoch = v40;
          *(_OWORD *)&v48.duration.timescale = *(_OWORD *)&retstr->var1.var1;
          CMTimeRangeGetIntersection(&time2, &v49, &v48);
          if ((time2.start.flags & 1) != 0
            && (time2.duration.flags & 1) != 0
            && !time2.duration.epoch
            && (time2.duration.value & 0x8000000000000000) == 0)
          {
            v47 = time2.duration;
            v46 = *v10;
            if (!CMTimeCompare(&v47, &v46))
              continue;
          }
          v82 = time2.duration;
          v81 = v74.duration;
          if (CMTimeCompare(&v82, &v81) <= 0)
            p_time2 = &v74;
          else
            p_time2 = &time2;
          v42 = *(_OWORD *)&p_time2->start.value;
          v43 = *(_OWORD *)&p_time2->start.epoch;
          *(_OWORD *)&v74.duration.timescale = *(_OWORD *)&p_time2->duration.timescale;
          *(_OWORD *)&v74.start.epoch = v43;
          *(_OWORD *)&v74.start.value = v42;
        }
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v53, v83, 16);
        if (v35)
          continue;
        break;
      }
    }

    v44 = *(_OWORD *)&v74.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v74.start.value;
    *(_OWORD *)&retstr->var0.var3 = v44;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v74.duration.timescale;
  }
  return result;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)computeActionFaceTrimFor:(SEL)a3
{
  id *v4;
  CMTime *v5;
  CMTimeRange *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFDictionary *v10;
  __int128 v11;
  void *v12;
  NSString *v13;
  double width;
  double height;
  void *v16;
  float v17;
  double Seconds;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFDictionary *v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  float v27;
  float v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const __CFDictionary *v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  void *v38;
  float v39;
  float v40;
  double v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  const __CFDictionary *v45;
  __int128 v46;
  __int128 v47;
  void *v48;
  float v49;
  float v50;
  __int128 v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const __CFDictionary *v56;
  void *v57;
  float v58;
  float v59;
  __int128 v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const __CFDictionary *v65;
  void *v66;
  uint64_t v67;
  double v68;
  double v69;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  uint64_t v71;
  __int128 v72;
  CMTime *v73;
  __int128 v74;
  __int128 v75;
  CMTimeFlags v76;
  CMTimeEpoch v77;
  CMTimeRange *v78;
  uint64_t v79;
  uint64_t v80;
  id *v81;
  id obj;
  id obja;
  id objb;
  id objc;
  CMTimeEpoch epoch;
  CMTime *v87;
  CMTimeFlags flags;
  CMTime end;
  CMTime start;
  CMTimeRange v91;
  CMTimeRange v92;
  CMTimeRange v93;
  CMTime v94;
  CMTime v95;
  CMTime v96;
  CMTime v97;
  CMTime v98;
  CMTime v99;
  CMTimeRange v100;
  CMTimeRange v101;
  CMTimeRange v102;
  CMTimeRange v103;
  CMTimeRange v104;
  CMTime v105;
  CMTime v106;
  CMTimeRange v107;
  CMTimeRange v108;
  CMTimeRange v109;
  CMTime v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  CMTimeRange v115;
  CMTimeRange v116;
  CMTimeRange v117;
  CMTime v118;
  CMTime v119;
  CMTimeRange v120;
  CMTimeRange v121;
  CMTimeRange v122;
  CMTimeRange v123;
  CMTimeRange v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  CMTimeRange v129;
  CMTime v130;
  CMTime v131;
  CMTimeRange v132;
  CMTimeRange v133;
  CMTimeRange v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  CMTimeRange v139;
  CMTimeRange v140;
  CMTime v141;
  CMTime v142;
  CMTime v143;
  CMTime v144;
  CMTime v145;
  CMTime v146;
  CMTimeRange v147;
  CMTimeRange v148;
  CMTimeRange v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  CMTimeRange v154;
  CMTimeRange v155;
  CMTime v156;
  CMTime v157;
  CMTime v158;
  CMTime v159;
  CMTime v160;
  CMTime duration;
  CMTimeRange v162;
  CMTimeRange v163;
  CMTimeRange v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  CMTimeRange v169;
  CMTimeRange v170;
  CMTime v171;
  CMTime v172;
  CMTime v173;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v179;
  CMTimeRange v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  CMTime v185;
  _BYTE v186[128];
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v194;
  NSRect v195;

  v4 = (id *)MEMORY[0x1E0C80A78](retstr, self, a3, a4);
  v87 = v5;
  v78 = v6;
  v194 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&v185.value = *MEMORY[0x1E0CA2E18];
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v185.epoch = epoch;
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v181 = 0u;
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v81 = v4;
  obj = v4[3];
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v191, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v182;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v182 != v8)
          objc_enumerationMutation(obj);
        v10 = *(const __CFDictionary **)(*((_QWORD *)&v181 + 1) + 8 * i);
        memset(&v180, 0, sizeof(v180));
        CMTimeRangeMakeFromDictionary(&v180, v10);
        range = v180;
        v11 = *(_OWORD *)&v87->epoch;
        *(_OWORD *)&otherRange.start.value = *(_OWORD *)&v87->value;
        memset(&v179, 0, sizeof(v179));
        *(_OWORD *)&otherRange.start.epoch = v11;
        *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&v87[1].timescale;
        CMTimeRangeGetIntersection(&v179, &range, &otherRange);
        if ((v179.start.flags & 1) != 0
          && (v179.duration.flags & 1) != 0
          && !v179.duration.epoch
          && (v179.duration.value & 0x8000000000000000) == 0)
        {
          time1 = v179.duration;
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          if (!CMTimeCompare(&time1, &time2))
            continue;
        }
        -[__CFDictionary objectForKey:](v10, "objectForKey:", CFSTR("attributes"), v78);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("faceBounds"));
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        v195 = NSRectFromString(v13);
        width = v195.size.width;
        height = v195.size.height;
        -[__CFDictionary objectForKey:](v10, "objectForKey:", CFSTR("flags"), v195.origin.x, v195.origin.y);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "intValue") & 2) != 0 || (v17 = width * height, v17 >= 0.02) && v17 <= 0.6)
        {
          if ((v185.flags & 1) == 0
            || (time = v185, Seconds = CMTimeGetSeconds(&time), v173 = v179.start, Seconds > CMTimeGetSeconds(&v173)))
          {
            v185 = v179.start;
          }
          if ((flags & 1) == 0
            || (v172.value = value,
                v172.timescale = timescale,
                v172.flags = flags,
                v172.epoch = epoch,
                v19 = CMTimeGetSeconds(&v172),
                v170 = v179,
                CMTimeRangeGetEnd(&v171, &v170),
                v19 < CMTimeGetSeconds(&v171)))
          {
            v169 = v179;
            CMTimeRangeGetEnd(&v129.start, &v169);
            value = v129.start.value;
            flags = v129.start.flags;
            timescale = v129.start.timescale;
            epoch = v129.start.epoch;
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v181, v191, 16);
    }
    while (v7);
  }

  v168 = 0u;
  v167 = 0u;
  v166 = 0u;
  v165 = 0u;
  obja = v81[6];
  v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v165, v190, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v166;
LABEL_25:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v166 != v21)
        objc_enumerationMutation(obja);
      v23 = *(const __CFDictionary **)(*((_QWORD *)&v165 + 1) + 8 * v22);
      memset(&v180, 0, sizeof(v180));
      CMTimeRangeMakeFromDictionary(&v180, v23);
      v24 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v164.start.value = *(_OWORD *)&v87->value;
      *(_OWORD *)&v164.start.epoch = v24;
      *(_OWORD *)&v164.duration.timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetEnd(&v124.start, &v164);
      *(_OWORD *)&v179.start.value = *(_OWORD *)&v180.start.value;
      v179.start.epoch = v180.start.epoch;
      *(_OWORD *)&v129.start.value = *(_OWORD *)&v124.start.value;
      v129.start.epoch = v124.start.epoch;
      if ((CMTimeCompare(&v179.start, &v129.start) & 0x80000000) == 0)
        break;
      v163 = v180;
      v25 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v162.start.value = *(_OWORD *)&v87->value;
      memset(&v179, 0, sizeof(v179));
      *(_OWORD *)&v162.start.epoch = v25;
      *(_OWORD *)&v162.duration.timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetIntersection(&v179, &v163, &v162);
      if ((v179.start.flags & 1) == 0
        || (v179.duration.flags & 1) == 0
        || v179.duration.epoch
        || v179.duration.value < 0
        || (duration = v179.duration, v160 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&duration, &v160)))
      {
        -[__CFDictionary objectForKey:](v23, "objectForKey:", CFSTR("quality"), v78);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "floatValue");
        v28 = v27;

        if (v28 >= 0.3)
        {
          if ((v185.flags & 1) == 0
            || (v159 = v185, v29 = CMTimeGetSeconds(&v159), v158 = v179.start, v29 > CMTimeGetSeconds(&v158)))
          {
            v185 = v179.start;
          }
          if ((flags & 1) == 0
            || (v157.value = value,
                v157.timescale = timescale,
                v157.flags = flags,
                v157.epoch = epoch,
                v30 = CMTimeGetSeconds(&v157),
                v155 = v179,
                CMTimeRangeGetEnd(&v156, &v155),
                v30 < CMTimeGetSeconds(&v156)))
          {
            v154 = v179;
            CMTimeRangeGetEnd(&v129.start, &v154);
            value = v129.start.value;
            flags = v129.start.flags;
            timescale = v129.start.timescale;
            epoch = v129.start.epoch;
          }
        }
      }
      if (v20 == ++v22)
      {
        v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v165, v190, 16);
        if (v20)
          goto LABEL_25;
        break;
      }
    }
  }

  v153 = 0u;
  v152 = 0u;
  v151 = 0u;
  v150 = 0u;
  objb = v81[10];
  v31 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v150, v189, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v151;
LABEL_45:
    v33 = 0;
    while (1)
    {
      if (*(_QWORD *)v151 != v32)
        objc_enumerationMutation(objb);
      v34 = *(const __CFDictionary **)(*((_QWORD *)&v150 + 1) + 8 * v33);
      memset(&v180, 0, sizeof(v180));
      CMTimeRangeMakeFromDictionary(&v180, v34);
      v35 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v149.start.value = *(_OWORD *)&v87->value;
      *(_OWORD *)&v149.start.epoch = v35;
      *(_OWORD *)&v149.duration.timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetEnd(&v124.start, &v149);
      *(_OWORD *)&v179.start.value = *(_OWORD *)&v180.start.value;
      v179.start.epoch = v180.start.epoch;
      *(_OWORD *)&v129.start.value = *(_OWORD *)&v124.start.value;
      v129.start.epoch = v124.start.epoch;
      if ((CMTimeCompare(&v179.start, &v129.start) & 0x80000000) == 0)
        break;
      v148 = v180;
      v36 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v147.start.value = *(_OWORD *)&v87->value;
      memset(&v179, 0, sizeof(v179));
      *(_OWORD *)&v147.start.epoch = v36;
      *(_OWORD *)&v147.duration.timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetIntersection(&v179, &v148, &v147);
      if ((v179.start.flags & 1) == 0
        || (v179.duration.flags & 1) == 0
        || v179.duration.epoch
        || v179.duration.value < 0
        || (v146 = v179.duration, v145 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v146, &v145)))
      {
        -[__CFDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", CFSTR("attributes"), v78);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("absoluteScore"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "floatValue");
        v40 = v39;

        if (v40 >= 0.2)
        {
          if ((v185.flags & 1) == 0
            || (v144 = v185, v41 = CMTimeGetSeconds(&v144), v143 = v179.start, v41 > CMTimeGetSeconds(&v143)))
          {
            v185 = v179.start;
          }
          if ((flags & 1) == 0
            || (v142.value = value,
                v142.timescale = timescale,
                v142.flags = flags,
                v142.epoch = epoch,
                v42 = CMTimeGetSeconds(&v142),
                v140 = v179,
                CMTimeRangeGetEnd(&v141, &v140),
                v42 < CMTimeGetSeconds(&v141)))
          {
            v139 = v179;
            CMTimeRangeGetEnd(&v129.start, &v139);
            value = v129.start.value;
            flags = v129.start.flags;
            timescale = v129.start.timescale;
            epoch = v129.start.epoch;
          }
        }
      }
      if (v31 == ++v33)
      {
        v31 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v150, v189, 16);
        if (v31)
          goto LABEL_45;
        break;
      }
    }
  }

  v138 = 0u;
  v137 = 0u;
  v136 = 0u;
  v135 = 0u;
  objc = v81[7];
  v43 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v135, v188, 16);
  if (v43)
  {
    v80 = *(_QWORD *)v136;
LABEL_65:
    v79 = v43;
    v44 = 0;
    while (1)
    {
      if (*(_QWORD *)v136 != v80)
        objc_enumerationMutation(objc);
      v45 = *(const __CFDictionary **)(*((_QWORD *)&v135 + 1) + 8 * v44);
      memset(&v180, 0, sizeof(v180));
      CMTimeRangeMakeFromDictionary(&v180, v45);
      v46 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v134.start.value = *(_OWORD *)&v87->value;
      *(_OWORD *)&v134.start.epoch = v46;
      *(_OWORD *)&v134.duration.timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetEnd(&v124.start, &v134);
      *(_OWORD *)&v179.start.value = *(_OWORD *)&v180.start.value;
      v179.start.epoch = v180.start.epoch;
      *(_OWORD *)&v129.start.value = *(_OWORD *)&v124.start.value;
      v129.start.epoch = v124.start.epoch;
      if ((CMTimeCompare(&v179.start, &v129.start) & 0x80000000) == 0)
        break;
      v133 = v180;
      v47 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v132.start.value = *(_OWORD *)&v87->value;
      memset(&v179, 0, sizeof(v179));
      *(_OWORD *)&v132.start.epoch = v47;
      *(_OWORD *)&v132.duration.timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetIntersection(&v179, &v133, &v132);
      if ((v179.start.flags & 1) == 0
        || (v179.duration.flags & 1) == 0
        || v179.duration.epoch
        || v179.duration.value < 0
        || (v131 = v179.duration, v130 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v131, &v130)))
      {
        -[__CFDictionary objectForKey:](v45, "objectForKey:", CFSTR("quality"), v78);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "floatValue");
        v50 = v49;

        if (v50 >= 0.3)
        {
          v51 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
          *(_OWORD *)&v129.start.value = *MEMORY[0x1E0CA2E40];
          *(_OWORD *)&v129.start.epoch = v51;
          *(_OWORD *)&v129.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
          v125 = 0u;
          v126 = 0u;
          v127 = 0u;
          v128 = 0u;
          v52 = v81[2];
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v125, v187, 16);
          if (v53)
          {
            v54 = *(_QWORD *)v126;
LABEL_77:
            v55 = 0;
            while (1)
            {
              if (*(_QWORD *)v126 != v54)
                objc_enumerationMutation(v52);
              v56 = *(const __CFDictionary **)(*((_QWORD *)&v125 + 1) + 8 * v55);
              memset(&v124, 0, sizeof(v124));
              CMTimeRangeMakeFromDictionary(&v124, v56);
              v123 = v179;
              CMTimeRangeGetEnd(&v104.start, &v123);
              *(_OWORD *)&v122.start.value = *(_OWORD *)&v124.start.value;
              v122.start.epoch = v124.start.epoch;
              *(_OWORD *)&v117.start.value = *(_OWORD *)&v104.start.value;
              v117.start.epoch = v104.start.epoch;
              if ((CMTimeCompare(&v122.start, &v117.start) & 0x80000000) == 0)
                break;
              memset(&v122, 0, sizeof(v122));
              v121 = v179;
              v120 = v124;
              CMTimeRangeGetIntersection(&v122, &v121, &v120);
              -[__CFDictionary objectForKey:](v56, "objectForKey:", CFSTR("quality"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "floatValue");
              v59 = v58;

              if ((v122.start.flags & 1) == 0
                || (v122.duration.flags & 1) == 0
                || v122.duration.epoch
                || v122.duration.value < 0
                || (v119 = v122.duration, v118 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v119, &v118)))
              {
                if (v59 > 0.7)
                {
                  v116 = v129;
                  v115 = v122;
                  CMTimeRangeGetUnion(&v117, &v116, &v115);
                  v129 = v117;
                }
              }
              if (v53 == ++v55)
              {
                v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v125, v187, 16);
                if (v53)
                  goto LABEL_77;
                break;
              }
            }
          }

          v60 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
          *(_OWORD *)&v124.start.value = *MEMORY[0x1E0CA2E40];
          *(_OWORD *)&v124.start.epoch = v60;
          *(_OWORD *)&v124.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
          v111 = 0u;
          v112 = 0u;
          v113 = 0u;
          v114 = 0u;
          v61 = v81[12];
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v111, v186, 16);
          if (v62)
          {
            v63 = *(_QWORD *)v112;
LABEL_92:
            v64 = 0;
            while (1)
            {
              if (*(_QWORD *)v112 != v63)
                objc_enumerationMutation(v61);
              v65 = *(const __CFDictionary **)(*((_QWORD *)&v111 + 1) + 8 * v64);
              memset(&v122, 0, sizeof(v122));
              CMTimeRangeMakeFromDictionary(&v122, v65);
              v109 = v179;
              CMTimeRangeGetEnd(&v110, &v109);
              *(_OWORD *)&v117.start.value = *(_OWORD *)&v122.start.value;
              v117.start.epoch = v122.start.epoch;
              v104.start = v110;
              if ((CMTimeCompare(&v117.start, &v104.start) & 0x80000000) == 0)
                break;
              memset(&v117, 0, sizeof(v117));
              v108 = v179;
              v107 = v122;
              CMTimeRangeGetIntersection(&v117, &v108, &v107);
              if ((v117.start.flags & 1) == 0
                || (v117.duration.flags & 1) == 0
                || v117.duration.epoch
                || v117.duration.value < 0
                || (v106 = v117.duration, v105 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v106, &v105)))
              {
                -[__CFDictionary objectForKey:](v65, "objectForKey:", CFSTR("flags"));
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = objc_msgSend(v66, "integerValue");
                if ((v67 & 0x2FFC0) != 0 && (v67 & 0x40) == 0x40)
                {
                  v103 = v124;
                  v102 = v117;
                  CMTimeRangeGetUnion(&v104, &v103, &v102);
                  v124 = v104;
                }

              }
              if (v62 == ++v64)
              {
                v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v111, v186, 16);
                if (v62)
                  goto LABEL_92;
                break;
              }
            }
          }

          v101 = v124;
          v100 = v129;
          CMTimeRangeGetIntersection(&v122, &v101, &v100);
          v179 = v122;
          if ((v122.start.flags & 1) == 0
            || (v179.duration.flags & 1) == 0
            || v179.duration.epoch
            || v179.duration.value < 0
            || (v99 = v179.duration, v98 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v99, &v98)))
          {
            if ((v185.flags & 1) == 0
              || (v97 = v185, v68 = CMTimeGetSeconds(&v97), v96 = v179.start, v68 > CMTimeGetSeconds(&v96)))
            {
              v185 = v179.start;
            }
            if ((flags & 1) == 0
              || (v95.value = value,
                  v95.timescale = timescale,
                  v95.flags = flags,
                  v95.epoch = epoch,
                  v69 = CMTimeGetSeconds(&v95),
                  v93 = v179,
                  CMTimeRangeGetEnd(&v94, &v93),
                  v69 < CMTimeGetSeconds(&v94)))
            {
              v92 = v179;
              CMTimeRangeGetEnd(&v122.start, &v92);
              value = v122.start.value;
              flags = v122.start.flags;
              timescale = v122.start.timescale;
              epoch = v122.start.epoch;
            }
          }
        }
      }
      if (++v44 == v79)
      {
        v43 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v135, v188, 16);
        if (v43)
          goto LABEL_65;
        break;
      }
    }
  }

  if (((v185.flags | flags) & 1) != 0)
  {
    v73 = &v185;
    if ((v185.flags & 1) == 0)
      v73 = v87;
    v74 = *(_OWORD *)&v73->value;
    v185.epoch = v73->epoch;
    *(_OWORD *)&v185.value = v74;
    if ((flags & 1) != 0)
    {
      v76 = flags;
      v180.start.value = value;
      v180.start.timescale = timescale;
      v180.start.flags = flags;
      v77 = epoch;
    }
    else
    {
      v75 = *(_OWORD *)&v87->epoch;
      *(_OWORD *)&v91.start.value = *(_OWORD *)&v87->value;
      *(_OWORD *)&v91.start.epoch = v75;
      *(_OWORD *)&v91.duration.timescale = *(_OWORD *)&v87[1].timescale;
      CMTimeRangeGetEnd(&v180.start, &v91);
      v76 = v180.start.flags;
      v77 = v180.start.epoch;
    }
    value = v180.start.value;
    timescale = v180.start.timescale;
    start = v185;
    end.value = v180.start.value;
    end.timescale = v180.start.timescale;
    end.flags = v76;
    end.epoch = v77;
    return ($C7CBA4C8288BA02ADCCB8E56B4665FF4 *)CMTimeRangeFromTimeToTime(v78, &start, &end);
  }
  else
  {
    v71 = MEMORY[0x1E0CA2E50];
    v72 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)&v78->start.value = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)&v78->start.epoch = v72;
    *(_OWORD *)&v78->duration.timescale = *(_OWORD *)(v71 + 32);
  }
  return result;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)computeSteadyTranslationTrimFor:(SEL)a3
{
  __int128 v5;
  CMTimeFlags flags;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  __int128 v10;
  void *v11;
  float v12;
  BOOL v13;
  __int128 v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  void *v20;
  uint64_t v21;
  double Seconds;
  double v23;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  uint64_t v25;
  __int128 v26;
  CMTime *v27;
  __int128 v28;
  __int128 v29;
  CMTimeEpoch v30;
  NSArray *obj;
  uint64_t v34;
  uint64_t v35;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *v36;
  CMTimeEpoch epoch;
  CMTime end;
  CMTime start;
  CMTimeRange v40;
  CMTimeRange v41;
  CMTimeRange v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime time;
  CMTime v47;
  CMTime duration;
  CMTimeRange v49;
  CMTimeRange v50;
  CMTimeRange time2;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CMTime v56;
  CMTime v57;
  CMTimeRange otherRange;
  CMTimeRange v59;
  CMTimeRange time1;
  CMTimeRange v61;
  CMTimeRange range;
  CMTime v63;
  CMTimeRange v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CMTime v69;
  CMTime v70;
  _BYTE v71[128];
  _BYTE v72[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CA2E18];
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v69.epoch = epoch;
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  *(_OWORD *)&v69.value = v5;
  obj = self->_qualityResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  v36 = a4;
  if (v7)
  {
    v34 = v7;
    v35 = *(_QWORD *)v66;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v66 != v35)
        objc_enumerationMutation(obj);
      v9 = *(const __CFDictionary **)(*((_QWORD *)&v65 + 1) + 8 * v8);
      memset(&v64, 0, sizeof(v64));
      CMTimeRangeMakeFromDictionary(&v64, v9);
      memset(&v63, 0, sizeof(v63));
      range = v64;
      CMTimeRangeGetEnd(&v63, &range);
      v10 = *(_OWORD *)&v36->var0.var3;
      *(_OWORD *)&v61.start.value = *(_OWORD *)&v36->var0.var0;
      *(_OWORD *)&v61.start.epoch = v10;
      *(_OWORD *)&v61.duration.timescale = *(_OWORD *)&v36->var1.var1;
      CMTimeRangeGetEnd(&v70, &v61);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v64.start.value;
      time1.start.epoch = v64.start.epoch;
      time2.start = v70;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0)
        break;
      -[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("quality"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "floatValue");
      v13 = v12 < 0.7;

      if (!v13)
      {
        *(_OWORD *)&v59.start.epoch = *(_OWORD *)&v64.start.epoch;
        *(_OWORD *)&v59.duration.timescale = *(_OWORD *)&v64.duration.timescale;
        v14 = *(_OWORD *)&v36->var0.var3;
        *(_OWORD *)&otherRange.start.value = *(_OWORD *)&v36->var0.var0;
        *(_OWORD *)&otherRange.start.epoch = v14;
        *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&v36->var1.var1;
        *(_OWORD *)&v59.start.value = *(_OWORD *)&v64.start.value;
        CMTimeRangeGetIntersection(&time1, &v59, &otherRange);
        v64 = time1;
        if ((time1.start.flags & 1) == 0
          || (v64.duration.flags & 1) == 0
          || v64.duration.epoch
          || v64.duration.value < 0
          || (v57 = v64.duration, v56 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v57, &v56)))
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v15 = self->_cameraMotionResults;
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v53;
LABEL_15:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v53 != v17)
                objc_enumerationMutation(v15);
              v19 = *(const __CFDictionary **)(*((_QWORD *)&v52 + 1) + 8 * v18);
              memset(&time1, 0, sizeof(time1));
              CMTimeRangeMakeFromDictionary(&time1, v19);
              *(_OWORD *)&time2.start.value = *(_OWORD *)&time1.start.value;
              time2.start.epoch = time1.start.epoch;
              v70 = v63;
              if ((CMTimeCompare(&time2.start, &v70) & 0x80000000) == 0)
                break;
              v50 = time1;
              memset(&time2, 0, sizeof(time2));
              v49 = v64;
              CMTimeRangeGetIntersection(&time2, &v50, &v49);
              if ((time2.start.flags & 1) == 0
                || (time2.duration.flags & 1) == 0
                || time2.duration.epoch
                || time2.duration.value < 0
                || (duration = time2.duration,
                    v47 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
                    CMTimeCompare(&duration, &v47)))
              {
                -[__CFDictionary objectForKey:](v19, "objectForKey:", CFSTR("flags"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "integerValue");
                if ((v21 & 0x2FFC0) != 0 && __clz(__rbit32(v21 & 0x2FFC0)) - 7 <= 1)
                {
                  if ((v69.flags & 1) == 0
                    || (time = v69,
                        Seconds = CMTimeGetSeconds(&time),
                        v45 = time2.start,
                        Seconds > CMTimeGetSeconds(&v45)))
                  {
                    v69 = time2.start;
                  }
                  if ((flags & 1) == 0
                    || (v44.value = value,
                        v44.timescale = timescale,
                        v44.flags = flags,
                        v44.epoch = epoch,
                        v23 = CMTimeGetSeconds(&v44),
                        v42 = time2,
                        CMTimeRangeGetEnd(&v43, &v42),
                        v23 < CMTimeGetSeconds(&v43)))
                  {
                    v41 = time2;
                    CMTimeRangeGetEnd(&v70, &v41);
                    value = v70.value;
                    flags = v70.flags;
                    timescale = v70.timescale;
                    epoch = v70.epoch;
                  }
                }

              }
              if (v16 == ++v18)
              {
                v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v52, v71, 16);
                if (v16)
                  goto LABEL_15;
                break;
              }
            }
          }

        }
      }
      if (++v8 == v34)
      {
        v34 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
        if (v34)
          goto LABEL_3;
        break;
      }
    }
  }

  if (((v69.flags | flags) & 1) != 0)
  {
    v27 = &v69;
    if ((v69.flags & 1) == 0)
      v27 = (CMTime *)v36;
    v28 = *(_OWORD *)&v27->value;
    v69.epoch = v27->epoch;
    *(_OWORD *)&v69.value = v28;
    if ((flags & 1) != 0)
    {
      v64.start.value = value;
      v64.start.timescale = timescale;
      v64.start.flags = flags;
      v30 = epoch;
    }
    else
    {
      v29 = *(_OWORD *)&v36->var0.var3;
      *(_OWORD *)&v40.start.value = *(_OWORD *)&v36->var0.var0;
      *(_OWORD *)&v40.start.epoch = v29;
      *(_OWORD *)&v40.duration.timescale = *(_OWORD *)&v36->var1.var1;
      CMTimeRangeGetEnd(&v64.start, &v40);
      flags = v64.start.flags;
      v30 = v64.start.epoch;
    }
    value = v64.start.value;
    timescale = v64.start.timescale;
    start = v69;
    end.value = v64.start.value;
    end.timescale = v64.start.timescale;
    end.flags = flags;
    end.epoch = v30;
    return ($C7CBA4C8288BA02ADCCB8E56B4665FF4 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &end);
  }
  else
  {
    v25 = MEMORY[0x1E0CA2E50];
    v26 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)&retstr->var0.var3 = v26;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v25 + 32);
  }
  return result;
}

- (BOOL)checkCameraZoom:(id *)a3
{
  __int128 v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  char v14;
  BOOL v15;
  BOOL v16;
  BOOL v17;
  CMTime v19;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v22;
  CMTimeRange time1;
  CMTimeRange v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTimeRange range;
  CMTime v30;
  CMTime time2;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  memset(&v30, 0, sizeof(v30));
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v30, &range);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_cameraMotionResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v26;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v6);
      v10 = *(const __CFDictionary **)(*((_QWORD *)&v25 + 1) + 8 * v9);
      memset(&v24, 0, sizeof(v24));
      CMTimeRangeMakeFromDictionary(&v24, v10);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v24.start.value;
      time1.start.epoch = v24.start.epoch;
      time2 = v30;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v22 = v24;
      memset(&time1, 0, sizeof(time1));
      v11 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v11;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v22, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, v19 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&duration, &v19)))
      {
        -[__CFDictionary objectForKey:](v10, "objectForKey:", CFSTR("flags"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue");
        v15 = !(v14 | ((v13 & 0x2FFC0) == 0)) && (v13 & 0x1FC0) == 4096;
        v16 = v15;

        if (v16)
        {
          v17 = 1;
          goto LABEL_24;
        }
      }
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
        v17 = 0;
        if (v7)
          goto LABEL_3;
        goto LABEL_24;
      }
    }
  }
  v17 = 0;
LABEL_24:

  return v17;
}

- (float)computeHighlightScoreOfRange:(id *)a3
{
  __int128 v5;
  float v6;
  float v7;
  __int128 v8;
  float v9;
  float v10;
  __int128 v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  Float64 Seconds;
  __int128 v18;
  Float64 v19;
  CMTimeRange v21;
  CMTime v22;
  CMTime time;
  _OWORD v24[3];
  _OWORD v25[3];
  _OWORD v26[3];
  uint8_t buf[4];
  Float64 v28;
  __int16 v29;
  Float64 v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&a3->var0.var3;
  v26[0] = *(_OWORD *)&a3->var0.var0;
  v26[1] = v5;
  v26[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer computeExpressionScoreInTimerange:](self, "computeExpressionScoreInTimerange:", v26);
  v7 = v6;
  v8 = *(_OWORD *)&a3->var0.var3;
  v25[0] = *(_OWORD *)&a3->var0.var0;
  v25[1] = v8;
  v25[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer computeActionScoreInTimerange:](self, "computeActionScoreInTimerange:", v25);
  v10 = v9;
  v11 = *(_OWORD *)&a3->var0.var3;
  v24[0] = *(_OWORD *)&a3->var0.var0;
  v24[1] = v11;
  v24[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer computeVoiceScoreInTimeRange:](self, "computeVoiceScoreInTimeRange:", v24);
  v13 = v12;
  v14 = (float)((float)((float)(v7 * 0.4) + 0.0) + (float)(v10 * 0.4)) + (float)(v12 * 0.2);
  v15 = 1.0;
  if (v14 < 1.0)
    v15 = v14;
  if (v14 <= 0.0)
    v16 = 0.0;
  else
    v16 = v15;
  if (self->_isLivePhoto
    && (int)MediaAnalysisLogLevel() >= 7
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    time = (CMTime)a3->var0;
    Seconds = CMTimeGetSeconds(&time);
    v18 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&v21.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&v21.start.epoch = v18;
    *(_OWORD *)&v21.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v22, &v21);
    v19 = CMTimeGetSeconds(&v22);
    *(_DWORD *)buf = 134219264;
    v28 = Seconds;
    v29 = 2048;
    v30 = v19;
    v31 = 2048;
    v32 = v7;
    v33 = 2048;
    v34 = v10;
    v35 = 2048;
    v36 = v13;
    v37 = 2048;
    v38 = v16;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%.2f - %.2f] expressionScore=%.2f, actionScore=%.2f, voiceScore=%.2f, Score=%.2f", buf, 0x3Eu);
  }
  return v16;
}

- (void)SetKeyFramesForSegments:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__VCPMovieHighlightAnalyzer_SetKeyFramesForSegments___block_invoke;
  v3[3] = &unk_1E6B17598;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

void __53__VCPMovieHighlightAnalyzer_SetKeyFramesForSegments___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v7[3];

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v3, "timerange");
  else
    memset(v7, 0, sizeof(v7));
  objc_msgSend(v5, "pickKeyFramesInRange:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyFrame:", v6);

}

- (id)pickKeyFramesInRange:(id *)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  float v12;
  float v13;
  id v14;
  CMTime time;
  CMTimeRange range;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_keyFrameResults;
  v5 = 0;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    v8 = -1.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.epoch = v11;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
        if (v10)
          objc_msgSend(v10, "timestamp");
        else
          memset(&time, 0, sizeof(time));
        if (CMTimeRangeContainsTime(&range, &time))
        {
          objc_msgSend(v10, "score");
          if (v12 > v8)
          {
            objc_msgSend(v10, "score");
            v8 = v13;
            v14 = v10;

            v5 = v14;
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v5;
}

- (int)computeHighlightScoreResults
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  unsigned __int8 v7;
  VCPMovieHighlight *v8;
  VCPMovieHighlight *v9;
  VCPMovieHighlight *v10;
  CMTimeRange *v11;
  float v12;
  float v13;
  uint64_t v14;
  NSArray *obj;
  CMTimeRange v17;
  CMTime duration;
  CMTime v19;
  CMTimeRange v20;
  CMTimeRange v21;
  CMTime v22;
  CMTime v23;
  CMTimeRange v24;
  CMTime v25;
  CMTimeRange v26;
  CMTime end;
  CMTime start;
  CMTimeRange time1;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTimeRange range;
  CMTime v34;
  CMTime v35;
  CMTime v36;
  CMTimeRange v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime rhs;
  CMTime time2;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = self->_sceneResults;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v39;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v39 != v4)
          objc_enumerationMutation(obj);
        v6 = *(const __CFDictionary **)(*((_QWORD *)&v38 + 1) + 8 * v5);
        memset(&v37, 0, sizeof(v37));
        CMTimeRangeMakeFromDictionary(&v37, v6);
        if ((v7 & 1) == 0
        {
          CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer computeHighlightScoreResults]::kHalfSecond, 300, 600);
        }
        memset(&v36, 0, sizeof(v36));
        CMTimeMake(&v36, 300, 600);
        v35 = v37.start;
        memset(&v34, 0, sizeof(v34));
        range = v37;
        CMTimeRangeGetEnd(&v34, &range);
        v8 = 0;
        v32 = v35;
        while (1)
        {
          time1.start = v32;
          time2 = v34;
          if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
            break;
          memset(&v31, 0, sizeof(v31));
          time1.start = v35;
          time2 = v36;
          CMTimeAdd(&rhs, &time1.start, &time2);
          time1.start = v32;
          time2 = rhs;
          if (CMTimeCompare(&time1.start, &time2) < 1)
          {
            v31 = v35;
          }
          else
          {
            time1.start = v32;
            time2 = v36;
            CMTimeSubtract(&v31, &time1.start, &time2);
          }
          memset(&v30, 0, sizeof(v30));
          time1.start = v32;
          time2 = v36;
          CMTimeAdd(&rhs, &time1.start, &time2);
          time1.start = rhs;
          time2 = v34;
          if (CMTimeCompare(&time1.start, &time2) < 1)
          {
            time1.start = v32;
            time2 = v36;
            CMTimeAdd(&v30, &time1.start, &time2);
          }
          else
          {
            v30 = v34;
          }
          memset(&time1, 0, sizeof(time1));
          start = v31;
          end = v30;
          CMTimeRangeFromTimeToTime(&time1, &start, &end);
          v9 = [VCPMovieHighlight alloc];
          v26 = time1;
          v10 = -[VCPMovieHighlight initWithTimeRange:](v9, "initWithTimeRange:", &v26);
          -[VCPMovieHighlightAnalyzer computeHighlightScoreOfSegment:](self, "computeHighlightScoreOfSegment:", v10);
          time2 = v32;
          rhs = *(CMTime *)-[VCPMovieHighlightAnalyzer computeHighlightScoreResults]::kHalfSecond;
          CMTimeAdd(&v25, &time2, &rhs);
          time2 = v25;
          rhs = v34;
          if (CMTimeCompare(&time2, &rhs) < 0)
          {
            v23 = v32;
            v22 = *(CMTime *)-[VCPMovieHighlightAnalyzer computeHighlightScoreResults]::kHalfSecond;
            CMTimeRangeMake(&v24, &v23, &v22);
            v21 = v24;
            v11 = &v21;
          }
          else
          {
            v19 = v32;
            time2 = v34;
            rhs = v32;
            CMTimeSubtract(&duration, &time2, &rhs);
            CMTimeRangeMake(&v20, &v19, &duration);
            v17 = v20;
            v11 = &v17;
          }
          -[VCPMovieHighlight setTimerange:](v10, "setTimerange:", v11);
          -[NSMutableArray addObject:](self->_internalResults, "addObject:", v10);
          -[VCPMovieHighlight score](v10, "score");
          if (*(float *)&self->_contextResults >= v12)
            v12 = *(float *)&self->_contextResults;
          *(float *)&self->_contextResults = v12;
          -[VCPMovieHighlight score](v10, "score");
          if (v13 >= *((float *)&self->_contextResults + 1))
            v13 = *((float *)&self->_contextResults + 1);
          *((float *)&self->_contextResults + 1) = v13;

          time2 = v32;
          rhs = *(CMTime *)-[VCPMovieHighlightAnalyzer computeHighlightScoreResults]::kHalfSecond;
          CMTimeAdd(&time1.start, &time2, &rhs);
          v32 = time1.start;
          v8 = v10;
        }

        ++v5;
      }
      while (v5 != v3);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      v3 = v14;
    }
    while (v14);
  }

  return 0;
}

- (int)pickHighlightsFrom:(id)a3
{
  id v4;
  unsigned __int8 v5;
  VCPMovieHighlight *v6;
  VCPMovieHighlight *v7;
  VCPMovieHighlight *v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  VCPMovieHighlight *v13;
  void *v14;
  int v15;
  CMTimeRange v17;
  CMTimeRange v18;
  CMTime duration;
  CMTime start;
  CMTime time;
  CMTime v22;
  CMTime time2[2];
  CMTime v24;
  _BYTE time1[72];
  CMTime v26;
  CMTime rhs;
  CMTime lhs;

  v4 = a3;
  if ((v5 & 1) == 0
  {
    CMTimeMake((CMTime *)-[VCPMovieHighlightAnalyzer pickHighlightsFrom:]::kHalfSecond, 300, 600);
  }
  memset(&v26, 0, sizeof(v26));
  CMTimeMake(&v26, (uint64_t)(float)(self->_maxDurationInSeconds * 600.0), 600);
  if (v4)
  {
    objc_msgSend(v4, "timerange");
    *(CMTime *)&time1[48] = *(CMTime *)time1;
    memset(&v24, 0, sizeof(v24));
    objc_msgSend(v4, "timerange");
    objc_msgSend(v4, "timerange");
  }
  else
  {
    memset(&v24, 0, sizeof(v24));
    memset(time1, 0, sizeof(time1));
    memset(time2, 0, sizeof(time2));
  }
  lhs = *(CMTime *)time1;
  rhs = time2[1];
  CMTimeAdd(&v24, &lhs, &rhs);
  v6 = 0;
  for (rhs = *(CMTime *)&time1[48]; ; rhs = *(CMTime *)time1)
  {
    *(CMTime *)time1 = v24;
    time2[0] = v26;
    CMTimeSubtract(&lhs, (CMTime *)time1, time2);
    *(CMTime *)time1 = rhs;
    time2[0] = lhs;
    if ((CMTimeCompare((CMTime *)time1, time2) & 0x80000000) == 0)
      break;
    memset(&lhs, 0, sizeof(lhs));
    *(CMTime *)time1 = rhs;
    time2[0] = v26;
    CMTimeAdd(&v22, (CMTime *)time1, time2);
    *(CMTime *)time1 = v22;
    time2[0] = v24;
    if (CMTimeCompare((CMTime *)time1, time2) < 1)
    {
      lhs = v26;
    }
    else
    {
      *(CMTime *)time1 = v24;
      time2[0] = rhs;
      CMTimeSubtract(&lhs, (CMTime *)time1, time2);
    }
    time = lhs;
    if (fabs(CMTimeGetSeconds(&time)) < self->_minDurationInSeconds)
      break;
    memset(time1, 0, 48);
    start = rhs;
    duration = lhs;
    CMTimeRangeMake((CMTimeRange *)time1, &start, &duration);
    v7 = [VCPMovieHighlight alloc];
    v18 = *(CMTimeRange *)time1;
    v8 = -[VCPMovieHighlight initWithTimeRange:](v7, "initWithTimeRange:", &v18);
    -[VCPMovieHighlight copyScoresFrom:](v8, "copyScoresFrom:", v4);
    v17 = *(CMTimeRange *)time1;
    -[VCPMovieHighlightAnalyzer pickKeyFramesInRange:](self, "pickKeyFramesInRange:", &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPMovieHighlight setKeyFrame:](v8, "setKeyFrame:", v9);

    -[VCPMovieHighlightAnalyzer computeHighlightScoreOfSegment:](self, "computeHighlightScoreOfSegment:", v8);
    -[VCPMovieHighlight score](v8, "score");
    v11 = v10;
    -[VCPMovieHighlight score](v6, "score");
    if (v11 > v12)
    {
      v13 = v8;

      v6 = v13;
    }

    time2[0] = rhs;
    lhs = *(CMTime *)-[VCPMovieHighlightAnalyzer pickHighlightsFrom:]::kHalfSecond;
    CMTimeAdd((CMTime *)time1, time2, &lhs);
  }
  -[VCPMovieHighlightAnalyzer searchFeatureVectorOfSegment:](self, "searchFeatureVectorOfSegment:", v4);
  objc_msgSend(v4, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPMovieHighlight setDescriptor:](v6, "setDescriptor:", v14);

  -[VCPMovieHighlightAnalyzer computeHighlightScoreOfSegment:](self, "computeHighlightScoreOfSegment:", v4);
  objc_msgSend(v4, "score");
  -[VCPMovieHighlight setScore:](v6, "setScore:");
  v15 = -[VCPMovieHighlightAnalyzer evaluateSegment:](self, "evaluateSegment:", v6);

  return v15;
}

- (void)searchFeatureVectorOfSegment:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  NSArray *v13;
  NSArray *v14;
  void *v15;
  void *v16;
  NSArray *obj;
  uint64_t v18;
  CMTime v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTimeRange range;
  CMTime v25;
  CMTime time1;
  CMTime v27;
  CMTime time2;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = v4;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "timerange");
    v27 = time1;
    memset(&v25, 0, sizeof(v25));
    objc_msgSend(v5, "timerange");
  }
  else
  {
    memset(&v27, 0, sizeof(v27));
    memset(&v25, 0, sizeof(v25));
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v25, &range);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_featureResults;
  obj = v6;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_19;
  }
  v6 = 0;
  v18 = *(_QWORD *)v21;
  while (2)
  {
    v8 = 0;
    v9 = v6;
    do
    {
      if (*(_QWORD *)v21 != v18)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"), v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("featureVector"));
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();

      memset(&v19, 0, sizeof(v19));
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("start"));
      v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v19, v12);

      time1 = v19;
      time2 = v27;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        time1 = v19;
        time2 = v25;
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        {
          v14 = v9;

          v6 = v14;
        }
        v13 = obj;
        goto LABEL_16;
      }
      v6 = v6;

      ++v8;
      v9 = v6;
    }
    while (v7 != v8);
    v13 = obj;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    v9 = v6;
    if (v7)
      continue;
    break;
  }
LABEL_16:

  if (v6)
  {
    +[VCPImageDescriptor descriptorWithData:](VCPImageDescriptor, "descriptorWithData:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDescriptor:", v15);

LABEL_19:
  }

}

- (int)evaluateSegment:(id)a3
{
  id v4;
  float v5;
  int v6;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  float v19;
  id v20;
  void *v21;
  id v22;
  float v23;
  float v24;
  float v25;
  NSMutableArray *obj;
  void *v27;
  CMTime time2[2];
  CMTime time1[2];
  CMTimeRange v30;
  CMTimeRange v31;
  CMTimeRange otherRange;
  CMTimeRange range;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CMTimeRange v38;
  CMTime time;
  CMTime v40;
  CMTime duration;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "score");
  if (v5 < *((float *)&self->_contextResults + 1))
    goto LABEL_8;
  if (v4)
    objc_msgSend(v4, "timerange");
  else
    memset(&v38, 0, sizeof(v38));
  time = v38.duration;
  if (CMTimeGetSeconds(&time) < self->_minDurationInSeconds)
    goto LABEL_8;
  if (LOBYTE(self->_maxHighlightScore))
  {
    -[VCPMovieHighlightAnalyzer addSegment:](self, "addSegment:", v4);
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  if (v9)
  {
    v21 = 0;
    v6 = 0;
    goto LABEL_55;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_internalConstraintResults;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v10)
  {

    v27 = 0;
    goto LABEL_35;
  }
  v27 = 0;
  v11 = *(_QWORD *)v35;
  v12 = *(float *)"";
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v35 != v11)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      if (v4)
      {
        objc_msgSend(v4, "timerange");
        if (v14)
          goto LABEL_18;
      }
      else
      {
        memset(&range, 0, sizeof(range));
        if (v14)
        {
LABEL_18:
          objc_msgSend(v14, "timerange");
          goto LABEL_21;
        }
      }
      memset(&otherRange, 0, sizeof(otherRange));
LABEL_21:
      CMTimeRangeGetIntersection(&v38, &range, &otherRange);
      time1[0] = v38.duration;
      time2[0] = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (CMTimeCompare(time1, time2) >= 1)
      {
        v22 = v14;

        v27 = v22;
        goto LABEL_32;
      }
      objc_msgSend(v14, "descriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (!v16)
      {
        LODWORD(v38.start.value) = 0;
        objc_msgSend(v14, "descriptor");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "descriptor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v17, "computeDistance:toDescriptor:", &v38, v18);

        if (v6)
        {

          goto LABEL_54;
        }
        v19 = *(float *)&v38.start.value;
        if (*(float *)&v38.start.value < v12)
        {
          v20 = v14;

          v27 = v20;
          v12 = v19;
        }
      }
    }
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v10)
      continue;
    break;
  }

  if (v12 < 0.1)
  {
LABEL_32:
    if (v4)
      objc_msgSend(v4, "timerange");
    else
      memset(&v31, 0, sizeof(v31));
    if (v27)
      objc_msgSend(v27, "timerange");
    else
      memset(&v30, 0, sizeof(v30));
    CMTimeRangeGetIntersection(&v38, &v31, &v30);
    duration = v38.duration;
    v40 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (CMTimeCompare(&duration, &v40) < 1)
      goto LABEL_50;
    if (v4)
      objc_msgSend(v4, "timerange");
    else
      memset(time1, 0, sizeof(time1));
    if (v27)
      objc_msgSend(v27, "timerange");
    else
      memset(time2, 0, sizeof(time2));
    duration = time1[1];
    v40 = time2[1];
    if (CMTimeCompare(&duration, &v40) < 1)
    {
LABEL_50:
      objc_msgSend(v27, "score");
      v24 = v23;
      objc_msgSend(v4, "score");
      if (v24 >= v25 || !-[VCPMovieHighlightAnalyzer addSegment:](self, "addSegment:", v4))
        goto LABEL_53;
    }
    else
    {
      -[NSMutableArray addObject:](self->_internalConstraintResults, "addObject:", v4);
    }
    -[NSMutableArray removeObject:](self->_internalConstraintResults, "removeObject:", v27);
    goto LABEL_53;
  }
LABEL_35:
  -[VCPMovieHighlightAnalyzer addSegment:](self, "addSegment:", v4);
LABEL_53:
  v6 = 0;
LABEL_54:
  v21 = v27;
LABEL_55:

LABEL_9:
  return v6;
}

- (BOOL)addSegment:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  double Seconds;
  float v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  __int128 v17;
  _BYTE v18[64];
  CMTime v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTime time;
  CMTime rhs;
  CMTime lhs;

  v4 = a3;
  -[NSMutableArray lastObject](self->_internalConstraintResults, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "score");
  v7 = v6;
  objc_msgSend(v4, "score");
  v9 = v8;
  if (!v4)
  {
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v17 = 0u;
    memset(v18, 0, 56);
    goto LABEL_6;
  }
  objc_msgSend(v4, "timerange");
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v5, "timerange");
  objc_msgSend(v5, "timerange");
LABEL_6:
  lhs = *(CMTime *)&v18[32];
  rhs = *(CMTime *)&v18[8];
  CMTimeAdd(&v19, &lhs, &rhs);
  *(_OWORD *)&lhs.value = v20;
  lhs.epoch = v21;
  rhs = v19;
  CMTimeSubtract(&time, &lhs, &rhs);
  Seconds = CMTimeGetSeconds(&time);
  if (vabds_f32(v7, v9) < 0.1)
  {
    v11 = Seconds;
    if (v11 < 0.2)
    {
      objc_msgSend(v4, "score");
      v13 = v12;
      objc_msgSend(v5, "score");
      if (v13 <= v14)
      {
        v15 = 0;
        goto LABEL_12;
      }
      -[NSMutableArray removeLastObject](self->_internalConstraintResults, "removeLastObject");
    }
  }
  -[NSMutableArray addObject:](self->_internalConstraintResults, "addObject:", v4, v17, *(_QWORD *)v18);
  v15 = 1;
LABEL_12:

  return v15;
}

- (void)computeHighlightScoreOfSegment:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  BOOL v16;
  BOOL v17;
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
  double v28;
  float v29;
  _BOOL4 v30;
  _BOOL4 v31;
  float v32;
  float v33;
  float v34;
  double v35;
  float v36;
  double v37;
  __int128 v38;
  double Seconds;
  double v40;
  float v41;
  double v42;
  float v43;
  NSObject *v44;
  id v45;
  Float64 v46;
  void *v47;
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
  Float64 v61;
  float v62;
  CMTimeRange v63;
  CMTime v64;
  CMTime v65;
  __int128 v66;
  _OWORD v67[2];
  CMTime v68;
  CMTime time;
  CMTimeRange otherRange;
  CMTimeRange range;
  _OWORD v72[3];
  _OWORD v73[3];
  _OWORD v74[3];
  _OWORD v75[3];
  _OWORD v76[3];
  _OWORD v77[3];
  _OWORD v78[3];
  _OWORD v79[3];
  _OWORD v80[3];
  _OWORD v81[3];
  _BYTE v82[52];
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  double v90;
  __int16 v91;
  double v92;
  __int16 v93;
  double v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "timerange");
  else
    memset(v81, 0, sizeof(v81));
  -[VCPMovieHighlightAnalyzer qualityScoreForTimerange:](self, "qualityScoreForTimerange:", v81);
  v7 = v6;
  if (v5)
    objc_msgSend(v5, "timerange");
  else
    memset(v80, 0, sizeof(v80));
  -[VCPMovieHighlightAnalyzer computeMLQualityScoreForTimerange:](self, "computeMLQualityScoreForTimerange:", v80);
  v9 = v8;
  if (v5)
    objc_msgSend(v5, "timerange");
  else
    memset(v79, 0, sizeof(v79));
  -[VCPMovieHighlightAnalyzer junkScoreForTimerange:lengthScale:](self, "junkScoreForTimerange:lengthScale:", v79, 0);
  v11 = v10;
  if (v5)
    objc_msgSend(v5, "timerange");
  else
    memset(v78, 0, sizeof(v78));
  -[VCPMovieHighlightAnalyzer computeSubtleMotionScoreInTimerange:](self, "computeSubtleMotionScoreInTimerange:", v78);
  v13 = v12;
  if (v5)
    objc_msgSend(v5, "timerange");
  else
    memset(v77, 0, sizeof(v77));
  -[VCPMovieHighlightAnalyzer cameraMotionScoreForTimerange:](self, "cameraMotionScoreForTimerange:", v77);
  v15 = v14;
  if (v5)
    objc_msgSend(v5, "timerange");
  else
    memset(v76, 0, sizeof(v76));
  -[VCPMovieHighlightAnalyzer computeExpressionScoreInTimerange:](self, "computeExpressionScoreInTimerange:", v76);
  objc_msgSend(v5, "setExpressionScore:");
  if (v5)
    objc_msgSend(v5, "timerange");
  else
    memset(v75, 0, sizeof(v75));
  -[VCPMovieHighlightAnalyzer computeActionScoreInTimerange:](self, "computeActionScoreInTimerange:", v75);
  objc_msgSend(v5, "setActionScore:");
  if (v5)
    objc_msgSend(v5, "timerange");
  else
    memset(v74, 0, sizeof(v74));
  -[VCPMovieHighlightAnalyzer computeVoiceScoreInTimeRange:](self, "computeVoiceScoreInTimeRange:", v74);
  objc_msgSend(v5, "setVoiceScore:");
  if (v5)
    objc_msgSend(v5, "timerange");
  else
    memset(v73, 0, sizeof(v73));
  -[VCPMovieHighlightAnalyzer computeHumanActionScoreInTimerange:](self, "computeHumanActionScoreInTimerange:", v73);
  objc_msgSend(v5, "setHumanActionScore:");
  if (v5)
    objc_msgSend(v5, "timerange");
  else
    memset(v72, 0, sizeof(v72));
  -[VCPMovieHighlightAnalyzer computeHumanPoseScoreInTimerange:](self, "computeHumanPoseScoreInTimerange:", v72);
  objc_msgSend(v5, "setHumanPoseScore:");
  v16 = v7 >= 0.405 || v7 <= 0.3;
  v17 = v16 || v9 <= 0.7;
  v62 = v9;
  if (v17)
    v18 = v7;
  else
    v18 = v9;
  objc_msgSend(v5, "expressionScore");
  v20 = v19;
  objc_msgSend(v5, "humanPoseScore");
  v22 = v21 * 0.5;
  if (v20 >= v22)
    v23 = v20;
  else
    v23 = v22;
  objc_msgSend(v5, "actionScore");
  v25 = v24;
  objc_msgSend(v5, "humanActionScore");
  v27 = v26;
  objc_msgSend(v5, "voiceScore");
  v29 = (float)(v13 + v25) + (float)(v27 * 1.5);
  v30 = *(float *)&v28 > 0.8;
  v31 = v23 > 0.6;
  if (v30 && v31)
    *(float *)&v28 = *(float *)&v28 + *(float *)&v28;
  v32 = 0.1;
  if (v30 && v31)
    v32 = 0.5;
  if (v29 >= 0.2 || v23 >= 0.2)
  {
    if (v23 >= v29)
      v33 = v23;
    else
      v33 = (float)(v13 + v25) + (float)(v27 * 1.5);
    v34 = (float)(v29 * 0.25) + (float)(v23 * 0.25);
    if (*(float *)&v28 >= v33)
      *(float *)&v28 = (float)(v34 + (float)(v32 * *(float *)&v28)) / (float)(v32 + 0.5);
    else
      *(float *)&v28 = v34 + v34;
  }
  else
  {
    objc_msgSend(v5, "voiceScore", v28);
    *(float *)&v28 = (float)(v15 * 0.4) + (float)(*(float *)&v28 * 0.07);
  }
  objc_msgSend(v5, "setScore:", v28);
  objc_msgSend(v5, "score");
  *(float *)&v35 = *(float *)&v35 / 1.5;
  v36 = 1.0;
  if (*(float *)&v35 < 1.0)
    v36 = *(float *)&v35;
  v16 = *(float *)&v35 > 0.0;
  LODWORD(v35) = 0;
  if (v16)
    *(float *)&v35 = v36;
  objc_msgSend(v5, "setScore:", v35);
  if ((self->_preferredTimeRange.start.value & 0x100000000) != 0
    && (self->_preferredTimeRange.duration.value & 0x100000000) != 0
    && !*(_QWORD *)&self->_preferredTimeRange.duration.timescale
    && (self->_preferredTimeRange.start.epoch & 0x8000000000000000) == 0)
  {
    memset(v82, 0, 48);
    v38 = *(_OWORD *)&self->_preferredTimeRange.start.timescale;
    *(_OWORD *)&range.start.value = *(_OWORD *)&self->_verbose;
    *(_OWORD *)&range.start.epoch = v38;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_preferredTimeRange.duration.value;
    if (v5)
      objc_msgSend(v5, "timerange");
    else
      memset(&otherRange, 0, sizeof(otherRange));
    CMTimeRangeGetIntersection((CMTimeRange *)v82, &range, &otherRange);
    time = *(CMTime *)&v82[24];
    Seconds = CMTimeGetSeconds(&time);
    if (v5)
    {
      objc_msgSend(v5, "timerange");
    }
    else
    {
      memset(v67, 0, sizeof(v67));
      v66 = 0u;
    }
    v68 = *(CMTime *)((char *)v67 + 8);
    v40 = CMTimeGetSeconds(&v68);
    objc_msgSend(v5, "score");
    v42 = (Seconds * 0.300000012 / v40 + 1.0) * v41;
    *(float *)&v42 = v42;
    objc_msgSend(v5, "setScore:", v42);
  }
  v43 = v18 * v11;
  if ((float)(v18 * v11) <= 0.405)
  {
    LODWORD(v37) = -1.0;
    objc_msgSend(v5, "setScore:", v37);
  }
  if (self->_isLivePhoto && (int)MediaAnalysisLogLevel() >= 7)
  {
    v44 = MEMORY[0x1E0C81028];
    v45 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      if (v5)
      {
        objc_msgSend(v5, "timerange");
      }
      else
      {
        memset(v67, 0, sizeof(v67));
        v66 = 0u;
      }
      *(_OWORD *)&v65.value = v66;
      v65.epoch = *(_QWORD *)&v67[0];
      v46 = CMTimeGetSeconds(&v65);
      if (v5)
        objc_msgSend(v5, "timerange");
      else
        memset(&v63, 0, sizeof(v63));
      CMTimeRangeGetEnd(&v64, &v63);
      v61 = CMTimeGetSeconds(&v64);
      objc_msgSend(v5, "keyFrame");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "score");
      v49 = v48;
      objc_msgSend(v5, "expressionScore");
      v51 = v50;
      objc_msgSend(v5, "actionScore");
      v53 = v52;
      objc_msgSend(v5, "voiceScore");
      v55 = v54;
      objc_msgSend(v5, "humanActionScore");
      v57 = v56;
      objc_msgSend(v5, "humanPoseScore");
      v59 = v58;
      objc_msgSend(v5, "score");
      *(_DWORD *)v82 = 134220544;
      *(Float64 *)&v82[4] = v46;
      *(_WORD *)&v82[12] = 2048;
      *(Float64 *)&v82[14] = v61;
      *(_WORD *)&v82[22] = 2048;
      *(double *)&v82[24] = v49;
      *(_WORD *)&v82[32] = 2048;
      *(double *)&v82[34] = v51;
      *(_WORD *)&v82[42] = 2048;
      *(double *)&v82[44] = v53;
      v83 = 2048;
      v84 = v55;
      v85 = 2048;
      v86 = v57;
      v87 = 2048;
      v88 = v59;
      v89 = 2048;
      v90 = v43;
      v91 = 2048;
      v92 = v62;
      v93 = 2048;
      v94 = v60;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[%.2f - %.2f] keyFrameScore=%.2f, expressionScore=%.2f, actionScore=%.2f, voiceScore=%.2f, humanActionScore=%.2f, humanPoseScore=%0.2f, qualityJunkScore = %.2f, mlQualityScore = %.2f, Score=%.2f", v82, 0x70u);

    }
  }

}

- (float)computeExpressionScoreInTimerange:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  float v6;
  float v7;
  uint64_t i;
  const __CFDictionary *v9;
  __int128 v10;
  void *v11;
  NSString *v12;
  void *v13;
  char v14;
  float v15;
  float v16;
  double Seconds;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float result;
  NSArray *obj;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v32;
  CMTimeRange v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  NSRect v40;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = self->_faceResults;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v4)
  {

    return 0.0;
  }
  v5 = *(_QWORD *)v35;
  v6 = 0.0;
  v7 = 0.0;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v35 != v5)
        objc_enumerationMutation(obj);
      v9 = *(const __CFDictionary **)(*((_QWORD *)&v34 + 1) + 8 * i);
      memset(&v33, 0, sizeof(v33));
      CMTimeRangeMakeFromDictionary(&v33, v9);
      range = v33;
      memset(&v32, 0, sizeof(v32));
      v10 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v10;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&v32, &range, &otherRange);
      if ((v32.start.flags & 1) != 0
        && (v32.duration.flags & 1) != 0
        && !v32.duration.epoch
        && (v32.duration.value & 0x8000000000000000) == 0)
      {
        time1 = v32.duration;
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (!CMTimeCompare(&time1, &time2))
          continue;
      }
      -[__CFDictionary objectForKey:](v9, "objectForKey:", CFSTR("attributes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", CFSTR("faceBounds"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary objectForKey:](v9, "objectForKey:", CFSTR("flags"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");
      v40 = NSRectFromString(v12);
      v15 = v40.size.width * v40.size.height + -0.170000002;
      v16 = -[VCPMovieHighlightAnalyzer computeExpressionScoreInTimerange:]::kAreaSigma[v15 > 0.0];
      time = v32.duration;
      Seconds = CMTimeGetSeconds(&time);
      v18 = expf((float)-(float)(v15 * v15) / v16);
      if ((v14 & 2) != 0)
        v19 = 0.3;
      else
        v19 = 0.0;
      v20 = v19 + v18;
      if (v20 < 1.0)
        v21 = v20;
      else
        v21 = 1.0;
      if (v20 <= 0.0)
        v22 = 0.0;
      else
        v22 = v21;

      v23 = Seconds;
      v7 = v7 + (float)(v22 * v23);
      v6 = v6 + v23;
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  }
  while (v4);

  if (v6 == 0.0)
    return 0.0;
  v24 = 1.0;
  if ((float)(v7 / v6) < 1.0)
    v24 = v7 / v6;
  result = 0.0;
  if ((float)(v7 / v6) > 0.0)
    return v24;
  return result;
}

- (float)expressionScoreForTimerange:(id *)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float result;
  CMTime time;
  CMTimeRange range;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_keyFrameResults;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v5)
  {

    return 0.0;
  }
  v6 = *(_QWORD *)v22;
  v7 = 0.0;
  v8 = 0.0;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v22 != v6)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      v11 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&range.start.epoch = v11;
      *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
      if (v10)
        objc_msgSend(v10, "timestamp");
      else
        memset(&time, 0, sizeof(time));
      if (CMTimeRangeContainsTime(&range, &time))
      {
        objc_msgSend(v10, "expressionChangeScore");
        v13 = v12;
        objc_msgSend(v10, "expressionChangeScore");
        v15 = v14;
        objc_msgSend(v10, "expressionChangeScore");
        v8 = v8 + (float)(v13 * v15);
        v7 = v7 + v16;
      }
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v5);

  if (v7 == 0.0)
    return 0.0;
  v17 = 1.0;
  if ((float)(v8 / v7) < 1.0)
    v17 = v8 / v7;
  result = 0.0;
  if ((float)(v8 / v7) > 0.0)
    return v17;
  return result;
}

- (float)computeSubtleMotionScoreInTimerange:(id *)a3
{
  __int128 v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  CMTime *v10;
  float v11;
  float v12;
  uint64_t v13;
  const __CFDictionary *v14;
  __int128 v15;
  void *v16;
  float v17;
  float v18;
  float Seconds;
  float v20;
  float v21;
  BOOL v22;
  float result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;
  CMTime time;
  CMTime v26;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v29;
  CMTimeRange time1;
  CMTimeRange v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTimeRange range;
  CMTime v37;
  CMTime time2;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  memset(&v37, 0, sizeof(v37));
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v37, &range);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = self->_subtleMotionResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v33;
    v9 = 0.0;
    v10 = (CMTime *)MEMORY[0x1E0CA2E68];
    v11 = 0.0;
    v12 = 0.0;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v8)
        objc_enumerationMutation(v6);
      v14 = *(const __CFDictionary **)(*((_QWORD *)&v32 + 1) + 8 * v13);
      memset(&v31, 0, sizeof(v31));
      CMTimeRangeMakeFromDictionary(&v31, v14);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v31.start.value;
      time1.start.epoch = v31.start.epoch;
      time2 = v37;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v29 = v31;
      memset(&time1, 0, sizeof(time1));
      v15 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v15;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v29, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, v26 = *v10, CMTimeCompare(&duration, &v26)))
      {
        -[__CFDictionary objectForKey:](v14, "objectForKey:", CFSTR("quality"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        time = time1.duration;
        Seconds = CMTimeGetSeconds(&time);
        v12 = v12 + (float)(v18 * Seconds);
        v9 = v9 + Seconds;
        if (v11 <= v18)
          v11 = v18;
      }
      if (v7 == ++v13)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }

    if (v9 != 0.0)
    {
      var1 = a3->var1;
      v12 = v12 / CMTimeGetSeconds((CMTime *)&var1);
    }
  }
  else
  {

    v11 = 0.0;
    v12 = 0.0;
  }
  v20 = (float)(erff((float)((float)((float)(v11 + v12) * 0.5) * 6.0) + -1.8) * 0.5) + 0.5;
  v21 = 1.0;
  if (v20 < 1.0)
    v21 = v20;
  v22 = v20 > 0.0;
  result = 0.0;
  if (v22)
    return v21;
  return result;
}

- (float)computeActionScoreInTimerange:(id *)a3
{
  __int128 v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  CMTime *v10;
  float v11;
  float v12;
  uint64_t v13;
  const __CFDictionary *v14;
  __int128 v15;
  void *v16;
  float v17;
  float v18;
  float Seconds;
  float v20;
  float v21;
  BOOL v22;
  float result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;
  CMTime time;
  CMTime v26;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v29;
  CMTimeRange time1;
  CMTimeRange v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTimeRange range;
  CMTime v37;
  CMTime time2;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  memset(&v37, 0, sizeof(v37));
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v37, &range);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = self->_actionResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v33;
    v9 = 0.0;
    v10 = (CMTime *)MEMORY[0x1E0CA2E68];
    v11 = 0.0;
    v12 = 0.0;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v8)
        objc_enumerationMutation(v6);
      v14 = *(const __CFDictionary **)(*((_QWORD *)&v32 + 1) + 8 * v13);
      memset(&v31, 0, sizeof(v31));
      CMTimeRangeMakeFromDictionary(&v31, v14);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v31.start.value;
      time1.start.epoch = v31.start.epoch;
      time2 = v37;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v29 = v31;
      memset(&time1, 0, sizeof(time1));
      v15 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v15;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v29, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, v26 = *v10, CMTimeCompare(&duration, &v26)))
      {
        -[__CFDictionary objectForKey:](v14, "objectForKey:", CFSTR("quality"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        time = time1.duration;
        Seconds = CMTimeGetSeconds(&time);
        v12 = v12 + (float)(v18 * Seconds);
        v9 = v9 + Seconds;
        if (v11 <= v18)
          v11 = v18;
      }
      if (v7 == ++v13)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }

    if (v9 != 0.0)
    {
      var1 = a3->var1;
      v12 = v12 / CMTimeGetSeconds((CMTime *)&var1);
    }
  }
  else
  {

    v11 = 0.0;
    v12 = 0.0;
  }
  v20 = (float)(erff((float)((float)((float)(v11 + v12) * 0.5) * 6.0) + -1.8) * 0.5) + 0.5;
  v21 = 1.0;
  if (v20 < 1.0)
    v21 = v20;
  v22 = v20 > 0.0;
  result = 0.0;
  if (v22)
    return v21;
  return result;
}

- (float)computeHumanActionScoreInTimerange:(id *)a3
{
  __int128 v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  uint64_t v11;
  const __CFDictionary *v12;
  __int128 v13;
  void *v14;
  char v15;
  _BOOL4 v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  const __CFDictionary *v24;
  __int128 v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  float Seconds;
  CMTime var1;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTimeRange v36;
  CMTimeRange v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime duration;
  CMTime time;
  CMTime v44;
  CMTime v45;
  CMTimeRange otherRange;
  CMTimeRange v47;
  CMTimeRange time1;
  CMTimeRange v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  CMTimeRange range;
  CMTime v55;
  CMTime time2;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  memset(&v55, 0, sizeof(v55));
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v55, &range);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = self->_cameraMotionResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v51;
    v9 = 0.0;
    v10 = 0.0;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v8)
        objc_enumerationMutation(v6);
      v12 = *(const __CFDictionary **)(*((_QWORD *)&v50 + 1) + 8 * v11);
      memset(&v49, 0, sizeof(v49));
      CMTimeRangeMakeFromDictionary(&v49, v12);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v49.start.value;
      time1.start.epoch = v49.start.epoch;
      time2 = v55;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v47 = v49;
      memset(&time1, 0, sizeof(time1));
      v13 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v13;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v47, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v45 = time1.duration, v44 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v45, &v44)))
      {
        -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("flags"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        if ((v15 & 0x40) != 0)
        {
          time = time1.duration;
          v10 = CMTimeGetSeconds(&time) + v10;
        }
        duration = time1.duration;
        v9 = CMTimeGetSeconds(&duration) + v9;
      }
      if (v7 == ++v11)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }

    if (v9 != 0.0)
    {
      v16 = (float)(v10 / v9) > 0.8;
      goto LABEL_21;
    }
  }
  else
  {

  }
  v16 = 0;
LABEL_21:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = self->_humanActionResults;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v57, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v39;
    v20 = 0.0;
    v21 = 0.0;
    v22 = 0.0;
LABEL_23:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v19)
        objc_enumerationMutation(v17);
      v24 = *(const __CFDictionary **)(*((_QWORD *)&v38 + 1) + 8 * v23);
      memset(&v49, 0, sizeof(v49));
      CMTimeRangeMakeFromDictionary(&v49, v24);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v49.start.value;
      time1.start.epoch = v49.start.epoch;
      time2 = v55;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      memset(&time1, 0, sizeof(time1));
      v37 = v49;
      v25 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v36.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v36.start.epoch = v25;
      *(_OWORD *)&v36.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v37, &v36);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v35 = time1.duration, v34 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v35, &v34)))
      {
        -[__CFDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", CFSTR("attributes"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("absoluteScore"));
        else
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("relativeScore"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v29 = v28;

        v33 = time1.duration;
        Seconds = CMTimeGetSeconds(&v33);
        v22 = v22 + (float)(v29 * Seconds);
        v21 = v21 + Seconds;
        if (v20 <= v29)
          v20 = v29;
      }
      if (v18 == ++v23)
      {
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v57, 16);
        if (v18)
          goto LABEL_23;
        break;
      }
    }

    if (v21 != 0.0)
    {
      var1 = (CMTime)a3->var1;
      v22 = v22 / CMTimeGetSeconds(&var1);
    }
  }
  else
  {

    v20 = 0.0;
    v22 = 0.0;
  }
  return (float)(v20 + v22) * 0.5;
}

- (float)computeHumanPoseScoreInTimerange:(id *)a3
{
  __int128 v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  uint64_t v12;
  const __CFDictionary *v13;
  __int128 v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float Seconds;
  float v20;
  float v21;
  BOOL v22;
  float result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;
  CMTime time;
  CMTime v26;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v29;
  CMTimeRange time1;
  CMTimeRange v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTimeRange range;
  CMTime v37;
  CMTime time2;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  memset(&v37, 0, sizeof(v37));
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v37, &range);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = self->_humanActionResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v33;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v8)
        objc_enumerationMutation(v6);
      v13 = *(const __CFDictionary **)(*((_QWORD *)&v32 + 1) + 8 * v12);
      memset(&v31, 0, sizeof(v31));
      CMTimeRangeMakeFromDictionary(&v31, v13);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v31.start.value;
      time1.start.epoch = v31.start.epoch;
      time2 = v37;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v29 = v31;
      memset(&time1, 0, sizeof(time1));
      v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v14;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v29, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, v26 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&duration, &v26)))
      {
        -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("attributes"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("humanScore"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "floatValue");
        v18 = v17;

        time = time1.duration;
        Seconds = CMTimeGetSeconds(&time);
        v11 = v11 + (float)(v18 * Seconds);
        v9 = v9 + Seconds;
        if (v10 <= v18)
          v10 = v18;
      }
      if (v7 == ++v12)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }

    if (v9 != 0.0)
    {
      var1 = a3->var1;
      v11 = v11 / CMTimeGetSeconds((CMTime *)&var1);
    }
  }
  else
  {

    v10 = 0.0;
    v11 = 0.0;
  }
  v20 = (float)(v10 + v11) * 0.5;
  v21 = 1.0;
  if (v20 < 1.0)
    v21 = (float)(v10 + v11) * 0.5;
  v22 = v20 > 0.0;
  result = 0.0;
  if (v22)
    return v21;
  return result;
}

- (float)computeVoiceScoreInTimeRange:(id *)a3
{
  double Seconds;
  __int128 v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  CMTime *v11;
  uint64_t v12;
  const __CFDictionary *v13;
  __int128 v14;
  float v15;
  float v16;
  BOOL v17;
  float result;
  CMTime duration;
  CMTime v20;
  CMTime v21;
  CMTimeRange otherRange;
  CMTimeRange v23;
  CMTimeRange time1;
  CMTimeRange v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CMTimeRange range;
  CMTime v31;
  CMTime time;
  CMTime time2;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  time = (CMTime)a3->var1;
  Seconds = CMTimeGetSeconds(&time);
  memset(&v31, 0, sizeof(v31));
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v31, &range);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = self->_voiceResults;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
    v10 = 0.0;
    v11 = (CMTime *)MEMORY[0x1E0CA2E68];
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v7);
      v13 = *(const __CFDictionary **)(*((_QWORD *)&v26 + 1) + 8 * v12);
      memset(&v25, 0, sizeof(v25));
      CMTimeRangeMakeFromDictionary(&v25, v13);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v25.start.value;
      time1.start.epoch = v25.start.epoch;
      time2 = v31;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v23 = v25;
      memset(&time1, 0, sizeof(time1));
      v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v14;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v23, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v21 = time1.duration, v20 = *v11, CMTimeCompare(&v21, &v20)))
      {
        duration = time1.duration;
        v10 = CMTimeGetSeconds(&duration) + v10;
      }
      if (v8 == ++v12)
      {
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v10 = 0.0;
  }

  v15 = Seconds;
  v16 = v10 / v15;
  v17 = v15 == 0.0;
  result = 0.0;
  if (!v17)
    return v16;
  return result;
}

- (int)postProcessMLHighlightScore
{
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  float v6;
  float v7;
  NSArray *i;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  double v26;
  void *v27;
  NSArray *mlHighlightScoreResults;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = self->_mlHighlightScoreResults;
  v4 = (NSArray *)-[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v4)
  {
LABEL_25:

    goto LABEL_26;
  }
  v5 = *(_QWORD *)v35;
  v6 = 0.0;
  v7 = 1.0;
  do
  {
    for (i = 0; i != v4; i = (NSArray *)((char *)i + 1))
    {
      if (*(_QWORD *)v35 != v5)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("quality"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      if (v11 >= v6)
        v6 = v11;

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("quality"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      if (v7 >= v13)
        v7 = v13;

    }
    v4 = (NSArray *)-[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  }
  while (v4);

  if (v6 > 0.0 && v6 > v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v15 = *(float *)&self->_contextResults;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v3 = self->_mlHighlightScoreResults;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    v17 = v16;
    if (v16)
    {
      v18 = *(_QWORD *)v31;
      v19 = v15 / v6;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v3);
          v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v20);
          v22 = (void *)objc_msgSend(v21, "mutableCopy", (_QWORD)v30);
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("quality"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          v25 = v24;

          *(float *)&v26 = v19 * v25;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, CFSTR("quality"));

          -[NSArray addObject:](v4, "addObject:", v22);
          ++v20;
        }
        while (v17 != v20);
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v17);
    }
    goto LABEL_25;
  }
  v4 = 0;
LABEL_26:
  mlHighlightScoreResults = self->_mlHighlightScoreResults;
  self->_mlHighlightScoreResults = v4;

  return 0;
}

- (int)combineMLHighlightScore
{
  unint64_t v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  double v16;
  float v17;
  float v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (self->_mlHighlightScoreResults && -[NSMutableArray count](self->_internalResults, "count"))
  {
    v3 = 0;
    v4 = 0.0;
    v5 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v3, v21, v22, v23);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "timerange");
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v21 = 0u;
      }
      -[VCPMovieHighlightAnalyzer computeMLHighlightScoreForTimerange:](self, "computeMLHighlightScoreForTimerange:", &v21);
      v9 = v8;
      objc_msgSend(v7, "score");
      if (v10 >= 0.0)
      {
        if (v9 < 0.0 || v9 < 0.3 && (objc_msgSend(v7, "score"), v14 > 0.3))
        {
          if (v5 <= 0.0 || v4 <= 0.0 || (float)(vabds_f32(v4, v5) / (float)(v5 + v4)) >= 0.33)
          {
            objc_msgSend(v7, "score", v21, v22, v23);
            v4 = v17;
          }
          else
          {
            objc_msgSend(v7, "score");
            v12 = v4 * (float)(v11 / v5);
            if (v12 < 1.0)
              v13 = v12;
            else
              v13 = 1.0;
            if (v12 <= 0.0)
              v4 = 0.0;
            else
              v4 = v13;
          }
          objc_msgSend(v7, "score", v21, v22, v23);
          v5 = v18;
          *(float *)&v19 = v4;
          objc_msgSend(v7, "setScore:", v19);
        }
        else
        {
          objc_msgSend(v7, "score", v21, v22, v23);
          v5 = v15;
          *(float *)&v16 = v9;
          objc_msgSend(v7, "setScore:", v16);
          v4 = v9;
        }
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_internalResults, "replaceObjectAtIndex:withObject:", v3, v7);
      }

      ++v3;
    }
    while (v3 < -[NSMutableArray count](self->_internalResults, "count"));
  }
  return 0;
}

- (float)computeMLHighlightScoreForTimerange:(id *)a3
{
  __int128 v5;
  CMTime *v6;
  __int128 v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  const __CFDictionary *v13;
  __int128 v14;
  void *v15;
  float v16;
  float v17;
  double Seconds;
  float v19;
  int32_t v20;
  float result;
  float v22;
  float v23;
  BOOL v24;
  CMTime v25;
  CMTime time;
  CMTime v27;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v30;
  CMTimeRange time1;
  CMTimeRange v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CMTime v37;
  CMTimeRange range;
  CMTime v39;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  memset(&v39, 0, sizeof(v39));
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v39, &range);
  v6 = (CMTime *)MEMORY[0x1E0CA2E68];
  v7 = *MEMORY[0x1E0CA2E68];
  v37.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  *(_OWORD *)&v37.value = v7;
  v8 = self->_mlHighlightScoreResults;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v34;
    v11 = 0.0;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v8);
      v13 = *(const __CFDictionary **)(*((_QWORD *)&v33 + 1) + 8 * v12);
      memset(&v32, 0, sizeof(v32));
      CMTimeRangeMakeFromDictionary(&v32, v13);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v32.start.value;
      time1.start.epoch = v32.start.epoch;
      time2 = v39;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v30 = v32;
      memset(&time1, 0, sizeof(time1));
      v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v14;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v30, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, v27 = *v6, CMTimeCompare(&duration, &v27)))
      {
        -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("quality"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16;

        time = time1.duration;
        Seconds = CMTimeGetSeconds(&time);
        lhs = v37;
        rhs = time1.duration;
        CMTimeAdd(&time2, &lhs, &rhs);
        v37 = time2;
        v19 = Seconds;
        v11 = v11 + (float)(v17 * v19);
      }
      if (v9 == ++v12)
      {
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v11 = 0.0;
  }

  v32.start = v37;
  *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var1.var0;
  time1.start.epoch = a3->var1.var3;
  v20 = CMTimeCompare(&v32.start, &time1.start);
  result = -1.0;
  if (!v20)
  {
    v25 = v37;
    v22 = v11 / CMTimeGetSeconds(&v25);
    v23 = 1.0;
    if (v22 < 1.0)
      v23 = v22;
    v24 = v22 > 0.0;
    result = 0.0;
    if (v24)
      return v23;
  }
  return result;
}

- (float)computeMLQualityScoreForTimerange:(id *)a3
{
  __int128 v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  CMTime *v10;
  float v11;
  uint64_t v12;
  const __CFDictionary *v13;
  __int128 v14;
  void *v15;
  float v16;
  float v17;
  float Seconds;
  float result;
  float v20;
  float v21;
  CMTime duration;
  CMTime v23;
  CMTime v24;
  CMTimeRange otherRange;
  CMTimeRange v26;
  CMTimeRange time1;
  CMTimeRange v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CMTimeRange range;
  CMTime v34;
  CMTime time2;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  memset(&v34, 0, sizeof(v34));
  v5 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v34, &range);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_mlQualityResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v30;
    v9 = 0.0;
    v10 = (CMTime *)MEMORY[0x1E0CA2E68];
    v11 = 0.0;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(v6);
      v13 = *(const __CFDictionary **)(*((_QWORD *)&v29 + 1) + 8 * v12);
      memset(&v28, 0, sizeof(v28));
      CMTimeRangeMakeFromDictionary(&v28, v13);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v28.start.value;
      time1.start.epoch = v28.start.epoch;
      time2 = v34;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v26 = v28;
      memset(&time1, 0, sizeof(time1));
      v14 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v14;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v26, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v24 = time1.duration, v23 = *v10, CMTimeCompare(&v24, &v23)))
      {
        -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("quality"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "floatValue");
        v17 = v16;

        duration = time1.duration;
        Seconds = CMTimeGetSeconds(&duration);
        v11 = v11 + (float)(v17 * Seconds);
        v9 = v9 + Seconds;
      }
      if (v7 == ++v12)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0.0;
    v11 = 0.0;
  }

  result = 1.0;
  if (v9 <= 0.0)
    v20 = 1.0;
  else
    v20 = v9;
  v21 = v11 / v20;
  if (v21 < 1.0)
    result = v21;
  if (v21 <= 0.0)
    return 0.0;
  return result;
}

- (float)stickerScaledScore:(float)a3 highPrecisionThreshold:(float)a4 highRecallThreshold:(float)a5
{
  float v5;
  float v6;
  float v7;

  if (a3 > a4)
  {
    v5 = (float)((float)(a3 - a4) * 0.1) / (float)(1.0 - a4);
    v6 = 0.9;
    return v5 + v6;
  }
  v7 = 0.0;
  if (a3 > a5)
  {
    v5 = (float)((float)(a3 - a5) * 0.1) / (float)(1.0 - a5);
    v6 = 0.2;
    return v5 + v6;
  }
  return v7;
}

- (float)analyzeOverallQuality:(id *)a3 isSettlingEffect:(BOOL)a4 isAnimatedSticker:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  __int128 v9;
  float v10;
  float v11;
  __int128 v12;
  float v13;
  float v14;
  __int128 v15;
  float v16;
  float v17;
  __int128 v18;
  float v19;
  float v20;
  float v21;
  __int128 v22;
  float v23;
  __int128 v24;
  float v25;
  __int128 v26;
  float v27;
  float v28;
  __int128 v29;
  float v30;
  float v31;
  __int128 v32;
  float v33;
  float v34;
  __int128 v35;
  double v36;
  double v37;
  double v38;
  float v39;
  float v40;
  double v41;
  double v42;
  double v43;
  float v44;
  float v45;
  double v46;
  double v47;
  double v48;
  float v49;
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
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  CMTime v72;
  CMTime var1;
  CMTime time;
  _OWORD v75[3];
  _OWORD v76[3];
  _OWORD v77[3];
  _OWORD v78[3];
  _OWORD v79[3];
  _OWORD v80[3];
  _OWORD v81[3];
  _OWORD v82[3];
  _OWORD v83[3];
  _OWORD v84[3];

  v5 = a5;
  v6 = a4;
  v9 = *(_OWORD *)&a3->var0.var3;
  v84[0] = *(_OWORD *)&a3->var0.var0;
  v84[1] = v9;
  v84[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer qualityScoreForTimerange:](self, "qualityScoreForTimerange:", v84);
  v11 = v10;
  v12 = *(_OWORD *)&a3->var0.var3;
  v83[0] = *(_OWORD *)&a3->var0.var0;
  v83[1] = v12;
  v83[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer actionScoreForTimerange:](self, "actionScoreForTimerange:", v83);
  v14 = v13;
  v15 = *(_OWORD *)&a3->var0.var3;
  v82[0] = *(_OWORD *)&a3->var0.var0;
  v82[1] = v15;
  v82[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer subtleMotionScoreForTimerange:](self, "subtleMotionScoreForTimerange:", v82);
  v17 = v16;
  v18 = *(_OWORD *)&a3->var0.var3;
  v81[0] = *(_OWORD *)&a3->var0.var0;
  v81[1] = v18;
  v81[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer expressionScoreForTimerange:](self, "expressionScoreForTimerange:", v81);
  v20 = v19;
  v21 = 0.5;
  if (!v6)
  {
    v22 = *(_OWORD *)&a3->var0.var3;
    v80[0] = *(_OWORD *)&a3->var0.var0;
    v80[1] = v22;
    v80[2] = *(_OWORD *)&a3->var1.var1;
    -[VCPMovieHighlightAnalyzer voiceScoreForTimerange:](self, "voiceScoreForTimerange:", v80);
    v21 = v23;
  }
  v24 = *(_OWORD *)&a3->var0.var3;
  v79[0] = *(_OWORD *)&a3->var0.var0;
  v79[1] = v24;
  v79[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer junkScoreForTimerange:lengthScale:](self, "junkScoreForTimerange:lengthScale:", v79, !v6);
  v71 = v25;
  v26 = *(_OWORD *)&a3->var0.var3;
  v78[0] = *(_OWORD *)&a3->var0.var0;
  v78[1] = v26;
  v78[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer cameraMotionScoreForTimerange:](self, "cameraMotionScoreForTimerange:", v78);
  v28 = v27;
  v29 = *(_OWORD *)&a3->var0.var3;
  v77[0] = *(_OWORD *)&a3->var0.var0;
  v77[1] = v29;
  v77[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer visualPleasingScoreForTimerange:](self, "visualPleasingScoreForTimerange:", v77);
  v31 = v30;
  v32 = *(_OWORD *)&a3->var0.var3;
  v76[0] = *(_OWORD *)&a3->var0.var0;
  v76[1] = v32;
  v76[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer computeHumanActionScoreInTimerange:](self, "computeHumanActionScoreInTimerange:", v76);
  v34 = v33;
  v35 = *(_OWORD *)&a3->var0.var3;
  v75[0] = *(_OWORD *)&a3->var0.var0;
  v75[1] = v35;
  v75[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer computeHumanPoseScoreInTimerange:](self, "computeHumanPoseScoreInTimerange:", v75);
  if (v5)
  {
    LODWORD(v37) = 1062165545;
    *(float *)&v36 = v14;
    LODWORD(v38) = 1045220557;
    -[VCPMovieHighlightAnalyzer stickerScaledScore:highPrecisionThreshold:highRecallThreshold:](self, "stickerScaledScore:highPrecisionThreshold:highRecallThreshold:", v36, v37, v38);
    v40 = v39 + 0.0;
    LODWORD(v41) = 1041865114;
    LODWORD(v42) = 1028443341;
    *(float *)&v43 = v34;
    -[VCPMovieHighlightAnalyzer stickerScaledScore:highPrecisionThreshold:highRecallThreshold:](self, "stickerScaledScore:highPrecisionThreshold:highRecallThreshold:", v43, v41, v42);
    v45 = v40 + v44;
    LODWORD(v46) = 1.0;
    *(float *)&v47 = v17;
    LODWORD(v48) = 1045220557;
    -[VCPMovieHighlightAnalyzer stickerScaledScore:highPrecisionThreshold:highRecallThreshold:](self, "stickerScaledScore:highPrecisionThreshold:highRecallThreshold:", v47, v46, v48);
    return (float)(v45 + v49) / 3.0;
  }
  else
  {
    v51 = v17 * 1.1;
    if (!v6)
      v51 = v17;
    if (v14 >= v51)
      v51 = v14;
    if (v51 < (float)(v34 * 1.5))
      v51 = v34 * 1.5;
    if (v51 < 0.2 && v21 < 0.2)
      *(float *)&v36 = *(float *)&v36 * 0.3;
    v52 = *(float *)&v36 * 0.5;
    if (v20 >= v52)
      v53 = v20;
    else
      v53 = v52;
    v54 = flt_1B6FBEA38[v11 > 0.4];
    v55 = v54 + 0.1;
    v56 = 0.0;
    if (v51 >= 0.2 || v53 >= 0.2)
      v56 = v21 * 0.1;
    v57 = v56 + (float)(v54 * v11);
    if (v51 < 0.2 && v53 < 0.2)
    {
      if (v28 >= 0.2)
      {
        v59 = v55 + 0.7;
        v58 = (float)((float)((float)(v31 * 0.6) * 0.35) + (float)((float)(v28 * 0.35) * 0.6)) + v57;
      }
      else
      {
        v58 = (float)((float)(v53 * 0.35) + (float)(v51 * 0.25)) + 0.0;
        v59 = 0.7;
      }
    }
    else
    {
      v60 = (float)((float)(v31 * 0.6) * 0.35) + (float)((float)(v28 * 0.35) * 0.6);
      v61 = (float)((float)(v53 * 0.35) + (float)(v51 * 0.25)) + (float)(v31 * 0.35);
      v62 = 0.7;
      if ((float)(v60 / 0.7) <= (float)(v61 / 0.95))
        v62 = 0.95;
      v59 = v55 + v62;
      if ((float)(v60 / 0.7) > (float)(v61 / 0.95))
        v61 = (float)((float)(v31 * 0.6) * 0.35) + (float)((float)(v28 * 0.35) * 0.6);
      v58 = v57 + v61;
    }
    v63 = v58 / v59;
    if (v59 == 0.0)
      v64 = 0.0;
    else
      v64 = v63;
    v65 = 1.0;
    if (!v6)
    {
      time = (CMTime)a3->var1;
      v66 = (CMTimeGetSeconds(&time) + -3.0) / 424.26001;
      v67 = erff(v66);
      var1 = (CMTime)a3->var1;
      if (CMTimeGetSeconds(&var1) <= 10.0)
      {
        v65 = v67 + 1.0;
      }
      else
      {
        v72 = (CMTime)a3->var1;
        v68 = (10.0 - CMTimeGetSeconds(&v72)) / 424.26001;
        v65 = erff(v68) + 1.0;
      }
    }
    v69 = powf((float)(v71 * v64) * v65, 0.8) * 1.25;
    if (v69 < 1.0)
      v70 = v69;
    else
      v70 = 1.0;
    if (v69 <= 0.0)
      return 0.0;
    else
      return v70;
  }
}

- (float)qualityScoreForTimerange:(id *)a3
{
  unint64_t v5;
  CMTime *v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  const __CFDictionary *v12;
  __int128 v13;
  double Seconds;
  void *v15;
  float v16;
  float v17;
  _BOOL4 v18;
  _BOOL4 v19;
  float v20;
  NSUInteger v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  BOOL v27;
  float result;
  float v29;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v35;
  CMTimeRange v36;

  if (!-[NSArray count](self->_qualityResults, "count"))
    return 0.0;
  v5 = 0;
  v6 = (CMTime *)MEMORY[0x1E0CA2E68];
  v7 = 0.0;
  v8 = 0.0;
  v9 = 1.0;
  v10 = 0.0;
  v11 = 0.0;
  v29 = 1.0;
  do
  {
    -[NSArray objectAtIndex:](self->_qualityResults, "objectAtIndex:", v5);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    memset(&v36, 0, sizeof(v36));
    CMTimeRangeMakeFromDictionary(&v36, v12);
    v13 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v13;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    memset(&v35, 0, sizeof(v35));
    otherRange = v36;
    CMTimeRangeGetIntersection(&v35, &range, &otherRange);
    v36 = v35;
    if ((v35.start.flags & 1) == 0
      || (v36.duration.flags & 1) == 0
      || v36.duration.epoch
      || v36.duration.value < 0
      || (time1 = v36.duration, time2 = *v6, CMTimeCompare(&time1, &time2)))
    {
      time = v36.duration;
      Seconds = CMTimeGetSeconds(&time);
      -[__CFDictionary objectForKey:](v12, "objectForKey:", CFSTR("quality"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v17 = v16;

      v18 = v9 > 0.3;
      v19 = v9 <= 0.3;
      if (v17 <= 0.3)
        v20 = 0.0;
      else
        v20 = 1.0;
      if (v17 <= 0.3)
        v19 = 0;
      else
        v18 = 0;
      if (v18 || v19)
        v8 = v8 + 1.0;
      v21 = -[NSArray count](self->_qualityResults, "count");
      v22 = Seconds;
      v11 = v11 + v22;
      v7 = v7 + (float)(v17 * v22);
      v10 = v10 + (float)(v20 * v22);
      if (v5 < v21 - 1)
      {
        v23 = v29;
        if (v29 > v22)
          v23 = Seconds;
        v29 = v23;
      }
    }
    else
    {
      v17 = v9;
    }

    ++v5;
    v9 = v17;
  }
  while (v5 < -[NSArray count](self->_qualityResults, "count"));
  if (v11 == 0.0)
    return 0.0;
  v24 = (float)((float)(v29 * (float)(v8 * -0.4)) / v11) + 1.0;
  v25 = v24 * (float)((float)(v10 * (float)(v7 / v11)) / v11);
  if (v25 < 1.0)
    v26 = v24 * (float)((float)(v10 * (float)(v7 / v11)) / v11);
  else
    v26 = 1.0;
  v27 = v25 > 0.0;
  result = 0.0;
  if (v27)
    return v26;
  return result;
}

- (float)actionScoreForTimerange:(id *)a3
{
  __int128 v3;
  uint64_t v4;
  float v5;
  CMTime *v6;
  float v7;
  uint64_t v8;
  const __CFDictionary *v9;
  __int128 v10;
  void *v11;
  float v12;
  float v13;
  double Seconds;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  const __CFDictionary *v20;
  void *v21;
  float v22;
  float v23;
  double v24;
  double v25;
  float v26;
  float v27;
  float v28;
  float v29;
  BOOL v30;
  float result;
  NSArray *obj;
  uint64_t v35;
  uint64_t v36;
  float v37;
  CMTime duration;
  CMTime v39;
  CMTime v40;
  CMTimeRange v41;
  CMTimeRange v42;
  CMTimeRange v43;
  CMTimeRange v44;
  CMTime v45;
  CMTimeRange time2;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CMTime time;
  CMTime v52;
  CMTime v53;
  CMTimeRange otherRange;
  CMTimeRange v55;
  CMTimeRange time1;
  CMTimeRange v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CMTimeRange range;
  CMTime v63;
  CMTime v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  memset(&v63, 0, sizeof(v63));
  v3 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v63, &range);
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = self->_actionResults;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v4)
  {
    v36 = *(_QWORD *)v59;
    v5 = 0.0;
    v6 = (CMTime *)MEMORY[0x1E0CA2E68];
    v7 = 0.0;
LABEL_3:
    v35 = v4;
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v59 != v36)
        objc_enumerationMutation(obj);
      v9 = *(const __CFDictionary **)(*((_QWORD *)&v58 + 1) + 8 * v8);
      memset(&v57, 0, sizeof(v57));
      CMTimeRangeMakeFromDictionary(&v57, v9);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v57.start.value;
      time1.start.epoch = v57.start.epoch;
      time2.start = v63;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0)
        break;
      v55 = v57;
      memset(&time1, 0, sizeof(time1));
      v10 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v10;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v55, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v53 = time1.duration, v52 = *v6, CMTimeCompare(&v53, &v52)))
      {
        -[__CFDictionary objectForKey:](v9, "objectForKey:", CFSTR("quality"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v7;
        objc_msgSend(v11, "floatValue");
        v13 = v12;

        time = time1.duration;
        Seconds = CMTimeGetSeconds(&time);
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v15 = self->_qualityResults;
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v48;
          v18 = 0.0;
LABEL_14:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v48 != v17)
              objc_enumerationMutation(v15);
            v20 = *(const __CFDictionary **)(*((_QWORD *)&v47 + 1) + 8 * v19);
            memset(&time2, 0, sizeof(time2));
            CMTimeRangeMakeFromDictionary(&time2, v20);
            v44 = time1;
            CMTimeRangeGetEnd(&v45, &v44);
            *(_OWORD *)&v43.start.value = *(_OWORD *)&time2.start.value;
            v43.start.epoch = time2.start.epoch;
            v64 = v45;
            if ((CMTimeCompare(&v43.start, &v64) & 0x80000000) == 0)
              break;
            v42 = time1;
            memset(&v43, 0, sizeof(v43));
            v41 = time2;
            CMTimeRangeGetIntersection(&v43, &v42, &v41);
            -[__CFDictionary objectForKey:](v20, "objectForKey:", CFSTR("quality"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "floatValue");
            v23 = v22;

            if ((v43.start.flags & 1) == 0
              || (v43.duration.flags & 1) == 0
              || v43.duration.epoch
              || v43.duration.value < 0
              || (v40 = v43.duration, v39 = *v6, CMTimeCompare(&v40, &v39)))
            {
              duration = v43.duration;
              v24 = CMTimeGetSeconds(&duration);
              if (v23 <= 0.3)
                v25 = 0.0;
              else
                v25 = 1.0;
              v18 = v18 + v25 * v24;
            }
            if (v16 == ++v19)
            {
              v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
              if (v16)
                goto LABEL_14;
              break;
            }
          }
        }
        else
        {
          v18 = 0.0;
        }

        v26 = Seconds;
        v5 = v5 + (float)((float)(v13 * v26) * (float)(v18 / v26));
        v7 = v37 + v26;
      }
      if (++v8 == v35)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v5 = 0.0;
    v7 = 0.0;
  }

  v27 = v7;
  if (v7 <= 0.0)
    v27 = 1.0;
  v28 = (float)(erff((float)((float)(v5 / v27) * 6.0) + -1.8) * 0.5) + 0.5;
  if (v28 < 1.0)
    v29 = v28;
  else
    v29 = 1.0;
  v30 = v28 > 0.0;
  result = 0.0;
  if (v30)
    return v29;
  return result;
}

- (float)voiceScoreForTimerange:(id *)a3
{
  __int128 v3;
  float v4;
  float v5;
  float v6;
  BOOL v7;
  float result;
  _OWORD v9[3];

  v3 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v3;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  -[VCPMovieHighlightAnalyzer computeVoiceScoreInTimeRange:](self, "computeVoiceScoreInTimeRange:", v9);
  v5 = expf((float)((float)(1.0 - v4) * (float)(1.0 - v4)) * -4.0);
  if (v5 < 1.0)
    v6 = v5;
  else
    v6 = 1.0;
  v7 = v5 > 0.0;
  result = 0.0;
  if (v7)
    return v6;
  return result;
}

- (float)visualPleasingScoreForTimerange:(id *)a3
{
  NSArray *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  float v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  float v12;
  CMTime time;
  CMTimeRange range;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_keyFrameResults;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v17;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.epoch = v11;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
        if (v10)
          objc_msgSend(v10, "timestamp");
        else
          memset(&time, 0, sizeof(time));
        if (CMTimeRangeContainsTime(&range, &time))
        {
          objc_msgSend(v10, "visualPleasingScore");
          v8 = v8 + v12;
          ++v6;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);

    if (v6)
      return v8 / (float)v6;
  }
  else
  {

  }
  return -1.0;
}

- (float)cameraMotionScoreForTimerange:(id *)a3
{
  uint64_t v3;
  float v4;
  float v5;
  float v6;
  const __CFDictionary *v7;
  __int128 v8;
  __int128 v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFDictionary *v14;
  void *v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  char v19;
  unsigned int v20;
  double Seconds;
  void *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  BOOL v31;
  float result;
  CMTime *p_duration;
  NSArray *obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  CMTime var1;
  CMTime time;
  CMTime v42;
  CMTime duration;
  CMTimeRange v44;
  CMTimeRange v45;
  CMTimeRange time2;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CMTime v51;
  CMTime v52;
  CMTimeRange otherRange;
  CMTimeRange v54;
  CMTimeRange time1;
  CMTimeRange v56;
  CMTimeRange range;
  CMTime v58;
  CMTimeRange v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CMTime v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = self->_qualityResults;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (v3)
  {
    v36 = v3;
    v37 = *(_QWORD *)v61;
    p_duration = &v59.duration;
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
LABEL_3:
    v39 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v37)
        objc_enumerationMutation(obj);
      v7 = *(const __CFDictionary **)(*((_QWORD *)&v60 + 1) + 8 * v39);
      memset(&v59, 0, sizeof(v59));
      CMTimeRangeMakeFromDictionary(&v59, v7);
      memset(&v58, 0, sizeof(v58));
      range = v59;
      CMTimeRangeGetEnd(&v58, &range);
      v8 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v56.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v56.start.epoch = v8;
      *(_OWORD *)&v56.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetEnd(&v64, &v56);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v59.start.value;
      time1.start.epoch = v59.start.epoch;
      time2.start = v64;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0)
        break;
      v54 = v59;
      v9 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v9;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v54, &otherRange);
      v59 = time1;
      if ((time1.start.flags & 1) == 0
        || (v59.duration.flags & 1) == 0
        || v59.duration.epoch
        || v59.duration.value < 0
        || (v52 = *p_duration, v51 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v52, &v51)))
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v10 = self->_cameraMotionResults;
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v48;
LABEL_14:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v48 != v12)
              objc_enumerationMutation(v10);
            v14 = *(const __CFDictionary **)(*((_QWORD *)&v47 + 1) + 8 * v13);
            memset(&time1, 0, sizeof(time1));
            CMTimeRangeMakeFromDictionary(&time1, v14);
            *(_OWORD *)&time2.start.value = *(_OWORD *)&time1.start.value;
            time2.start.epoch = time1.start.epoch;
            v64 = v58;
            if ((CMTimeCompare(&time2.start, &v64) & 0x80000000) == 0)
              break;
            v45 = time1;
            memset(&time2, 0, sizeof(time2));
            v44 = v59;
            CMTimeRangeGetIntersection(&time2, &v45, &v44);
            if ((time2.start.flags & 1) == 0
              || (time2.duration.flags & 1) == 0
              || time2.duration.epoch
              || time2.duration.value < 0
              || (duration = time2.duration,
                  v42 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
                  CMTimeCompare(&duration, &v42)))
            {
              -[__CFDictionary objectForKey:](v14, "objectForKey:", CFSTR("flags"), p_duration);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "integerValue");
              v17 = v16 & 0x3FFC0;
              v18 = __clz(__rbit32(v16 & 0x2FFC0));
              if (v19 | ((v16 & 0x2FFC0) == 0))
                v20 = 0;
              else
                v20 = v18;
              time = time2.duration;
              Seconds = CMTimeGetSeconds(&time);
              -[__CFDictionary objectForKey:](v7, "objectForKey:", CFSTR("quality"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "floatValue");
              v24 = v23;

              if ((v17 & 0x10000) != 0 || v20 - 7 >= 4 && v20 != 12)
                goto LABEL_37;
              v25 = Seconds;
              v26 = 0.0;
              if (v24 > 0.3)
              {
                if ((float)(v24 + 0.2) < 1.0)
                  v27 = v24 + 0.2;
                else
                  v27 = 1.0;
                v28 = 0.0;
                if ((float)(v24 + 0.2) > 0.0)
                  v28 = v27;
                v26 = v28 * v25;
              }
              v6 = v6 + v26;
              v5 = v5 + v25;
              if (v4 >= v25)
LABEL_37:
                v25 = v4;

              v4 = v25;
            }
            if (v11 == ++v13)
            {
              v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v47, v65, 16);
              if (v11)
                goto LABEL_14;
              break;
            }
          }
        }

      }
      if (++v39 == v36)
      {
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        if (v36)
          goto LABEL_3;
        break;
      }
    }

    v29 = 0.0;
    if (v4 >= 0.5 && v5 != 0.0)
    {
      var1 = (CMTime)a3->var1;
      v29 = v6 / CMTimeGetSeconds(&var1);
    }
  }
  else
  {

    v29 = 0.0;
  }
  v30 = 1.0;
  if (v29 < 1.0)
    v30 = v29;
  v31 = v29 > 0.0;
  result = 0.0;
  if (v31)
    return v30;
  return result;
}

- (float)subtleMotionScoreForTimerange:(id *)a3
{
  __int128 v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  const __CFDictionary *v7;
  __int128 v8;
  void *v9;
  float v10;
  float v11;
  double Seconds;
  NSArray *v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  const __CFDictionary *v19;
  void *v20;
  float v21;
  float v22;
  double v23;
  double v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  const __CFDictionary *v30;
  void *v31;
  uint64_t v32;
  double v33;
  char v34;
  BOOL v35;
  unsigned int v36;
  float v37;
  float v38;
  float v39;
  float v40;
  BOOL v41;
  float result;
  NSArray *obj;
  uint64_t v44;
  uint64_t v46;
  float v48;
  CMTime v49;
  CMTime v50;
  CMTime v51;
  CMTimeRange v52;
  CMTimeRange v53;
  CMTimeRange v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CMTime duration;
  CMTime v60;
  CMTime v61;
  CMTimeRange v62;
  CMTimeRange v63;
  CMTimeRange v64;
  CMTimeRange v65;
  CMTime v66;
  CMTimeRange time2;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  CMTime time;
  CMTime v73;
  CMTime v74;
  CMTimeRange otherRange;
  CMTimeRange v76;
  CMTimeRange time1;
  CMTimeRange v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CMTimeRange range;
  CMTime v84;
  CMTime v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  memset(&v84, 0, sizeof(v84));
  v3 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v84, &range);
  v82 = 0u;
  v81 = 0u;
  v80 = 0u;
  v79 = 0u;
  obj = self->_subtleMotionResults;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
  if (v4)
  {
    v46 = *(_QWORD *)v80;
    v48 = 0.0;
    v5 = 0.0;
LABEL_3:
    v6 = 0;
    v44 = v4;
    while (1)
    {
      if (*(_QWORD *)v80 != v46)
        objc_enumerationMutation(obj);
      v7 = *(const __CFDictionary **)(*((_QWORD *)&v79 + 1) + 8 * v6);
      memset(&v78, 0, sizeof(v78));
      CMTimeRangeMakeFromDictionary(&v78, v7);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v78.start.value;
      time1.start.epoch = v78.start.epoch;
      time2.start = v84;
      if ((CMTimeCompare(&time1.start, &time2.start) & 0x80000000) == 0)
        break;
      memset(&time1, 0, sizeof(time1));
      v76 = v78;
      v8 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v8;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v76, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (v74 = time1.duration, v73 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v74, &v73)))
      {
        -[__CFDictionary objectForKey:](v7, "objectForKey:", CFSTR("quality"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "floatValue");
        v11 = v10;

        time = time1.duration;
        Seconds = CMTimeGetSeconds(&time);
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v13 = self->_qualityResults;
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
        v15 = Seconds;
        if (v14)
        {
          v16 = *(_QWORD *)v69;
          v17 = 0.0;
LABEL_14:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v69 != v16)
              objc_enumerationMutation(v13);
            v19 = *(const __CFDictionary **)(*((_QWORD *)&v68 + 1) + 8 * v18);
            memset(&time2, 0, sizeof(time2));
            CMTimeRangeMakeFromDictionary(&time2, v19);
            v65 = time1;
            CMTimeRangeGetEnd(&v66, &v65);
            *(_OWORD *)&v64.start.value = *(_OWORD *)&time2.start.value;
            v64.start.epoch = time2.start.epoch;
            v85 = v66;
            if ((CMTimeCompare(&v64.start, &v85) & 0x80000000) == 0)
              break;
            v63 = time1;
            memset(&v64, 0, sizeof(v64));
            v62 = time2;
            CMTimeRangeGetIntersection(&v64, &v63, &v62);
            -[__CFDictionary objectForKey:](v19, "objectForKey:", CFSTR("quality"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "floatValue");
            v22 = v21;

            if ((v64.start.flags & 1) == 0
              || (v64.duration.flags & 1) == 0
              || v64.duration.epoch
              || v64.duration.value < 0
              || (v61 = v64.duration, v60 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v61, &v60)))
            {
              duration = v64.duration;
              v23 = CMTimeGetSeconds(&duration);
              if (v22 <= 0.0)
                v24 = 0.0;
              else
                v24 = 1.0;
              v17 = v17 + v24 * v23;
            }
            if (v14 == ++v18)
            {
              v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v68, v87, 16);
              if (v14)
                goto LABEL_14;
              break;
            }
          }

          if (v17 > 0.0)
          {
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v25 = self->_cameraMotionResults;
            v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v55, v86, 16);
            if (v26)
            {
              v27 = *(_QWORD *)v56;
              v28 = 0.0;
LABEL_32:
              v29 = 0;
              while (1)
              {
                if (*(_QWORD *)v56 != v27)
                  objc_enumerationMutation(v25);
                v30 = *(const __CFDictionary **)(*((_QWORD *)&v55 + 1) + 8 * v29);
                memset(&time2, 0, sizeof(time2));
                CMTimeRangeMakeFromDictionary(&time2, v30);
                v54 = time1;
                CMTimeRangeGetEnd(&v66, &v54);
                *(_OWORD *)&v64.start.value = *(_OWORD *)&time2.start.value;
                v64.start.epoch = time2.start.epoch;
                v85 = v66;
                if ((CMTimeCompare(&v64.start, &v85) & 0x80000000) == 0)
                  break;
                memset(&v64, 0, sizeof(v64));
                v53 = time1;
                v52 = time2;
                CMTimeRangeGetIntersection(&v64, &v53, &v52);
                if ((v64.start.flags & 1) == 0
                  || (v64.duration.flags & 1) == 0
                  || v64.duration.epoch
                  || v64.duration.value < 0
                  || (v51 = v64.duration, v50 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v51, &v50)))
                {
                  -[__CFDictionary objectForKey:](v30, "objectForKey:", CFSTR("flags"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "integerValue");
                  v49 = v64.duration;
                  v33 = CMTimeGetSeconds(&v49);
                  if (v34 | ((v32 & 0x2FFC0) == 0))
                    v35 = 0;
                  else
                    v35 = (v32 & 0x40) == 64;
                  v36 = v35;

                  v28 = v28 + (double)v36 * v33;
                }
                if (v26 == ++v29)
                {
                  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v55, v86, 16);
                  if (v26)
                    goto LABEL_32;
                  break;
                }
              }
            }
            else
            {
              v28 = 0.0;
            }

            if (v28 < v17)
              v17 = v28;
          }
          v37 = v17 / v15;
        }
        else
        {

          v37 = 0.0 / v15;
        }
        v48 = v48 + (float)((float)(v11 * v15) * v37);
        v5 = v5 + v15;
        v4 = v44;
      }
      if (++v6 == v4)
      {
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v88, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v48 = 0.0;
    v5 = 0.0;
  }

  if (v5 <= 0.0)
    v38 = 1.0;
  else
    v38 = v5;
  v39 = (float)(erff((float)((float)(v48 / v38) * 6.0) + -1.8) * 0.5) + 0.5;
  if (v39 < 1.0)
    v40 = v39;
  else
    v40 = 1.0;
  v41 = v39 > 0.0;
  result = 0.0;
  if (v41)
    return v40;
  return result;
}

- (float)junkScoreForTimerange:(id *)a3 lengthScale:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  uint64_t i;
  const __CFDictionary *v12;
  __int128 v13;
  double Seconds;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  BOOL v22;
  float result;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v27;
  CMTimeRange v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = self->_junkResults;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v7)
  {

LABEL_14:
    v20 = 1.0;
    goto LABEL_17;
  }
  v8 = *(_QWORD *)v30;
  v9 = 0.0;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v30 != v8)
        objc_enumerationMutation(v6);
      v12 = *(const __CFDictionary **)(*((_QWORD *)&v29 + 1) + 8 * i);
      memset(&v28, 0, sizeof(v28));
      CMTimeRangeMakeFromDictionary(&v28, v12);
      range = v28;
      memset(&v27, 0, sizeof(v27));
      v13 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v13;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&v27, &range, &otherRange);
      duration = v27.duration;
      Seconds = CMTimeGetSeconds(&duration);
      -[__CFDictionary objectForKey:](v12, "objectForKey:", CFSTR("quality"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v17 = v16;

      v18 = Seconds;
      v10 = v10 + (float)(v17 * v18);
      v9 = v9 + v18;
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v7);

  if (v9 == 0.0)
    goto LABEL_14;
  v19 = v10 / v9;
  if (v4)
  {
    v20 = (float)(v19 * (float)(erff((float)(v9 * 3.0) + -2.0) + 1.0)) * 0.5;
    if (v20 >= *(float *)&-[VCPMovieHighlightAnalyzer junkScoreForTimerange:lengthScale:]::kThreshold[4 * (v9 > 2.0)])
      v20 = 1.0;
  }
  else
  {
    v20 = 1.0;
    if (v19 < 0.5)
      v20 = v10 / v9;
  }
LABEL_17:
  v21 = 1.0;
  if (v20 < 1.0)
    v21 = v20;
  v22 = v20 > 0.0;
  result = 0.0;
  if (v22)
    return v21;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffFlipCount.__elems_[4], 0);
  objc_storeStrong((id *)&self->_numberOfFrames, 0);
  objc_storeStrong((id *)&self->_preferredTimeRange.duration.epoch, 0);
  objc_storeStrong((id *)&self->_isMaxTrim, 0);
  objc_storeStrong((id *)&self->_internalConstraintResults, 0);
  objc_storeStrong((id *)&self->_highlightResults, 0);
  objc_storeStrong((id *)&self->_internalResults, 0);
  objc_storeStrong((id *)&self->_expressionSegments, 0);
  objc_storeStrong((id *)&self->_audioQualityResults, 0);
  objc_storeStrong((id *)&self->_mlQualityResults, 0);
  objc_storeStrong((id *)&self->_mlHighlightScoreResults, 0);
  objc_storeStrong((id *)&self->_orientationResults, 0);
  objc_storeStrong((id *)&self->_sceneResults, 0);
  objc_storeStrong((id *)&self->_keyFrameResults, 0);
  objc_storeStrong((id *)&self->_cameraMotionResults, 0);
  objc_storeStrong((id *)&self->_humanPoseResults, 0);
  objc_storeStrong((id *)&self->_humanActionResults, 0);
  objc_storeStrong((id *)&self->_featureResults, 0);
  objc_storeStrong((id *)&self->_voiceResults, 0);
  objc_storeStrong((id *)&self->_subtleMotionResults, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_saliencyResults, 0);
  objc_storeStrong((id *)&self->_petsResults, 0);
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_qualityResults, 0);
  objc_storeStrong((id *)&self->_junkResults, 0);
}

@end
