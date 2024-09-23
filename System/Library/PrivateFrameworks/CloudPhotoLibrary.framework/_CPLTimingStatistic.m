@implementation _CPLTimingStatistic

- (void)updateWithDuration:(double)a3 recordCount:(unint64_t)a4 error:(BOOL)a5 cancelled:(BOOL)a6
{
  int64x2_t v6;

  if (a3 >= 0.0)
  {
    v6 = vdupq_n_s64(1uLL);
    v6.i64[0] = a4;
    *(int64x2_t *)&self->_recordCount = vaddq_s64(*(int64x2_t *)&self->_recordCount, v6);
    if (a5)
      ++self->_errorCount;
    if (a6)
      ++self->_cancelCount;
    self->_duration = self->_duration + a3;
  }
}

- (id)description
{
  __CFString *v2;
  id v4;
  void *v5;

  if (self->_duration >= 1.0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB37A0]);
    +[CPLDateFormatter stringForTimeInterval:](CPLDateFormatter, "stringForTimeInterval:", self->_duration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ for %lu records (%lu batches"), v5, self->_recordCount, self->_batchCount);

    if (self->_errorCount)
      -[__CFString appendFormat:](v2, "appendFormat:", CFSTR(" - %lu errors"), self->_errorCount);
    if (self->_cancelCount)
      -[__CFString appendFormat:](v2, "appendFormat:", CFSTR(" - %lu cancels"), self->_cancelCount);
    -[__CFString appendString:](v2, "appendString:", CFSTR(")"));
  }
  else
  {
    v2 = CFSTR("insignificant");
  }
  return v2;
}

@end
