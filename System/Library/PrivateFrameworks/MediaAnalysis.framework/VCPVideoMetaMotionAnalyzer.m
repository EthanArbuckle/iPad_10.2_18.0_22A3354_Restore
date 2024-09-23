@implementation VCPVideoMetaMotionAnalyzer

- (VCPVideoMetaMotionAnalyzer)init
{
  VCPVideoMetaMotionAnalyzer *v2;
  uint64_t v3;
  NSMutableArray *internalResults;
  uint64_t v5;
  NSMutableArray *mutableResults;
  VCPVideoMetaMotionSegment *v7;
  VCPVideoMetaMotionSegment *activeSegment;
  void *v9;
  uint64_t v10;
  __int128 v11;
  VCPVideoMetaMotionAnalyzer *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VCPVideoMetaMotionAnalyzer;
  v2 = -[VCPVideoMetaMotionAnalyzer init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    internalResults = v2->_internalResults;
    v2->_internalResults = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    mutableResults = v2->_mutableResults;
    v2->_mutableResults = (NSMutableArray *)v5;

    v7 = objc_alloc_init(VCPVideoMetaMotionSegment);
    activeSegment = v2->_activeSegment;
    v2->_activeSegment = v7;

    v9 = v2->_mutableResults;
    if (v9)
    {
      v9 = v2->_internalResults;
      if (v9)
      {
        v9 = v2->_activeSegment;
        if (v9)
        {
          ma::HinkleyDetector::Initialize((uint64_t)&v2->_hinkleyDetector, 0.03, 0.1, 10);
          v10 = MEMORY[0x1E0CA2E50];
          v11 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
          *(_OWORD *)&v2->_frameTimeRange.start.value = *MEMORY[0x1E0CA2E50];
          *(_OWORD *)&v2->_frameTimeRange.start.epoch = v11;
          *(_OWORD *)&v2->_frameTimeRange.duration.timescale = *(_OWORD *)(v10 + 32);
          v9 = v2;
        }
      }
    }
    v12 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)decideSegmentPointBasedOn:(float)a3
{
  int v4;
  HinkleyDetector *p_hinkleyDetector;
  float v6;
  BOOL v7;
  unint64_t v8;
  BOOL result;
  float v10;
  float v11;

  v11 = a3;
  v4 = -[VCPMetaSegment numOfFrames](self->_activeSegment, "numOfFrames") + 1;
  p_hinkleyDetector = &self->_hinkleyDetector;
  if (self->_hinkleyDetector.min_length_ < v4
    && (-[VCPVideoMetaMotionSegment stabilityScore](self->_activeSegment, "stabilityScore"),
        v10 = v6,
        ma::HinkleyDetector::Test((ma::HinkleyDetector *)&self->_hinkleyDetector, &v10, &v11, v4)))
  {
    v7 = 1;
  }
  else
  {
    v8 = -[VCPMetaSegment numOfFrames](self->_activeSegment, "numOfFrames");
    v7 = 0;
    result = 0;
    if (v8)
      return result;
  }
  ma::HinkleyDetector::ResetStats((ma::HinkleyDetector *)p_hinkleyDetector);
  return v7;
}

- (int)processFrameMetadata:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  NSPoint v7;
  double x;
  double y;
  __int128 v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  $3C33A24319B208EC3024E724BAC5FA63 *p_frameTimeRange;
  double v16;
  _BOOL4 v17;
  VCPVideoMetaMotionSegment *activeSegment;
  VCPVideoMetaMotionSegment *v19;
  VCPVideoMetaMotionSegment *v20;
  VCPVideoMetaMotionSegment *v21;
  VCPVideoMetaMotionSegment *v22;
  __int128 v24;
  int64_t v25;
  __int128 v26;
  int64_t v27;
  __int128 v28;
  int64_t epoch;
  __int128 v30;
  int64_t v31;
  CMTimeRange v32;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("privECMVct"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = NSPointFromString(v5);
    x = v7.x;
    y = v7.y;
  }
  else
  {
    x = *MEMORY[0x1E0C9D538];
    y = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  CMTimeRangeMakeFromDictionary(&v32, (CFDictionaryRef)v4);
  v10 = *(_OWORD *)&v32.start.epoch;
  *(_OWORD *)&self->_frameTimeRange.start.value = *(_OWORD *)&v32.start.value;
  *(_OWORD *)&self->_frameTimeRange.start.epoch = v10;
  *(_OWORD *)&self->_frameTimeRange.duration.timescale = *(_OWORD *)&v32.duration.timescale;
  v11 = -[NSMutableArray count](self->_internalResults, "count");
  v12 = x;
  v13 = y;
  v14 = fabsf(v12) + fabsf(v13);
  p_frameTimeRange = &self->_frameTimeRange;
  if (v11 || -[VCPMetaSegment numOfFrames](self->_activeSegment, "numOfFrames"))
  {
    *(float *)&v16 = expf(v14 * -0.1);
    v17 = -[VCPVideoMetaMotionAnalyzer decideSegmentPointBasedOn:](self, "decideSegmentPointBasedOn:", v16);
    activeSegment = self->_activeSegment;
    if (v17)
    {
      v28 = *(_OWORD *)&p_frameTimeRange->start.value;
      epoch = self->_frameTimeRange.start.epoch;
      -[VCPVideoMetaMotionSegment finalizeAtTime:](activeSegment, "finalizeAtTime:", &v28);
      -[NSMutableArray addObject:](self->_internalResults, "addObject:", self->_activeSegment);
      v19 = [VCPVideoMetaMotionSegment alloc];
      v26 = *(_OWORD *)&p_frameTimeRange->start.value;
      v27 = self->_frameTimeRange.start.epoch;
      v20 = -[VCPVideoMetaMotionSegment initWithAbsMotion:atTime:](v19, "initWithAbsMotion:atTime:", &v26, COERCE_DOUBLE(__PAIR64__(DWORD1(v26), LODWORD(v14))));
      v21 = self->_activeSegment;
      self->_activeSegment = v20;

    }
    else
    {
      v24 = *(_OWORD *)&p_frameTimeRange->start.value;
      v25 = self->_frameTimeRange.start.epoch;
      -[VCPVideoMetaMotionSegment updateSegment:atTime:](activeSegment, "updateSegment:atTime:", &v24, COERCE_DOUBLE(__PAIR64__(DWORD1(v24), LODWORD(v14))));
    }
  }
  else
  {
    v22 = self->_activeSegment;
    v30 = *(_OWORD *)&p_frameTimeRange->start.value;
    v31 = self->_frameTimeRange.start.epoch;
    -[VCPVideoMetaMotionSegment resetSegment:atTime:](v22, "resetSegment:atTime:", &v30, COERCE_DOUBLE(__PAIR64__(DWORD1(v30), LODWORD(v14))));
  }

  return 0;
}

- (void)mergeSimilarSegments
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;

  if ((unint64_t)-[NSMutableArray count](self->_internalResults, "count") >= 2)
  {
    v3 = 0;
    do
    {
      v4 = v3 + 1;
      if (-[NSMutableArray count](self->_internalResults, "count") <= (unint64_t)(v3 + 1))
        break;
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->_internalResults, "objectAtIndexedSubscript:", v3 + 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stabilityScore");
      v8 = v7;
      objc_msgSend(v6, "stabilityScore");
      if (vabds_f32(v8, v9) <= 0.15)
      {
        objc_msgSend(v6, "mergeSegment:", v5);
        -[NSMutableArray removeObject:](self->_internalResults, "removeObject:", v5);
        v4 = v3;
      }

      v3 = v4;
    }
    while ((unint64_t)-[NSMutableArray count](self->_internalResults, "count") > 1);
  }
}

- (int)finalizeAnalysis
{
  VCPVideoMetaMotionSegment *activeSegment;
  VCPVideoMetaMotionSegment **p_activeSegment;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSMutableArray *mutableResults;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *obj;
  uint64_t v16;
  CMTime time[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CMTimeRange range;
  CMTime v27;
  CMTime v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  p_activeSegment = &self->_activeSegment;
  activeSegment = self->_activeSegment;
  v4 = *(_OWORD *)&self->_frameTimeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_frameTimeRange.start.value;
  *(_OWORD *)&range.start.epoch = v4;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_frameTimeRange.duration.timescale;
  CMTimeRangeGetEnd(&v27, &range);
  -[VCPVideoMetaMotionSegment finalizeAtTime:](activeSegment, "finalizeAtTime:", &v27);
  -[NSMutableArray addObject:](self->_internalResults, "addObject:", *p_activeSegment);
  -[VCPVideoMetaMotionAnalyzer mergeSimilarSegments](self, "mergeSimilarSegments");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_internalResults;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v5)
  {
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        mutableResults = self->_mutableResults;
        v29[0] = CFSTR("start");
        if (v7)
        {
          objc_msgSend(v7, "timeRange");
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
          v19 = 0u;
        }
        *(_OWORD *)&time[0].value = v19;
        time[0].epoch = v20;
        v9 = CMTimeCopyAsDictionary(time, 0);
        v30[0] = v9;
        v29[1] = CFSTR("duration");
        if (v7)
          objc_msgSend(v7, "timeRange");
        else
          memset(time, 0, sizeof(time));
        v28 = time[1];
        v10 = CMTimeCopyAsDictionary(&v28, 0);
        v30[1] = v10;
        v29[2] = CFSTR("quality");
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "absMotion");
        objc_msgSend(v11, "numberWithFloat:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30[2] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](mutableResults, "addObject:", v13);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v5);
  }

  return 0;
}

- (NSArray)results
{
  return (NSArray *)self->_mutableResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalResults, 0);
  objc_storeStrong((id *)&self->_mutableResults, 0);
  objc_storeStrong((id *)&self->_activeSegment, 0);
  ma::MotionFilter::~MotionFilter((ma::MotionFilter *)&self->_hinkleyDetector);
}

- (id).cxx_construct
{
  ma::HinkleyDetector::HinkleyDetector((uint64_t)&self->_hinkleyDetector);
  return self;
}

@end
