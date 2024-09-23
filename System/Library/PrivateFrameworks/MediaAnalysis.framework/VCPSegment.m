@implementation VCPSegment

- (VCPSegment)init
{
  VCPSegment *v2;
  VCPSegment *v3;
  uint64_t v4;
  __int128 v5;
  VCPSegment *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPSegment;
  v2 = -[VCPSegment init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x1E0CA2E50];
    v5 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)&v2->_timeRange.start.value = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)&v2->_timeRange.start.epoch = v5;
    *(_OWORD *)&v2->_timeRange.duration.timescale = *(_OWORD *)(v4 + 32);
    v2->_sumOfScore = 0.0;
    v2->_numOfFrames = 0;
    v2->_numOfValidFrames = 0;
    v6 = v2;
  }

  return v3;
}

- (VCPSegment)initWithTimestamp:(id *)a3 score:(float)a4 valid:(BOOL)a5
{
  _BOOL4 v5;
  VCPSegment *v8;
  __int128 v9;
  __int128 v10;
  VCPSegment *v11;
  CMTime v13;
  CMTime start;
  CMTimeRange v15;
  objc_super v16;

  v5 = a5;
  v16.receiver = self;
  v16.super_class = (Class)VCPSegment;
  v8 = -[VCPSegment init](&v16, sel_init);
  if (v8)
  {
    start = (CMTime)*a3;
    v13 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    CMTimeRangeMake(&v15, &start, &v13);
    v10 = *(_OWORD *)&v15.start.epoch;
    v9 = *(_OWORD *)&v15.duration.timescale;
    *(_OWORD *)&v8->_timeRange.start.value = *(_OWORD *)&v15.start.value;
    *(_OWORD *)&v8->_timeRange.start.epoch = v10;
    *(_OWORD *)&v8->_timeRange.duration.timescale = v9;
    v8->_numOfFrames = 1;
    if (v5)
    {
      v8->_numOfValidFrames = 1;
      v8->_sumOfScore = a4;
    }
    v11 = v8;
  }

  return v8;
}

- (void)updateWithFirstFrame:(id *)a3 score:(float)a4 valid:(BOOL)a5
{
  __int128 v5;
  __int128 v6;

  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    v5 = *(_OWORD *)&a3->var0.var0;
    v6 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&self->_timeRange.duration.timescale = v6;
    *(_OWORD *)&self->_timeRange.start.value = v5;
    self->_numOfFrames = 1;
    if (a5)
    {
      self->_numOfValidFrames = 1;
      self->_sumOfScore = a4;
    }
  }
}

- (void)updateSegment:(id *)a3 score:(float)a4 valid:(BOOL)a5
{
  _BOOL4 v5;
  __int128 v8;
  $95D729B680665BEAEFA1D6FCA8238556 start;
  CMTimeRange range;
  CMTime lhs;

  if ((a3->var0.var2 & 1) != 0
    && (a3->var1.var2 & 1) != 0
    && !a3->var1.var3
    && (a3->var1.var0 & 0x8000000000000000) == 0)
  {
    v5 = a5;
    v8 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&lhs, &range);
    start = self->_timeRange.start;
    CMTimeSubtract(&range.start, &lhs, (CMTime *)&start);
    self->_timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)range.start;
    ++self->_numOfFrames;
    if (v5)
    {
      ++self->_numOfValidFrames;
      self->_sumOfScore = self->_sumOfScore + a4;
    }
  }
}

- (void)mergeSegment:(id)a3
{
  id v4;
  float v5;
  float v6;
  __int128 v7;
  __int128 v8;
  CMTimeRange v9;
  CMTimeRange otherRange;
  CMTimeRange v11;

  v4 = a3;
  v5 = (float)(unint64_t)objc_msgSend(v4, "numOfFrames");
  objc_msgSend(v4, "score");
  self->_sumOfScore = self->_sumOfScore + (float)(v5 * v6);
  self->_numOfFrames += objc_msgSend(v4, "numOfFrames");
  self->_numOfValidFrames += objc_msgSend(v4, "numOfValidFrames");
  if (v4)
    objc_msgSend(v4, "timeRange");
  else
    memset(&otherRange, 0, sizeof(otherRange));
  v7 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&v9.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&v9.start.epoch = v7;
  *(_OWORD *)&v9.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  CMTimeRangeGetUnion(&v11, &v9, &otherRange);
  v8 = *(_OWORD *)&v11.start.epoch;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v11.start.value;
  *(_OWORD *)&self->_timeRange.start.epoch = v8;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v11.duration.timescale;

}

- (void)copyFrom:(id)a3
{
  id v4;
  float v5;
  float v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = a3;
  objc_msgSend(v4, "sumOfScore");
  self->_sumOfScore = v5;
  self->_numOfFrames = objc_msgSend(v4, "numOfFrames");
  self->_numOfValidFrames = objc_msgSend(v4, "numOfValidFrames");
  if (v4)
  {
    objc_msgSend(v4, "timeRange");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  *(_OWORD *)&self->_timeRange.start.value = v7;
  *(_OWORD *)&self->_timeRange.start.epoch = v8;
  *(_OWORD *)&self->_timeRange.duration.timescale = v9;
  objc_msgSend(v4, "curationScore", v7, v8, v9);
  self->_curationScore = v6;

}

- (void)updateDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 start;
  CMTime lhs;
  CMTime v6;

  lhs = *(CMTime *)a3;
  start = self->_timeRange.start;
  CMTimeSubtract(&v6, &lhs, (CMTime *)&start);
  self->_timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)v6;
}

- (void)trimSegment:(id *)a3 fromStart:(BOOL)a4
{
  $3C33A24319B208EC3024E724BAC5FA63 *p_timeRange;
  $95D729B680665BEAEFA1D6FCA8238556 *p_duration;
  __int128 v7;
  __int128 v8;
  CMTime v9;
  CMTime rhs;
  CMTimeRange range;
  CMTime lhs;

  p_timeRange = &self->_timeRange;
  p_duration = &self->_timeRange.duration;
  if (a4)
  {
    v7 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&p_timeRange->start.value;
    *(_OWORD *)&range.start.epoch = v7;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    CMTimeRangeGetEnd(&lhs, &range);
    rhs = (CMTime)*a3;
    CMTimeSubtract(&range.start, &lhs, &rhs);
    *(_OWORD *)&p_duration->value = *(_OWORD *)&range.start.value;
    p_duration->epoch = range.start.epoch;
    v8 = *(_OWORD *)&a3->var0;
    p_timeRange->start.epoch = a3->var3;
    *(_OWORD *)&p_timeRange->start.value = v8;
  }
  else
  {
    rhs = *(CMTime *)a3;
    *(_OWORD *)&v9.value = *(_OWORD *)&p_timeRange->start.value;
    v9.epoch = self->_timeRange.start.epoch;
    CMTimeSubtract(&range.start, &rhs, &v9);
    *(_OWORD *)&p_duration->value = *(_OWORD *)&range.start.value;
    p_duration->epoch = range.start.epoch;
  }
}

- (BOOL)isContentTooShort
{
  $95D729B680665BEAEFA1D6FCA8238556 duration;

  duration = self->_timeRange.duration;
  return CMTimeGetSeconds((CMTime *)&duration) < 0.5;
}

- (float)score
{
  unint64_t numOfValidFrames;

  numOfValidFrames = self->_numOfValidFrames;
  if (numOfValidFrames)
    return self->_sumOfScore / (float)numOfValidFrames;
  else
    return 0.0;
}

- (float)sumOfScore
{
  return self->_sumOfScore;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (unint64_t)numOfFrames
{
  return self->_numOfFrames;
}

- (unint64_t)numOfValidFrames
{
  return self->_numOfValidFrames;
}

- (float)curationScore
{
  return self->_curationScore;
}

- (void)setCurationScore:(float)a3
{
  self->_curationScore = a3;
}

@end
