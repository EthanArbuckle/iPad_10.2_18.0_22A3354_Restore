@implementation FlexTestingContext

- (FlexTestingContext)init
{
  FlexTestingContext *v2;
  FlexTestingContext *v3;
  uint64_t v4;
  NSCountedSet *removedConflicts;
  uint64_t v6;
  __int128 v7;
  int64_t v8;
  __int128 v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FlexTestingContext;
  v2 = -[FlexTestingContext init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_timedOut = 0;
    v2->_usingPreventedOutro = 0;
    v2->_maxPassesToFit = 0;
    v4 = objc_opt_new();
    removedConflicts = v3->_removedConflicts;
    v3->_removedConflicts = (NSCountedSet *)v4;

    v6 = MEMORY[0x24BDC0D88];
    v7 = *MEMORY[0x24BDC0D88];
    *(_OWORD *)&v3->_maxSilenceDurationTime.value = *MEMORY[0x24BDC0D88];
    v8 = *(_QWORD *)(v6 + 16);
    v3->_maxSilenceDurationTime.epoch = v8;
    *(_QWORD *)&v9 = -1;
    *((_QWORD *)&v9 + 1) = -1;
    *(_OWORD *)&v3->_maxSilenceDuration = v9;
    *(_OWORD *)&v3->_maxSilenceUnderSetDurationTime.value = v7;
    v3->_maxSilenceUnderSetDurationTime.epoch = v8;
    *(_OWORD *)&v3->_maxSilencePercentageTime.value = v7;
    v3->_maxSilencePercentageTime.epoch = v8;
    v3->_maxSilencePercentage = 0.0;
    v3->_minOutroDuration = -1;
    *(_OWORD *)&v3->_minOutroDurationTime.value = v7;
    v3->_minOutroDurationTime.epoch = v8;
  }
  return v3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (BOOL)usingPreventedIntro
{
  return self->_usingPreventedIntro;
}

- (void)setUsingPreventedIntro:(BOOL)a3
{
  self->_usingPreventedIntro = a3;
}

- (BOOL)usingPreventedOutro
{
  return self->_usingPreventedOutro;
}

- (void)setUsingPreventedOutro:(BOOL)a3
{
  self->_usingPreventedOutro = a3;
}

- (int64_t)maxPassesToFit
{
  return self->_maxPassesToFit;
}

- (void)setMaxPassesToFit:(int64_t)a3
{
  self->_maxPassesToFit = a3;
}

- (NSCountedSet)removedConflicts
{
  return self->_removedConflicts;
}

- (void)setRemovedConflicts:(id)a3
{
  objc_storeStrong((id *)&self->_removedConflicts, a3);
}

- (int64_t)maxSilenceDuration
{
  return self->_maxSilenceDuration;
}

- (void)setMaxSilenceDuration:(int64_t)a3
{
  self->_maxSilenceDuration = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxSilenceDurationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setMaxSilenceDurationTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maxSilenceDurationTime.epoch = a3->var3;
  *(_OWORD *)&self->_maxSilenceDurationTime.value = v3;
}

- (int64_t)maxSilenceUnderSetDuration
{
  return self->_maxSilenceUnderSetDuration;
}

- (void)setMaxSilenceUnderSetDuration:(int64_t)a3
{
  self->_maxSilenceUnderSetDuration = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxSilenceUnderSetDurationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void)setMaxSilenceUnderSetDurationTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maxSilenceUnderSetDurationTime.epoch = a3->var3;
  *(_OWORD *)&self->_maxSilenceUnderSetDurationTime.value = v3;
}

- (double)maxSilencePercentage
{
  return self->_maxSilencePercentage;
}

- (void)setMaxSilencePercentage:(double)a3
{
  self->_maxSilencePercentage = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxSilencePercentageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (void)setMaxSilencePercentageTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maxSilencePercentageTime.epoch = a3->var3;
  *(_OWORD *)&self->_maxSilencePercentageTime.value = v3;
}

- (int64_t)minOutroDuration
{
  return self->_minOutroDuration;
}

- (void)setMinOutroDuration:(int64_t)a3
{
  self->_minOutroDuration = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minOutroDurationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (void)setMinOutroDurationTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_minOutroDurationTime.epoch = a3->var3;
  *(_OWORD *)&self->_minOutroDurationTime.value = v3;
}

- (BOOL)sequencingLongSong
{
  return self->_sequencingLongSong;
}

- (void)setSequencingLongSong:(BOOL)a3
{
  self->_sequencingLongSong = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedConflicts, 0);
}

@end
