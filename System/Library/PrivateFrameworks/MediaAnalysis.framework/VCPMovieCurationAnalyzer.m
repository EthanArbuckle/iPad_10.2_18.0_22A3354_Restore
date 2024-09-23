@implementation VCPMovieCurationAnalyzer

+ (BOOL)isSettlingEffectPregatingEnabled
{
  return 1;
}

- (VCPMovieCurationAnalyzer)initWithAnalysisTypes:(unint64_t)a3 transform:(CGAffineTransform *)a4 timeRange:(id *)a5 isLivePhoto:(BOOL)a6 photoOffset:(float)a7 hadFlash:(BOOL)a8 hadZoom:(BOOL)a9 settlingHadZoom:(BOOL)a10 keyFrameResults:(id)a11 isTimelapse:(BOOL)a12 preferredTimeRange:(id *)a13 asset:(id)a14
{
  _BOOL8 v14;
  _BOOL8 v15;
  _BOOL8 v17;
  id v22;
  id v23;
  VCPMovieCurationAnalyzer *v24;
  VCPMovieCurationAnalyzer *v25;
  VCPVideoKeyFrameAnalyzer *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  VCPVideoKeyFrameAnalyzer *keyFrameAnalyzer;
  VCPMovieHighlightAnalyzer *v31;
  __int128 v32;
  uint64_t v33;
  VCPMovieHighlightAnalyzer *highlightAnalyzer;
  void *v35;
  __int128 v36;
  __int128 v37;
  VCPMovieCurationAnalyzer *v38;
  _OWORD v40[2];
  __int128 v41;
  _OWORD v42[3];
  _OWORD v43[3];
  objc_super v44;

  v14 = a9;
  v15 = a8;
  v17 = a6;
  v22 = a11;
  v23 = a14;
  v44.receiver = self;
  v44.super_class = (Class)VCPMovieCurationAnalyzer;
  v24 = -[VCPMovieCurationAnalyzer init](&v44, sel_init);
  v25 = v24;
  if (v24)
  {
    v24->_isLivePhoto = v17;
    v24->_hadFlash = v15;
    v24->_hadZoom = v14;
    v26 = [VCPVideoKeyFrameAnalyzer alloc];
    v27 = *(_OWORD *)&a4->c;
    v43[0] = *(_OWORD *)&a4->a;
    v43[1] = v27;
    v43[2] = *(_OWORD *)&a4->tx;
    v28 = *(_OWORD *)&a5->var0.var3;
    v42[0] = *(_OWORD *)&a5->var0.var0;
    v42[1] = v28;
    v42[2] = *(_OWORD *)&a5->var1.var1;
    v29 = -[VCPVideoKeyFrameAnalyzer initWithTransform:timeRange:isLivePhoto:keyFrameResults:](v26, "initWithTransform:timeRange:isLivePhoto:keyFrameResults:", v43, v42, v17, v22);
    keyFrameAnalyzer = v25->_keyFrameAnalyzer;
    v25->_keyFrameAnalyzer = (VCPVideoKeyFrameAnalyzer *)v29;

    v31 = [VCPMovieHighlightAnalyzer alloc];
    v32 = *(_OWORD *)&a13->var0.var3;
    v40[0] = *(_OWORD *)&a13->var0.var0;
    v40[1] = v32;
    v41 = *(_OWORD *)&a13->var1.var1;
    v33 = -[VCPMovieHighlightAnalyzer initWithAnalysisType:isLivePhoto:photoOffset:hadFlash:hadZoom:settlingHadZoom:isTimelapse:preferredTimeRange:asset:](v31, "initWithAnalysisType:isLivePhoto:photoOffset:hadFlash:hadZoom:settlingHadZoom:isTimelapse:preferredTimeRange:asset:", a3, v17, v15, v14, a10, a12, COERCE_DOUBLE(__PAIR64__(DWORD1(v41), LODWORD(a7))), v40, v23);
    highlightAnalyzer = v25->_highlightAnalyzer;
    v25->_highlightAnalyzer = (VCPMovieHighlightAnalyzer *)v33;

    v35 = v25->_keyFrameAnalyzer;
    if (v35)
    {
      v35 = v25->_highlightAnalyzer;
      if (v35)
      {
        v36 = *(_OWORD *)&a5->var0.var0;
        v37 = *(_OWORD *)&a5->var0.var3;
        *(_OWORD *)&v25->_timeRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
        *(_OWORD *)&v25->_timeRange.start.epoch = v37;
        *(_OWORD *)&v25->_timeRange.start.value = v36;
        v35 = v25;
      }
    }
    v38 = v35;
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (void)setMaxHighlightDuration:(float)a3
{
  -[VCPMovieHighlightAnalyzer setMaxHighlightDuration:](self->_highlightAnalyzer, "setMaxHighlightDuration:");
}

- (int)analyzeKeyFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7 photoOffset:(float)a8
{
  id v12;
  VCPMovieHighlightAnalyzer *highlightAnalyzer;
  int v14;
  VCPMovieHighlightAnalyzer *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  double v21;
  double v22;
  double v23;
  VCPVideoKeyFrameAnalyzer *keyFrameAnalyzer;
  __int128 v26;
  int64_t var3;
  _QWORD v28[3];
  _QWORD v29[3];
  CMTime v30;
  CMTime time;

  v12 = a6;
  if (!self->_isLivePhoto)
    goto LABEL_9;
  time = (CMTime)*a4;
  if (CMTimeGetSeconds(&time) >= a8)
    goto LABEL_9;
  v30 = (CMTime)*a4;
  if (CMTimeGetSeconds(&v30) <= (float)(a8 + -0.5))
    goto LABEL_9;
  highlightAnalyzer = self->_highlightAnalyzer;
  if (v12)
  {
    objc_msgSend(v12, "motionParam");
    objc_msgSend(v12, "motionParamDiff");
  }
  else
  {
    memset(v29, 0, sizeof(v29));
    memset(v28, 0, sizeof(v28));
  }
  v14 = -[VCPMovieHighlightAnalyzer analyzeMotionStability:motionParamDiff:](highlightAnalyzer, "analyzeMotionStability:motionParamDiff:", v29, v28);
  if (!v14)
  {
    v15 = self->_highlightAnalyzer;
    objc_msgSend(v12, "subjectActionScore");
    v17 = v16;
    objc_msgSend(v12, "subtleMotionScore");
    v19 = v18;
    objc_msgSend(v12, "humanActionScore");
    LODWORD(v21) = v20;
    LODWORD(v22) = v17;
    LODWORD(v23) = v19;
    v14 = -[VCPMovieHighlightAnalyzer analyzeRankingScores:subtleMotion:humanAction:](v15, "analyzeRankingScores:subtleMotion:humanAction:", v22, v23, v21);
    if (!v14)
    {
LABEL_9:
      keyFrameAnalyzer = self->_keyFrameAnalyzer;
      v26 = *(_OWORD *)&a4->var0;
      var3 = a4->var3;
      v14 = -[VCPVideoKeyFrameAnalyzer analyzeFrame:frameStats:timestamp:](keyFrameAnalyzer, "analyzeFrame:frameStats:timestamp:", a3, v12, &v26);
    }
  }

  return v14;
}

- (void)loadVideoAnalysisResults:(id)a3 audioAnalysisResults:(id)a4 videoCNNResults:(id)a5 andFaceRanges:(id)a6 frameSize:(CGSize)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  id v14;
  NSDictionary *v15;
  NSArray *v16;
  NSArray *descriptorResults;
  NSArray *v18;
  NSArray *qualityResuls;
  NSArray *v20;
  NSArray *junkResults;
  NSArray *v22;
  NSArray *faceResults;
  NSArray *v24;
  NSArray *petsResults;
  NSArray *v26;
  NSArray *actionResults;
  NSArray *v28;
  NSArray *subtleMotionResults;
  NSArray *v30;
  NSArray *humanActionResults;
  NSArray *v32;
  NSArray *humanPoseResults;
  NSArray *v34;
  NSArray *cameraMotionResults;
  NSArray *v36;
  NSArray *saliencyResults;
  NSArray *v38;
  NSArray *sceneResults;
  NSArray *v40;
  NSArray *orientationResults;
  NSArray *v42;
  NSArray *voiceResults;
  NSArray *v44;
  NSArray *audioQualityResults;
  NSArray *v46;
  NSArray *mlHighlightScoreResults;
  NSArray *v48;
  NSArray *mlQualityResults;
  NSDictionary *faceRanges;
  id v51;

  height = a7.height;
  width = a7.width;
  v51 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (NSDictionary *)a6;
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("FeatureVectorResults"));
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  descriptorResults = self->_descriptorResults;
  self->_descriptorResults = v16;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("QualityResults"));
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  qualityResuls = self->_qualityResuls;
  self->_qualityResuls = v18;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("InterestingnessResults"));
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  junkResults = self->_junkResults;
  self->_junkResults = v20;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("FaceResults"));
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  faceResults = self->_faceResults;
  self->_faceResults = v22;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("PetsResults"));
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  petsResults = self->_petsResults;
  self->_petsResults = v24;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("FineSubjectMotionResults"));
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
  actionResults = self->_actionResults;
  self->_actionResults = v26;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SubtleMotionResults"));
  v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
  subtleMotionResults = self->_subtleMotionResults;
  self->_subtleMotionResults = v28;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("HumanActionResults"));
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  humanActionResults = self->_humanActionResults;
  self->_humanActionResults = v30;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("HumanPoseResults"));
  v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
  humanPoseResults = self->_humanPoseResults;
  self->_humanPoseResults = v32;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("CameraMotionResults"));
  v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cameraMotionResults = self->_cameraMotionResults;
  self->_cameraMotionResults = v34;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SaliencyResults"));
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
  saliencyResults = self->_saliencyResults;
  self->_saliencyResults = v36;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SceneResults"));
  v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sceneResults = self->_sceneResults;
  self->_sceneResults = v38;

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("OrientationResults"));
  v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orientationResults = self->_orientationResults;
  self->_orientationResults = v40;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VoiceResults"));
  v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
  voiceResults = self->_voiceResults;
  self->_voiceResults = v42;

  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AudioQualityResults"));
  v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
  audioQualityResults = self->_audioQualityResults;
  self->_audioQualityResults = v44;

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MLHighlightScoreResults"));
  v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mlHighlightScoreResults = self->_mlHighlightScoreResults;
  self->_mlHighlightScoreResults = v46;

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MLQualityResults"));
  v48 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mlQualityResults = self->_mlQualityResults;
  self->_mlQualityResults = v48;

  faceRanges = self->_faceRanges;
  self->_faceRanges = v15;

  self->_frameSize.width = width;
  self->_frameSize.height = height;

}

- (int)postProcessKeyFrames
{
  -[VCPVideoKeyFrameAnalyzer preparePostProcessingStatsFromFaceRange:junkResults:](self->_keyFrameAnalyzer, "preparePostProcessingStatsFromFaceRange:junkResults:", self->_faceRanges, self->_junkResults);
  return -[VCPVideoKeyFrameAnalyzer postProcess](self->_keyFrameAnalyzer, "postProcess");
}

- (int)generateMovieCurations
{
  int v3;
  NSArray *qualityResuls;
  NSArray *descriptorResults;
  NSArray *junkResults;
  NSArray *faceResults;
  NSArray *petsResults;
  NSArray *saliencyResults;
  NSArray *voiceResults;
  VCPMovieHighlightAnalyzer *highlightAnalyzer;
  void *v12;
  __int128 v14;

  v3 = -[VCPMovieCurationAnalyzer postProcessKeyFrames](self, "postProcessKeyFrames");
  if (v3)
    return v3;
  descriptorResults = self->_descriptorResults;
  qualityResuls = self->_qualityResuls;
  junkResults = self->_junkResults;
  faceResults = self->_faceResults;
  petsResults = self->_petsResults;
  saliencyResults = self->_saliencyResults;
  v14 = *(_OWORD *)&self->_actionResults;
  voiceResults = self->_voiceResults;
  highlightAnalyzer = self->_highlightAnalyzer;
  -[VCPVideoKeyFrameAnalyzer keyFrames](self->_keyFrameAnalyzer, "keyFrames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VCPMovieHighlightAnalyzer prepareRequiredQualityResult:junkDetectionResult:descriptorResult:faceResult:petsResult:saliencyResult:actionResult:subtleMotionResult:voiceResult:keyFrameResult:sceneResults:humanActionResults:humanPoseResults:cameraMotionResults:orientationResults:mlHighlightScoreResults:mlQualityResults:frameSize:](highlightAnalyzer, "prepareRequiredQualityResult:junkDetectionResult:descriptorResult:faceResult:petsResult:saliencyResult:actionResult:subtleMotionResult:voiceResult:keyFrameResult:sceneResults:humanActionResults:humanPoseResults:cameraMotionResults:orientationResults:mlHighlightScoreResults:mlQualityResults:frameSize:", qualityResuls, junkResults, descriptorResults, faceResults, petsResults, saliencyResults, self->_frameSize.width, self->_frameSize.height, v14, voiceResults, v12, self->_sceneResults, self->_humanActionResults, self->_humanPoseResults, self->_cameraMotionResults,
         self->_orientationResults,
         self->_mlHighlightScoreResults,
         self->_mlQualityResults);

  if (v3)
    return v3;
  else
    return -[VCPMovieHighlightAnalyzer generateHighlights](self->_highlightAnalyzer, "generateHighlights");
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

- (void)addHighlight:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  CFDictionaryRef v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  CFDictionaryRef v30;
  CFDictionaryRef v31;
  double v32;
  void *v33;
  void *v34;
  _BYTE v35[48];
  CMTime v36;
  CMTime v37;
  CMTime time;
  CMTime v39;
  CMTime v40;
  _QWORD v41[4];
  _QWORD v42[5];
  NSRect v43;

  v42[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "timerange");
    v40 = time;
    objc_msgSend(v6, "timerange");
    v37 = v39;
    objc_msgSend(v6, "score");
    v9 = v8;
    objc_msgSend(v6, "bestPlaybackCrop");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    memset(&v36, 0, sizeof(v36));
    objc_msgSend(v6, "keyFrame");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "timestamp");
    else
      memset(&v36, 0, sizeof(v36));

    objc_msgSend(v6, "keyFrame");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "score");
    v22 = v21;

    objc_msgSend(v6, "colorNormalization");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    time = v36;
    v25 = CMTimeCopyAsDictionary(&time, 0);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("keyFrameTime"));

    LODWORD(v26) = v22;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("keyFrameScore"));

    v43.origin.x = v11;
    v43.origin.y = v13;
    v43.size.width = v15;
    v43.size.height = v17;
    NSStringFromRect(v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("bestPlaybackCrop"));

    if (!self->_isLivePhoto)
    {
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("colorNormalizationData"));
      objc_msgSend(v6, "timerange");
      -[VCPMovieCurationAnalyzer audioQualityScore:](self, "audioQualityScore:", v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("audioQuality"));

    }
    v41[0] = CFSTR("start");
    time = v40;
    v30 = CMTimeCopyAsDictionary(&time, 0);
    v42[0] = v30;
    v41[1] = CFSTR("duration");
    time = v37;
    v31 = CMTimeCopyAsDictionary(&time, 0);
    v42[1] = v31;
    v41[2] = CFSTR("quality");
    LODWORD(v32) = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = CFSTR("attributes");
    v42[2] = v33;
    v42[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v34);

  }
}

- (void)addSummary:(id)a3 to:(id)a4
{
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  uint64_t v22;
  uint64_t v23;
  CFDictionaryRef v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CFDictionaryRef v31;
  CFDictionaryRef v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  CMTime v40;
  CMTime time;
  __int128 v42;
  CMTimeEpoch v43;
  CMTime v44;
  _QWORD v45[5];
  _QWORD v46[5];
  const __CFString *v47;
  void *v48;
  _QWORD v49[3];
  _QWORD v50[5];
  NSRect v51;

  v50[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = a4;
  if (v6)
  {
    objc_msgSend(v6, "timerange");
    v44 = time;
    objc_msgSend(v6, "timerange");
    *(_OWORD *)&v40.value = v42;
    v40.epoch = v43;
    objc_msgSend(v6, "score");
    v8 = v7;
    v39 = 0uLL;
    objc_msgSend(v6, "keyFrame");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "timestamp");
    else
      v39 = 0uLL;

    objc_msgSend(v6, "keyFrame");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "score");
    v13 = v12;

    objc_msgSend(v6, "bestPlaybackCrop");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = objc_msgSend(v6, "isTrimmed");
    if (objc_msgSend(v6, "isAutoPlayable"))
      v23 = 0x80000;
    else
      v23 = 0;
    v49[0] = CFSTR("keyFrameTime");
    *(_OWORD *)&time.value = v39;
    time.epoch = 0;
    v24 = CMTimeCopyAsDictionary(&time, 0);
    v50[0] = v24;
    v49[1] = CFSTR("keyFrameScore");
    LODWORD(v25) = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v26;
    v49[2] = CFSTR("bestPlaybackCrop");
    v51.origin.x = v15;
    v51.origin.y = v17;
    v51.size.width = v19;
    v51.size.height = v21;
    NSStringFromRect(v51);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = CFSTR("summaryIsTrimmed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v45[0] = CFSTR("start");
    time = v44;
    v31 = CMTimeCopyAsDictionary(&time, 0);
    v46[0] = v31;
    v45[1] = CFSTR("duration");
    time = v40;
    v32 = CMTimeCopyAsDictionary(&time, 0);
    v46[1] = v32;
    v45[2] = CFSTR("quality");
    LODWORD(v33) = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v34;
    v45[3] = CFSTR("flags");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = CFSTR("attributes");
    v46[3] = v35;
    v46[4] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObject:", v36);

    objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPMovieCurationAnalyzer reportMovieCurationAnalysisResults:withSummaryAnalytics:](self, "reportMovieCurationAnalysisResults:withSummaryAnalytics:", v37, v30);

  }
  else
  {
    -[VCPMovieCurationAnalyzer reportMovieCurationAnalysisResults:withSummaryAnalytics:](self, "reportMovieCurationAnalysisResults:withSummaryAnalytics:", 0, 0);
  }

}

- (void)addSticker:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  void *v11;
  CMTime v12[4];
  CMTime time;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v14[0] = CFSTR("start");
    objc_msgSend(v5, "timerange");
    v12[0] = v12[2];
    v7 = CMTimeCopyAsDictionary(v12, 0);
    v15[0] = v7;
    v14[1] = CFSTR("duration");
    objc_msgSend(v5, "timerange");
    time = v12[1];
    v8 = CMTimeCopyAsDictionary(&time, 0);
    v15[1] = v8;
    v14[2] = CFSTR("quality");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "score");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v11);

  }
}

- (void)addSettling:(id)a3 to:(id)a4
{
  id v6;
  int v7;
  int v8;
  uint64_t v9;
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
  CFDictionaryRef v23;
  CFDictionaryRef v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  CMTime v30;
  CMTime time;
  __int128 v32;
  CMTimeEpoch v33;
  CMTime v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[6];
  _QWORD v38[8];

  v38[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  if (v6)
  {
    objc_msgSend(v6, "timerange");
    v34 = time;
    objc_msgSend(v6, "timerange");
    *(_OWORD *)&v30.value = v32;
    v30.epoch = v33;
    objc_msgSend(v6, "score");
    v8 = v7;
    if (objc_msgSend(v6, "isSettlingOK"))
      v9 = 0x10000000;
    else
      v9 = 0;
    v37[0] = CFSTR("AutoplayScore");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "autoplayScore");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v11;
    v37[1] = CFSTR("ExposureChangeScore");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "exposureChangeScore");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v13;
    v37[2] = CFSTR("SharpnessScore");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "sharpnessScore");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v15;
    v37[3] = CFSTR("ZoomChangeScore");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "zoomChangeScore");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v17;
    v37[4] = CFSTR("FlashScore");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "flashScore");
    objc_msgSend(v18, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = v19;
    v37[5] = CFSTR("RankingLevel");
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPMovieHighlightAnalyzer rankingLevel](self->_highlightAnalyzer, "rankingLevel");
    objc_msgSend(v20, "numberWithFloat:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[5] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v35[0] = CFSTR("start");
    time = v34;
    v23 = CMTimeCopyAsDictionary(&time, 0);
    v36[0] = v23;
    v35[1] = CFSTR("duration");
    time = v30;
    v24 = CMTimeCopyAsDictionary(&time, 0);
    v36[1] = v24;
    v35[2] = CFSTR("quality");
    LODWORD(v25) = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v26;
    v35[3] = CFSTR("flags");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = CFSTR("attributes");
    v36[3] = v27;
    v36[4] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v28);

  }
}

- (id)results
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t j;
  void *v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  void *v29;
  void *v30;
  CMTime time[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CMTime v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[VCPMovieHighlightAnalyzer results](self->_highlightAnalyzer, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v41 != v4)
          objc_enumerationMutation(v2);
        -[VCPMovieCurationAnalyzer addHighlight:to:](self, "addHighlight:to:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i), v30);
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v3);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[VCPMovieHighlightAnalyzer highlightScoreResults](self->_highlightAnalyzer, "highlightScoreResults");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v6)
  {
    v28 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v6; ++j)
      {
        if (*(_QWORD *)v37 != v28)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        v45[0] = CFSTR("start");
        if (v8)
        {
          objc_msgSend(v8, "timerange");
        }
        else
        {
          v34 = 0u;
          v35 = 0u;
          v33 = 0u;
        }
        *(_OWORD *)&time[0].value = v33;
        time[0].epoch = v34;
        v9 = CMTimeCopyAsDictionary(time, 0);
        v46[0] = v9;
        v45[1] = CFSTR("duration");
        if (v8)
          objc_msgSend(v8, "timerange");
        else
          memset(time, 0, sizeof(time));
        v44 = time[1];
        v10 = CMTimeCopyAsDictionary(&v44, 0);
        v46[1] = v10;
        v45[2] = CFSTR("quality");
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "score");
        objc_msgSend(v11, "numberWithFloat:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v46[2] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObject:", v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v6);
  }

  -[VCPMovieHighlightAnalyzer movieSummary](self->_highlightAnalyzer, "movieSummary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPMovieCurationAnalyzer addSummary:to:](self, "addSummary:to:", v14, v24);

  -[VCPMovieHighlightAnalyzer animatedStickerGating](self->_highlightAnalyzer, "animatedStickerGating");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPMovieCurationAnalyzer addSticker:to:](self, "addSticker:to:", v15, v25);

  if (+[VCPMovieCurationAnalyzer isSettlingEffectPregatingEnabled](VCPMovieCurationAnalyzer, "isSettlingEffectPregatingEnabled"))
  {
    -[VCPMovieHighlightAnalyzer settlingEffects](self->_highlightAnalyzer, "settlingEffects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPMovieCurationAnalyzer addSettling:to:](self, "addSettling:to:", v16, v23);

  }
  if (objc_msgSend(v24, "count"))
    objc_msgSend(v26, "setObject:forKey:", v24, CFSTR("MovieSummaryResults"));
  if (objc_msgSend(v30, "count"))
    objc_msgSend(v26, "setObject:forKey:", v30, CFSTR("MovieHighlightResults"));
  -[VCPVideoKeyFrameAnalyzer keyFrameScores](self->_keyFrameAnalyzer, "keyFrameScores");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count") == 0;

  if (!v18)
  {
    -[VCPVideoKeyFrameAnalyzer keyFrameScores](self->_keyFrameAnalyzer, "keyFrameScores");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v19, CFSTR("KeyFrameResults"));

  }
  if (objc_msgSend(v29, "count"))
    objc_msgSend(v26, "setObject:forKey:", v29, CFSTR("MovieHighlightScoreResults"));
  if (objc_msgSend(v23, "count"))
    objc_msgSend(v26, "setObject:forKey:", v23, CFSTR("SettlingEffectsGatingResults"));
  if (objc_msgSend(v25, "count"))
    objc_msgSend(v26, "setObject:forKey:", v25, CFSTR("AnimatedStickerResults"));
  if (objc_msgSend(v26, "count"))
    v20 = v26;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

- (void)reportMovieCurationAnalysisResults:(id)a3 withSummaryAnalytics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  unsigned int v13;
  const __CFDictionary *v14;
  double Seconds;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CMTime v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (!v7)
      goto LABEL_8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("quality"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("flags"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("duration"));
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v26, v14);
    Seconds = CMTimeGetSeconds(&v26);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("summaryIsTrimmed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    *(float *)&v18 = v11 * (float)((v13 >> 19) & 1);
    v31[0] = CFSTR("AutoPlayableScore");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v20 = Seconds;
    v32[0] = v19;
    v31[1] = CFSTR("SummaryDuration");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v21;
    v31[2] = CFSTR("IsTrimmed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v23);

  }
  if (self->_isLivePhoto)
  {
    v29 = CFSTR("MediaType");
    v30 = CFSTR("livePhoto");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  }
  else
  {
    v27 = CFSTR("MediaType");
    v28 = CFSTR("movie");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v24);

  +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.moviecurationresults"), v8);

LABEL_8:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceRanges, 0);
  objc_storeStrong((id *)&self->_mlQualityResults, 0);
  objc_storeStrong((id *)&self->_mlHighlightScoreResults, 0);
  objc_storeStrong((id *)&self->_orientationResults, 0);
  objc_storeStrong((id *)&self->_saliencyResults, 0);
  objc_storeStrong((id *)&self->_cameraMotionResults, 0);
  objc_storeStrong((id *)&self->_humanPoseResults, 0);
  objc_storeStrong((id *)&self->_humanActionResults, 0);
  objc_storeStrong((id *)&self->_sceneResults, 0);
  objc_storeStrong((id *)&self->_audioQualityResults, 0);
  objc_storeStrong((id *)&self->_voiceResults, 0);
  objc_storeStrong((id *)&self->_subtleMotionResults, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_petsResults, 0);
  objc_storeStrong((id *)&self->_faceResults, 0);
  objc_storeStrong((id *)&self->_junkResults, 0);
  objc_storeStrong((id *)&self->_qualityResuls, 0);
  objc_storeStrong((id *)&self->_descriptorResults, 0);
  objc_storeStrong((id *)&self->_highlightAnalyzer, 0);
  objc_storeStrong((id *)&self->_keyFrameAnalyzer, 0);
}

@end
