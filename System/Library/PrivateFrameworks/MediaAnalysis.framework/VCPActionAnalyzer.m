@implementation VCPActionAnalyzer

- (VCPActionAnalyzer)init
{
  VCPActionAnalyzer *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableArray *internalResults;
  VCPSegment *v7;
  VCPSegment *activeSegment;
  VCPActionAnalyzer *v9;
  VCPActionAnalyzer *v10;
  __int16 v12[8];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VCPActionAnalyzer;
  v2 = -[VCPActionAnalyzer init](&v13, sel_init);
  if (!v2)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  v3 = operator new(0x1CuLL, MEMORY[0x1E0DE4E10]);
  if (!v3)
  {
    v2->_activeHinkleyDetector = 0;
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12[0] = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to allocate memory", (uint8_t *)v12, 2u);
    }
    goto LABEL_7;
  }
  v4 = (uint64_t)v3;
  ma::HinkleyDetector::HinkleyDetector((uint64_t)v3);
  v2->_activeHinkleyDetector = (HinkleyDetector *)v4;
  ma::HinkleyDetector::Initialize(v4, 0.05, 0.15, 10);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = objc_claimAutoreleasedReturnValue();
  internalResults = v2->_internalResults;
  v2->_internalResults = (NSMutableArray *)v5;

  v7 = objc_alloc_init(VCPSegment);
  activeSegment = v2->_activeSegment;
  v2->_activeSegment = v7;

  *(_WORD *)&v2->_firstFrame = 1;
  v2->_postProcessStart = 0;
  v9 = v2;
LABEL_8:
  v10 = v9;

  return v10;
}

- (void)dealloc
{
  HinkleyDetector *activeHinkleyDetector;
  objc_super v4;

  activeHinkleyDetector = self->_activeHinkleyDetector;
  if (activeHinkleyDetector)
  {
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)activeHinkleyDetector);
    MEMORY[0x1BCCA12BC]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPActionAnalyzer;
  -[VCPActionAnalyzer dealloc](&v4, sel_dealloc);
}

- (int)analyzeFrameWithTimeRange:(id *)a3 andActionScore:(float)a4
{
  VCPSegment *activeSegment;
  __int128 v8;
  _BOOL8 v9;
  double v10;
  double v11;
  VCPSegment *v12;
  VCPSegment *v13;
  VCPSegment *v14;
  VCPSegment *v15;
  VCPSegment *v16;
  __int128 v17;
  __int128 v18;
  _BOOL8 v19;
  double v20;
  _OWORD v22[2];
  __int128 v23;
  int64_t v24;
  __int128 v25;
  int64_t var3;
  _OWORD v27[2];
  __int128 v28;

  if (self->_firstFrame)
  {
    activeSegment = self->_activeSegment;
    v8 = *(_OWORD *)&a3->var0.var3;
    v27[0] = *(_OWORD *)&a3->var0.var0;
    v27[1] = v8;
    v28 = *(_OWORD *)&a3->var1.var1;
    v9 = -[VCPActionAnalyzer isScoreValid:](self, "isScoreValid:", COERCE_DOUBLE(__PAIR64__(DWORD1(v28), LODWORD(a4))));
    *(float *)&v10 = a4;
    -[VCPSegment updateWithFirstFrame:score:valid:](activeSegment, "updateWithFirstFrame:score:valid:", v27, v9, v10);
    self->_firstFrame = 0;
  }
  else if (-[VCPActionAnalyzer isScoreValid:](self, "isScoreValid:", *(double *)&a4)
         && (*(float *)&v11 = a4,
             -[VCPActionAnalyzer decideSegmentPointUsingHinkleyDetector:](self, "decideSegmentPointUsingHinkleyDetector:", v11)))
  {
    v12 = self->_activeSegment;
    v25 = *(_OWORD *)&a3->var0.var0;
    var3 = a3->var0.var3;
    -[VCPSegment updateDuration:](v12, "updateDuration:", &v25);
    -[NSMutableArray addObject:](self->_internalResults, "addObject:", self->_activeSegment);
    v13 = [VCPSegment alloc];
    v23 = *(_OWORD *)&a3->var0.var0;
    v24 = a3->var0.var3;
    v14 = -[VCPSegment initWithTimestamp:score:valid:](v13, "initWithTimestamp:score:valid:", &v23, 1, COERCE_DOUBLE(__PAIR64__(DWORD1(v23), LODWORD(a4))));
    v15 = self->_activeSegment;
    self->_activeSegment = v14;

  }
  else
  {
    v16 = self->_activeSegment;
    v17 = *(_OWORD *)&a3->var0.var3;
    v22[0] = *(_OWORD *)&a3->var0.var0;
    v22[1] = v17;
    v18 = *(_OWORD *)&a3->var1.var1;
    *(float *)&v18 = a4;
    v19 = -[VCPActionAnalyzer isScoreValid:](self, "isScoreValid:", *(double *)&v18, v22[0], v17, *(_QWORD *)&a3->var1.var1, a3->var1.var3);
    *(float *)&v20 = a4;
    -[VCPSegment updateSegment:score:valid:](v16, "updateSegment:score:valid:", v22, v19, v20);
  }
  return 0;
}

- (void)updateActiveThreshold
{
  unint64_t v3;
  float v4;
  void *v5;
  float v6;
  float v7;
  float activeThreshold;

  self->_activeThreshold = 0.2;
  if (-[NSMutableArray count](self->_internalResults, "count"))
  {
    v3 = 0;
    v4 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "score");
      if (v6 > v4)
      {
        objc_msgSend(v5, "score");
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
  activeThreshold = self->_activeThreshold;
  if (v4 > activeThreshold)
    self->_activeThreshold = (float)(v4 + activeThreshold) * 0.5;
}

- (BOOL)isActive:(float)a3
{
  return self->_activeThreshold < a3;
}

- (BOOL)isScoreValid:(float)a3
{
  return a3 >= 0.0;
}

- (BOOL)decideSegmentPointBasedOnActionScore:(float)a3
{
  unint64_t v5;
  double v6;
  BOOL v7;
  double v8;

  v5 = -[VCPSegment numOfFrames](self->_activeSegment, "numOfFrames");
  if (v5)
  {
    *(float *)&v6 = a3;
    LODWORD(v5) = -[VCPActionAnalyzer isScoreValid:](self, "isScoreValid:", v6);
    if ((_DWORD)v5)
    {
      -[VCPSegment score](self->_activeSegment, "score");
      v7 = -[VCPActionAnalyzer isActive:](self, "isActive:");
      *(float *)&v8 = a3;
      LOBYTE(v5) = v7 ^ -[VCPActionAnalyzer isActive:](self, "isActive:", v8);
    }
  }
  return v5;
}

- (BOOL)decideSegmentPointUsingHinkleyDetector:(float)a3
{
  HinkleyDetector *activeHinkleyDetector;
  HinkleyDetector *v5;
  float v6;
  BOOL v7;
  unint64_t v8;
  BOOL result;
  float v10;
  float v11;

  v11 = a3;
  if (-[VCPSegment numOfValidFrames](self->_activeSegment, "numOfValidFrames")
    && (activeHinkleyDetector = self->_activeHinkleyDetector,
        activeHinkleyDetector->min_length_ < (int)-[VCPSegment numOfFrames](self->_activeSegment, "numOfFrames"))
    && (v5 = self->_activeHinkleyDetector,
        -[VCPSegment sumOfScore](self->_activeSegment, "sumOfScore"),
        v10 = v6,
        ma::HinkleyDetector::Test((ma::HinkleyDetector *)v5, &v10, &v11, -[VCPSegment numOfValidFrames](self->_activeSegment, "numOfValidFrames") + 1)))
  {
    v7 = 1;
  }
  else
  {
    v8 = -[VCPSegment numOfValidFrames](self->_activeSegment, "numOfValidFrames");
    v7 = 0;
    result = 0;
    if (v8)
      return result;
  }
  ma::HinkleyDetector::ResetStats((ma::HinkleyDetector *)self->_activeHinkleyDetector);
  return v7;
}

- (int)mergeConsecutiveShortSegments
{
  int postProcessStart;
  void *v4;
  signed int v5;
  uint64_t v6;
  int v7;
  void *v8;
  int v9;
  void *v10;

  postProcessStart = self->_postProcessStart;
  if (postProcessStart < (int)(-[NSMutableArray count](self->_internalResults, "count") - 1))
  {
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", postProcessStart);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = postProcessStart + 1;
      if (objc_msgSend(v4, "isContentTooShort"))
      {
        v6 = 0;
        v7 = postProcessStart;
        while (-[NSMutableArray count](self->_internalResults, "count") > (unint64_t)(v5 + v6))
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "isContentTooShort");

          if (!v9)
            break;
          ++v6;
          ++postProcessStart;
        }
        while (v7 < postProcessStart)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "mergeSegment:", v10);

          --postProcessStart;
          -[NSMutableArray removeObjectAtIndex:](self->_internalResults, "removeObjectAtIndex:", v5);
        }
        v5 = postProcessStart + 1;
      }

      postProcessStart = v5;
    }
    while (v5 < (int)(-[NSMutableArray count](self->_internalResults, "count") - 1));
  }
  -[VCPActionAnalyzer updateActiveThreshold](self, "updateActiveThreshold");
  -[VCPActionAnalyzer mergeSameTypeSegments](self, "mergeSameTypeSegments");
  return 0;
}

- (int)mergeSameTypeSegments
{
  uint64_t postProcessStart;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;

  postProcessStart = self->_postProcessStart;
  if ((int)-[NSMutableArray count](self->_internalResults, "count") >= 2)
  {
    do
    {
      v4 = (postProcessStart + 1);
      if (-[NSMutableArray count](self->_internalResults, "count") <= (unint64_t)(int)v4)
        break;
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", (int)postProcessStart);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", (int)v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "score");
      v7 = -[VCPActionAnalyzer isActive:](self, "isActive:");
      objc_msgSend(v5, "score");
      if (v7 == -[VCPActionAnalyzer isActive:](self, "isActive:"))
      {
        objc_msgSend(v6, "mergeSegment:", v5);
        -[NSMutableArray removeObjectAtIndex:](self->_internalResults, "removeObjectAtIndex:", (int)postProcessStart);
        v4 = postProcessStart;
      }

      postProcessStart = v4;
    }
    while ((int)-[NSMutableArray count](self->_internalResults, "count") > 1);
  }
  return 0;
}

- (int)mergeSparseShortSegments
{
  int postProcessStart;
  uint64_t v4;
  int v5;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;

  -[NSMutableArray count](self->_internalResults, "count");
  postProcessStart = self->_postProcessStart;
  v4 = (postProcessStart + 1);
  v5 = -[NSMutableArray count](self->_internalResults, "count");
  if (v5 >= 3 && (int)v4 < v5 - 1)
  {
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", postProcessStart);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", (int)v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (v4 + 1);
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", (int)v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isContentTooShort") & 1) != 0
        || !objc_msgSend(v9, "isContentTooShort")
        || (objc_msgSend(v11, "isContentTooShort") & 1) != 0)
      {
        postProcessStart = v4;
      }
      else
      {
        objc_msgSend(v9, "mergeSegment:", v11);
        -[NSMutableArray removeObjectAtIndex:](self->_internalResults, "removeObjectAtIndex:", (int)v10);
        v10 = v4;
      }
      v12 = -[NSMutableArray count](self->_internalResults, "count");

      if (v12 < 3)
        break;
      v4 = v10;
    }
    while ((int)v10 < v12 - 1);
  }
  -[VCPActionAnalyzer mergeSameTypeSegments](self, "mergeSameTypeSegments");
  return 0;
}

- (int)finalizeWithDestructiveTrimStart:(id *)a3 trimEnd:(id *)a4
{
  double Seconds;
  Float64 v8;
  __int128 v10;
  int64_t v11;
  __int128 v12;
  int64_t var3;
  CMTime v14;
  CMTime time;

  if (self->_verbose)
  {
    time = *(CMTime *)a3;
    Seconds = CMTimeGetSeconds(&time);
    v14 = (CMTime)*a4;
    v8 = CMTimeGetSeconds(&v14);
    printf("Destructive Trim Range: [%.2f - %.2f]\n", Seconds, v8);
  }
  -[NSMutableArray addObject:](self->_internalResults, "addObject:", self->_activeSegment);
  -[VCPActionAnalyzer printSegments:](self, "printSegments:", CFSTR("start"));
  v12 = *(_OWORD *)&a3->var0;
  var3 = a3->var3;
  v10 = *(_OWORD *)&a4->var0;
  v11 = a4->var3;
  -[VCPActionAnalyzer prepareTrimmingWithTrimStart:andTrimEnd:](self, "prepareTrimmingWithTrimStart:andTrimEnd:", &v12, &v10);
  -[VCPActionAnalyzer printSegments:](self, "printSegments:", CFSTR("after repare"));
  -[VCPActionAnalyzer mergeConsecutiveShortSegments](self, "mergeConsecutiveShortSegments");
  -[VCPActionAnalyzer printSegments:](self, "printSegments:", CFSTR("after consecutive short merge"));
  -[VCPActionAnalyzer mergeSparseShortSegments](self, "mergeSparseShortSegments");
  -[VCPActionAnalyzer printSegments:](self, "printSegments:", CFSTR("after sparse short merge"));
  return 0;
}

- (int)postProcessSegmentsWithCaptureTime:(id *)a3 trimStart:(id *)a4
{
  VCPSegment *activeSegment;
  VCPSegment *v8;
  VCPSegment *v9;
  int v10;
  int v11;
  _BOOL8 v12;
  double v13;
  VCPSegment *v14;
  VCPSegment *v15;
  void *v16;
  void *v17;
  CMTimeRange v19;
  CMTime v20;
  __int128 v21;
  int64_t var3;
  CMTimeRange v23;
  CMTime v24;
  CMTime time;
  CMTimeRange range;

  activeSegment = self->_activeSegment;
  if (activeSegment)
    -[VCPSegment timeRange](activeSegment, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  time = (CMTime)*a3;
  if (CMTimeRangeContainsTime(&range, &time))
  {
    -[NSMutableArray addObject:](self->_internalResults, "addObject:", self->_activeSegment);
    v8 = [VCPSegment alloc];
    v9 = self->_activeSegment;
    if (v9)
      -[VCPSegment timeRange](v9, "timeRange");
    else
      memset(&v23, 0, sizeof(v23));
    CMTimeRangeGetEnd(&v24, &v23);
    -[VCPSegment score](self->_activeSegment, "score");
    v11 = v10;
    -[VCPSegment score](self->_activeSegment, "score");
    v12 = -[VCPActionAnalyzer isScoreValid:](self, "isScoreValid:");
    LODWORD(v13) = v11;
    v14 = -[VCPSegment initWithTimestamp:score:valid:](v8, "initWithTimestamp:score:valid:", &v24, v12, v13);
    v15 = self->_activeSegment;
    self->_activeSegment = v14;

  }
  if (-[NSMutableArray count](self->_internalResults, "count"))
  {
    -[NSMutableArray lastObject](self->_internalResults, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v21 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    if (v16)
      objc_msgSend(v16, "timeRange");
    else
      memset(&v19, 0, sizeof(v19));
    CMTimeRangeGetEnd(&v20, &v19);
    -[VCPActionAnalyzer prepareTrimmingWithTrimStart:andTrimEnd:](self, "prepareTrimmingWithTrimStart:andTrimEnd:", &v21, &v20);
    -[VCPActionAnalyzer mergeConsecutiveShortSegments](self, "mergeConsecutiveShortSegments");
    -[VCPActionAnalyzer mergeSparseShortSegments](self, "mergeSparseShortSegments");
    -[VCPActionAnalyzer printSegments:](self, "printSegments:", CFSTR("after post processing"));
    self->_postProcessStart = -[NSMutableArray count](self->_internalResults, "count") - 1;

  }
  return 0;
}

- (id)segments
{
  return self->_internalResults;
}

- (id)activeSegment
{
  return self->_activeSegment;
}

- (void)printSegments:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (self->_verbose)
  {
    v5 = v4;
    printf("=========Segment %s==========\n", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_internalResults, "enumerateObjectsUsingBlock:", &__block_literal_global_73);
    v4 = v5;
  }

}

void __35__VCPActionAnalyzer_printSegments___block_invoke(uint64_t a1, void *a2)
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
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  *(_OWORD *)&time.value = v9;
  time.epoch = v10;
  Seconds = CMTimeGetSeconds(&time);
  if (v3)
    objc_msgSend(v3, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  CMTimeRangeGetEnd(&v8, &range);
  v5 = CMTimeGetSeconds(&v8);
  objc_msgSend(v3, "score");
  printf(" [%.2f - %.2f]: %.2f\n", Seconds, v5, v6);

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
  int64_t v28;
  __int128 v29;
  int64_t var3;
  _QWORD v31[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v32;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v37 = -[NSMutableArray count](self->_internalResults, "count") - 1;
  internalResults = self->_internalResults;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __61__VCPActionAnalyzer_prepareTrimmingWithTrimStart_andTrimEnd___block_invoke;
  v31[3] = &unk_1E6B1A688;
  v32 = *a3;
  v33 = *a4;
  v31[4] = &v38;
  v31[5] = &v34;
  -[NSMutableArray enumerateObjectsUsingBlock:](internalResults, "enumerateObjectsUsingBlock:", v31);
  for (i = (int)-[NSMutableArray count](self->_internalResults, "count") - 1; ; i = v10)
  {
    v9 = self->_internalResults;
    if (v35[3] >= i)
      break;
    v10 = i - 1;
    -[NSMutableArray removeObjectAtIndex:](v9, "removeObjectAtIndex:");
  }
  -[NSMutableArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  objc_msgSend(v11, "trimSegment:fromStart:", &v29, 0);

  for (j = *((unsigned int *)v39 + 6);
        (int)j >= 1;
        -[NSMutableArray removeObjectAtIndex:](self->_internalResults, "removeObjectAtIndex:", j))
  {
    --j;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(_OWORD *)&a3->var0;
  v28 = a3->var3;
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
    printf("--[%.2f - %.2f]\n", Seconds, v19);

  }
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  return 0;
}

void __61__VCPActionAnalyzer_prepareTrimmingWithTrimStart_andTrimEnd___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  CMTime v7;
  CMTimeRange v8;
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
    memset(&v8, 0, sizeof(v8));
  v7 = *(CMTime *)(a1 + 72);
  if (CMTimeRangeContainsTime(&v8, &v7))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSegment, 0);
  objc_storeStrong((id *)&self->_internalResults, 0);
}

@end
