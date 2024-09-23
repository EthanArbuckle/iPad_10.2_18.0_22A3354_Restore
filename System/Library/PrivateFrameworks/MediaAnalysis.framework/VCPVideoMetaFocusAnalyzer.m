@implementation VCPVideoMetaFocusAnalyzer

- (VCPVideoMetaFocusAnalyzer)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  VCPVideoMetaFocusSegment *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  VCPVideoMetaFocusAnalyzer *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VCPVideoMetaFocusAnalyzer;
  v2 = -[VCPVideoMetaFocusAnalyzer init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    v5 = objc_alloc_init(VCPVideoMetaFocusSegment);
    v6 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v5;

    v7 = (void *)*((_QWORD *)v2 + 2);
    if (v7)
    {
      v7 = (void *)*((_QWORD *)v2 + 1);
      if (v7)
      {
        v9 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
        v8 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
        *(_OWORD *)(v2 + 24) = *MEMORY[0x1E0CA2E50];
        *(_OWORD *)(v2 + 40) = v9;
        *(_OWORD *)(v2 + 56) = v8;
        v7 = v2;
      }
    }
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int)processFrameMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  $3C33A24319B208EC3024E724BAC5FA63 *p_frameTimeRange;
  int64_t v10;
  VCPVideoMetaFocusSegment *activeSegment;
  VCPVideoMetaFocusSegment *v12;
  VCPVideoMetaFocusSegment *v13;
  VCPVideoMetaFocusSegment *v14;
  VCPVideoMetaFocusSegment *v15;
  __int128 v17;
  int64_t epoch;
  __int128 v19;
  int64_t v20;
  __int128 v21;
  int64_t v22;
  __int128 v23;
  int64_t v24;
  CMTimeRange v25;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("privAFSt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "integerValue");
  else
    v7 = 4;
  CMTimeRangeMakeFromDictionary(&v25, (CFDictionaryRef)v4);
  v8 = *(_OWORD *)&v25.start.epoch;
  *(_OWORD *)&self->_frameTimeRange.start.value = *(_OWORD *)&v25.start.value;
  *(_OWORD *)&self->_frameTimeRange.start.epoch = v8;
  *(_OWORD *)&self->_frameTimeRange.duration.timescale = *(_OWORD *)&v25.duration.timescale;
  p_frameTimeRange = &self->_frameTimeRange;
  if (-[NSMutableArray count](self->_mutableResults, "count")
    || -[VCPMetaSegment numOfFrames](self->_activeSegment, "numOfFrames"))
  {
    v10 = -[VCPVideoMetaFocusSegment focusStatus](self->_activeSegment, "focusStatus");
    activeSegment = self->_activeSegment;
    if (v7 == v10)
    {
      v17 = *(_OWORD *)&p_frameTimeRange->start.value;
      epoch = self->_frameTimeRange.start.epoch;
      -[VCPVideoMetaFocusSegment updateSegment:atTime:](activeSegment, "updateSegment:atTime:", v7, &v17);
    }
    else
    {
      v21 = *(_OWORD *)&p_frameTimeRange->start.value;
      v22 = self->_frameTimeRange.start.epoch;
      -[VCPMetaSegment finalizeAtTime:](activeSegment, "finalizeAtTime:", &v21);
      -[VCPVideoMetaFocusAnalyzer addSegmentToResults](self, "addSegmentToResults");
      v12 = [VCPVideoMetaFocusSegment alloc];
      v19 = *(_OWORD *)&p_frameTimeRange->start.value;
      v20 = self->_frameTimeRange.start.epoch;
      v13 = -[VCPVideoMetaFocusSegment initWithFocusStatus:atTime:](v12, "initWithFocusStatus:atTime:", v7, &v19);
      v14 = self->_activeSegment;
      self->_activeSegment = v13;

    }
  }
  else
  {
    v15 = self->_activeSegment;
    v23 = *(_OWORD *)&p_frameTimeRange->start.value;
    v24 = self->_frameTimeRange.start.epoch;
    -[VCPVideoMetaFocusSegment resetSegment:atTime:](v15, "resetSegment:atTime:", v7, &v23);
  }

  return 0;
}

- (void)addSegmentToResults
{
  float v3;
  VCPVideoMetaFocusSegment *activeSegment;
  NSMutableArray *mutableResults;
  CFDictionaryRef v6;
  VCPVideoMetaFocusSegment *v7;
  CFDictionaryRef v8;
  double v9;
  void *v10;
  void *v11;
  CMTime v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CMTime time;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (-[VCPVideoMetaFocusSegment focusStatus](self->_activeSegment, "focusStatus") == 4)
    v3 = 1.0;
  else
    v3 = 0.0;
  v17[0] = CFSTR("start");
  activeSegment = self->_activeSegment;
  mutableResults = self->_mutableResults;
  if (activeSegment)
  {
    -[VCPMetaSegment timeRange](activeSegment, "timeRange");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
  }
  *(_OWORD *)&v12[0].value = v13;
  v12[0].epoch = v14;
  v6 = CMTimeCopyAsDictionary(v12, 0);
  v18[0] = v6;
  v17[1] = CFSTR("duration");
  v7 = self->_activeSegment;
  if (v7)
    -[VCPMetaSegment timeRange](v7, "timeRange");
  else
    memset(v12, 0, sizeof(v12));
  time = v12[1];
  v8 = CMTimeCopyAsDictionary(&time, 0);
  v18[1] = v8;
  v17[2] = CFSTR("quality");
  *(float *)&v9 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](mutableResults, "addObject:", v11);

}

- (int)finalizeAnalysis
{
  VCPVideoMetaFocusSegment *activeSegment;
  __int128 v4;
  CMTimeRange v6;
  CMTime v7;

  activeSegment = self->_activeSegment;
  v4 = *(_OWORD *)&self->_frameTimeRange.start.epoch;
  *(_OWORD *)&v6.start.value = *(_OWORD *)&self->_frameTimeRange.start.value;
  *(_OWORD *)&v6.start.epoch = v4;
  *(_OWORD *)&v6.duration.timescale = *(_OWORD *)&self->_frameTimeRange.duration.timescale;
  CMTimeRangeGetEnd(&v7, &v6);
  -[VCPMetaSegment finalizeAtTime:](activeSegment, "finalizeAtTime:", &v7);
  -[VCPVideoMetaFocusAnalyzer addSegmentToResults](self, "addSegmentToResults");
  return 0;
}

- (NSArray)results
{
  return (NSArray *)self->_mutableResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableResults, 0);
  objc_storeStrong((id *)&self->_activeSegment, 0);
}

@end
