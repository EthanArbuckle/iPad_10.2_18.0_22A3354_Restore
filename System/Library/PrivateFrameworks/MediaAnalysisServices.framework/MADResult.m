@implementation MADResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADResult)init
{
  MADResult *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MADResult;
  result = -[MADResult init](&v5, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0CA2E40];
    v4 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    *(_OWORD *)&result->_timerange.start.value = *MEMORY[0x1E0CA2E40];
    *(_OWORD *)&result->_timerange.start.epoch = v4;
    *(_OWORD *)&result->_timerange.duration.timescale = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (unint64_t)executionNanoseconds
{
  return self->_executionNanoseconds;
}

- (void)setExecutionNanoseconds:(unint64_t)a3
{
  self->_executionNanoseconds = a3;
}

- (double)executionTimeInterval
{
  return (double)self->_executionNanoseconds / 1000000000.0;
}

- (MADResult)initWithCoder:(id)a3
{
  id v4;
  MADResult *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADResult;
  v5 = -[MADResult init](&v7, sel_init);
  if (v5)
  {
    v5->_timerange.start.value = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TimeRangeStartValue"));
    v5->_timerange.start.timescale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TimeRangeStartTimescale"));
    v5->_timerange.start.flags = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TimeRangeStartFlags"));
    v5->_timerange.start.epoch = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TimeRangeStartEpoch"));
    v5->_timerange.duration.value = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TimeRangeDurationValue"));
    v5->_timerange.duration.timescale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TimeRangeDurationTimescale"));
    v5->_timerange.duration.flags = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TimeRangeDurationFlags"));
    v5->_timerange.duration.epoch = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TimeRangeDurationEpoch"));
    v5->_executionNanoseconds = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ExecutionNanoseconds"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t value;
  id v5;

  value = self->_timerange.start.value;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", value, CFSTR("TimeRangeStartValue"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_timerange.start.timescale, CFSTR("TimeRangeStartTimescale"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_timerange.start.flags, CFSTR("TimeRangeStartFlags"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timerange.start.epoch, CFSTR("TimeRangeStartEpoch"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timerange.duration.value, CFSTR("TimeRangeDurationValue"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_timerange.duration.timescale, CFSTR("TimeRangeDurationTimescale"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_timerange.duration.flags, CFSTR("TimeRangeDurationFlags"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timerange.duration.epoch, CFSTR("TimeRangeDurationEpoch"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_executionNanoseconds, CFSTR("ExecutionNanoseconds"));

}

- ($7159EBE1BBBCDCA1B95AF1FC27B9DE98)timerange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var0;
  return self;
}

@end
