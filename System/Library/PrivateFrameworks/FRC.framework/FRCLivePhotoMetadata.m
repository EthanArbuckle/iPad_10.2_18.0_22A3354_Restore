@implementation FRCLivePhotoMetadata

- (int64_t)frameIndex
{
  return self->_frameIndex;
}

- (void)setFrameIndex:(int64_t)a3
{
  self->_frameIndex = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (BOOL)isIDR
{
  return self->_isIDR;
}

- (void)setIsIDR:(BOOL)a3
{
  self->_isIDR = a3;
}

- (BOOL)interpolated
{
  return self->_interpolated;
}

- (void)setInterpolated:(BOOL)a3
{
  self->_interpolated = a3;
}

- (BOOL)noRecipeGap
{
  return self->_noRecipeGap;
}

- (void)setNoRecipeGap:(BOOL)a3
{
  self->_noRecipeGap = a3;
}

- (unint64_t)ptsInNanos
{
  return self->_ptsInNanos;
}

- (void)setPtsInNanos:(unint64_t)a3
{
  self->_ptsInNanos = a3;
}

- (unint64_t)originalPTSInNanos
{
  return self->_originalPTSInNanos;
}

- (void)setOriginalPTSInNanos:(unint64_t)a3
{
  self->_originalPTSInNanos = a3;
}

- (int64_t)sequenceAdjusterRecipe
{
  return self->_sequenceAdjusterRecipe;
}

- (void)setSequenceAdjusterRecipe:(int64_t)a3
{
  self->_sequenceAdjusterRecipe = a3;
}

- (int64_t)sequenceAdjusterDisplacement
{
  return self->_sequenceAdjusterDisplacement;
}

- (void)setSequenceAdjusterDisplacement:(int64_t)a3
{
  self->_sequenceAdjusterDisplacement = a3;
}

@end
