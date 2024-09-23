@implementation VCPMetaSegment

- (VCPMetaSegment)init
{
  VCPMetaSegment *v2;
  VCPMetaSegment *v3;
  __int128 v4;
  __int128 v5;
  VCPMetaSegment *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPMetaSegment;
  v2 = -[VCPMetaSegment init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v5 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    v4 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
    *(_OWORD *)&v2->_timeRange.start.value = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)&v2->_timeRange.start.epoch = v5;
    *(_OWORD *)&v2->_timeRange.duration.timescale = v4;
    v2->_numOfFrames = 0;
    v6 = v2;
  }

  return v3;
}

- (void)updateSegment:(id *)a3
{
  CMTime v4;
  CMTime rhs;
  CMTime lhs;

  lhs = *(CMTime *)a3;
  rhs = (CMTime)self->_timeRange.start;
  CMTimeSubtract(&v4, &lhs, &rhs);
  self->_timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)v4;
  ++self->_numOfFrames;
}

- (void)resetSegment:(id *)a3
{
  __int128 v4;
  CMTime v5;
  CMTime start;
  CMTimeRange v7;

  start = *(CMTime *)a3;
  v5 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  CMTimeRangeMake(&v7, &start, &v5);
  v4 = *(_OWORD *)&v7.start.epoch;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v7.start.value;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v7.duration.timescale;
  self->_numOfFrames = 1;
}

- (void)mergeSegment:(id)a3
{
  id v4;
  __int128 v5;
  __int128 v6;
  CMTimeRange v7;
  CMTimeRange range;
  CMTimeRange v9;

  v4 = a3;
  self->_numOfFrames += objc_msgSend(v4, "numOfFrames");
  v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  if (v4)
    objc_msgSend(v4, "timeRange");
  else
    memset(&v7, 0, sizeof(v7));
  CMTimeRangeGetUnion(&v9, &range, &v7);
  v6 = *(_OWORD *)&v9.start.epoch;
  *(_OWORD *)&self->_timeRange.start.value = *(_OWORD *)&v9.start.value;
  *(_OWORD *)&self->_timeRange.start.epoch = v6;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&v9.duration.timescale;

}

- (void)finalizeAtTime:(id *)a3
{
  CMTime v4;
  CMTime rhs;
  CMTime lhs;

  lhs = *(CMTime *)a3;
  rhs = (CMTime)self->_timeRange.start;
  CMTimeSubtract(&v4, &lhs, &rhs);
  self->_timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)v4;
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var0;
  return self;
}

- (unint64_t)numOfFrames
{
  return self->_numOfFrames;
}

@end
