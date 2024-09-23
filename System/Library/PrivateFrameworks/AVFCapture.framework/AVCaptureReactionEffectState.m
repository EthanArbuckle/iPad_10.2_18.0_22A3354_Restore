@implementation AVCaptureReactionEffectState

- (AVCaptureReactionEffectState)initWithReactionType:(id)a3 startTime:(id *)a4
{
  __int128 v5;
  uint64_t v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a4;
  v5 = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  return -[AVCaptureReactionEffectState initWithReactionType:startTime:endTime:](self, "initWithReactionType:startTime:endTime:", a3, &v7, &v5);
}

- (AVCaptureReactionEffectState)initWithReactionType:(id)a3 startTime:(id *)a4 endTime:(id *)a5
{
  char *v8;
  int64_t var3;
  __int128 v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVCaptureReactionEffectState;
  v8 = -[AVCaptureReactionEffectState init](&v12, sel_init);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = a3;
    var3 = a4->var3;
    *((_OWORD *)v8 + 1) = *(_OWORD *)&a4->var0;
    *((_QWORD *)v8 + 4) = var3;
    v10 = *(_OWORD *)&a5->var0;
    *((_QWORD *)v8 + 7) = a5->var3;
    *(_OWORD *)(v8 + 40) = v10;
  }
  return (AVCaptureReactionEffectState *)v8;
}

- (id)initFromDictionary:(id)a3
{
  char *v4;
  id v5;
  Float64 v6;
  CMTimeEpoch epoch;
  void *v8;
  _OWORD *v9;
  Float64 v10;
  uint64_t v11;
  CMTime v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVCaptureReactionEffectState;
  v4 = -[AVCaptureReactionEffectState init](&v14, sel_init);
  if (v4)
  {
    v5 = (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ReactionType"));
    *((_QWORD *)v4 + 1) = v5;
    if (!v5)
      goto LABEL_6;
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StartTime")), "doubleValue");
    CMTimeMakeWithSeconds(&v13, v6, 1000000000);
    epoch = v13.epoch;
    *((_OWORD *)v4 + 1) = *(_OWORD *)&v13.value;
    *((_QWORD *)v4 + 4) = epoch;
    if ((v4[28] & 1) == 0)
      goto LABEL_6;
    v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("EndTime"));
    v9 = v4 + 40;
    if (!v8)
    {
      v11 = MEMORY[0x1E0CA2E18];
      *v9 = *MEMORY[0x1E0CA2E18];
      *((_QWORD *)v4 + 7) = *(_QWORD *)(v11 + 16);
      return v4;
    }
    objc_msgSend(v8, "doubleValue");
    CMTimeMakeWithSeconds(&v13, v10, 1000000000);
    *v9 = *(_OWORD *)&v13.value;
    *((_QWORD *)v4 + 7) = v13.epoch;
    if ((v4[52] & 1) == 0)
    {
LABEL_6:

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureReactionEffectState;
  -[AVCaptureReactionEffectState dealloc](&v3, sel_dealloc);
}

- (id)dictionaryRepresentation
{
  NSString *reactionType;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  $95D729B680665BEAEFA1D6FCA8238556 startTime;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if ((self->_endTime.flags & 1) != 0)
  {
    v13[0] = self->_reactionType;
    v12[0] = CFSTR("ReactionType");
    v12[1] = CFSTR("StartTime");
    startTime = self->_startTime;
    v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds((CMTime *)&startTime));
    v12[2] = CFSTR("EndTime");
    startTime = self->_endTime;
    v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds((CMTime *)&startTime));
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v13;
    v6 = v12;
    v7 = 3;
  }
  else
  {
    reactionType = self->_reactionType;
    v10[1] = CFSTR("StartTime");
    v11[0] = reactionType;
    startTime = self->_startTime;
    v10[0] = CFSTR("ReactionType");
    v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds((CMTime *)&startTime));
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v11;
    v6 = v10;
    v7 = 2;
  }
  return (id)objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, v7);
}

- (id)description
{
  const __CFString *v3;
  NSString *reactionType;
  CMTime time;

  if ((self->_endTime.flags & 1) != 0)
  {
    time = (CMTime)self->_endTime;
    v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.4f"), CMTimeGetSeconds(&time));
  }
  else
  {
    v3 = CFSTR("...");
  }
  reactionType = self->_reactionType;
  time = (CMTime)self->_startTime;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[AVCaptureReactionEffectState(%p): %@ %.4f - %@]"), self, reactionType, CMTimeGetSeconds(&time), v3);
}

- (AVCaptureReactionType)reactionType
{
  return self->_reactionType;
}

- (CMTime)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->epoch;
  return self;
}

- (CMTime)endTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setEndTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_endTime.epoch = a3->var3;
  *(_OWORD *)&self->_endTime.value = v3;
}

@end
