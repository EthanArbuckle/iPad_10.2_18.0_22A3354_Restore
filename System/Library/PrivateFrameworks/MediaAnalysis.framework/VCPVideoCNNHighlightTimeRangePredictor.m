@implementation VCPVideoCNNHighlightTimeRangePredictor

- (VCPVideoCNNHighlightTimeRangePredictor)initWithHightlightEnabled:(BOOL)a3 postInference:(BOOL)a4 minProcessingInterval:(float)a5 startTime:(id *)a6
{
  VCPVideoCNNHighlightTimeRangePredictor *result;
  int64_t v11;
  uint64_t v12;
  int64_t var3;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VCPVideoCNNHighlightTimeRangePredictor;
  result = -[VCPVideoCNNHighlightTimeRangePredictor init](&v14, sel_init);
  if (result)
  {
    result->_enableHighlight = a3;
    result->_postInference = a4;
    result->_enoughFrames = 0;
    result->_validFrames = 0;
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
    *(_OWORD *)&result->_timeLastProcess.value = *MEMORY[0x1E0CA2E28];
    result->_timeLastProcess.epoch = v11;
    v12 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->_timeLastDetection.value = *MEMORY[0x1E0CA2E18];
    result->_timeLastDetection.epoch = *(_QWORD *)(v12 + 16);
    var3 = a6->var3;
    *(_OWORD *)&result->_timeStart.value = *(_OWORD *)&a6->var0;
    result->_timeStart.epoch = var3;
    result->_minProcessingInterval = a5;
  }
  return result;
}

- (BOOL)needsAnalysisResultsAtTime:(id *)a3
{
  CMTime time;
  CMTime rhs;
  CMTime lhs;

  if (self->_enableHighlight
    && self->_validFrames >= 15
    && (lhs = *(CMTime *)a3,
        rhs = (CMTime)self->_timeLastProcess,
        CMTimeSubtract(&time, &lhs, &rhs),
        CMTimeGetSeconds(&time) >= 0.125))
  {
    return self->_timeLastDetection.flags & 1;
  }
  else
  {
    return 0;
  }
}

- ($C7CBA4C8288BA02ADCCB8E56B4665FF4)timeRangeAtTime:(SEL)a3
{
  $C7CBA4C8288BA02ADCCB8E56B4665FF4 *result;
  uint64_t v8;
  __int128 v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  CMTime start;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v12 = *a4;
  result = ($C7CBA4C8288BA02ADCCB8E56B4665FF4 *)-[VCPVideoCNNHighlightTimeRangePredictor needsAnalysisResultsAtTime:](self, "needsAnalysisResultsAtTime:", &v12);
  if ((_DWORD)result)
  {
    start = (CMTime)self->_timeLastDetection;
    v10 = *a4;
    return ($C7CBA4C8288BA02ADCCB8E56B4665FF4 *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, (CMTime *)&v10);
  }
  else
  {
    v8 = MEMORY[0x1E0CA2E40];
    v9 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&retstr->var0.var3 = v9;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v8 + 32);
  }
  return result;
}

- (void)updateForTime:(id *)a3
{
  _BOOL4 v5;
  $95D729B680665BEAEFA1D6FCA8238556 *p_timeLastDetection;
  __int128 v7;
  int validFrames;
  __int128 v9;
  __int128 v10;
  CMTime time;
  CMTime rhs;
  CMTime lhs;

  lhs = *(CMTime *)a3;
  rhs = (CMTime)self->_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) < self->_minProcessingInterval
    || (lhs = (CMTime)*a3, rhs = (CMTime)self->_timeStart, CMTimeCompare(&lhs, &rhs) < 0))
  {
    v5 = 0;
  }
  else
  {
    v5 = !self->_enoughFrames || !self->_postInference;
  }
  p_timeLastDetection = &self->_timeLastDetection;
  if ((self->_timeLastDetection.flags & 1) == 0)
  {
    v7 = *(_OWORD *)&a3->var0;
    self->_timeLastDetection.epoch = a3->var3;
    *(_OWORD *)&p_timeLastDetection->value = v7;
  }
  if (v5)
  {
    validFrames = self->_validFrames;
    self->_validFrames = validFrames + 1;
    if (validFrames >= 15)
    {
      self->_enoughFrames = 1;
      if (!self->_postInference)
      {
        self->_enoughFrames = 0;
        self->_validFrames = 0;
        v9 = *(_OWORD *)&a3->var0;
        self->_timeLastDetection.epoch = a3->var3;
        *(_OWORD *)&p_timeLastDetection->value = v9;
      }
    }
    v10 = *(_OWORD *)&a3->var0;
    self->_timeLastProcess.epoch = a3->var3;
    *(_OWORD *)&self->_timeLastProcess.value = v10;
  }
}

@end
