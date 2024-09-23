@implementation AVFrameRateRange

- (CMTime)minFrameDuration
{
  return CMTimeMake(retstr, 1, self->_internal->maxFrameRate);
}

- (CMTime)maxFrameDuration
{
  return CMTimeMake(retstr, 1, self->_internal->minFrameRate);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int v7;
  CMTime v9;
  CMTime time1;
  CMTime time2;
  CMTime v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 == self)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  v13 = v3;
  v14 = v4;
  v7 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v7)
    return v7;
  if (a3)
  {
    objc_msgSend(a3, "maxFrameDuration");
    if (self)
    {
LABEL_5:
      -[AVFrameRateRange maxFrameDuration](self, "maxFrameDuration");
      goto LABEL_9;
    }
  }
  else
  {
    memset(&v12, 0, sizeof(v12));
    if (self)
      goto LABEL_5;
  }
  memset(&time2, 0, sizeof(time2));
LABEL_9:
  if (CMTimeCompare(&v12, &time2))
  {
LABEL_16:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (!a3)
  {
    memset(&time1, 0, sizeof(time1));
    if (self)
      goto LABEL_12;
LABEL_14:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_15;
  }
  objc_msgSend(a3, "minFrameDuration");
  if (!self)
    goto LABEL_14;
LABEL_12:
  -[AVFrameRateRange minFrameDuration](self, "minFrameDuration");
LABEL_15:
  if (CMTimeCompare(&time1, &v9))
    goto LABEL_16;
  LOBYTE(v7) = 1;
  return v7;
}

- (Float64)maxFrameRate
{
  return (double)self->_internal->maxFrameRate;
}

- (Float64)minFrameRate
{
  return (double)self->_internal->minFrameRate;
}

+ (AVFrameRateRange)frameRateRangeWithMinRate:(int)a3 maxFrameRate:(int)a4
{
  return (AVFrameRateRange *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMinFrameRate:maxFrameRate:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (AVFrameRateRange)initWithMinFrameRate:(int)a3 maxFrameRate:(int)a4
{
  AVFrameRateRange *v6;
  AVFrameRateRangeInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVFrameRateRange;
  v6 = -[AVFrameRateRange init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVFrameRateRangeInternal);
    v6->_internal = v7;
    if (v7)
    {
      v7->minFrameRate = a3;
      v6->_internal->maxFrameRate = a4;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFrameRateRange;
  -[AVFrameRateRange dealloc](&v3, sel_dealloc);
}

- (BOOL)includesFrameRate:(double)a3
{
  AVFrameRateRangeInternal *internal;

  internal = self->_internal;
  return (double)internal->maxFrameRate >= a3 && (double)internal->minFrameRate <= a3;
}

- (BOOL)includesFrameDuration:(id *)a3
{
  return -[AVFrameRateRange includesFrameRate:](self, "includesFrameRate:", (double)a3->var1 / (double)a3->var0);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %d - %d>"), NSStringFromClass(v4), self, self->_internal->minFrameRate, self->_internal->maxFrameRate);
}

@end
