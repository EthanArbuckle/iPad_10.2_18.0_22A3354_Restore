@implementation BWTimeSkew

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)native
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var1;
  return self;
}

- (BOOL)isBracketFrame
{
  return self->_isBracketFrame;
}

- (BWTimeSkew)initWithNativeTime:(id *)a3 originalTime:(id *)a4 isBracketFrame:(BOOL)a5 isSISFrame:(BOOL)a6
{
  BWTimeSkew *result;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BWTimeSkew;
  result = -[BWTimeSkew init](&v14, sel_init);
  if (result)
  {
    v11 = *(_OWORD *)&a3->var0;
    result->_native.epoch = a3->var3;
    *(_OWORD *)&result->_native.value = v11;
    v12 = *(_OWORD *)&a4->var0;
    result->_original.epoch = a4->var3;
    *(_OWORD *)&result->_original.value = v12;
    v13 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&result->_adjusted.value = *MEMORY[0x1E0CA2E18];
    result->_adjusted.epoch = *(_QWORD *)(v13 + 16);
    result->_isBracketFrame = a5;
    result->_isSISFrame = a6;
    result->_isStartOfDiscontinuity = 0;
  }
  return result;
}

- (BOOL)isStartOfDiscontinuity
{
  return self->_isStartOfDiscontinuity;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  int64_t epoch;
  int64_t v7;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = *(_OWORD *)&self->_native.value;
  *((_QWORD *)result + 3) = self->_native.epoch;
  *(_OWORD *)((char *)result + 8) = v5;
  epoch = self->_original.epoch;
  *((_OWORD *)result + 2) = *(_OWORD *)&self->_original.value;
  *((_QWORD *)result + 6) = epoch;
  v7 = self->_adjusted.epoch;
  *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_adjusted.value;
  *((_QWORD *)result + 9) = v7;
  *((_BYTE *)result + 80) = self->_isBracketFrame;
  *((_BYTE *)result + 81) = self->_isSISFrame;
  *((_BYTE *)result + 82) = self->_isStartOfDiscontinuity;
  return result;
}

- (id)description
{
  void *v3;
  Float64 Seconds;
  Float64 v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMTime time;

  v3 = (void *)MEMORY[0x1E0CB3940];
  time = (CMTime)self->_native;
  Seconds = CMTimeGetSeconds(&time);
  time = (CMTime)self->_original;
  v5 = CMTimeGetSeconds(&time);
  time = (CMTime)self->_adjusted;
  v6 = CMTimeGetSeconds(&time);
  if (self->_isStartOfDiscontinuity)
    v7 = 84;
  else
    v7 = 70;
  if (self->_isSISFrame)
    v8 = 84;
  else
    v8 = 70;
  if (self->_isBracketFrame)
    v9 = 84;
  else
    v9 = 70;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%.4lf:%.4lf:%.4lf:Bracket=%c:SIS=%c:StartsDiscontinuity:%c"), *(_QWORD *)&Seconds, *(_QWORD *)&v5, *(_QWORD *)&v6, v9, v8, v7);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)original
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)adjusted
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setAdjusted:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_adjusted.epoch = a3->var3;
  *(_OWORD *)&self->_adjusted.value = v3;
}

- (BOOL)isSISFrame
{
  return self->_isSISFrame;
}

- (void)setIsStartOfDiscontinuity:(BOOL)a3
{
  self->_isStartOfDiscontinuity = a3;
}

@end
