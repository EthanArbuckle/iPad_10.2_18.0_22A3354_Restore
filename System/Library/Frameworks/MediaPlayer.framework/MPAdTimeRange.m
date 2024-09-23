@implementation MPAdTimeRange

- (MPAdTimeRange)initWithTimeRange:(CMTimeRange *)timeRange
{
  MPAdTimeRange *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPAdTimeRange;
  result = -[MPAdTimeRange init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&timeRange->start.value;
    v6 = *(_OWORD *)&timeRange->start.epoch;
    *(_OWORD *)&result->_timeRange.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
    *(_OWORD *)&result->_timeRange.start.epoch = v6;
    *(_OWORD *)&result->_timeRange.start.value = v5;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  CMTimeRange v7;
  CMTimeRange range1;

  v4 = a3;
  -[MPAdTimeRange timeRange](self, "timeRange");
  if (v4)
    objc_msgSend(v4, "timeRange");
  else
    memset(&v7, 0, sizeof(v7));
  v5 = CMTimeRangeEqual(&range1, &v7) != 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPAdTimeRange *v4;
  __int128 v5;
  __int128 v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v4 = objc_alloc_init(MPAdTimeRange);
  -[MPAdTimeRange timeRange](self, "timeRange");
  v5 = v8;
  v6 = v9;
  *(_OWORD *)&v4->_timeRange.duration.timescale = v10;
  *(_OWORD *)&v4->_timeRange.start.epoch = v6;
  *(_OWORD *)&v4->_timeRange.start.value = v5;
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFAllocator *v6;
  __CFString *v7;
  void *v8;
  CMTimeRange range;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[MPAdTimeRange timeRange](self, "timeRange");
  v7 = (__CFString *)CMTimeRangeCopyDescription(v6, &range);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %@=%@>"), v5, self, CFSTR("timeRange"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CMTimeRange)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->duration.value;
  *(_OWORD *)&retstr->start.value = *(_OWORD *)&self->start.timescale;
  *(_OWORD *)&retstr->start.epoch = v3;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)&self->duration.epoch;
  return self;
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&timeRange->start.value;
  v4 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

@end
