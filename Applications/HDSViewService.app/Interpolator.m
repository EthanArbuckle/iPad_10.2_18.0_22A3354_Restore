@implementation Interpolator

- (Interpolator)init
{
  Interpolator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)Interpolator;
  result = -[Interpolator init](&v3, "init");
  if (result)
  {
    result->_interpolatedLength = 0;
    result->_interpolatedValues = 0;
    result->_interpolatedTimes = 0;
  }
  return result;
}

- (void)dealloc
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *interpolatedTimes;
  float *interpolatedValues;
  objc_super v5;

  interpolatedTimes = self->_interpolatedTimes;
  if (interpolatedTimes)
    free(interpolatedTimes);
  interpolatedValues = self->_interpolatedValues;
  if (interpolatedValues)
    free(interpolatedValues);
  v5.receiver = self;
  v5.super_class = (Class)Interpolator;
  -[Interpolator dealloc](&v5, "dealloc");
}

- (void)interpolateData:(float *)a3 atTimes:(id *)a4 andLength:(unsigned int)a5 toRate:(float)a6
{
  unsigned int interpolatedLength;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *interpolatedTimes;
  uint64_t v13;
  int v14;
  unint64_t v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v16;
  __int128 v17;
  unint64_t v18;
  CMTime v19;
  CMTime v20;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v24;

  v24 = *(CMTime *)a4;
  lhs = (CMTime)a4[a5 - 1];
  rhs = *(CMTime *)a4;
  CMTimeSubtract(&time, &lhs, &rhs);
  interpolatedLength = (CMTimeGetSeconds(&time) * a6 + 0.5) + 1;
  interpolatedTimes = self->_interpolatedTimes;
  if (!interpolatedTimes || self->_interpolatedLength != interpolatedLength)
  {
    self->_interpolatedLength = interpolatedLength;
    self->_interpolatedTimes = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)malloc_type_realloc(interpolatedTimes, 24 * interpolatedLength, 0x1000040504FFAC1uLL);
    self->_interpolatedValues = (float *)malloc_type_realloc(self->_interpolatedValues, 4 * self->_interpolatedLength, 0x100004052888210uLL);
    interpolatedLength = self->_interpolatedLength;
  }
  if (interpolatedLength)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    do
    {
      memset(&lhs, 0, sizeof(lhs));
      CMTimeMake(&lhs, v14 & 0xFFFFFFFE, (int)(float)(a6 * 10.0));
      v16 = &self->_interpolatedTimes[v13];
      v20 = v24;
      v19 = lhs;
      CMTimeAdd(&rhs, &v20, &v19);
      v17 = *(_OWORD *)&rhs.value;
      v16->var3 = rhs.epoch;
      *(_OWORD *)&v16->var0 = v17;
      ++v15;
      v18 = self->_interpolatedLength;
      v14 += 10;
      ++v13;
    }
    while (v15 < v18);
  }
  else
  {
    LODWORD(v18) = 0;
  }
  sub_1000088FC((CMTime *)a4, (uint64_t)a3, a5, (uint64_t)self->_interpolatedTimes, v18, (uint64_t)self->_interpolatedValues);
}

- (float)interpolatedValues
{
  return self->_interpolatedValues;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)interpolatedTimes
{
  return self->_interpolatedTimes;
}

- (unsigned)interpolatedLength
{
  return self->_interpolatedLength;
}

@end
