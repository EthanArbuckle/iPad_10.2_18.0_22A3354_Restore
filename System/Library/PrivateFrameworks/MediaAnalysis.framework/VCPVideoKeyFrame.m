@implementation VCPVideoKeyFrame

- (VCPVideoKeyFrame)initWithLivePhoto:(BOOL)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VCPVideoKeyFrame;
  v4 = -[VCPVideoKeyFrame init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0CA2E10];
    *((_OWORD *)v4 + 8) = *MEMORY[0x1E0CA2E10];
    *((_QWORD *)v4 + 18) = *(_QWORD *)(v6 + 16);
    *((_QWORD *)v4 + 4) = 0;
    *((_QWORD *)v4 + 5) = 0;
    *((_QWORD *)v4 + 6) = 0x3F80000000000000;
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *(_WORD *)(v4 + 29) = 1;
    *((_DWORD *)v4 + 21) = 0;
    *((_DWORD *)v4 + 22) = 0;
    *((_QWORD *)v4 + 12) = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v11;

    *((_QWORD *)v5 + 7) = 0;
    *((_QWORD *)v5 + 8) = 0;
    *((_DWORD *)v5 + 18) = 0;
    *(_QWORD *)(v5 + 76) = 1065353216;
    v5[28] = a3;
    v13 = v5;
  }

  return (VCPVideoKeyFrame *)v5;
}

+ (BOOL)isLivePhotoKeyFrameEnabled
{
  return 0;
}

- (void)copyFrom:(id)a3
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
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  __int128 v21;
  int64_t v22;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timestamp");
  }
  else
  {
    v21 = 0uLL;
    v22 = 0;
  }
  *(_OWORD *)&self->_timestamp.value = v21;
  self->_timestamp.epoch = v22;
  objc_msgSend(v5, "score");
  self->_score = v6;
  objc_msgSend(v5, "semanticScore");
  self->_semanticScore = v7;
  objc_msgSend(v5, "sharpness");
  self->_sharpness = v8;
  objc_msgSend(v5, "faceSharpness");
  self->_faceSharpness = v9;
  objc_msgSend(v5, "textureScore");
  self->_textureScore = v10;
  objc_msgSend(v5, "exposureScore");
  self->_exposureScore = v11;
  objc_msgSend(v5, "humanPoseScore");
  self->_humanPoseScore = v12;
  objc_msgSend(v5, "humanActionScore");
  self->_humanActionScore = v13;
  self->_isHeadingFrame = objc_msgSend(v5, "isHeadingFrame");
  self->_statsFlags = objc_msgSend(v5, "statsFlags");
  objc_msgSend(v5, "expressionChangeScore");
  self->_expressionChangeScore = v14;
  objc_msgSend(v5, "overallFaceQualityScore");
  self->_overallFaceQualityScore = v15;
  objc_msgSend(v5, "qualityScoreForLivePhoto");
  self->_qualityScoreForLivePhoto = v16;
  objc_msgSend(v5, "globalQualityScore");
  self->_globalQualityScore = v17;
  objc_msgSend(v5, "visualPleasingScore");
  self->_visualPleasingScore = v18;
  objc_msgSend(v5, "penaltyScore");
  self->_penaltyScore = v19;
  objc_msgSend(v5, "contentScore");
  self->_contentScore = v20;

}

- (int)loadKeyFrameResult:(id)a3 timestamp:(id *)a4
{
  void *v6;
  void *v7;
  float v8;
  double Seconds;
  float v10;
  int v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  void *v17;
  float v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  VCPFace *v28;
  void *v29;
  NSString *v30;
  NSMutableArray *faceQualityScores;
  void *v32;
  void *v33;
  float v34;
  void *v35;
  float v36;
  float overallFaceQualityScore;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CMTime time;
  CMTime v49;
  _BYTE v50[128];
  uint64_t v51;
  NSRect v52;

  v51 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v39 = v7;
      objc_msgSend(v7, "floatValue");
      CMTimeMakeWithSeconds(&v49, v8, 600);
      self->_timestamp = ($95D729B680665BEAEFA1D6FCA8238556)v49;
      time = (CMTime)*a4;
      Seconds = CMTimeGetSeconds(&time);
      objc_msgSend(v39, "floatValue");
      if (vabdd_f64(Seconds, v10) > 0.00499999989)
      {
        v11 = 0;
        v12 = v39;
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("frameQualityScore"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "floatValue");
        self->_qualityScoreForLivePhoto = v14;
        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("faceQualityScore"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "floatValue");
          self->_overallFaceQualityScore = v16;
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("visualPleasingScore"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v17, "floatValue");
            self->_visualPleasingScore = v18;
            objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("penaltyScore"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v19, "floatValue");
              self->_penaltyScore = v20;
              objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("sharpnessScore"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                v40 = v21;
                objc_msgSend(v21, "floatValue");
                self->_sharpness = v22;
                v44 = 0u;
                v45 = 0u;
                v46 = 0u;
                v47 = 0u;
                objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("FaceResults"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                obj = v23;
                v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
                if (v24)
                {
                  v25 = *(_QWORD *)v45;
                  do
                  {
                    for (i = 0; i != v24; ++i)
                    {
                      if (*(_QWORD *)v45 != v25)
                        objc_enumerationMutation(obj);
                      v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
                      v28 = objc_alloc_init(VCPFace);
                      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("attributes"));
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("faceBounds"));
                      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
                      v52 = NSRectFromString(v30);
                      -[VCPFace setBounds:](v28, "setBounds:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);

                      -[NSMutableArray addObject:](self->_detectedFaces, "addObject:", v28);
                      if (+[VCPVideoKeyFrame isLivePhotoKeyFrameEnabled](VCPVideoKeyFrame, "isLivePhotoKeyFrameEnabled"))
                      {
                        faceQualityScores = self->_faceQualityScores;
                        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("attributes"));
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("faceQuality"));
                        v33 = (void *)objc_claimAutoreleasedReturnValue();
                        -[NSMutableArray addObject:](faceQualityScores, "addObject:", v33);

                      }
                    }
                    v23 = obj;
                    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
                  }
                  while (v24);
                }

                self->_statsFlags |= 0x10uLL;
                v34 = 0.0;
                if (self->_sharpness > 0.0)
                {
                  v34 = 0.0;
                  if (self->_qualityScoreForLivePhoto == 0.0)
                    v34 = 1.0;
                }
                self->_obstruction = v34;
                objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("globalQualityScore"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                if (v35)
                  objc_msgSend(v35, "floatValue");
                else
                  -[VCPVideoKeyFrame computeGlobalQuality](self, "computeGlobalQuality");
                self->_globalQualityScore = v36;
                objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("contentScore"));
                v12 = (void *)objc_claimAutoreleasedReturnValue();

                if (v12)
                  objc_msgSend(v12, "floatValue");
                else
                  overallFaceQualityScore = self->_overallFaceQualityScore;
                v11 = 0;
                self->_contentScore = overallFaceQualityScore;
                goto LABEL_26;
              }
            }
          }
        }
      }
    }
    v12 = 0;
    v11 = -50;
    goto LABEL_26;
  }
  v11 = -50;
LABEL_27:

  return v11;
}

- (void)resetStatsFlag
{
  self->_statsFlags = 0;
}

- (void)setFaceStatsFlag:(BOOL)a3 detectedFaces:(id)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4)
  {
    -[NSMutableArray removeAllObjects](self->_detectedFaces, "removeAllObjects");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          -[NSMutableArray addObject:](self->_detectedFaces, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    self->_statsFlags |= 1uLL;
  }

}

- (void)setMotionStatsFlag:(BOOL)a3 cameraMotion:(float)a4 subjectAction:(float)a5 interestingness:(float)a6 obstruction:(float)a7 colorfulness:(float)a8 exposureScore:(float)a9 humanActionStatsFlag:(BOOL)a10 humanPoseScore:(float)a11 humanActionScore:(float)a12 subMb:(BOOL)a13
{
  *(_QWORD *)&self->_subjectAction = 0;
  self->_obstruction = 0.0;
  self->_subMb = 0;
  if (a3)
  {
    self->_subjectAction = a5;
    self->_cameraMotion = a4;
    self->_obstruction = 1.0 - a7;
    self->_subMb = a13;
    self->_statsFlags |= 2uLL;
  }
  if (a10)
  {
    self->_humanPoseScore = a11;
    self->_humanActionScore = a12;
    self->_statsFlags |= 8uLL;
  }
  self->_exposureScore = a9;
  self->_interestingness = a6;
  self->_colorfulness = a8;
}

- (void)computeGlobalQualityForLivePhoto
{
  float sharpness;
  float v3;
  float v4;

  sharpness = self->_sharpness;
  v3 = 1.0;
  v4 = 1.0;
  if (sharpness < 1.0)
  {
    v4 = 0.0;
    if (sharpness >= 0.0)
      v4 = self->_sharpness;
  }
  if (!self->_isHeadingFrame)
  {
    v3 = 0.0;
    if (self->_obstruction >= 0.96)
      v3 = 1.0;
  }
  self->_qualityScoreForLivePhoto = v4 * v3;
}

- (float)computeGlobalQuality
{
  float sharpness;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;

  sharpness = self->_sharpness;
  v3 = 1.0;
  v4 = 1.0;
  if (sharpness < 0.6)
  {
    v4 = 0.0;
    if (sharpness >= 0.3)
      v4 = self->_sharpness;
  }
  if (!self->_isHeadingFrame)
  {
    v3 = 0.0;
    if (self->_obstruction >= 0.96)
      v3 = 1.0;
  }
  if (self->_interestingness <= 0.0)
    v5 = 0.0;
  else
    v5 = 1.0;
  v6 = (float)(v4 * v5) * v3;
  if (v6 < 1.0)
    v7 = v6;
  else
    v7 = 1.0;
  if (v6 <= 0.0)
    return 0.0;
  else
    return v7;
}

- (float)computeVisualPleasingScore
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  BOOL v8;
  float result;

  -[VCPVideoKeyFrame computeScoreFromColorfulness](self, "computeScoreFromColorfulness");
  v4 = v3;
  -[VCPVideoKeyFrame computeScoreFromExposure](self, "computeScoreFromExposure");
  v6 = (float)(v5 * 0.4) + (float)(v4 * 0.6);
  v7 = 1.0;
  if (v6 < 1.0)
    v7 = v6;
  v8 = v6 > 0.0;
  result = 0.0;
  if (v8)
    return v7;
  return result;
}

- (float)computeContentScore
{
  float result;
  float v4;
  float v5;

  -[VCPVideoKeyFrame computeExpressionScore](self, "computeExpressionScore");
  if (result < (float)(self->_humanPoseScore * 0.5))
    result = self->_humanPoseScore * 0.5;
  if (!self->_isHeadingFrame)
  {
    v4 = result * 0.6;
    -[VCPVideoKeyFrame computeScoreFromAction](self, "computeScoreFromAction");
    return v4 + (float)((float)(v5 + self->_humanActionScore) * 0.4);
  }
  return result;
}

- (float)computePenaltyScore
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  float result;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  int v25;
  float v26;
  float v27;
  float v28;
  float v29;
  _BOOL4 v30;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_detectedFaces, "count"))
    return 1.0;
  -[NSMutableArray firstObject](self->_detectedFaces, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v7 * v5;
  if (v8 <= 0.2 || (result = 0.0, self->_faceSharpness >= 0.3))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = self->_detectedFaces;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v33;
      v13 = (float)(v8 * 0.9);
LABEL_6:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        objc_msgSend(v15, "bounds", (_QWORD)v32);
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v23 = v21 * v19;
        if (v21 * v19 >= v13)
        {
          v24 = v16;
          if ((objc_msgSend(v15, "leftEyeClosed", v23) & 1) != 0)
            v25 = 1;
          else
            v25 = objc_msgSend(v15, "rightEyeClosed");
          v26 = v18;
          v27 = v24;
          v29 = v24 + v22;
          v30 = v26 < 0.05;
          if (v27 < 0.05)
            v30 = 1;
          v28 = v18 + v20;
          if (v28 > 0.949999999)
            v30 = 1;
          v23 = v29;
          v31 = v29 > 0.949999999 || v30;
          if ((v25 & 1) != 0 || (v31 & 1) != 0)
            break;
        }
        if (v11 == ++v14)
        {
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16, v23);
          if (v11)
            goto LABEL_6;
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      v25 = 0;
      v31 = 0;
    }

    result = 0.4;
    if (!(v25 | v31))
      return 1.0;
  }
  return result;
}

- (void)storeFrameResults
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a3;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Error: FaceQualityScore should not contain results! (size = %lu, timestamp=%.2f)", buf, 0x16u);
}

- (void)computeCurationScoreComponents
{
  unint64_t statsFlags;
  float v4;
  float v5;
  float v6;
  float v7;

  statsFlags = self->_statsFlags;
  if ((statsFlags & 0x12) == 0x10)
  {
    if ((statsFlags & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    -[VCPVideoKeyFrame computeGlobalQuality](self, "computeGlobalQuality");
    self->_globalQualityScore = v4;
    -[VCPVideoKeyFrame computeVisualPleasingScore](self, "computeVisualPleasingScore");
    self->_visualPleasingScore = v5;
    statsFlags = self->_statsFlags;
    if ((statsFlags & 1) == 0)
    {
LABEL_3:
      if ((statsFlags & 0x10) == 0)
        goto LABEL_8;
LABEL_7:
      if ((statsFlags & 3) != 3)
        return;
      goto LABEL_8;
    }
  }
  -[VCPVideoKeyFrame computePenaltyScore](self, "computePenaltyScore");
  self->_penaltyScore = v6;
  statsFlags = self->_statsFlags;
  if ((statsFlags & 0x10) != 0)
    goto LABEL_7;
LABEL_8:
  -[VCPVideoKeyFrame computeContentScore](self, "computeContentScore");
  self->_contentScore = v7;
}

- (void)computeCurationScore
{
  float v3;
  float v4;
  float v5;

  -[VCPVideoKeyFrame computeCurationScoreComponents](self, "computeCurationScoreComponents");
  v3 = 0.0;
  v4 = 0.0;
  if (self->_globalQualityScore >= 0.5)
    v4 = (float)((float)((float)(self->_visualPleasingScore * 0.25) + 0.1) + (float)(self->_contentScore * 0.65))
       * self->_penaltyScore;
  v5 = 1.0;
  if (v4 < 1.0)
    v5 = v4;
  if (v4 > 0.0)
    v3 = v5;
  self->_score = v3;
  if (self->_isLivePhoto)
    -[VCPVideoKeyFrame storeFrameResults](self, "storeFrameResults");
}

- (float)computeScoreFromAction
{
  float v2;
  float v3;
  BOOL v4;
  float result;

  v2 = (float)(erff((float)(self->_subjectAction * 0.5) + -1.5) * 0.5) + 0.5;
  v3 = 1.0;
  if (v2 < 1.0)
    v3 = v2;
  v4 = v2 > 0.0;
  result = 0.0;
  if (v4)
    return v3;
  return result;
}

- (float)computeExpressionScore
{
  int v3;
  unint64_t v4;
  char v5;
  char v6;
  float v7;
  float v8;
  void *v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  float v15;
  float v16;
  float v17;
  void *v18;
  float v19;
  float v21;
  float v22;
  float v23;
  float faceSharpness;
  float v25;
  float v26;
  CGRect v27;

  v3 = -[NSMutableArray count](self->_detectedFaces, "count");
  if (!v3)
    return 0.0;
  if (-[NSMutableArray count](self->_detectedFaces, "count"))
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_detectedFaces, "objectAtIndexedSubscript:", v4, *(_OWORD *)&v27.origin, *(_OWORD *)&v27.size);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bounds", 0, 0, 0, 0);
      v27.origin.x = v12;
      v27.origin.y = v13;
      v27.size.width = v10;
      v27.size.height = v11;
      if (v11 >= v10)
        v14 = v11;
      else
        v14 = v10;
      v15 = v14;
      if (MediaAnalysisFacePosition(&v27) == 16)
        v16 = 1.0;
      else
        v16 = 0.5;
      v17 = v16 * v15;
      if ((float)(v16 * v15) > v8)
      {
        v6 = objc_msgSend(v9, "smile", *(_OWORD *)&v27.origin, *(_OWORD *)&v27.size);
        if ((objc_msgSend(v9, "leftEyeClosed") & 1) != 0)
          v5 = 1;
        else
          v5 = objc_msgSend(v9, "rightEyeClosed");
        if (-[NSMutableArray count](self->_faceQualityScores, "count") > v4)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_faceQualityScores, "objectAtIndexedSubscript:", v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "floatValue");
          self->_overallFaceQualityScore = v19;

        }
        v8 = v17;
        v7 = v15;
      }

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_detectedFaces, "count"));
  }
  else
  {
    v6 = 0;
    v5 = 0;
    v7 = 0.0;
  }
  if ((float)(v7 + -0.368) >= 0.0)
    v21 = expf((float)-(float)((float)(v7 + -0.368) * (float)(v7 + -0.368)) / sqrtf((float)v3));
  else
    v21 = v7 / 0.368;
  if ((v6 & 1) != 0)
    v22 = 0.3;
  else
    v22 = 0.0;
  if ((v5 & 1) != 0)
    v22 = -0.9;
  v23 = v22 + v21;
  if (self->_faceSharpness >= 0.3)
    faceSharpness = self->_faceSharpness;
  else
    faceSharpness = 0.0;
  v25 = v23 * faceSharpness;
  v26 = 1.0;
  if (v25 < 1.0)
    v26 = v25;
  if (v25 <= 0.0)
    return 0.0;
  else
    return v26;
}

- (float)computeScoreFromColorfulness
{
  float v2;
  float v3;
  BOOL v4;
  float result;

  v2 = self->_colorfulness * 0.012195;
  v3 = 1.0;
  if (v2 < 1.0)
    v3 = self->_colorfulness * 0.012195;
  v4 = v2 > 0.0;
  result = 0.0;
  if (v4)
    return v3;
  return result;
}

- (float)computeScoreFromExposure
{
  float v2;
  float v3;
  BOOL v4;
  BOOL v5;
  float result;

  v2 = expf((float)(self->_exposureScore * self->_exposureScore) / -12723.0);
  v3 = 1.0;
  if (v2 < 1.0)
    v3 = v2;
  v5 = v2 == 0.0;
  v4 = v2 >= 0.0;
  result = 0.0;
  if (!v5 && v4)
    return v3;
  return result;
}

- (BOOL)hasGoodSubjectAction
{
  float subjectAction;

  subjectAction = self->_subjectAction;
  return subjectAction < 8.0 && subjectAction > 3.0;
}

- (void)printStats
{
  Float64 Seconds;
  double sharpness;
  double faceSharpness;
  double cameraMotion;
  double subjectAction;
  double interestingness;
  double obstruction;
  double exposureScore;
  double score;
  $95D729B680665BEAEFA1D6FCA8238556 timestamp;
  uint8_t buf[4];
  Float64 v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    timestamp = self->_timestamp;
    Seconds = CMTimeGetSeconds((CMTime *)&timestamp);
    sharpness = self->_sharpness;
    faceSharpness = self->_faceSharpness;
    cameraMotion = self->_cameraMotion;
    subjectAction = self->_subjectAction;
    interestingness = self->_interestingness;
    obstruction = self->_obstruction;
    exposureScore = self->_exposureScore;
    score = self->_score;
    *(_DWORD *)buf = 134220032;
    v14 = Seconds;
    v15 = 2048;
    v16 = sharpness;
    v17 = 2048;
    v18 = faceSharpness;
    v19 = 2048;
    v20 = cameraMotion;
    v21 = 2048;
    v22 = subjectAction;
    v23 = 2048;
    v24 = interestingness;
    v25 = 2048;
    v26 = obstruction;
    v27 = 2048;
    v28 = exposureScore;
    v29 = 2048;
    v30 = score;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "time=%.2f sharpness=%.2f, faceSharpness=%.2f, cameraM=%.2f, subjectM=%.2f, junk=%.2f, obstr=%.2f, exposure=%.2f, score=%.2f", buf, 0x5Cu);
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (void)setTimestamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (void)setSemanticScore:(float)a3
{
  self->_semanticScore = a3;
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_sharpness = a3;
}

- (float)faceSharpness
{
  return self->_faceSharpness;
}

- (void)setFaceSharpness:(float)a3
{
  self->_faceSharpness = a3;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(float)a3
{
  self->_exposureScore = a3;
}

- (BOOL)isHeadingFrame
{
  return self->_isHeadingFrame;
}

- (void)setIsHeadingFrame:(BOOL)a3
{
  self->_isHeadingFrame = a3;
}

- (float)textureScore
{
  return self->_textureScore;
}

- (void)setTextureScore:(float)a3
{
  self->_textureScore = a3;
}

- (float)expressionChangeScore
{
  return self->_expressionChangeScore;
}

- (void)setExpressionChangeScore:(float)a3
{
  self->_expressionChangeScore = a3;
}

- (unint64_t)statsFlags
{
  return self->_statsFlags;
}

- (void)setStatsFlags:(unint64_t)a3
{
  self->_statsFlags = a3;
}

- (NSMutableArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
  objc_storeStrong((id *)&self->_detectedFaces, a3);
}

- (NSMutableArray)faceQualityScores
{
  return self->_faceQualityScores;
}

- (void)setFaceQualityScores:(id)a3
{
  objc_storeStrong((id *)&self->_faceQualityScores, a3);
}

- (NSMutableDictionary)frameResults
{
  return self->_frameResults;
}

- (void)setFrameResults:(id)a3
{
  objc_storeStrong((id *)&self->_frameResults, a3);
}

- (float)overallFaceQualityScore
{
  return self->_overallFaceQualityScore;
}

- (void)setOverallFaceQualityScore:(float)a3
{
  self->_overallFaceQualityScore = a3;
}

- (float)qualityScoreForLivePhoto
{
  return self->_qualityScoreForLivePhoto;
}

- (void)setQualityScoreForLivePhoto:(float)a3
{
  self->_qualityScoreForLivePhoto = a3;
}

- (float)globalQualityScore
{
  return self->_globalQualityScore;
}

- (void)setGlobalQualityScore:(float)a3
{
  self->_globalQualityScore = a3;
}

- (float)visualPleasingScore
{
  return self->_visualPleasingScore;
}

- (void)setVisualPleasingScore:(float)a3
{
  self->_visualPleasingScore = a3;
}

- (float)penaltyScore
{
  return self->_penaltyScore;
}

- (void)setPenaltyScore:(float)a3
{
  self->_penaltyScore = a3;
}

- (float)contentScore
{
  return self->_contentScore;
}

- (void)setContentScore:(float)a3
{
  self->_contentScore = a3;
}

- (float)humanPoseScore
{
  return self->_humanPoseScore;
}

- (void)setHumanPoseScore:(float)a3
{
  self->_humanPoseScore = a3;
}

- (float)humanActionScore
{
  return self->_humanActionScore;
}

- (void)setHumanActionScore:(float)a3
{
  self->_humanActionScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameResults, 0);
  objc_storeStrong((id *)&self->_faceQualityScores, 0);
  objc_storeStrong((id *)&self->_detectedFaces, 0);
}

@end
