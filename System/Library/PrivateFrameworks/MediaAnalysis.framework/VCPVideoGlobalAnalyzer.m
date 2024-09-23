@implementation VCPVideoGlobalAnalyzer

- (float)analyzeOverallQuality:(id)a3 withFpsRate:(float)a4
{
  id v6;
  double v7;
  double v8;
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
  float v25;
  float v26;

  v6 = a3;
  if ((~objc_msgSend(v6, "vcp_types") & 0x98) != 0 || a4 <= 0.0)
  {
    v9 = -1.0;
  }
  else
  {
    *(float *)&v7 = a4;
    v9 = 0.0;
    if (-[VCPVideoGlobalAnalyzer hasMeaningfulSceneSegment:withFpsRate:](self, "hasMeaningfulSceneSegment:withFpsRate:", v6, v7))
    {
      *(float *)&v8 = a4;
      -[VCPVideoGlobalAnalyzer assetQualityScoreFromAnalysis:withFpsRate:](self, "assetQualityScoreFromAnalysis:withFpsRate:", v6, v8);
      v11 = v10;
      -[VCPVideoGlobalAnalyzer assetActionScoreFromAnalysis:](self, "assetActionScoreFromAnalysis:", v6);
      v13 = v12;
      -[VCPVideoGlobalAnalyzer assetExpressionScoreFromAnalysis:](self, "assetExpressionScoreFromAnalysis:", v6);
      v15 = v14;
      -[VCPVideoGlobalAnalyzer assetVoiceScoreFromAnalysis:](self, "assetVoiceScoreFromAnalysis:", v6);
      v17 = v16;
      -[VCPVideoGlobalAnalyzer assetJunkScoreFromAnalysis:](self, "assetJunkScoreFromAnalysis:", v6);
      v19 = v18;
      v20 = (float)(v17 * 0.1) + (float)(v11 * 0.4);
      if (v13 >= 0.2 || v15 >= 0.2)
      {
        v22 = (float)((float)(v15 * 0.25) + (float)(v13 * 0.25)) + v20;
        v23 = 1.0;
      }
      else
      {
        -[VCPVideoGlobalAnalyzer assetCameraMotionScoreFromAnalysis:](self, "assetCameraMotionScoreFromAnalysis:", v6);
        v22 = v20 + (float)(v21 * 0.35);
        v23 = 0.85;
      }
      v25 = powf(v19 * (float)(v22 / v23), 0.4);
      v26 = 1.0;
      if (v25 < 1.0)
        v26 = v25;
      if (v25 <= 0.0)
        v9 = 0.0;
      else
        v9 = v26;
    }
  }

  return v9;
}

- (BOOL)checkCameraZoom:(id *)a3 cameraMotionResults:(id)a4
{
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  __int128 v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  CMTime v21;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v24;
  CMTimeRange time1;
  CMTimeRange v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CMTimeRange range;
  CMTime v32;
  CMTime time2;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  memset(&v32, 0, sizeof(v32));
  v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v32, &range);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(v7);
      v11 = *(const __CFDictionary **)(*((_QWORD *)&v27 + 1) + 8 * v10);
      memset(&v26, 0, sizeof(v26));
      CMTimeRangeMakeFromDictionary(&v26, v11);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&v26.start.value;
      time1.start.epoch = v26.start.epoch;
      time2 = v32;
      if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
        break;
      v24 = v26;
      memset(&time1, 0, sizeof(time1));
      v12 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&otherRange.start.epoch = v12;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      CMTimeRangeGetIntersection(&time1, &v24, &otherRange);
      if ((time1.start.flags & 1) == 0
        || (time1.duration.flags & 1) == 0
        || time1.duration.epoch
        || time1.duration.value < 0
        || (duration = time1.duration, v21 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&duration, &v21)))
      {
        -[__CFDictionary objectForKey:](v11, "objectForKey:", CFSTR("flags"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = objc_msgSend(v13, "intValue");
          v17 = !(v16 | ((v15 & 0x2FFC0) == 0)) && (v15 & 0x1FC0) == 4096;
          v18 = v17;

          if (v18)
          {
            v19 = 1;
            goto LABEL_25;
          }
        }
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        v19 = 0;
        if (v8)
          goto LABEL_3;
        goto LABEL_25;
      }
    }
  }
  v19 = 0;
LABEL_25:

  return v19;
}

- (int)generateLivePhotoRecommendationForResults:(id)a3 andPrivateResults:(id)a4 usingFaceAction:(BOOL)a5
{
  unsigned __int8 v6;
  CMTime *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  unint64_t v10;
  const __CFDictionary *v11;
  void *v12;
  float v13;
  float v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  int32_t v21;
  _BOOL4 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFDictionary *v27;
  void *v28;
  float v29;
  float v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  uint64_t j;
  void *v37;
  void *v38;
  NSString *v39;
  double width;
  double height;
  double v42;
  float v43;
  double Seconds;
  int v45;
  void *v47;
  __CFArray *v48;
  void *v49;
  id v50;
  id v51;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  unint64_t v58;
  CMTime v59;
  CMTime v60;
  CMTimeRange v61;
  CMTimeRange v62;
  CMTime v63;
  CMTime v64;
  CMTime v65;
  CMTime v66;
  CMTime v67;
  CMTimeRange v68;
  CMTimeRange v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CMTime v74;
  CMTimeRange v75;
  CMTimeRange v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  CMTime time;
  CMTimeRange v82;
  CMTimeRange v83;
  CMTimeRange v84;
  CMTime v85;
  CMTimeRange v86;
  CMTimeRange v87;
  CMTimeRange v88;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange rhs;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  CMTimeRange lhs;
  CMTimeRange v99;
  float v100;
  CMTime v101;
  CMTime v102;
  CMTimeRange v103;
  CMTime duration;
  CMTime start;
  CMTimeRange v106;
  CMTime v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;
  NSRect v112;

  v55 = a5;
  v111 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v50 = a4;
  if ((v6 & 1) == 0
  {
    CMTimeMake((CMTime *)&-[VCPVideoGlobalAnalyzer generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:]::kTrimLength, 2, 15);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  memset(&v106, 0, sizeof(v106));
  v7 = (CMTime *)MEMORY[0x1E0CA2E68];
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  duration = start;
  CMTimeRangeMake(&v106, &start, &duration);
  memset(&v103, 0, sizeof(v103));
  v102 = *v7;
  v101 = v102;
  CMTimeRangeMake(&v103, &v102, &v101);
  v100 = 0.0;
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SceneResults"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("FineSubjectMotionResults"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("FaceResults"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("OrientationResults"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("MetaMotionProcessedResults"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("CameraMotionResults"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "count"))
  {
    objc_msgSend(v56, "lastObject");
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    memset(&v99, 0, sizeof(v99));
    CMTimeRangeMakeFromDictionary(&v99, v8);
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v99.start.value;
    lhs.start.epoch = v99.start.epoch;
    rhs.start = v99.duration;
    CMTimeAdd(&v107, &lhs.start, &rhs.start);
    v106.duration = v107;
    objc_msgSend(v56, "firstObject");
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    CMTimeRangeMakeFromDictionary(&lhs, v9);
    *(_OWORD *)&v99.start.epoch = *(_OWORD *)&lhs.start.epoch;
    *(_OWORD *)&v106.start.value = *(_OWORD *)&lhs.start.value;
    v106.start.epoch = lhs.start.epoch;

  }
  v58 = 0;
  v10 = 0;
  while (v58 < objc_msgSend(v56, "count"))
  {
    objc_msgSend(v56, "objectAtIndex:");
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    memset(&v99, 0, sizeof(v99));
    CMTimeRangeMakeFromDictionary(&v99, v11);
    -[__CFDictionary objectForKey:](v11, "objectForKey:", CFSTR("quality"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    v97 = 0u;
    v96 = 0u;
    v95 = 0u;
    v94 = 0u;
    v15 = v54;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v95;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v95 != v17)
            objc_enumerationMutation(v15);
          v19 = *(const __CFDictionary **)(*((_QWORD *)&v94 + 1) + 8 * i);
          memset(&lhs, 0, sizeof(lhs));
          CMTimeRangeMakeFromDictionary(&lhs, v19);
          memset(&rhs, 0, sizeof(rhs));
          range = v99;
          otherRange = lhs;
          CMTimeRangeGetIntersection(&rhs, &range, &otherRange);
          if ((rhs.start.flags & 1) != 0
            && (rhs.duration.flags & 1) != 0
            && !rhs.duration.epoch
            && (rhs.duration.value & 0x8000000000000000) == 0)
          {
            time1 = rhs.duration;
            time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
            if (!CMTimeCompare(&time1, &time2))
              continue;
          }
          v88 = lhs;
          v87 = v99;
          if (!CMTimeRangeContainsTimeRange(&v88, &v87))
          {

            goto LABEL_27;
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v94, v110, 16);
        if (v16)
          continue;
        break;
      }
    }

    if (v14 >= 0.0)
    {
      v86 = v99;
      if (!-[VCPVideoGlobalAnalyzer checkCameraZoom:cameraMotionResults:](self, "checkCameraZoom:cameraMotionResults:", &v86, v53))
      {
        while (v10 < objc_msgSend(v57, "count") && v55)
        {
          memset(&lhs, 0, sizeof(lhs));
          objc_msgSend(v57, "objectAtIndex:", v10);
          v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeRangeMakeFromDictionary(&lhs, v20);

          v84 = v99;
          CMTimeRangeGetEnd(&v85, &v84);
          rhs.start = v85;
          v107 = lhs.start;
          v21 = CMTimeCompare(&rhs.start, &v107);
          v22 = v21 > 0;
          if (v21 > 0)
          {
            v83 = lhs;
            v82 = v99;
            ++v10;
            if (!CMTimeRangeContainsTimeRange(&v83, &v82))
              continue;
          }
          goto LABEL_29;
        }
        v22 = 0;
LABEL_29:
        if (v14 >= 0.3)
        {
          time = v99.duration;
          if (CMTimeGetSeconds(&time) >= 1.0)
          {
            if (v22 || !v55)
              goto LABEL_65;
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            v23 = v49;
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v77, v109, 16);
            if (v24)
            {
              v25 = *(_QWORD *)v78;
              do
              {
                v26 = 0;
                do
                {
                  if (*(_QWORD *)v78 != v25)
                    objc_enumerationMutation(v23);
                  v27 = *(const __CFDictionary **)(*((_QWORD *)&v77 + 1) + 8 * v26);
                  memset(&lhs, 0, sizeof(lhs));
                  CMTimeRangeMakeFromDictionary(&lhs, v27);
                  -[__CFDictionary objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("quality"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "floatValue");
                  v30 = v29;

                  memset(&rhs, 0, sizeof(rhs));
                  v76 = v99;
                  v75 = lhs;
                  CMTimeRangeGetIntersection(&rhs, &v76, &v75);
                  if ((rhs.start.flags & 1) != 0
                    && (rhs.duration.flags & 1) != 0
                    && !rhs.duration.epoch
                    && (rhs.duration.value & 0x8000000000000000) == 0
                    && v30 >= 0.3)
                  {
                    v74 = rhs.duration;
                    if (CMTimeGetSeconds(&v74) > 0.0)
                    {

                      goto LABEL_65;
                    }
                  }
                  ++v26;
                }
                while (v24 != v26);
                v31 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v77, v109, 16);
                v24 = v31;
              }
              while (v31);
            }

            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v32 = v47;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v108, 16);
            if (v33)
            {
              v34 = *(_QWORD *)v71;
              v35 = 0.0;
              do
              {
                for (j = 0; j != v33; ++j)
                {
                  if (*(_QWORD *)v71 != v34)
                    objc_enumerationMutation(v32);
                  v37 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                  objc_msgSend(v37, "objectForKey:", CFSTR("attributes"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "objectForKey:", CFSTR("faceBounds"));
                  v39 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v112 = NSRectFromString(v39);
                  width = v112.size.width;
                  height = v112.size.height;
                  memset(&lhs, 0, sizeof(lhs));
                  CMTimeRangeMakeFromDictionary(&lhs, (CFDictionaryRef)v37);
                  memset(&rhs, 0, sizeof(rhs));
                  v69 = v99;
                  v68 = lhs;
                  CMTimeRangeGetIntersection(&rhs, &v69, &v68);
                  if ((rhs.start.flags & 1) != 0
                    && (rhs.duration.flags & 1) != 0
                    && !rhs.duration.epoch
                    && (rhs.duration.value & 0x8000000000000000) == 0)
                  {
                    v67 = rhs.duration;
                    v35 = v35 + width * height * CMTimeGetSeconds(&v67);
                  }

                }
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v108, 16);
              }
              while (v33);
            }
            else
            {
              v35 = 0.0;
            }

            lhs.start = v99.duration;
            *(_OWORD *)&rhs.start.value = *MEMORY[0x1E0CA2E68];
            rhs.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
            if (CMTimeCompare(&lhs.start, &rhs.start))
            {
              v66 = v99.duration;
              v42 = v35 / CMTimeGetSeconds(&v66);
            }
            else
            {
              v42 = 0.0;
            }
            v43 = v42;
            if (v43 >= 0.04)
            {
LABEL_65:
              v65 = v99.duration;
              Seconds = CMTimeGetSeconds(&v65);
              v64 = v103.duration;
              if (Seconds > CMTimeGetSeconds(&v64))
              {
                v103 = v99;
                v100 = v14;
              }
            }
          }
        }
      }
    }
LABEL_27:

    ++v58;
  }
  if ((v103.start.flags & 1) == 0)
  {
LABEL_68:
    v45 = 0;
    goto LABEL_69;
  }
  v45 = 0;
  if ((v103.duration.flags & 1) != 0 && !v103.duration.epoch && (v103.duration.value & 0x8000000000000000) == 0)
  {
    v99.start = v103.duration;
    *(_OWORD *)&lhs.start.value = *MEMORY[0x1E0CA2E68];
    lhs.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    if (CMTimeCompare(&v99.start, &lhs.start))
    {
      v63 = v106.duration;
      if (CMTimeGetSeconds(&v63) >= 2.29999995)
        goto LABEL_84;
      *(_OWORD *)&v99.start.value = *(_OWORD *)&v103.start.value;
      v99.start.epoch = v103.start.epoch;
      *(_OWORD *)&lhs.start.value = *(_OWORD *)&v106.start.value;
      lhs.start.epoch = v106.start.epoch;
      if (!CMTimeCompare(&v99.start, &lhs.start))
      {
        *(_OWORD *)&v99.start.value = *(_OWORD *)&v106.start.value;
        v99.start.epoch = v106.start.epoch;
        *(_OWORD *)&lhs.start.value = -[VCPVideoGlobalAnalyzer generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:]::kTrimLength;
        lhs.start.epoch = qword_1ED261000;
        CMTimeAdd(&rhs.start, &v99.start, &lhs.start);
        *(_OWORD *)&v103.start.value = *(_OWORD *)&rhs.start.value;
        v103.start.epoch = rhs.start.epoch;
        v99.start = v103.duration;
        *(_OWORD *)&lhs.start.value = -[VCPVideoGlobalAnalyzer generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:]::kTrimLength;
        lhs.start.epoch = qword_1ED261000;
        CMTimeSubtract(&rhs.start, &v99.start, &lhs.start);
        v103.duration = rhs.start;
      }
      v62 = v103;
      CMTimeRangeGetEnd(&rhs.start, &v62);
      v61 = v106;
      CMTimeRangeGetEnd(&v107, &v61);
      *(_OWORD *)&v99.start.value = *(_OWORD *)&rhs.start.value;
      v99.start.epoch = rhs.start.epoch;
      lhs.start = v107;
      if (!CMTimeCompare(&v99.start, &lhs.start))
      {
        v99.start = v103.duration;
        *(_OWORD *)&lhs.start.value = -[VCPVideoGlobalAnalyzer generateLivePhotoRecommendationForResults:andPrivateResults:usingFaceAction:]::kTrimLength;
        lhs.start.epoch = qword_1ED261000;
        CMTimeSubtract(&rhs.start, &v99.start, &lhs.start);
        v103.duration = rhs.start;
      }
      if ((v103.start.flags & 1) == 0
        || (v103.duration.flags & 1) == 0
        || v103.duration.epoch
        || v103.duration.value < 0
        || (v60 = v103.duration, v59 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v60, &v59)))
      {
LABEL_84:
        v45 = AddResultDictionary(&v103.start, &v103.duration, &v100, 0, 0, v48);
        if (v45)
          goto LABEL_69;
        objc_msgSend(v51, "setObject:forKey:", v48, CFSTR("IrisRecommendResults"));
      }
    }
    goto LABEL_68;
  }
LABEL_69:

  return v45;
}

- (float)assetQualityScoreFromAnalysis:(id)a3 withFpsRate:(float)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  const __CFDictionary *v15;
  double Seconds;
  void *v17;
  float v18;
  float v19;
  uint64_t v20;
  float v21;
  _BOOL4 v22;
  _BOOL4 v23;
  int v24;
  float v25;
  float v27;
  float v28;
  float v29;
  float v31;
  CMTime time;
  CMTimeRange v33;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("metadataRanges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("QualityResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = 1.0;
  v10 = 0.0;
  v11 = 1.0;
  v12 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  while (v8 < objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndex:", v8);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    memset(&v33, 0, sizeof(v33));
    CMTimeRangeMakeFromDictionary(&v33, v15);
    time = v33.duration;
    Seconds = CMTimeGetSeconds(&time);
    -[__CFDictionary objectForKey:](v15, "objectForKey:", CFSTR("quality"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;

    v20 = objc_msgSend(v7, "count");
    v21 = Seconds;
    v22 = v11 > 0.3;
    v23 = v11 <= 0.3;
    if (v19 <= 0.3)
      v23 = 0;
    else
      v22 = 0;
    v24 = v22 || v23;
    v25 = 0.0;
    if (v19 > 0.3)
      v25 = 1.0;
    if (v24)
      v12 = v12 + 1.0;
    v10 = v10 + (float)(v25 * v21);
    v14 = v14 + (float)(v19 * v21);
    v13 = v13 + v21;
    if (v9 > v21 && v8 < v20 - 1)
      v9 = Seconds;

    ++v8;
    v11 = v19;
  }
  if (v13 == 0.0)
  {
    v29 = 0.0;
  }
  else
  {
    v27 = (float)((float)((float)((float)(v9 * (float)(v12 * -0.4)) / v13) + 1.0)
                * (float)((float)(v10 * (float)(v14 / v13)) / v13))
        * (float)(erff((float)((float)(v13 / v31) + -10.0) / 424.26) + 1.0);
    if (v27 < 1.0)
      v28 = v27;
    else
      v28 = 1.0;
    if (v27 <= 0.0)
      v29 = 0.0;
    else
      v29 = v28;
  }

  return v29;
}

- (float)assetActionScoreFromAnalysis:(id)a3
{
  void *v3;
  uint64_t v4;
  float v5;
  float v6;
  const __CFDictionary *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  float Seconds;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFDictionary *v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  int v29;
  double v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  id obj;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t i;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTimeRange v46;
  CMTimeRange v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CMTime time;
  CMTime v53;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v56;
  CMTimeRange time1;
  CMTimeRange v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  CMTimeRange range;
  CMTime v64;
  CMTimeRange v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  CMTime time2;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("metadataRanges"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v3, "count");

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v40, "objectForKey:", CFSTR("QualityResults"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v4)
  {
    v41 = v4;
    v38 = *(_QWORD *)v67;
    v5 = 0.0;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v67 != v38)
          objc_enumerationMutation(obj);
        v7 = *(const __CFDictionary **)(*((_QWORD *)&v66 + 1) + 8 * i);
        memset(&v65, 0, sizeof(v65));
        CMTimeRangeMakeFromDictionary(&v65, v7);
        memset(&v64, 0, sizeof(v64));
        range = v65;
        CMTimeRangeGetEnd(&v64, &range);
        if (v39)
        {
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          objc_msgSend(v40, "objectForKey:", CFSTR("FineSubjectMotionResults"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v60;
LABEL_9:
            v11 = 0;
            while (1)
            {
              if (*(_QWORD *)v60 != v10)
                objc_enumerationMutation(v8);
              v12 = *(const __CFDictionary **)(*((_QWORD *)&v59 + 1) + 8 * v11);
              memset(&v58, 0, sizeof(v58));
              CMTimeRangeMakeFromDictionary(&v58, v12);
              *(_OWORD *)&time1.start.value = *(_OWORD *)&v58.start.value;
              time1.start.epoch = v58.start.epoch;
              time2 = v64;
              if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
                break;
              v56 = v58;
              memset(&time1, 0, sizeof(time1));
              otherRange = v65;
              CMTimeRangeGetIntersection(&time1, &v56, &otherRange);
              if ((time1.start.flags & 1) == 0
                || (time1.duration.flags & 1) == 0
                || time1.duration.epoch
                || time1.duration.value < 0
                || (duration = time1.duration,
                    v53 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
                    CMTimeCompare(&duration, &v53)))
              {
                -[__CFDictionary objectForKey:](v12, "objectForKey:", CFSTR("quality"));
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "floatValue");
                v15 = v14;

                -[__CFDictionary objectForKey:](v7, "objectForKey:", CFSTR("quality"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "floatValue");
                v18 = v17;

                time = time1.duration;
                Seconds = CMTimeGetSeconds(&time);
                if (v15 < 0.3)
                  v20 = 0.0;
                else
                  v20 = 1.0;
                v6 = v6 + (float)((float)(v18 * v20) * Seconds);
                v5 = v5 + Seconds;
              }
              if (v9 == ++v11)
              {
                v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                if (v9)
                  goto LABEL_9;
                break;
              }
            }
          }
        }
        else
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          objc_msgSend(v40, "objectForKey:", CFSTR("SubjectMotionResults"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v71, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v49;
LABEL_27:
            v23 = 0;
            while (1)
            {
              if (*(_QWORD *)v49 != v22)
                objc_enumerationMutation(v8);
              v24 = *(const __CFDictionary **)(*((_QWORD *)&v48 + 1) + 8 * v23);
              memset(&v58, 0, sizeof(v58));
              CMTimeRangeMakeFromDictionary(&v58, v24);
              *(_OWORD *)&time1.start.value = *(_OWORD *)&v58.start.value;
              time1.start.epoch = v58.start.epoch;
              time2 = v64;
              if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
                break;
              memset(&time1, 0, sizeof(time1));
              v47 = v58;
              v46 = v65;
              CMTimeRangeGetIntersection(&time1, &v47, &v46);
              if ((time1.start.flags & 1) == 0
                || (time1.duration.flags & 1) == 0
                || time1.duration.epoch
                || time1.duration.value < 0
                || (v45 = time1.duration, v44 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&v45, &v44)))
              {
                -[__CFDictionary objectForKey:](v7, "objectForKey:", CFSTR("quality"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "floatValue");
                v27 = v26;

                -[__CFDictionary objectForKey:](v24, "objectForKey:", CFSTR("flags"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "unsignedIntegerValue");

                v43 = time1.duration;
                v30 = CMTimeGetSeconds(&v43);
                if ((*(_QWORD *)&v29 & 0x20000) != 0)
                  v31 = 1.0;
                else
                  v31 = 0.0;
                v32 = v30;
                v6 = v6 + (float)((float)(v27 * v31) * v32);
                v5 = v5 + v32;
              }
              if (v21 == ++v23)
              {
                v21 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v71, 16);
                if (v21)
                  goto LABEL_27;
                break;
              }
            }
          }
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v41);
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
  }

  v33 = (float)(erff((float)((float)(v6 / fmaxf(v5, 1.0)) * 12.0) + -1.8) * 0.5) + 0.5;
  if (v33 < 1.0)
    v34 = v33;
  else
    v34 = 1.0;
  if (v33 <= 0.0)
    v35 = 0.0;
  else
    v35 = v34;

  return v35;
}

- (float)assetExpressionScoreFromAnalysis:(id)a3
{
  uint64_t v3;
  float v4;
  float v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
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
  void *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  id obj;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  CMTime time;
  CMTime v38;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v41;
  CMTimeRange time1;
  CMTimeRange v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CMTimeRange range;
  CMTime v49;
  CMTimeRange v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CMTime time2;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;
  NSRect v59;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("metadataRanges"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v33, "objectForKey:", CFSTR("QualityResults"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v3)
  {
    v34 = v3;
    v32 = *(_QWORD *)v52;
    v4 = 0.0;
    v5 = 0.0;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(obj);
        v6 = *(const __CFDictionary **)(*((_QWORD *)&v51 + 1) + 8 * i);
        memset(&v50, 0, sizeof(v50));
        CMTimeRangeMakeFromDictionary(&v50, v6);
        memset(&v49, 0, sizeof(v49));
        range = v50;
        CMTimeRangeGetEnd(&v49, &range);
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v33, "objectForKey:", CFSTR("FaceResults"));
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v45;
LABEL_8:
          v9 = 0;
          while (1)
          {
            if (*(_QWORD *)v45 != v8)
              objc_enumerationMutation(v36);
            v10 = *(const __CFDictionary **)(*((_QWORD *)&v44 + 1) + 8 * v9);
            memset(&v43, 0, sizeof(v43));
            CMTimeRangeMakeFromDictionary(&v43, v10);
            *(_OWORD *)&time1.start.value = *(_OWORD *)&v43.start.value;
            time1.start.epoch = v43.start.epoch;
            time2 = v49;
            if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
              break;
            v41 = v43;
            memset(&time1, 0, sizeof(time1));
            otherRange = v50;
            CMTimeRangeGetIntersection(&time1, &v41, &otherRange);
            if ((time1.start.flags & 1) == 0
              || (time1.duration.flags & 1) == 0
              || time1.duration.epoch
              || time1.duration.value < 0
              || (duration = time1.duration,
                  v38 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
                  CMTimeCompare(&duration, &v38)))
            {
              -[__CFDictionary objectForKey:](v10, "objectForKey:", CFSTR("attributes"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKey:", CFSTR("faceBounds"));
              v12 = (NSString *)objc_claimAutoreleasedReturnValue();
              -[__CFDictionary objectForKey:](v10, "objectForKey:", CFSTR("flags"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "intValue");
              v59 = NSRectFromString(v12);
              v15 = v59.size.width * v59.size.height + -0.170000002;
              v16 = -[VCPVideoGlobalAnalyzer assetExpressionScoreFromAnalysis:]::kAreaSigma[v15 > 0.0];
              time = time1.duration;
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
              -[__CFDictionary objectForKey:](v6, "objectForKey:", CFSTR("quality"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "floatValue");
              v25 = v24;

              v26 = Seconds;
              v5 = v5 + (float)(sqrtf(v22 * v25) * v26);
              v4 = v4 + v26;
            }
            if (v7 == ++v9)
            {
              v7 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
              if (v7)
                goto LABEL_8;
              break;
            }
          }
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v34);
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
  }

  v27 = 1.0;
  v28 = v5 / fmaxf(v4, 1.0);
  if (v28 < 1.0)
    v27 = v28;
  if (v28 <= 0.0)
    v29 = 0.0;
  else
    v29 = v27;

  return v29;
}

- (float)assetVoiceScoreFromAnalysis:(id)a3
{
  void *v3;
  void *v4;
  const __CFDictionary *v5;
  float Seconds;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t i;
  const __CFDictionary *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  CMTime duration;
  CMTimeRange lhs;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CMTime time;
  CMTimeRange v27;
  CMTime rhs;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("metadataRanges"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("QualityResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  memset(&v27, 0, sizeof(v27));
  CMTimeRangeMakeFromDictionary(&v27, v5);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&v27.start.value;
  lhs.start.epoch = v27.start.epoch;
  rhs = v27.duration;
  CMTimeAdd(&time, &lhs.start, &rhs);
  Seconds = CMTimeGetSeconds(&time);
  if (Seconds == 0.0)
  {
    v13 = 0.0;
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v3, "objectForKey:", CFSTR("VoiceResults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v23;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v7);
          v12 = *(const __CFDictionary **)(*((_QWORD *)&v22 + 1) + 8 * i);
          memset(&lhs, 0, sizeof(lhs));
          CMTimeRangeMakeFromDictionary(&lhs, v12);
          duration = lhs.duration;
          v10 = CMTimeGetSeconds(&duration) + v10;
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v29, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 0.0;
    }

    v14 = (float)(Seconds - v10) / Seconds;
    if (v14 < 1.0)
      v15 = (float)(Seconds - v10) / Seconds;
    else
      v15 = 1.0;
    if (v14 <= 0.0)
      v16 = 0.0;
    else
      v16 = v15;
    v17 = expf((float)(v16 * v16) * -4.0);
    if (v17 < 1.0)
      v18 = v17;
    else
      v18 = 1.0;
    if (v17 <= 0.0)
      v13 = 0.0;
    else
      v13 = v18;
  }

  return v13;
}

- (float)assetCameraMotionScoreFromAnalysis:(id)a3
{
  uint64_t v3;
  float v4;
  float v5;
  float v6;
  const __CFDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  void *v12;
  int v13;
  int v14;
  unsigned int v15;
  char v16;
  unsigned int v17;
  double Seconds;
  void *v19;
  float v20;
  float v21;
  BOOL v22;
  float v23;
  float v24;
  float v25;
  BOOL v26;
  float v27;
  float v28;
  float v29;
  id obj;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t i;
  id v36;
  CMTime time;
  CMTime v38;
  CMTime duration;
  CMTimeRange otherRange;
  CMTimeRange v41;
  CMTimeRange time1;
  CMTimeRange v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CMTimeRange range;
  CMTime v49;
  CMTimeRange v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CMTime time2;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("metadataRanges"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v33, "objectForKey:", CFSTR("QualityResults"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v3)
  {
    v34 = v3;
    v32 = *(_QWORD *)v52;
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v52 != v32)
          objc_enumerationMutation(obj);
        v7 = *(const __CFDictionary **)(*((_QWORD *)&v51 + 1) + 8 * i);
        memset(&v50, 0, sizeof(v50));
        CMTimeRangeMakeFromDictionary(&v50, v7);
        memset(&v49, 0, sizeof(v49));
        range = v50;
        CMTimeRangeGetEnd(&v49, &range);
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        objc_msgSend(v33, "objectForKey:", CFSTR("CameraMotionResults"));
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v45;
LABEL_8:
          v10 = 0;
          while (1)
          {
            if (*(_QWORD *)v45 != v9)
              objc_enumerationMutation(v36);
            v11 = *(const __CFDictionary **)(*((_QWORD *)&v44 + 1) + 8 * v10);
            memset(&v43, 0, sizeof(v43));
            CMTimeRangeMakeFromDictionary(&v43, v11);
            *(_OWORD *)&time1.start.value = *(_OWORD *)&v43.start.value;
            time1.start.epoch = v43.start.epoch;
            time2 = v49;
            if ((CMTimeCompare(&time1.start, &time2) & 0x80000000) == 0)
              break;
            v41 = v43;
            memset(&time1, 0, sizeof(time1));
            otherRange = v50;
            CMTimeRangeGetIntersection(&time1, &v41, &otherRange);
            if ((time1.start.flags & 1) == 0
              || (time1.duration.flags & 1) == 0
              || time1.duration.epoch
              || time1.duration.value < 0
              || (duration = time1.duration,
                  v38 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
                  CMTimeCompare(&duration, &v38)))
            {
              -[__CFDictionary objectForKey:](v11, "objectForKey:", CFSTR("flags"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "intValue");
              v14 = v13 & 0x3FFC0;
              v15 = __clz(__rbit32(v13 & 0x2FFC0));
              if (v16 | ((v13 & 0x2FFC0) == 0))
                v17 = 0;
              else
                v17 = v15;
              time = time1.duration;
              Seconds = CMTimeGetSeconds(&time);
              -[__CFDictionary objectForKey:](v7, "objectForKey:", CFSTR("quality"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "floatValue");
              v21 = v20;

              if ((v14 & 0x10000) != 0
                || (v17 - 7 >= 4 ? (v22 = v17 == 12) : (v22 = 1),
                    !v22
                 || ((v23 = Seconds, (float)(v21 + 0.2) < 1.0) ? (v24 = v21 + 0.2) : (v24 = 1.0),
                     (float)(v21 + 0.2) <= 0.0 ? (v25 = 0.0) : (v25 = v24),
                     v6 = v6 + (float)(v23 * v25),
                     v5 = v5 + v23,
                     v4 >= v23)))
              {
                v23 = v4;
              }

              v4 = v23;
            }
            if (v8 == ++v10)
            {
              v8 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
              if (v8)
                goto LABEL_8;
              break;
            }
          }
        }

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v34);
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
  }

  v26 = v5 == 0.0 || v4 < 0.5;
  v27 = v6 / v5;
  if (v26)
    v27 = 0.0;
  v28 = 1.0;
  if (v27 < 1.0)
    v28 = v27;
  if (v27 <= 0.0)
    v29 = 0.0;
  else
    v29 = v28;

  return v29;
}

- (BOOL)hasMeaningfulSceneSegment:(id)a3 withFpsRate:(float)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  const __CFDictionary *v12;
  void *v13;
  float v14;
  float v15;
  Float64 Seconds;
  CMTime duration;
  CMTimeRange v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("metadataRanges"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SceneResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    v10 = a4;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v12 = *(const __CFDictionary **)(*((_QWORD *)&v20 + 1) + 8 * i);
        memset(&v19, 0, sizeof(v19));
        CMTimeRangeMakeFromDictionary(&v19, v12);
        -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("quality"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "floatValue");
        v15 = v14;

        duration = v19.duration;
        Seconds = CMTimeGetSeconds(&duration);
        if (v15 >= 0.3)
        {
          Seconds = Seconds / v10;
          *(float *)&Seconds = Seconds;
          if (*(float *)&Seconds >= 3.0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, Seconds);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  return v8;
}

- (float)assetJunkScoreFromAnalysis:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  uint64_t i;
  const __CFDictionary *v11;
  double Seconds;
  void *v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  CMTime duration;
  CMTimeRange v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("metadataRanges"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("InterestingnessResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v6)
  {

LABEL_13:
    v17 = 1.0;
    goto LABEL_14;
  }
  v7 = *(_QWORD *)v24;
  v8 = 0.0;
  v9 = 0.0;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(v5);
      v11 = *(const __CFDictionary **)(*((_QWORD *)&v23 + 1) + 8 * i);
      memset(&v22, 0, sizeof(v22));
      CMTimeRangeMakeFromDictionary(&v22, v11);
      duration = v22.duration;
      Seconds = CMTimeGetSeconds(&duration);
      -[__CFDictionary objectForKey:](v11, "objectForKey:", CFSTR("quality"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;

      v16 = Seconds;
      v8 = v8 + (float)(v15 * v16);
      v9 = v9 + v16;
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v6);

  if (v9 == 0.0)
    goto LABEL_13;
  v17 = (float)((float)(v8 / v9) * (float)(erff((float)(v9 * 3.0) + -2.0) + 1.0)) * 0.5;
  if (v17 >= *(float *)&-[VCPVideoGlobalAnalyzer assetJunkScoreFromAnalysis:]::kThreshold[4 * (v9 > 2.0)])
    v17 = 1.0;
LABEL_14:
  v18 = 1.0;
  if (v17 < 1.0)
    v18 = v17;
  if (v17 <= 0.0)
    v19 = 0.0;
  else
    v19 = v18;

  return v19;
}

- (float)scaleForTimeRange:(id *)a3 basedOnFace:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  const __CFDictionary *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  NSString *v15;
  double width;
  double height;
  float v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  CMTime v26;
  CMTimeRange v27;
  CMTimeRange v28;
  CMTimeRange v29;
  CMTime time1;
  CMTimeRange v31;
  CMTimeRange v32;
  CMTimeRange v33;
  CMTimeRange v34;
  CMTimeRange v35;
  CMTimeRange v36;
  CMTimeRange v37;
  CMTimeRange v38;
  CMTimeRange v39;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v42;
  CMTimeRange v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;
  NSRect v50;

  v49 = *MEMORY[0x1E0C80C00];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v45;
    v8 = 0.0;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v45 != v7)
          objc_enumerationMutation(v5);
        v10 = *(const __CFDictionary **)(*((_QWORD *)&v44 + 1) + 8 * v9);
        memset(&v43, 0, sizeof(v43));
        CMTimeRangeMakeFromDictionary(&v43, v10);
        range = v43;
        v11 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&otherRange.start.epoch = v11;
        *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v42, &range, &otherRange);
        if ((v42.start.flags & 1) == 0)
          goto LABEL_9;
        v38 = v43;
        v12 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v37.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v37.start.epoch = v12;
        *(_OWORD *)&v37.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v39, &v38, &v37);
        if ((v39.duration.flags & 1) == 0)
          goto LABEL_9;
        v35 = v43;
        v13 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v34.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v34.start.epoch = v13;
        *(_OWORD *)&v34.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v36, &v35, &v34);
        if (v36.duration.epoch)
          goto LABEL_9;
        v32 = v43;
        v19 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v31.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v31.start.epoch = v19;
        *(_OWORD *)&v31.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v33, &v32, &v31);
        if (v33.duration.value < 0)
          goto LABEL_9;
        v28 = v43;
        v20 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&v27.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&v27.start.epoch = v20;
        *(_OWORD *)&v27.duration.timescale = *(_OWORD *)&a3->var1.var1;
        CMTimeRangeGetIntersection(&v29, &v28, &v27);
        time1 = v29.duration;
        v26 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (CMTimeCompare(&time1, &v26))
        {
LABEL_9:
          -[__CFDictionary objectForKey:](v10, "objectForKey:", CFSTR("attributes"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", CFSTR("faceBounds"));
          v15 = (NSString *)objc_claimAutoreleasedReturnValue();
          v50 = NSRectFromString(v15);
          width = v50.size.width;
          height = v50.size.height;

          v18 = width * height;
          if (v8 < v18)
            v8 = width * height;

        }
        ++v9;
      }
      while (v6 != v9);
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      v6 = v21;
    }
    while (v21);

    v22 = 1.0;
    if (v8 > 0.05)
    {
      v23 = 1.0;
      v24 = 1.0 - sqrtf(v8);
      if (v24 < 1.0)
        v23 = v24;
      if (v24 <= 0.0)
        v22 = 0.0;
      else
        v22 = v23;
    }
  }
  else
  {

    v22 = 1.0;
  }

  return v22;
}

- (float)subjectActivityInTimeRange:(id *)a3 fromResults:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  float v13;
  uint64_t i;
  const __CFDictionary *v15;
  __int128 v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float Seconds;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  const __CFDictionary *v26;
  __int128 v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  id v38;
  CMTime v39;
  CMTimeRange v40;
  CMTime v41;
  CMTime duration;
  CMTimeRange v43;
  CMTimeRange v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CMTime time;
  CMTimeRange v50;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v55;
  CMTimeRange v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v38 = a4;
  objc_msgSend(v38, "objectForKey:", CFSTR("FaceResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKey:", CFSTR("FineSubjectMotionResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v59 = 0uLL;
    v60 = 0uLL;
    v57 = 0uLL;
    v58 = 0uLL;
    objc_msgSend(v38, "objectForKey:", CFSTR("FineSubjectMotionResults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v58;
      v12 = 0.0;
      v13 = 0.0;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v58 != v11)
            objc_enumerationMutation(v9);
          v15 = *(const __CFDictionary **)(*((_QWORD *)&v57 + 1) + 8 * i);
          memset(&v56, 0, sizeof(v56));
          CMTimeRangeMakeFromDictionary(&v56, v15);
          v16 = *(_OWORD *)&a3->var0.var3;
          *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
          *(_OWORD *)&range.start.epoch = v16;
          *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
          memset(&v55, 0, sizeof(v55));
          otherRange = v56;
          CMTimeRangeGetIntersection(&v55, &range, &otherRange);
          if ((v55.start.flags & 1) != 0
            && (v55.duration.flags & 1) != 0
            && !v55.duration.epoch
            && (v55.duration.value & 0x8000000000000000) == 0)
          {
            time1 = v55.duration;
            time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
            if (!CMTimeCompare(&time1, &time2))
              continue;
          }
          -[__CFDictionary objectForKey:](v15, "objectForKey:", CFSTR("quality"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          v19 = v18;

          if (objc_msgSend(v6, "count"))
          {
            v50 = v55;
            -[VCPVideoGlobalAnalyzer scaleForTimeRange:basedOnFace:](self, "scaleForTimeRange:basedOnFace:", &v50, v6);
            v21 = v20;
          }
          else
          {
            v21 = 1.0;
          }
          time = v55.duration;
          Seconds = CMTimeGetSeconds(&time);
          v13 = v13 + (float)((float)(v19 * v21) * Seconds);
          v12 = v12 + Seconds;
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v10);
      goto LABEL_40;
    }
LABEL_39:
    v12 = 0.0;
    v13 = 0.0;
    goto LABEL_40;
  }
  v47 = 0uLL;
  v48 = 0uLL;
  v45 = 0uLL;
  v46 = 0uLL;
  objc_msgSend(v38, "objectForKey:", CFSTR("SubjectMotionResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  if (!v23)
    goto LABEL_39;
  v24 = *(_QWORD *)v46;
  v12 = 0.0;
  v13 = 0.0;
  do
  {
    for (j = 0; j != v23; ++j)
    {
      if (*(_QWORD *)v46 != v24)
        objc_enumerationMutation(v9);
      v26 = *(const __CFDictionary **)(*((_QWORD *)&v45 + 1) + 8 * j);
      memset(&v56, 0, sizeof(v56));
      CMTimeRangeMakeFromDictionary(&v56, v26);
      memset(&v55, 0, sizeof(v55));
      v27 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v44.start.value = *(_OWORD *)&a3->var0.var0;
      *(_OWORD *)&v44.start.epoch = v27;
      *(_OWORD *)&v44.duration.timescale = *(_OWORD *)&a3->var1.var1;
      v43 = v56;
      CMTimeRangeGetIntersection(&v55, &v44, &v43);
      if ((v55.start.flags & 1) != 0
        && (v55.duration.flags & 1) != 0
        && !v55.duration.epoch
        && (v55.duration.value & 0x8000000000000000) == 0)
      {
        duration = v55.duration;
        v41 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (!CMTimeCompare(&duration, &v41))
          continue;
      }
      -[__CFDictionary objectForKey:](v26, "objectForKey:", CFSTR("flags"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "unsignedIntegerValue") & 0x20000) != 0)
        v29 = 0.5;
      else
        v29 = 0.0;

      if (objc_msgSend(v6, "count"))
      {
        v40 = v55;
        -[VCPVideoGlobalAnalyzer scaleForTimeRange:basedOnFace:](self, "scaleForTimeRange:basedOnFace:", &v40, v6);
        v31 = v30;
      }
      else
      {
        v31 = 1.0;
      }
      v39 = v55.duration;
      v32 = CMTimeGetSeconds(&v39);
      v13 = v13 + (float)((float)(v29 * v31) * v32);
      v12 = v12 + v32;
    }
    v23 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v61, 16);
  }
  while (v23);
LABEL_40:

  if (v12 == 0.0)
    v33 = 1.0;
  else
    v33 = v12;
  v34 = 1.0 - expf((float)((float)(v13 / v33) * (float)(v13 / v33)) / -0.15);
  if (v34 < 1.0)
    v35 = v34;
  else
    v35 = 1.0;
  if (v34 <= 0.0)
    v36 = 0.0;
  else
    v36 = v35;

  return v36;
}

- (float)cameraActivityfromQuality:(float)a3
{
  float v3;
  float v4;
  BOOL v5;
  float result;

  v3 = (float)(a3 + -1.0) * -1.25;
  v4 = 1.0;
  if (v3 < 1.0)
    v4 = v3;
  v5 = v3 > 0.0;
  result = 0.0;
  if (v5)
    return v4;
  return result;
}

- (BOOL)isJunkTimeRange:(id *)a3 basedOnResults:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  CMTime *v9;
  uint64_t i;
  const __CFDictionary *v11;
  __int128 v12;
  double v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1;
  CMTime time;
  CMTime time2;
  CMTime time1;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v21;
  CMTimeRange v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a4, "objectForKey:", CFSTR("InterestingnessResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    v8 = 0.0;
    v9 = (CMTime *)MEMORY[0x1E0CA2E68];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v11 = *(const __CFDictionary **)(*((_QWORD *)&v23 + 1) + 8 * i);
        memset(&v22, 0, sizeof(v22));
        CMTimeRangeMakeFromDictionary(&v22, v11);
        v12 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.epoch = v12;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
        memset(&v21, 0, sizeof(v21));
        otherRange = v22;
        CMTimeRangeGetIntersection(&v21, &range, &otherRange);
        if ((v21.start.flags & 1) != 0
          && (v21.duration.flags & 1) != 0
          && !v21.duration.epoch
          && (v21.duration.value & 0x8000000000000000) == 0)
        {
          time1 = v21.duration;
          time2 = *v9;
          if (!CMTimeCompare(&time1, &time2))
            continue;
        }
        -[__CFDictionary vcp_quality](v11, "vcp_quality");
        if (v13 < 0.342999995)
        {
          time = v21.duration;
          v8 = CMTimeGetSeconds(&time) + v8;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
  }

  var1 = a3->var1;
  return v8 / CMTimeGetSeconds((CMTime *)&var1) > 0.300000012;
}

- (float)assetActivityLevelFromAnalysisResults:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CMTime *v8;
  float v9;
  float v10;
  uint64_t i;
  const __CFDictionary *v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v17;
  float v18;
  float v19;
  double Seconds;
  float v21;
  float v22;
  BOOL v23;
  float v24;
  float v25;
  float v26;
  float v27;
  CMTime duration;
  CMTimeRange v30;
  CMTimeRange v31;
  CMTime time2;
  CMTime time1;
  CMTimeRange v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v4, "objectForKey:", CFSTR("QualityResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v6)
  {

LABEL_28:
    v27 = 0.0;
    goto LABEL_29;
  }
  v7 = *(_QWORD *)v36;
  v8 = (CMTime *)MEMORY[0x1E0CA2E68];
  v9 = 0.0;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v36 != v7)
        objc_enumerationMutation(v5);
      v12 = *(const __CFDictionary **)(*((_QWORD *)&v35 + 1) + 8 * i);
      memset(&v34, 0, sizeof(v34));
      CMTimeRangeMakeFromDictionary(&v34, v12);
      -[__CFDictionary vcp_quality](v12, "vcp_quality");
      v14 = v13;
      if ((v34.start.flags & 1) != 0
        && (v34.duration.flags & 1) != 0
        && !v34.duration.epoch
        && (v34.duration.value & 0x8000000000000000) == 0)
      {
        time1 = v34.duration;
        time2 = *v8;
        if (!CMTimeCompare(&time1, &time2))
          continue;
      }
      if (v14 >= 0.200000003)
      {
        v31 = v34;
        if (!-[VCPVideoGlobalAnalyzer isJunkTimeRange:basedOnResults:](self, "isJunkTimeRange:basedOnResults:", &v31, v4))
        {
          v30 = v34;
          -[VCPVideoGlobalAnalyzer subjectActivityInTimeRange:fromResults:](self, "subjectActivityInTimeRange:fromResults:", &v30, v4);
          v16 = v15;
          *(float *)&v17 = v14;
          -[VCPVideoGlobalAnalyzer cameraActivityfromQuality:](self, "cameraActivityfromQuality:", v17);
          v19 = v18;
          duration = v34.duration;
          Seconds = CMTimeGetSeconds(&duration);
          v21 = (float)(v19 * 0.4) + (float)(v16 * 0.6);
          if (v21 < 1.0)
            v22 = (float)(v19 * 0.4) + (float)(v16 * 0.6);
          else
            v22 = 1.0;
          v23 = v21 > 0.0;
          v24 = 0.0;
          if (v23)
            v24 = v22;
          v25 = Seconds;
          v9 = v9 + (float)(v24 * v25);
          v10 = v10 + v25;
        }
      }
    }
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  }
  while (v6);

  if (v10 == 0.0)
    goto LABEL_28;
  v26 = 1.0;
  if ((float)(v9 / v10) < 1.0)
    v26 = v9 / v10;
  if ((float)(v9 / v10) <= 0.0)
    v27 = 0.0;
  else
    v27 = v26;
LABEL_29:

  return v27;
}

- (int)setActivityLevel:(id)a3
{
  id v4;
  __CFArray *v5;
  void *v6;
  int v7;
  float v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t i;
  const __CFDictionary *v16;
  double v17;
  double v18;
  Float64 Seconds;
  CMTime v21;
  CMTime time;
  CMTimeRange lhs;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTimeRange range;
  CMTime v29;
  CMTime duration;
  CMTime start;
  CMTimeRange v32;
  CMTimeRange v33;
  CMTimeRange v34;
  float v35;
  CMTime rhs;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (__CFArray *)objc_claimAutoreleasedReturnValue();
  v35 = 0.0;
  if ((int)SocType() >= 247)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ActivityLevelResults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v7 = 0;
LABEL_17:

      goto LABEL_20;
    }
    memset(&v34, 0, sizeof(v34));
    objc_msgSend(v6, "firstObject");
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&v34, v9);

    memset(&v33, 0, sizeof(v33));
    objc_msgSend(v6, "lastObject");
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeRangeMakeFromDictionary(&v33, v10);

    memset(&v32, 0, sizeof(v32));
    start = v34.start;
    range = v33;
    CMTimeRangeGetEnd(&v29, &range);
    lhs.start = v29;
    rhs = v34.start;
    CMTimeSubtract(&duration, &lhs.start, &rhs);
    CMTimeRangeMake(&v32, &start, &duration);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v25;
      v14 = 0.0;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v11);
          v16 = *(const __CFDictionary **)(*((_QWORD *)&v24 + 1) + 8 * i);
          memset(&lhs, 0, sizeof(lhs));
          CMTimeRangeMakeFromDictionary(&lhs, v16);
          -[__CFDictionary vcp_quality](v16, "vcp_quality");
          v18 = v17;
          time = lhs.duration;
          Seconds = CMTimeGetSeconds(&time);
          *(float *)&Seconds = v35 + v18 * Seconds;
          v35 = *(float *)&Seconds;
          v21 = lhs.duration;
          v14 = CMTimeGetSeconds(&v21) + v14;
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
      }
      while (v12);

      if (v14 != 0.0)
        v35 = v35 / v14;
    }
    else
    {

    }
    v7 = AddResultDictionary(&v32.start, &v32.duration, &v35, 0, 0, v5);
    if (v7)
      goto LABEL_17;

LABEL_19:
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("ActivityLevelResults"));
    v7 = 0;
    goto LABEL_20;
  }
  -[VCPVideoGlobalAnalyzer assetActivityLevelFromAnalysisResults:](self, "assetActivityLevelFromAnalysisResults:", v4);
  v35 = v8;
  v7 = AddResultDictionary(0, 0, &v35, 0, 0, v5);
  if (!v7)
    goto LABEL_19;
LABEL_20:

  return v7;
}

@end
