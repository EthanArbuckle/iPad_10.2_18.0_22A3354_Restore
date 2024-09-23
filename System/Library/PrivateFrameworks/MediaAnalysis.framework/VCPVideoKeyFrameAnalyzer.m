@implementation VCPVideoKeyFrameAnalyzer

+ (BOOL)isLivePhotoKeyFrameEnabled
{
  return 0;
}

- (VCPVideoKeyFrameAnalyzer)initWithTransform:(CGAffineTransform *)a3 timeRange:(id *)a4 isLivePhoto:(BOOL)a5 keyFrameResults:(id)a6
{
  _BOOL8 v7;
  id v10;
  VCPVideoKeyFrameAnalyzer *v11;
  uint64_t v12;
  NSMutableArray *keyFrames;
  VCPImageBlurAnalyzer *v14;
  VCPImageBlurAnalyzer *blurAnalyzer;
  VCPImageFaceQualityAnalyzer *v16;
  VCPImageFaceQualityAnalyzer *faceQualityAnalyzer;
  __int128 v18;
  __int128 v19;
  VCPVideoKeyFrame *v20;
  VCPVideoKeyFrame *activeKeyFrame;
  NSDictionary *faceRanges;
  uint64_t v23;
  NSMutableArray *keyFrameScores;
  VCPVideoKeyFrameAnalyzer *v25;
  VCPVideoKeyFrameAnalyzer *v26;
  objc_super v28;

  v7 = a5;
  v10 = a6;
  v28.receiver = self;
  v28.super_class = (Class)VCPVideoKeyFrameAnalyzer;
  v11 = -[VCPVideoKeyFrameAnalyzer init](&v28, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    keyFrames = v11->_keyFrames;
    v11->_keyFrames = (NSMutableArray *)v12;

    v14 = -[VCPImageBlurAnalyzer initWithFaceResults:sdof:]([VCPImageBlurAnalyzer alloc], "initWithFaceResults:sdof:", 0, 0);
    blurAnalyzer = v11->_blurAnalyzer;
    v11->_blurAnalyzer = v14;

    v16 = objc_alloc_init(VCPImageFaceQualityAnalyzer);
    faceQualityAnalyzer = v11->_faceQualityAnalyzer;
    v11->_faceQualityAnalyzer = v16;

    v18 = *(_OWORD *)&a4->var0.var0;
    v19 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v11->_timeRange.start.epoch = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v11->_timeRange.duration.timescale = v19;
    *(_OWORD *)&v11->_timeRange.start.value = v18;
    v20 = -[VCPVideoKeyFrame initWithLivePhoto:]([VCPVideoKeyFrame alloc], "initWithLivePhoto:", v7);
    activeKeyFrame = v11->_activeKeyFrame;
    v11->_activeKeyFrame = v20;

    faceRanges = v11->_faceRanges;
    v11->_faceRanges = 0;

    v11->_isLivePhoto = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    keyFrameScores = v11->_keyFrameScores;
    v11->_keyFrameScores = (NSMutableArray *)v23;

    objc_storeStrong((id *)&v11->_inputKeyFrameResults, a6);
    if (!v11->_blurAnalyzer || !v11->_faceQualityAnalyzer || (v25 = v11, !v11->_activeKeyFrame))
      v25 = 0;
    v26 = v25;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)keyFrameScores
{
  return self->_keyFrameScores;
}

- (int)analyzeFrame:(__CVBuffer *)a3 frameStats:(id)a4 timestamp:(id *)a5
{
  id v8;
  unsigned __int8 v9;
  int v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  __int128 v24;
  int64_t v25;
  CMTime v26;
  __int128 v27;
  int64_t var3;
  CMTime rhs;
  CMTime lhs;

  v8 = a4;
  if ((v9 & 1) == 0
  {
    CMTimeMake((CMTime *)-[VCPVideoKeyFrameAnalyzer analyzeFrame:frameStats:timestamp:]::kHeadingTime, 1, 1);
  }
  v27 = *(_OWORD *)&a5->var0;
  var3 = a5->var3;
  lhs = (CMTime)*a5;
  rhs = (CMTime)self->_timeRange.start;
  CMTimeSubtract(&v26, &lhs, &rhs);
  lhs = v26;
  rhs = *(CMTime *)-[VCPVideoKeyFrameAnalyzer analyzeFrame:frameStats:timestamp:]::kHeadingTime;
  -[VCPVideoKeyFrameAnalyzer setKeyFrameTime:isHeadingFrame:](self, "setKeyFrameTime:isHeadingFrame:", &v27, CMTimeCompare(&lhs, &rhs) >> 31);
  v24 = *(_OWORD *)&a5->var0;
  v25 = a5->var3;
  -[VCPVideoKeyFrameAnalyzer prepareFrameStats:timeStamp:](self, "prepareFrameStats:timeStamp:", v8, &v24);
  if ((-[VCPVideoKeyFrame statsFlags](self->_activeKeyFrame, "statsFlags") & 1) == 0
    && (-[VCPVideoKeyFrame statsFlags](self->_activeKeyFrame, "statsFlags") & 0x10) == 0)
  {
    v10 = 0;
    goto LABEL_27;
  }
  if ((-[VCPVideoKeyFrame statsFlags](self->_activeKeyFrame, "statsFlags") & 0x10) == 0
    || (-[VCPVideoKeyFrame statsFlags](self->_activeKeyFrame, "statsFlags") & 1) != 0)
  {
    VCPSignPostLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    VCPSignPostLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VCPVideoKeyFrameBlurAnalyzer", ", (uint8_t *)&lhs, 2u);
    }

    v10 = -[VCPVideoKeyFrameAnalyzer computeSharpnessOfFrame:](self, "computeSharpnessOfFrame:", a3);
    if (v10)
      goto LABEL_27;
    VCPSignPostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v12, "VCPVideoKeyFrameBlurAnalyzer", ", (uint8_t *)&lhs, 2u);
    }

  }
  if (!+[VCPVideoKeyFrameAnalyzer isLivePhotoKeyFrameEnabled](VCPVideoKeyFrameAnalyzer, "isLivePhotoKeyFrameEnabled")|| (-[VCPVideoKeyFrame statsFlags](self->_activeKeyFrame, "statsFlags") & 1) == 0|| !self->_isLivePhoto)
  {
LABEL_26:
    v10 = -[VCPVideoKeyFrameAnalyzer finalizeKeyFrame](self, "finalizeKeyFrame");
    goto LABEL_27;
  }
  VCPSignPostLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_generate(v17);

  VCPSignPostLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(lhs.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "VCPVideoKeyFrameFaceQualityAnalyzer", ", (uint8_t *)&lhs, 2u);
  }

  v10 = -[VCPVideoKeyFrameAnalyzer computeFaceQualityOfFrame:](self, "computeFaceQualityOfFrame:", a3);
  if (!v10)
  {
    VCPSignPostLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(lhs.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_END, v18, "VCPVideoKeyFrameFaceQualityAnalyzer", ", (uint8_t *)&lhs, 2u);
    }

    goto LABEL_26;
  }
LABEL_27:

  return v10;
}

- (int)loadKeyFrameResults:(id *)a3
{
  unint64_t v5;
  void *v6;
  VCPVideoKeyFrame *activeKeyFrame;
  __int128 v9;
  int64_t var3;

  if (self->_inputKeyFrameResults)
  {
    v5 = -[NSMutableArray count](self->_keyFrames, "count");
    if (v5 < -[NSArray count](self->_inputKeyFrameResults, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_inputKeyFrameResults, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_keyFrames, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      activeKeyFrame = self->_activeKeyFrame;
      v9 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      -[VCPVideoKeyFrame loadKeyFrameResult:timestamp:](activeKeyFrame, "loadKeyFrameResult:timestamp:", v6, &v9);

    }
  }
  return 0;
}

- (void)preparePostProcessingStatsFromFaceRange:(id)a3 junkResults:(id)a4
{
  id v6;
  NSDictionary *v7;
  NSDictionary *faceRanges;
  NSArray *v9;
  NSArray *junkResults;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v11);
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  faceRanges = self->_faceRanges;
  self->_faceRanges = v7;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  junkResults = self->_junkResults;
  self->_junkResults = v9;

}

- (int)postProcess
{
  -[VCPVideoKeyFrameAnalyzer adjustScoreByFace](self, "adjustScoreByFace");
  -[VCPVideoKeyFrameAnalyzer modulateByJunk](self, "modulateByJunk");
  -[VCPVideoKeyFrameAnalyzer modulateByTimeRange](self, "modulateByTimeRange");
  return 0;
}

- (id)keyFrames
{
  return self->_keyFrames;
}

- (void)setBlurAnalyzerFaceResults:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;
  NSRect v23;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = v10;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v6), "bounds");
        v19 = CFSTR("attributes");
        v17 = CFSTR("faceBounds");
        NSStringFromRect(v23);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v4);
  }

  -[VCPImageBlurAnalyzer setFaceResults:](self->_blurAnalyzer, "setFaceResults:", v3);
}

- (int)computeFaceQualityOfFrame:(__CVBuffer *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VCPImageFaceQualityAnalyzer *faceQualityAnalyzer;
  void *v10;
  int v11;
  void *v12;

  -[VCPVideoKeyFrame detectedFaces](self->_activeKeyFrame, "detectedFaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_5;
  -[VCPVideoKeyFrame detectedFaces](self->_activeKeyFrame, "detectedFaces");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "observation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  faceQualityAnalyzer = self->_faceQualityAnalyzer;
  -[VCPVideoKeyFrame detectedFaces](self->_activeKeyFrame, "detectedFaces");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VCPImageFaceQualityAnalyzer analyzeDetectedFaces:faceResults:cancel:](faceQualityAnalyzer, "analyzeDetectedFaces:faceResults:cancel:", a3, v10, &__block_literal_global_21);

  if (!v11)
  {
    -[VCPImageFaceQualityAnalyzer faceQualityScores](self->_faceQualityAnalyzer, "faceQualityScores");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v5, "mutableCopy");
    -[VCPVideoKeyFrame setFaceQualityScores:](self->_activeKeyFrame, "setFaceQualityScores:", v12);

LABEL_5:
    return 0;
  }
  return v11;
}

uint64_t __54__VCPVideoKeyFrameAnalyzer_computeFaceQualityOfFrame___block_invoke()
{
  return 0;
}

- (int)computeSharpnessOfFrame:(__CVBuffer *)a3
{
  void *v5;
  VCPImageBlurAnalyzer *blurAnalyzer;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  double v17;
  void *v18;
  int v19;
  int v20;
  double v21;
  id v23;
  uint64_t v24;

  v24 = 0;
  -[VCPVideoKeyFrame detectedFaces](self->_activeKeyFrame, "detectedFaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPVideoKeyFrameAnalyzer setBlurAnalyzerFaceResults:](self, "setBlurAnalyzerFaceResults:", v5);

  blurAnalyzer = self->_blurAnalyzer;
  v23 = 0;
  v7 = -[VCPImageBlurAnalyzer analyzePixelBuffer:flags:results:cancel:](blurAnalyzer, "analyzePixelBuffer:flags:results:cancel:", a3, &v24, &v23, &__block_literal_global_160);
  v8 = v23;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BlurResults"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("attributes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sharpness"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sharpnessFaces"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sharpnessFaces"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "floatValue");
      v20 = v19;

    }
    else
    {
      v20 = 0;
    }
    LODWORD(v17) = v15;
    -[VCPVideoKeyFrame setSharpness:](self->_activeKeyFrame, "setSharpness:", v17);
    -[VCPImageBlurAnalyzer textureScore](self->_blurAnalyzer, "textureScore");
    -[VCPVideoKeyFrame setTextureScore:](self->_activeKeyFrame, "setTextureScore:");
    LODWORD(v21) = v20;
    -[VCPVideoKeyFrame setFaceSharpness:](self->_activeKeyFrame, "setFaceSharpness:", v21);
    -[VCPVideoKeyFrame setStatsFlags:](self->_activeKeyFrame, "setStatsFlags:", -[VCPVideoKeyFrame statsFlags](self->_activeKeyFrame, "statsFlags") | 1);

  }
  return v7;
}

uint64_t __52__VCPVideoKeyFrameAnalyzer_computeSharpnessOfFrame___block_invoke()
{
  return 0;
}

- (int)finalizeKeyFrame
{
  NSMutableArray *keyFrameScores;
  void *v4;
  VCPVideoKeyFrame *v5;
  VCPVideoKeyFrame *activeKeyFrame;

  -[VCPVideoKeyFrame computeCurationScore](self->_activeKeyFrame, "computeCurationScore");
  -[NSMutableArray addObject:](self->_keyFrames, "addObject:", self->_activeKeyFrame);
  if (self->_isLivePhoto)
  {
    keyFrameScores = self->_keyFrameScores;
    -[VCPVideoKeyFrame frameResults](self->_activeKeyFrame, "frameResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](keyFrameScores, "addObject:", v4);

  }
  v5 = -[VCPVideoKeyFrame initWithLivePhoto:]([VCPVideoKeyFrame alloc], "initWithLivePhoto:", self->_isLivePhoto);
  activeKeyFrame = self->_activeKeyFrame;
  self->_activeKeyFrame = v5;

  if (self->_activeKeyFrame)
    return 0;
  else
    return -108;
}

- (void)adjustScoreByFace
{
  NSDictionary *faceRanges;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  int v13;
  double v14;
  float v15;
  NSMutableArray *obj;
  void *v17;
  CMTime time;
  CMTime v19[2];
  CMTime duration;
  CMTime start;
  CMTimeRange range;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[6];
  _QWORD v32[3];
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  CMTime rhs;
  CMTime lhs;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__12;
  v38 = __Block_byref_object_dispose__12;
  v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  faceRanges = self->_faceRanges;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __45__VCPVideoKeyFrameAnalyzer_adjustScoreByFace__block_invoke;
  v31[3] = &unk_1E6B16DD0;
  v31[4] = v32;
  v31[5] = &v34;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](faceRanges, "enumerateKeysAndObjectsUsingBlock:", v31);
  -[NSDictionary objectForKeyedSubscript:](self->_faceRanges, "objectForKeyedSubscript:", v35[5]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_keyFrames;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v8 = v17;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v42, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              if (v12)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "start");
                objc_msgSend(v12, "last");
                objc_msgSend(v12, "start");
              }
              else
              {
                memset(&start, 0, sizeof(start));
                memset(v19, 0, sizeof(v19));
              }
              lhs = v19[1];
              rhs = v19[0];
              CMTimeSubtract(&duration, &lhs, &rhs);
              CMTimeRangeMake(&range, &start, &duration);
              if (v7)
                objc_msgSend(v7, "timestamp");
              else
                memset(&time, 0, sizeof(time));
              if (CMTimeRangeContainsTime(&range, &time))
              {

                goto LABEL_25;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v42, 16);
            if (v9)
              continue;
            break;
          }
        }

        v13 = objc_msgSend(v7, "hasGoodSubjectAction");
        objc_msgSend(v7, "score");
        if (v13)
          v15 = 1.0;
        else
          v15 = 0.7;
        *(float *)&v14 = v15 * *(float *)&v14;
        objc_msgSend(v7, "setScore:", v14);
LABEL_25:
        ;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v4);
  }

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

}

void __45__VCPVideoKeyFrameAnalyzer_adjustScoreByFace__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  CMTime v14[2];
  CMTime time;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMTime rhs;
  CMTime lhs;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v12)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "last");
          objc_msgSend(v12, "start");
        }
        else
        {
          memset(v14, 0, sizeof(v14));
        }
        lhs = v14[1];
        rhs = v14[0];
        CMTimeSubtract(&time, &lhs, &rhs);
        v10 = CMTimeGetSeconds(&time) + v10;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v10 > *(float *)(v13 + 24))
  {
    *(float *)(v13 + 24) = v10;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (void)modulateByTimeRange
{
  float Seconds;
  void *v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  double v9;
  $95D729B680665BEAEFA1D6FCA8238556 duration;

  duration = self->_timeRange.duration;
  Seconds = CMTimeGetSeconds((CMTime *)&duration);
  if (Seconds >= 3.0)
  {
    -[NSMutableArray firstObject](self->_keyFrames, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray lastObject](self->_keyFrames, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "score");
    *(float *)&v7 = v6 * 0.8;
    objc_msgSend(v4, "setScore:", v7);
    objc_msgSend(v5, "score");
    *(float *)&v9 = v8 * 0.8;
    objc_msgSend(v5, "setScore:", v9);

  }
}

- (void)modulateByExposure
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  uint64_t i;
  void *v8;
  float v9;
  float v10;
  NSMutableArray *v11;
  uint64_t v12;
  double v13;
  float v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  float v18;
  double v19;
  float v20;
  float v21;
  float v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = self->_keyFrames;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v29;
    v6 = INFINITY;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v8, "exposureScore");
        if (v9 < v6)
        {
          objc_msgSend(v8, "exposureScore");
          v6 = v10;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v4);
  }
  else
  {
    v6 = INFINITY;
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_keyFrames;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v12)
  {
    v13 = fmaxf(v6 * 1.5, 15.0);
    v14 = v13 * 6.28318531 * v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v17, "exposureScore", (_QWORD)v24);
        *(float *)&v19 = expf((float)-(float)((float)(v18 - v6) * (float)(v18 - v6)) / v14);
        objc_msgSend(v17, "setExposureScore:", v19);
        objc_msgSend(v17, "exposureScore");
        v21 = v20;
        objc_msgSend(v17, "score");
        *(float *)&v23 = v21 * v22;
        objc_msgSend(v17, "setScore:", v23);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v12);
  }

}

- (void)modulateByJunk
{
  void *v2;
  NSArray *v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  uint64_t j;
  void *v8;
  void *v9;
  float v10;
  _BOOL4 v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  float v14;
  double v15;
  NSMutableArray *obj;
  uint64_t v17;
  uint64_t v19;
  uint64_t i;
  CMTime time;
  CMTime duration;
  CMTime start;
  CMTimeRange range;
  CMTime v25;
  CMTime v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = self->_keyFrames;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v2 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v3 = self->_junkResults;
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        v5 = 1.0;
        if (v4)
        {
          v6 = *(_QWORD *)v28;
          while (2)
          {
            for (j = 0; j != v4; ++j)
            {
              if (*(_QWORD *)v28 != v6)
                objc_enumerationMutation(v3);
              v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("quality"));
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "floatValue");
              v11 = v10 < 0.35;

              if (v11)
              {
                memset(&v26, 0, sizeof(v26));
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("start"));
                v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                CMTimeMakeFromDictionary(&v26, v12);

                memset(&v25, 0, sizeof(v25));
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("duration"));
                v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                CMTimeMakeFromDictionary(&v25, v13);

                start = v26;
                duration = v25;
                CMTimeRangeMake(&range, &start, &duration);
                if (v2)
                  objc_msgSend(v2, "timestamp");
                else
                  memset(&time, 0, sizeof(time));
                if (CMTimeRangeContainsTime(&range, &time))
                {
                  v5 = 0.0;
                  goto LABEL_20;
                }
              }
            }
            v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v4)
              continue;
            break;
          }
        }
LABEL_20:

        objc_msgSend(v2, "score");
        *(float *)&v15 = v5 * v14;
        objc_msgSend(v2, "setScore:", v15);
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v19);
  }

}

- (void)setKeyFrameTime:(id *)a3 isHeadingFrame:(BOOL)a4
{
  _BOOL8 v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v4 = a4;
  v6 = *a3;
  -[VCPVideoKeyFrame setTimestamp:](self->_activeKeyFrame, "setTimestamp:", &v6);
  -[VCPVideoKeyFrame setIsHeadingFrame:](self->_activeKeyFrame, "setIsHeadingFrame:", v4);
}

- (void)prepareFrameStats:(id)a3 timeStamp:(id *)a4
{
  id v6;
  VCPVideoKeyFrame *activeKeyFrame;
  uint64_t v8;
  void *v9;
  VCPVideoKeyFrame *v10;
  VCPVideoKeyFrame *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v39;

  v6 = a3;
  -[VCPVideoKeyFrame resetStatsFlag](self->_activeKeyFrame, "resetStatsFlag");
  v39 = *a4;
  -[VCPVideoKeyFrameAnalyzer loadKeyFrameResults:](self, "loadKeyFrameResults:", &v39);
  activeKeyFrame = self->_activeKeyFrame;
  v8 = objc_msgSend(v6, "frameProcessedByFaceDetector");
  objc_msgSend(v6, "detectedFaces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPVideoKeyFrame setFaceStatsFlag:detectedFaces:](activeKeyFrame, "setFaceStatsFlag:detectedFaces:", v8, v9);

  v10 = self->_activeKeyFrame;
  objc_msgSend(v6, "frameExpressionScore");
  -[VCPVideoKeyFrame setExpressionChangeScore:](v10, "setExpressionChangeScore:");
  v11 = self->_activeKeyFrame;
  v12 = objc_msgSend(v6, "frameProcessedByVideoAnalyzer");
  objc_msgSend(v6, "cameraMotionScore");
  v14 = v13;
  objc_msgSend(v6, "subjectActionScore");
  v16 = v15;
  objc_msgSend(v6, "interestingnessScore");
  v18 = v17;
  objc_msgSend(v6, "obstructionScore");
  v20 = v19;
  objc_msgSend(v6, "colorfulnessScore");
  v22 = v21;
  objc_msgSend(v6, "exposureScore");
  v24 = v23;
  v25 = objc_msgSend(v6, "frameProcessedByHumanAnalyzer");
  objc_msgSend(v6, "humanPoseScore");
  v27 = v26;
  objc_msgSend(v6, "humanActionScore");
  v29 = v28;
  v30 = objc_msgSend(v6, "subMbMotionAvailable");
  LODWORD(v31) = v14;
  LODWORD(v32) = v16;
  LODWORD(v33) = v18;
  LODWORD(v34) = v20;
  LODWORD(v35) = v22;
  LODWORD(v36) = v24;
  LODWORD(v37) = v27;
  LODWORD(v38) = v29;
  -[VCPVideoKeyFrame setMotionStatsFlag:cameraMotion:subjectAction:interestingness:obstruction:colorfulness:exposureScore:humanActionStatsFlag:humanPoseScore:humanActionScore:subMb:](v11, "setMotionStatsFlag:cameraMotion:subjectAction:interestingness:obstruction:colorfulness:exposureScore:humanActionStatsFlag:humanPoseScore:humanActionScore:subMb:", v12, v25, v30, v31, v32, v33, v34, v35, v36, v37, v38);

}

- (float)computeMinDistanceBetween:(id)a3 withSet:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  float v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    v9 = INFINITY;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v14 = 0.0;
        v12 = objc_msgSend(v5, "computeDistance:toDescriptor:", &v14, v11);
        if (v12)
        {
          v9 = (float)v12;
          goto LABEL_14;
        }
        if (v14 < v9)
          v9 = v14;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v9 = INFINITY;
  }
LABEL_14:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputKeyFrameResults, 0);
  objc_storeStrong((id *)&self->_keyFrameScores, 0);
  objc_storeStrong((id *)&self->_activeKeyFrame, 0);
  objc_storeStrong((id *)&self->_keyFrames, 0);
  objc_storeStrong((id *)&self->_junkResults, 0);
  objc_storeStrong((id *)&self->_faceRanges, 0);
  objc_storeStrong((id *)&self->_faceQualityAnalyzer, 0);
  objc_storeStrong((id *)&self->_blurAnalyzer, 0);
}

@end
