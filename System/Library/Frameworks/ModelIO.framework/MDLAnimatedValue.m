@implementation MDLAnimatedValue

- (MDLAnimatedValue)init
{
  MDLAnimatedValue *v2;
  MDLAnimatedValue *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MDLAnimatedValue;
  v2 = -[MDLAnimatedValue init](&v5, sel_init);
  if (v2)
  {
    sub_1DCAD5E24();
    v2->_interpolation = 1;
    v3 = v2;
  }

  return v2;
}

- (void)resetWithAnimatedValue:(id)a3
{
  id v4;

  v4 = a3;
  sub_1DCBD676C((uint64_t **)&self->_timeSampledData, (uint64_t **)v4 + 1);
  self->_interpolation = *((_QWORD *)v4 + 4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  *(_QWORD *)(v10 + 32) = self->_interpolation;
  sub_1DCBD676C((uint64_t **)(v10 + 8), (uint64_t **)&self->_timeSampledData);
  return (id)v10;
}

- (MDLDataPrecision)precision
{
  return 0;
}

- (VtValue)defaultVtValue
{
  uint64_t v2;
  VtValue result;

  *(_QWORD *)(v2 + 8) = 0;
  result._info._ptrAndBits = (_TypeInfo *)a2;
  result._storage = (type)self;
  return result;
}

- (NSUInteger)timeSampleCount
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - self->_timeSampledData.__begin_) >> 3);
}

- (NSTimeInterval)minimumTime
{
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  NSTimeInterval result;
  double v5;
  double v6;

  begin = self->_timeSampledData.__begin_;
  end = self->_timeSampledData.__end_;
  if (end == begin)
    return 0.0;
  result = 1000000000.0;
  do
  {
    v5 = *(double *)begin;
    begin = (TimeSampledVtValue *)((char *)begin + 24);
    v6 = v5;
    if (v5 < result)
      result = v6;
  }
  while (begin != end);
  return result;
}

- (NSTimeInterval)maximumTime
{
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  NSTimeInterval result;
  double v5;
  double v6;

  begin = self->_timeSampledData.__begin_;
  end = self->_timeSampledData.__end_;
  if (end == begin)
    return 0.0;
  result = -1000000000.0;
  do
  {
    v5 = *(double *)begin;
    begin = (TimeSampledVtValue *)((char *)begin + 24);
    v6 = v5;
    if (v5 > result)
      result = v6;
  }
  while (begin != end);
  return result;
}

- (void)clear
{
  TimeSampledVtValue *end;
  TimeSampledVtValue *begin;
  TimeSampledVtValue *v5;

  begin = self->_timeSampledData.__begin_;
  end = self->_timeSampledData.__end_;
  if (end != begin)
  {
    do
    {
      v5 = (TimeSampledVtValue *)((char *)end - 24);
      sub_1DCAEEE2C((uint64_t)end - 16);
      end = v5;
    }
    while (v5 != begin);
  }
  self->_timeSampledData.__end_ = begin;
}

- (NSArray)keyTimes
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  v3 = (void *)objc_opt_new();
  if (self->_timeSampledData.__end_ != self->_timeSampledData.__begin_)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v9 = (void *)objc_msgSend_initWithDouble_(v6, v7, v8, *(double *)((char *)self->_timeSampledData.__begin_ + v4));
      objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

      ++v5;
      v4 += 24;
    }
    while (v5 < 0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - self->_timeSampledData.__begin_) >> 3));
  }
  return (NSArray *)v3;
}

- (NSUInteger)getTimes:(NSTimeInterval *)timesArray maxCount:(NSUInteger)maxCount
{
  TimeSampledVtValue *begin;
  NSUInteger result;
  NSUInteger v6;
  uint64_t v7;

  begin = self->_timeSampledData.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - begin) >> 3) >= maxCount)
    result = maxCount;
  else
    result = 0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - begin) >> 3);
  if (result)
  {
    v6 = result;
    do
    {
      v7 = *(_QWORD *)begin;
      begin = (TimeSampledVtValue *)((char *)begin + 24);
      *(_QWORD *)timesArray++ = v7;
      --v6;
    }
    while (v6);
  }
  return result;
}

- (BOOL)isAnimated
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_timeSampledData.__end_ - self->_timeSampledData.__begin_) >> 3) > 1;
}

- (MDLAnimatedValueInterpolation)interpolation
{
  return self->_interpolation;
}

- (void)setInterpolation:(MDLAnimatedValueInterpolation)interpolation
{
  self->_interpolation = interpolation;
}

- (void).cxx_destruct
{
  TimeSampledVtValue *begin;
  TimeSampledVtValue *end;
  TimeSampledVtValue *v5;
  TimeSampledVtValue *v6;

  begin = self->_timeSampledData.__begin_;
  if (begin)
  {
    end = self->_timeSampledData.__end_;
    v5 = self->_timeSampledData.__begin_;
    if (end != begin)
    {
      do
      {
        v6 = (TimeSampledVtValue *)((char *)end - 24);
        sub_1DCAEEE2C((uint64_t)end - 16);
        end = v6;
      }
      while (v6 != begin);
      v5 = self->_timeSampledData.__begin_;
    }
    self->_timeSampledData.__end_ = begin;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
