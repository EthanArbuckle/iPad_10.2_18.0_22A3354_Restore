@implementation VCPTrimAnalyzer

- (VCPTrimAnalyzer)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  VCPActionAnalyzer *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  VCPSegment *v12;
  void *v13;
  char *v14;
  __int128 v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VCPTrimAnalyzer;
  v2 = -[VCPTrimAnalyzer init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    v5 = objc_alloc_init(VCPActionAnalyzer);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = MEMORY[0x1E0CA2E40];
    v8 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)(v2 + 24) = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)(v2 + 40) = v8;
    *(_OWORD *)(v2 + 56) = *(_OWORD *)(v7 + 32);
    v2[76] = 0;
    v9 = MEMORY[0x1E0CA2E68];
    *((_OWORD *)v2 + 5) = *MEMORY[0x1E0CA2E68];
    *((_QWORD *)v2 + 12) = *(_QWORD *)(v9 + 16);
    v10 = MEMORY[0x1E0CA2E18];
    v16 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v2 + 104) = *MEMORY[0x1E0CA2E18];
    v11 = *(_QWORD *)(v10 + 16);
    *((_QWORD *)v2 + 15) = v11;
    v2[128] = 1;
    v12 = objc_alloc_init(VCPSegment);
    v13 = (void *)*((_QWORD *)v2 + 17);
    *((_QWORD *)v2 + 17) = v12;

    *((_OWORD *)v2 + 9) = v16;
    *((_QWORD *)v2 + 20) = v11;
    v2[168] = 0;
    v14 = v2;
  }

  return (VCPTrimAnalyzer *)v2;
}

- (int)analyzeFrameWithTimeRange:(id *)a3 analysisData:(id)a4
{
  void *v6;
  float v7;
  float v8;
  VCPActionAnalyzer *actionAnalyzer;
  __int128 v10;
  __int128 v11;
  Float64 Seconds;
  _BYTE time[32];
  __int128 v15;

  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("subjectMotionScore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  actionAnalyzer = self->_actionAnalyzer;
  v10 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)time = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&time[16] = v10;
  v15 = *(_OWORD *)&a3->var1.var1;
  -[VCPActionAnalyzer analyzeFrameWithTimeRange:andActionScore:](actionAnalyzer, "analyzeFrameWithTimeRange:andActionScore:", time, COERCE_DOUBLE(__PAIR64__(DWORD1(v15), LODWORD(v8))));
  if (self->_firstFrame)
  {
    v11 = *(_OWORD *)&a3->var0.var0;
    self->_inTrimStart.epoch = a3->var0.var3;
    *(_OWORD *)&self->_inTrimStart.value = v11;
    self->_firstFrame = 0;
  }
  if (self->_verbose)
  {
    *(_OWORD *)time = *(_OWORD *)&a3->var0.var0;
    *(_QWORD *)&time[16] = a3->var0.var3;
    Seconds = CMTimeGetSeconds((CMTime *)time);
    printf("Received action score %f - %f\n", Seconds, v8);
  }
  self->_ready = 1;
  return 0;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)updateCurationThreshold
{
  unint64_t v3;
  float v4;
  void *v5;
  float v6;
  float v7;
  float curationThreshold;

  self->_curationThreshold = 0.2;
  if (-[NSMutableArray count](self->_internalResults, "count"))
  {
    v3 = 0;
    v4 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "curationScore");
      if (v6 > v4)
      {
        objc_msgSend(v5, "curationScore");
        v4 = v7;
      }

      ++v3;
    }
    while (-[NSMutableArray count](self->_internalResults, "count") > v3);
  }
  else
  {
    v4 = 0.0;
  }
  curationThreshold = self->_curationThreshold;
  if (v4 > curationThreshold)
    self->_curationThreshold = (float)(v4 + curationThreshold) * 0.5;
}

- (BOOL)isCurated:(float)a3
{
  return self->_curationThreshold < a3;
}

- (int)finalizeWithDestructiveTrimStart:(id *)a3 trimEnd:(id *)a4 andCaptureTime:(id *)a5
{
  double Seconds;
  Float64 v10;
  VCPActionAnalyzer *actionAnalyzer;
  __int128 v13;
  int64_t var3;
  CMTime time;

  if (self->_verbose)
  {
    time = *(CMTime *)a3;
    Seconds = CMTimeGetSeconds(&time);
    time = (CMTime)*a4;
    v10 = CMTimeGetSeconds(&time);
    printf("Destructive Trim Range: [%.2f - %.2f]\n", Seconds, v10);
  }
  actionAnalyzer = self->_actionAnalyzer;
  time = (CMTime)*a3;
  v13 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  -[VCPActionAnalyzer finalizeWithDestructiveTrimStart:trimEnd:](actionAnalyzer, "finalizeWithDestructiveTrimStart:trimEnd:", &time, &v13);
  -[VCPTrimAnalyzer generateCurationSegment](self, "generateCurationSegment");
  time = (CMTime)*a5;
  -[VCPTrimAnalyzer generateInterestingTrimBasedOnCaptureTime:](self, "generateInterestingTrimBasedOnCaptureTime:", &time);
  return 0;
}

- (void)printSegments:(id)a3
{
  if (self->_verbose)
  {
    printf("=========%s==========\n", (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_internalResults, "enumerateObjectsUsingBlock:", &__block_literal_global_90);
  }
}

void __33__VCPTrimAnalyzer_printSegments___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double Seconds;
  double v5;
  float v6;
  CMTimeRange range;
  CMTime v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  CMTime time;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "timeRange");
    *(_OWORD *)&time.value = v9;
    time.epoch = v10;
    Seconds = CMTimeGetSeconds(&time);
    objc_msgSend(v3, "timeRange");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
    memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    memset(&range, 0, sizeof(range));
  }
  CMTimeRangeGetEnd(&v8, &range);
  v5 = CMTimeGetSeconds(&v8);
  objc_msgSend(v3, "score");
  printf("[%.2f - %.2f]: %.2f\n", Seconds, v5, v6);

}

- (void)generateCurationSegment
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  VCPSegment *v9;
  VCPSegment *activeSegment;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->_internalResults, "removeAllObjects");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[VCPActionAnalyzer segments](self->_actionAnalyzer, "segments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_alloc_init(VCPSegment);
        -[VCPSegment copyFrom:](v9, "copyFrom:", v8);
        objc_msgSend(v8, "score");
        -[VCPSegment setCurationScore:](v9, "setCurationScore:");
        -[NSMutableArray addObject:](self->_internalResults, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  activeSegment = self->_activeSegment;
  -[VCPActionAnalyzer activeSegment](self->_actionAnalyzer, "activeSegment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPSegment copyFrom:](activeSegment, "copyFrom:", v11);

  -[VCPSegment score](self->_activeSegment, "score");
  -[VCPSegment setCurationScore:](self->_activeSegment, "setCurationScore:");
  -[VCPTrimAnalyzer updateCurationThreshold](self, "updateCurationThreshold");
}

- (int)generateInterestingTrimBasedOnCaptureTime:(id *)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  VCPSegment *v11;
  Float64 Seconds;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  Float64 v18;
  uint64_t v19;
  float v20;
  unint64_t v21;
  float v22;
  float v23;
  double v24;
  int v25;
  double v26;
  double v27;
  Float64 v28;
  double v29;
  Float64 v30;
  $3C33A24319B208EC3024E724BAC5FA63 *p_bestTrimTimeRange;
  __int128 v32;
  __int128 v33;
  Float64 v34;
  __int128 v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CMTime v40;
  CMTime v41;
  CMTimeRange v42;
  CMTime v43;
  CMTimeRange end;
  CMTimeRange time;
  CMTimeRange v46;
  CMTime v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CMTime v51;
  CMTimeRange v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CMTime start;
  CMTimeRange v57;
  CMTimeRange v58;
  CMTimeRange range;

  v5 = 0;
  do
  {
    v6 = v5;
    if (-[NSMutableArray count](self->_internalResults, "count") <= v5)
      break;
    -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "timeRange");
    else
      memset(&range, 0, sizeof(range));
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    v9 = CMTimeRangeContainsTime(&range, &time.start);
    ++v5;

  }
  while (!v9);
  v10 = -[NSMutableArray count](self->_internalResults, "count");
  if (v10 == v6)
  {
    v11 = objc_alloc_init(VCPSegment);
    -[VCPSegment copyFrom:](v11, "copyFrom:", self->_activeSegment);
    if (v11)
      -[VCPSegment timeRange](v11, "timeRange");
    else
      memset(&v58, 0, sizeof(v58));
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    if (!CMTimeRangeContainsTime(&v58, &time.start))
    {
      memset(&time, 0, 24);
      *(_OWORD *)&end.start.value = *(_OWORD *)&a3->var0;
      end.start.epoch = a3->var3;
      Seconds = CMTimeGetSeconds(&end.start);
      CMTimeMakeWithSeconds(&time.start, Seconds + 0.300000012, a3->var1);
      if (v11)
      {
        -[VCPSegment timeRange](v11, "timeRange");
      }
      else
      {
        v54 = 0u;
        v55 = 0u;
        v53 = 0u;
      }
      *(_OWORD *)&start.value = v53;
      start.epoch = v54;
      *(_OWORD *)&end.start.value = *(_OWORD *)&time.start.value;
      end.start.epoch = time.start.epoch;
      CMTimeRangeFromTimeToTime(&v57, &start, &end.start);
      v52 = v57;
      -[VCPSegment setTimeRange:](v11, "setTimeRange:", &v52);
    }
    -[NSMutableArray addObject:](self->_internalResults, "addObject:", v11);

  }
  if (self->_verbose)
  {
    printf("capturePointSegmentIdx: %d\n", v6);
    -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "timeRange");
    }
    else
    {
      v49 = 0u;
      v50 = 0u;
      v48 = 0u;
    }
    *(_OWORD *)&v51.value = v48;
    v51.epoch = v49;
    v15 = CMTimeGetSeconds(&v51);
    -[NSMutableArray lastObject](self->_internalResults, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "timeRange");
    else
      memset(&v46, 0, sizeof(v46));
    CMTimeRangeGetEnd(&v47, &v46);
    v18 = CMTimeGetSeconds(&v47);
    printf("----[%.2f - %.2f]\n", v15, v18);

  }
  v19 = 0;
  v38 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v39 = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&time.start.value = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)&time.start.epoch = v38;
  v37 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  *(_OWORD *)&time.duration.timescale = v37;
  v20 = -1.0;
  do
  {
    if ((int)v6 < (int)-[NSMutableArray count](self->_internalResults, "count"))
    {
      v21 = v6;
      do
      {
        *(_OWORD *)&end.start.value = v39;
        *(_OWORD *)&end.start.epoch = v38;
        *(_OWORD *)&end.duration.timescale = v37;
        *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0;
        v42.start.epoch = a3->var3;
        -[VCPTrimAnalyzer calculateCandidateScoreWithRangeAdjust:endIdx:candidateTimeRange:captureTime:](self, "calculateCandidateScoreWithRangeAdjust:endIdx:candidateTimeRange:captureTime:", v19, v21, &end, &v42);
        v23 = v22;
        if (v22 > v20)
        {
          *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0;
          v42.start.epoch = a3->var3;
          v24 = CMTimeGetSeconds(&v42.start);
          *(_OWORD *)&v42.start.value = *(_OWORD *)&end.start.value;
          v42.start.epoch = end.start.epoch;
          if (v24 - CMTimeGetSeconds(&v42.start) >= 1.5)
          {
            time = end;
            v20 = v23;
          }
        }
        if (self->_verbose)
        {
          v25 = -[NSMutableArray count](self->_internalResults, "count");
          *(_OWORD *)&v42.start.value = *(_OWORD *)&end.start.value;
          v42.start.epoch = end.start.epoch;
          v26 = CMTimeGetSeconds(&v42.start);
          v42 = end;
          CMTimeRangeGetEnd(&v43, &v42);
          v27 = CMTimeGetSeconds(&v43);
          *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0;
          v42.start.epoch = a3->var3;
          v28 = CMTimeGetSeconds(&v42.start);
          printf("startIdx = %d, endIdx = %d, count = %d, [%f, %f] with score %f captureTime=%f\n", v19, v21, v25, v26, v27, v23, v28);
        }
        v21 = (v21 + 1);
      }
      while ((int)v21 < (int)-[NSMutableArray count](self->_internalResults, "count"));
    }
    v19 = (v19 + 1);
  }
  while ((_DWORD)v6 + 1 != (_DWORD)v19);
  if (self->_verbose)
  {
    *(_OWORD *)&end.start.value = *(_OWORD *)&time.start.value;
    end.start.epoch = time.start.epoch;
    v29 = CMTimeGetSeconds(&end.start);
    end = time;
    CMTimeRangeGetEnd(&v41, &end);
    v30 = CMTimeGetSeconds(&v41);
    printf("interesting trim: [%f, %f], score = %.2f\n", v29, v30, v20);
  }
  p_bestTrimTimeRange = &self->_bestTrimTimeRange;
  if (v20 <= 0.05)
  {
    *(_OWORD *)&end.start.value = *(_OWORD *)&a3->var0;
    end.start.epoch = a3->var3;
    v34 = CMTimeGetSeconds(&end.start);
    CMTimeMakeWithSeconds(&v40, v34 + -1.5, a3->var1);
    *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0;
    v42.start.epoch = a3->var3;
    CMTimeRangeFromTimeToTime(&end, &v40, &v42.start);
    v35 = *(_OWORD *)&end.start.epoch;
    *(_OWORD *)&p_bestTrimTimeRange->start.value = *(_OWORD *)&end.start.value;
    *(_OWORD *)&self->_bestTrimTimeRange.start.epoch = v35;
    v33 = *(_OWORD *)&end.duration.timescale;
  }
  else
  {
    v32 = *(_OWORD *)&time.start.epoch;
    *(_OWORD *)&p_bestTrimTimeRange->start.value = *(_OWORD *)&time.start.value;
    *(_OWORD *)&self->_bestTrimTimeRange.start.epoch = v32;
    v33 = *(_OWORD *)&time.duration.timescale;
  }
  *(_OWORD *)&self->_bestTrimTimeRange.duration.timescale = v33;
  if (v10 == v6)
    -[NSMutableArray removeLastObject](self->_internalResults, "removeLastObject");
  return 0;
}

- (int)prepareTrimmingWithTrimStart:(id *)a3 andTrimEnd:(id *)a4
{
  NSMutableArray *internalResults;
  unint64_t i;
  NSMutableArray *v9;
  unint64_t v10;
  void *v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  double Seconds;
  void *v17;
  void *v18;
  Float64 v19;
  CMTimeRange range;
  CMTime v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CMTime time;
  __int128 v27;
  int64_t var3;
  _QWORD v29[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v30;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v35 = -[NSMutableArray count](self->_internalResults, "count") - 1;
  internalResults = self->_internalResults;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __59__VCPTrimAnalyzer_prepareTrimmingWithTrimStart_andTrimEnd___block_invoke;
  v29[3] = &unk_1E6B1B168;
  v30 = *a3;
  v31 = *a4;
  v29[4] = &v36;
  v29[5] = &v32;
  -[NSMutableArray enumerateObjectsUsingBlock:](internalResults, "enumerateObjectsUsingBlock:", v29);
  for (i = (int)-[NSMutableArray count](self->_internalResults, "count") - 1; ; i = v10)
  {
    v9 = self->_internalResults;
    if (v33[3] >= i)
      break;
    v10 = i - 1;
    -[NSMutableArray removeObjectAtIndex:](v9, "removeObjectAtIndex:");
  }
  -[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  objc_msgSend(v11, "trimSegment:fromStart:", &v27, 0);

  for (j = *((unsigned int *)v37 + 6);
        (int)j >= 1;
        -[NSMutableArray removeObjectAtIndex:](self->_internalResults, "removeObjectAtIndex:", j))
  {
    --j;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  objc_msgSend(v13, "trimSegment:fromStart:", &v27, 1);

  if (self->_verbose)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "timeRange");
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
    }
    *(_OWORD *)&time.value = v23;
    time.epoch = v24;
    Seconds = CMTimeGetSeconds(&time);
    -[NSMutableArray lastObject](self->_internalResults, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "timeRange");
    else
      memset(&range, 0, sizeof(range));
    CMTimeRangeGetEnd(&v22, &range);
    v19 = CMTimeGetSeconds(&v22);
    printf(" --[%.2f - %.2f]\n", Seconds, v19);

  }
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  return 0;
}

void __59__VCPTrimAnalyzer_prepareTrimmingWithTrimStart_andTrimEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  CMTimeRange v7;
  CMTime time;
  CMTimeRange range;

  v5 = a2;
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  time = *(CMTime *)(a1 + 48);
  if (CMTimeRangeContainsTime(&range, &time))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  if (v6)
    objc_msgSend(v6, "timeRange");
  else
    memset(&v7, 0, sizeof(v7));
  time = *(CMTime *)(a1 + 72);
  if (CMTimeRangeContainsTime(&v7, &time))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

- (float)calculateCandidateScoreWithRangeAdjust:(int)a3 endIdx:(int)a4 candidateTimeRange:(id *)a5 captureTime:(id *)a6
{
  uint64_t v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  double Seconds;
  float v16;
  float v17;
  float v18;
  float v19;
  double v20;
  double v21;
  float v22;
  double v23;
  float v24;
  float v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  float v29;
  float v30;
  double v31;
  float v32;
  float v33;
  double v34;
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  double v40;
  float v41;
  double v42;
  float v43;
  float v44;
  float v45;
  float v46;
  __int128 v47;
  float v49;
  double v50;
  double v51;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v52;
  uint64_t v53;
  CMTime end;
  CMTime start;
  CMTimeRange v57;
  CMTimeRange v58;
  CMTime v59;
  CMTimeRange v60;
  CMTime v61;
  __int128 v62;
  _OWORD v63[2];
  CMTime v64;
  __int128 v65;
  _OWORD v66[2];
  CMTime v67;
  __int128 v68;
  _OWORD v69[2];
  CMTime v70;
  __int128 v71;
  _OWORD v72[2];
  CMTime v73;
  CMTimeRange v74;
  CMTimeRange v75;
  CMTimeRange v76;
  CMTime v77;
  __int128 v78;
  _OWORD v79[2];
  CMTime v80;
  CMTimeRange range;
  CMTime v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  CMTime v86;
  __int128 v87;
  _OWORD v88[2];
  CMTime time;

  v10 = a3;
  -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "curationScore");
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v11, "timeRange");
  }
  else
  {
    memset(v88, 0, sizeof(v88));
    v87 = 0u;
  }
  v14 = v13;
  time = *(CMTime *)((char *)v88 + 8);
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(v11, "curationScore");
  v17 = v16;
  objc_msgSend(v11, "curationScore");
  v19 = v18;
  if (v11)
  {
    objc_msgSend(v11, "timeRange");
  }
  else
  {
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
  }
  v20 = Seconds * v14;
  *(_OWORD *)&v86.value = v83;
  v86.epoch = v84;
  v21 = CMTimeGetSeconds(&v86);
  if (v11)
    objc_msgSend(v11, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  v52 = a6;
  v22 = v21;
  CMTimeRangeGetEnd(&v82, &range);
  v23 = CMTimeGetSeconds(&v82);
  v24 = v23;
  v25 = v20;
  if (a3 < a4)
  {
    v26 = v10;
    do
    {
      v27 = v11;
      v28 = v26 + 1;
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v26 + 1, v52);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "curationScore");
      v30 = v29;
      if (v11)
      {
        objc_msgSend(v11, "timeRange");
      }
      else
      {
        memset(v79, 0, sizeof(v79));
        v78 = 0u;
      }
      v80 = *(CMTime *)((char *)v79 + 8);
      v31 = CMTimeGetSeconds(&v80);
      if (a4 - 1 == v26)
      {
        if (v11)
          objc_msgSend(v11, "timeRange");
        else
          memset(&v76, 0, sizeof(v76));
        CMTimeRangeGetEnd(&v77, &v76);
        v24 = CMTimeGetSeconds(&v77);
        objc_msgSend(v11, "curationScore");
        v19 = v32;
      }
      v23 = v25 + v30 * v31;
      v25 = v23;
      ++v26;
    }
    while (a4 != v28);
  }
  v33 = v24 - v22;
  if ((float)(v24 - v22) <= 1.5
    || (*(float *)&v23 = v17, -[VCPTrimAnalyzer isCurated:](self, "isCurated:", v23))
    && (*(float *)&v34 = v19, -[VCPTrimAnalyzer isCurated:](self, "isCurated:", v34)))
  {
    v35 = a5;
    goto LABEL_63;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v10, v52);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", a4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    objc_msgSend(v36, "timeRange");
  else
    memset(&v75, 0, sizeof(v75));
  *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
  v57.start.epoch = *(_QWORD *)(v53 + 16);
  v38 = CMTimeRangeContainsTime(&v75, &v57.start);
  if (v37)
    objc_msgSend(v37, "timeRange");
  else
    memset(&v74, 0, sizeof(v74));
  *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
  v57.start.epoch = *(_QWORD *)(v53 + 16);
  v39 = CMTimeRangeContainsTime(&v74, &v57.start);
  if (!v39)
  {
    *(float *)&v40 = v19;
    if (!-[VCPTrimAnalyzer isCurated:](self, "isCurated:", v40))
    {
      v41 = v33 + -1.5;
      if (v37)
      {
        objc_msgSend(v37, "timeRange");
      }
      else
      {
        memset(v72, 0, sizeof(v72));
        v71 = 0u;
      }
      v73 = *(CMTime *)((char *)v72 + 8);
      v40 = CMTimeGetSeconds(&v73);
      if (v40 < v41)
      {
        if (v37)
        {
          objc_msgSend(v37, "timeRange");
        }
        else
        {
          memset(v69, 0, sizeof(v69));
          v68 = 0u;
        }
        v70 = *(CMTime *)((char *)v69 + 8);
        v40 = CMTimeGetSeconds(&v70);
        v41 = v40;
      }
      v24 = v24 - v41;
      v25 = v25 - (float)(v41 * v19);
    }
  }
  if (v38)
  {
    if ((float)(v24 - v22) <= 1.5)
      goto LABEL_61;
    *(float *)&v40 = v17;
    if (!-[VCPTrimAnalyzer isCurated:](self, "isCurated:", v40))
    {
      v43 = (float)(v24 - v22) + -1.5;
      *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
      v57.start.epoch = *(_QWORD *)(v53 + 16);
      v42 = CMTimeGetSeconds(&v57.start) - v22;
      if (v42 <= v43)
      {
        *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
        v57.start.epoch = *(_QWORD *)(v53 + 16);
        v42 = CMTimeGetSeconds(&v57.start) - v22;
        v43 = v42;
      }
      v22 = v43 + v22;
      v25 = v25 - (float)(v43 * v17);
    }
  }
  else
  {
    *(float *)&v40 = v17;
    if (!-[VCPTrimAnalyzer isCurated:](self, "isCurated:", v40))
    {
      v44 = (float)(v24 - v22) + -1.5;
      if (v36)
      {
        objc_msgSend(v36, "timeRange");
      }
      else
      {
        memset(v66, 0, sizeof(v66));
        v65 = 0u;
      }
      v67 = *(CMTime *)((char *)v66 + 8);
      v42 = CMTimeGetSeconds(&v67);
      if (v42 < v44)
      {
        if (v36)
        {
          objc_msgSend(v36, "timeRange");
        }
        else
        {
          memset(v63, 0, sizeof(v63));
          v62 = 0u;
        }
        v64 = *(CMTime *)((char *)v63 + 8);
        v42 = CMTimeGetSeconds(&v64);
        v44 = v42;
      }
      v22 = v44 + v22;
      v25 = v25 - (float)(v44 * v17);
    }
    if ((float)(v24 - v22) <= 1.5)
      goto LABEL_61;
  }
  if (v39)
  {
    *(float *)&v42 = v19;
    if (!-[VCPTrimAnalyzer isCurated:](self, "isCurated:", v42))
    {
      v49 = (float)(v24 - v22) + -1.5;
      if (v37)
        objc_msgSend(v37, "timeRange");
      else
        memset(&v60, 0, sizeof(v60));
      v35 = a5;
      CMTimeRangeGetEnd(&v61, &v60);
      v50 = CMTimeGetSeconds(&v61);
      *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
      v57.start.epoch = *(_QWORD *)(v53 + 16);
      if (v50 - CMTimeGetSeconds(&v57.start) <= v49)
      {
        if (v37)
          objc_msgSend(v37, "timeRange");
        else
          memset(&v58, 0, sizeof(v58));
        CMTimeRangeGetEnd(&v59, &v58);
        v51 = CMTimeGetSeconds(&v59);
        *(_OWORD *)&v57.start.value = *(_OWORD *)v53;
        v57.start.epoch = *(_QWORD *)(v53 + 16);
        v49 = v51 - CMTimeGetSeconds(&v57.start);
      }
      v24 = v24 - v49;
      v25 = v25 - (float)(v49 * v19);
      goto LABEL_62;
    }
  }
LABEL_61:
  v35 = a5;
LABEL_62:

  v33 = v24 - v22;
LABEL_63:
  if (v33 == 0.0)
    v45 = 0.0;
  else
    v45 = v25 / v33;
  v46 = v45
      * expf((float)-(float)((float)(v33 + -1.5) * (float)(v33 + -1.5))/ calculateCandidateScoreWithRangeAdjust_endIdx_candidateTimeRange_captureTime__kDurationSigma[(float)(v33 + -1.5) > 0.0]);
  CMTimeMakeWithSeconds(&start, v22, 600);
  CMTimeMakeWithSeconds(&end, v24, 600);
  CMTimeRangeFromTimeToTime(&v57, &start, &end);
  v47 = *(_OWORD *)&v57.start.epoch;
  *(_OWORD *)&v35->var0.var0 = *(_OWORD *)&v57.start.value;
  *(_OWORD *)&v35->var0.var3 = v47;
  *(_OWORD *)&v35->var1.var1 = *(_OWORD *)&v57.duration.timescale;

  return v46;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)bestTrimTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (BOOL)shouldCutAt:(id *)a3 stillPTS:(id *)a4 withCut:(BOOL)a5
{
  double Seconds;
  __int128 v9;
  $95D729B680665BEAEFA1D6FCA8238556 *p_captureTime;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  double v15;
  VCPActionAnalyzer *actionAnalyzer;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int64_t var3;
  CMTimeRange time;
  CMTime time2;

  if (a5)
  {
    time.start = (CMTime)*a3;
    Seconds = CMTimeGetSeconds(&time.start);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    if (Seconds <= CMTimeGetSeconds(&time.start))
    {
      v9 = *(_OWORD *)&a3->var0;
      self->_inTrimStart.epoch = a3->var3;
      *(_OWORD *)&self->_inTrimStart.value = v9;
    }
    return 1;
  }
  else
  {
    p_captureTime = &self->_captureTime;
    if ((self->_captureTime.flags & 1) == 0
      || (*(_OWORD *)&time.start.value = *(_OWORD *)&p_captureTime->value,
          time.start.epoch = self->_captureTime.epoch,
          time2 = *(CMTime *)a4,
          CMTimeCompare(&time.start, &time2)))
    {
      v12 = *(_OWORD *)&a4->var0;
      self->_captureTime.epoch = a4->var3;
      *(_OWORD *)&p_captureTime->value = v12;
      v13 = MEMORY[0x1E0CA2E40];
      v14 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)&self->_bestTrimTimeRange.start.value = *MEMORY[0x1E0CA2E40];
      *(_OWORD *)&self->_bestTrimTimeRange.start.epoch = v14;
      *(_OWORD *)&self->_bestTrimTimeRange.duration.timescale = *(_OWORD *)(v13 + 32);
    }
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    v15 = CMTimeGetSeconds(&time.start);
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    if (v15 >= CMTimeGetSeconds(&time.start)
      || (self->_bestTrimTimeRange.start.flags & 1) == 0
      || (self->_bestTrimTimeRange.duration.flags & 1) == 0
      || self->_bestTrimTimeRange.duration.epoch
      || self->_bestTrimTimeRange.duration.value < 0)
    {
      if (-[NSMutableArray count](self->_internalResults, "count")
        && (*(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0,
            time.start.epoch = a3->var3,
            -[VCPTrimAnalyzer isTimestampSkipable:](self, "isTimestampSkipable:", &time)))
      {
        return 0;
      }
      else
      {
        actionAnalyzer = self->_actionAnalyzer;
        v19 = *(_OWORD *)&a4->var0;
        var3 = a4->var3;
        *(_OWORD *)&time.start.value = *(_OWORD *)&self->_inTrimStart.value;
        time.start.epoch = self->_inTrimStart.epoch;
        -[VCPActionAnalyzer postProcessSegmentsWithCaptureTime:trimStart:](actionAnalyzer, "postProcessSegmentsWithCaptureTime:trimStart:", &v19, &time);
        -[VCPTrimAnalyzer generateCurationSegment](self, "generateCurationSegment");
        *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
        time.start.epoch = a3->var3;
        time2 = (CMTime)*a4;
        return -[VCPTrimAnalyzer checkTrimAt:captureTime:](self, "checkTrimAt:captureTime:", &time, &time2);
      }
    }
    else
    {
      v17 = *(_OWORD *)&self->_bestTrimTimeRange.start.epoch;
      *(_OWORD *)&time.start.value = *(_OWORD *)&self->_bestTrimTimeRange.start.value;
      *(_OWORD *)&time.start.epoch = v17;
      v18 = *(_OWORD *)&a3->var0;
      *(_OWORD *)&time.duration.timescale = *(_OWORD *)&self->_bestTrimTimeRange.duration.timescale;
      *(_OWORD *)&time2.value = v18;
      time2.epoch = a3->var3;
      return CMTimeRangeContainsTime(&time, &time2) == 0;
    }
  }
}

- (BOOL)isTimestampSkipable:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  double Seconds;
  double v9;
  BOOL v10;
  double v11;
  CMTimeRange v13;
  CMTime v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CMTime v18;
  CMTimeRange v19;
  CMTime v20;
  CMTime time;
  CMTimeRange range;

  v5 = 0;
  v6 = -[NSMutableArray count](self->_internalResults, "count");
  do
  {
    if ((int)v6 < 1)
    {
      v10 = 0;
      v7 = v5;
      goto LABEL_23;
    }
    -[NSMutableArray objectAtIndex:](self->_internalResults, "objectAtIndex:", --v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(v7, "timeRange");
    else
      memset(&range, 0, sizeof(range));
    time = (CMTime)*a3;
    if (CMTimeRangeContainsTime(&range, &time))
      break;
    time = (CMTime)*a3;
    Seconds = CMTimeGetSeconds(&time);
    if (v7)
      objc_msgSend(v7, "timeRange");
    else
      memset(&v19, 0, sizeof(v19));
    CMTimeRangeGetEnd(&v20, &v19);
    v5 = v7;
  }
  while (Seconds <= CMTimeGetSeconds(&v20));
  time = (CMTime)*a3;
  v9 = CMTimeGetSeconds(&time);
  if (v7)
  {
    objc_msgSend(v7, "timeRange");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
  }
  *(_OWORD *)&v18.value = v15;
  v18.epoch = v16;
  if (v9 <= CMTimeGetSeconds(&v18))
    goto LABEL_22;
  time = (CMTime)*a3;
  v11 = CMTimeGetSeconds(&time);
  if (v7)
    objc_msgSend(v7, "timeRange");
  else
    memset(&v13, 0, sizeof(v13));
  CMTimeRangeGetEnd(&v14, &v13);
  if (v11 < CMTimeGetSeconds(&v14)
    && (objc_msgSend(v7, "curationScore"), -[VCPTrimAnalyzer isCurated:](self, "isCurated:")))
  {
    v10 = 1;
  }
  else
  {
LABEL_22:
    v10 = 0;
  }
LABEL_23:

  return v10;
}

- (BOOL)checkTrimAt:(id *)a3 captureTime:(id *)a4
{
  double Seconds;
  __int128 v9;
  double v10;
  VCPSegment *activeSegment;
  double v12;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  CMTimeRange time;

  time.start = (CMTime)*a3;
  Seconds = CMTimeGetSeconds(&time.start);
  time.start = (CMTime)*a4;
  if (Seconds <= CMTimeGetSeconds(&time.start))
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a4->var0;
    time.start.epoch = a4->var3;
    -[VCPTrimAnalyzer generateInterestingTrimBasedOnCaptureTime:](self, "generateInterestingTrimBasedOnCaptureTime:", &time);
    v9 = *(_OWORD *)&self->_bestTrimTimeRange.start.epoch;
    *(_OWORD *)&time.start.value = *(_OWORD *)&self->_bestTrimTimeRange.start.value;
    *(_OWORD *)&time.start.epoch = v9;
    *(_OWORD *)&time.duration.timescale = *(_OWORD *)&self->_bestTrimTimeRange.duration.timescale;
    v15 = (CMTime)*a3;
    return CMTimeRangeContainsTime(&time, &v15) == 0;
  }
  else
  {
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    if (-[VCPTrimAnalyzer isTimestampSkipable:](self, "isTimestampSkipable:", &time))
      return 0;
    *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
    time.start.epoch = a3->var3;
    v10 = CMTimeGetSeconds(&time.start);
    activeSegment = self->_activeSegment;
    if (activeSegment)
      -[VCPSegment timeRange](activeSegment, "timeRange");
    else
      memset(&v13, 0, sizeof(v13));
    v14 = v13;
    if (v10 > CMTimeGetSeconds(&v14)
      && (-[VCPSegment curationScore](self->_activeSegment, "curationScore"),
          -[VCPTrimAnalyzer isCurated:](self, "isCurated:")))
    {
      return 0;
    }
    else
    {
      *(_OWORD *)&time.start.value = *(_OWORD *)&a3->var0;
      time.start.epoch = a3->var3;
      v12 = CMTimeGetSeconds(&time.start);
      *(_OWORD *)&time.start.value = *(_OWORD *)&self->_bestTrimTimeRange.start.value;
      time.start.epoch = self->_bestTrimTimeRange.start.epoch;
      return v12 - CMTimeGetSeconds(&time.start) >= 3.0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSegment, 0);
  objc_storeStrong((id *)&self->_internalResults, 0);
  objc_storeStrong((id *)&self->_actionAnalyzer, 0);
}

@end
