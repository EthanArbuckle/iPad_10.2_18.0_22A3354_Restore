@implementation MOVStreamTimestamps

- (MOVStreamTimestamps)initWithAssetTrack:(id)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)(MEMORY[0x24BDC0D70] + 16);
  v5[0] = *MEMORY[0x24BDC0D70];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDC0D70] + 32);
  return -[MOVStreamTimestamps initWithAssetTrack:restrictedTimeRange:](self, "initWithAssetTrack:restrictedTimeRange:", a3, v5);
}

- (MOVStreamTimestamps)initWithAssetTrack:(id)a3 restrictedTimeRange:(id *)a4
{
  id v7;
  MOVStreamTimestamps *v8;
  MOVStreamTimestamps *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  MOVStreamTimestamps *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  CMTime v18;
  CMTime start;
  objc_super v20;
  CMTimeRange v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MOVStreamTimestamps;
  v8 = -[MOVStreamTimestamps init](&v20, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_8:
    v13 = v9;
    goto LABEL_12;
  }
  if (v7)
  {
    objc_storeStrong((id *)&v8->_assetTrack, a3);
    *(_WORD *)&v9->_shouldStartTimestampsAtZero = 1;
    if ((a4->var0.var2 & 1) == 0 || (a4->var1.var2 & 1) == 0 || a4->var1.var3 || a4->var1.var0 < 0)
    {
      start = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D50];
      v18 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D60];
      CMTimeRangeMake(&v21, &start, &v18);
      v10 = *(_OWORD *)&v21.start.epoch;
      *(_OWORD *)&a4->var0.var0 = *(_OWORD *)&v21.start.value;
      *(_OWORD *)&a4->var0.var3 = v10;
      *(_OWORD *)&a4->var1.var1 = *(_OWORD *)&v21.duration.timescale;
    }
    v11 = *(_OWORD *)&a4->var0.var0;
    v12 = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&v9->_restrictedTimeRange.duration.timescale = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&v9->_restrictedTimeRange.start.epoch = v12;
    *(_OWORD *)&v9->_restrictedTimeRange.start.value = v11;
    goto LABEL_8;
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21.start.value) = 138412290;
    *(CMTimeValue *)((char *)&v21.start.value + 4) = (CMTimeValue)v16;
    _os_log_impl(&dword_210675000, v14, OS_LOG_TYPE_ERROR, "❌ ERROR: Could not create %{pubic}@ with nil parameter", (uint8_t *)&v21, 0xCu);

  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (MOVStreamTimestamps)init
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_ERROR, "❌ ERROR: Do not call -[%{public}@ init].", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)description
{
  void *v2;
  void *v3;

  -[MOVStreamTimestamps timeList](self, "timeList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)clearCachedProperties
{
  -[MOVStreamTimestamps setTimeList:](self, "setTimeList:", 0);
}

- (void)setShouldStartTimestampsAtZero:(BOOL)a3
{
  if (self->_shouldStartTimestampsAtZero != a3)
  {
    self->_shouldStartTimestampsAtZero = a3;
    -[MOVStreamTimestamps clearCachedProperties](self, "clearCachedProperties");
  }
}

- (void)setShouldAppendEndOfStreamTimestamp:(BOOL)a3
{
  if (self->_shouldAppendEndOfStreamTimestamp != a3)
  {
    self->_shouldAppendEndOfStreamTimestamp = a3;
    -[MOVStreamTimestamps clearCachedProperties](self, "clearCachedProperties");
  }
}

- (MOVStreamSampleTimeList)timeList
{
  MOVStreamSampleTimeList *timeList;
  MOVStreamSampleTimeList *v4;
  MOVStreamSampleTimeList *v5;

  timeList = self->_timeList;
  if (!timeList)
  {
    if (self->_assetTrack)
    {
      -[MOVStreamTimestamps sampleTimelineForAssetTrack:](self, "sampleTimelineForAssetTrack:");
      v4 = (MOVStreamSampleTimeList *)objc_claimAutoreleasedReturnValue();
      v5 = self->_timeList;
      self->_timeList = v4;

      timeList = self->_timeList;
    }
    else
    {
      timeList = 0;
    }
  }
  return timeList;
}

- (_NSRange)frameRangeFrom:(id *)a3 to:(id *)a4
{
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  _NSRange result;

  -[MOVStreamTimestamps timeList](self, "timeList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *a3;
  v12 = *a4;
  v7 = objc_msgSend(v6, "frameRangeFrom:to:", &v13, &v12);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- ($69C59A32909E13F94AB58097350E6BB9)timeRangeFrom:(SEL)a3 to:(unint64_t)a4
{
  void *v8;
  $69C59A32909E13F94AB58097350E6BB9 *result;
  void *v10;

  -[MOVStreamTimestamps timeList](self, "timeList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = v8;
    objc_msgSend(v8, "timeRangeFrom:to:", a4, a5);
    v8 = v10;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (NSArray)times
{
  void *v2;
  void *v3;

  -[MOVStreamTimestamps timeList](self, "timeList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "times");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)cmtimes
{
  void *v2;
  void *v3;

  -[MOVStreamTimestamps timeList](self, "timeList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cmtimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[MOVStreamTimestamps timeList](self, "timeList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtIndex:(SEL)a3
{
  void *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v8;

  -[MOVStreamTimestamps timeList](self, "timeList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "timeAtIndex:", a4);
    v6 = v8;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (id)sampleTimelineForAssetTrack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CMTime v8;
  CMTime time1;
  CMTime v10;

  v4 = a3;
  -[MOVStreamTimestamps sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:](self, "sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:", v4, -[MOVStreamTimestamps shouldStartTimestampsAtZero](self, "shouldStartTimestampsAtZero"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MOVStreamTimestamps shouldAppendEndOfStreamTimestamp](self, "shouldAppendEndOfStreamTimestamp"))
  {
    memset(&v10, 0, sizeof(v10));
    -[MOVStreamTimestamps endTimeForAssetTrack:](self, "endTimeForAssetTrack:", v4);
    if ((unsigned __int128)0 >> 96)
    {
      time1 = v10;
      v8 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D90];
      if ((CMTimeCompare(&time1, &v8) & 0x80000000) == 0)
      {
        time1 = v10;
        objc_msgSend(v5, "appendTime:", &time1);
      }
    }
  }
  objc_msgSend(v5, "timeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)sampleTimelineForAssetTrack:(id)a3 shouldStartTimestampsAtZero:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  MOVStreamSampleTimeRangeBuffer *v8;
  MOVStreamSampleTimeRangeBuffer *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  int v22;
  $EADFAE6DDD4FCD5DD5573D2FB1EFCF6E *p_restrictedTimeRange;
  __int128 *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  CMTimeEpoch v28;
  int32_t v29;
  _BOOL4 v30;
  void *v32;
  void *v33;
  id v34;
  _BOOL4 v35;
  __int128 v36;
  CMTimeRange toRange;
  CMTimeRange fromRange;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  CMTimeRange time;
  CMTimeRange range;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[9];
  _OWORD v49[3];
  uint64_t v50;
  uint64_t v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v35 = a4;
  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (v5)
  {
    objc_msgSend(v5, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v7;
    v34 = v5;
    if (objc_msgSend(v7, "count"))
    {
      v8 = -[MOVStreamSampleTimeRangeBuffer initWithCapacity:]([MOVStreamSampleTimeRangeBuffer alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
      v9 = -[MOVStreamSampleTimeRangeBuffer initWithCapacity:]([MOVStreamSampleTimeRangeBuffer alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v60 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            if ((objc_msgSend(v15, "isEmpty") & 1) == 0)
            {
              if (v15)
              {
                objc_msgSend(v15, "timeMapping");
                if ((BYTE12(v56) & 1) != 0)
                {
                  objc_msgSend(v15, "timeMapping");
                  if ((v52 & 1) != 0)
                  {
                    objc_msgSend(v15, "timeMapping");
                    if (!v51)
                    {
                      objc_msgSend(v15, "timeMapping");
                      if ((v50 & 0x8000000000000000) == 0)
                      {
                        objc_msgSend(v15, "timeMapping");
                        v49[0] = v48[3];
                        v49[1] = v48[4];
                        v49[2] = v48[5];
                        -[MOVStreamSampleTimeRangeBuffer appendTimeRange:](v8, "appendTimeRange:", v49);
                        objc_msgSend(v15, "timeMapping");
                        v48[0] = v45;
                        v48[1] = v46;
                        v48[2] = v47;
                        -[MOVStreamSampleTimeRangeBuffer appendTimeRange:](v9, "appendTimeRange:", v48);
                      }
                    }
                  }
                }
              }
              else
              {
                v58 = 0u;
                v57 = 0u;
                v56 = 0u;
                v55 = 0u;
                v54 = 0u;
                v53 = 0u;
              }
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        }
        while (v12);
      }

      -[MOVStreamSampleTimeRangeBuffer timeRangeList](v8, "timeRangeList");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOVStreamSampleTimeRangeBuffer timeRangeList](v9, "timeRangeList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v33;
    }
    else
    {
      v17 = 0;
      v16 = 0;
    }
    objc_msgSend(v7, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    memset(&v44[32], 0, 96);
    if (v18)
      objc_msgSend(v18, "timeMapping");
    objc_msgSend(v5, "makeSampleCursorAtFirstSampleInDecodeOrder", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (v16)
        v21 = v17 == 0;
      else
        v21 = 1;
      v22 = !v21;
      p_restrictedTimeRange = &self->_restrictedTimeRange;
      v24 = (__int128 *)MEMORY[0x24BDC0D90];
      do
      {
        memset(v44, 0, 24);
        objc_msgSend(v20, "presentationTimeStamp");
        if (v22)
        {
          range.start = *(CMTime *)v44;
          v25 = objc_msgSend(v16, "indexOfTimeRangeAtTime:", &range);
          if ((v25 & 0x8000000000000000) == 0)
          {
            v26 = v25;
            memset(&range, 0, sizeof(range));
            objc_msgSend(v16, "timeRangeAtIndex:", v25);
            memset(&time, 0, sizeof(time));
            objc_msgSend(v17, "timeRangeAtIndex:", v26);
            v41 = *(CMTime *)v44;
            v39 = *(CMTime *)v44;
            fromRange = range;
            toRange = time;
            CMTimeMapTimeFromRangeToRange(&v40, &v39, &fromRange, &toRange);
            *(CMTime *)v44 = v40;
            fromRange = range;
            toRange = *(CMTimeRange *)&v44[32];
            if (!CMTimeRangeEqual(&fromRange, &toRange))
              -[MOVStreamTimestamps sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:].cold.1();
            fromRange = time;
            toRange = *(CMTimeRange *)&v44[80];
            if (!CMTimeRangeEqual(&fromRange, &toRange))
              -[MOVStreamTimestamps sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:].cold.2();
            memset(&v40, 0, sizeof(v40));
            v39 = v41;
            fromRange = *(CMTimeRange *)&v44[32];
            toRange = *(CMTimeRange *)&v44[80];
            CMTimeMapTimeFromRangeToRange(&v40, &v39, &fromRange, &toRange);
            fromRange.start = *(CMTime *)v44;
            toRange.start = v40;
            if (CMTimeCompare(&fromRange.start, &toRange.start))
              -[MOVStreamTimestamps sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:].cold.3();
          }
        }
        if ((v44[12] & 1) != 0)
        {
          v27 = *(_OWORD *)&p_restrictedTimeRange->start.epoch;
          *(_OWORD *)&range.start.value = *(_OWORD *)&p_restrictedTimeRange->start.value;
          *(_OWORD *)&range.start.epoch = v27;
          *(_OWORD *)&range.duration.timescale = *(_OWORD *)&p_restrictedTimeRange->duration.timescale;
          time.start = *(CMTime *)v44;
          if (CMTimeRangeContainsTime(&range, &time.start))
          {
            if (objc_msgSend(v6, "isEmpty"))
            {
              range.start = *(CMTime *)v44;
              v36 = *v24;
              *(_OWORD *)&time.start.value = *v24;
              v28 = *((_QWORD *)v24 + 2);
              time.start.epoch = v28;
              v29 = CMTimeCompare(&range.start, &time.start);
              v30 = v35;
              if (v35)
              {
                range.start = *(CMTime *)v44;
                *(_OWORD *)&time.start.value = v36;
                time.start.epoch = v28;
                v30 = CMTimeCompare(&range.start, &time.start) != 0;
              }
              if (v29 < 0 || v30)
              {
                *(_OWORD *)&range.start.value = v36;
                range.start.epoch = v28;
                objc_msgSend(v6, "appendTime:", &range);
              }
            }
            range.start = *(CMTime *)v44;
            *(_OWORD *)&time.start.value = *v24;
            time.start.epoch = *((_QWORD *)v24 + 2);
            if ((CMTimeCompare(&range.start, &time.start) & 0x80000000) == 0)
            {
              range.start = *(CMTime *)v44;
              objc_msgSend(v6, "appendTime:", &range);
            }
          }
        }
      }
      while (objc_msgSend(v20, "stepInPresentationOrderByCount:", 1));
    }

    v5 = v34;
  }

  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTimeForAssetTrack:(SEL)a3
{
  CMTimeRange range;
  CMTime v6;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x24BDC0D38];
  if (a4)
  {
    objc_msgSend(a4, "timeRange");
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeRangeGetEnd(&v6, &range);
    *(CMTime *)retstr = v6;
  }
  return self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldStartTimestampsAtZero
{
  return self->_shouldStartTimestampsAtZero;
}

- (BOOL)shouldAppendEndOfStreamTimestamp
{
  return self->_shouldAppendEndOfStreamTimestamp;
}

- (void)setTimeList:(id)a3
{
  objc_storeStrong((id *)&self->_timeList, a3);
}

- (AVAssetTrack)assetTrack
{
  return self->_assetTrack;
}

- (void)setAssetTrack:(id)a3
{
  objc_storeStrong((id *)&self->_assetTrack, a3);
}

- ($69C59A32909E13F94AB58097350E6BB9)restrictedTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setRestrictedTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_restrictedTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_restrictedTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_restrictedTimeRange.start.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetTrack, 0);
  objc_storeStrong((id *)&self->_timeList, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:.cold.1()
{
  __assert_rtn("-[MOVStreamTimestamps sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:]", "MOVStreamTimestamps.m", 184, "CMTimeRangeEqual(sourceRange, timeMapping.source)");
}

- (void)sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:.cold.2()
{
  __assert_rtn("-[MOVStreamTimestamps sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:]", "MOVStreamTimestamps.m", 185, "CMTimeRangeEqual(targetRange, timeMapping.target)");
}

- (void)sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:.cold.3()
{
  __assert_rtn("-[MOVStreamTimestamps sampleTimelineForAssetTrack:shouldStartTimestampsAtZero:]", "MOVStreamTimestamps.m", 188, "CMTIME_COMPARE_INLINE(pts, ==, pts0)");
}

@end
