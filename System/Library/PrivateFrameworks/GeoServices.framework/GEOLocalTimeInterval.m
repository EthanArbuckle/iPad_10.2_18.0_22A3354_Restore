@implementation GEOLocalTimeInterval

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOLocalTimeInterval)init
{
  GEOLocalTimeInterval *result;

  result = (GEOLocalTimeInterval *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOLocalTimeInterval)initWithLocalTimeRange:(GEOPDLocalTimeRange *)a3
{
  char *v4;
  void *v5;
  uint64x2_t v6;
  GEOLocalTimeInterval *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOLocalTimeInterval;
  v4 = -[GEOLocalTimeInterval init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    if ((~*(_BYTE *)&a3->var2 & 3) != 0)
    {
      v7 = 0;
      goto LABEL_6;
    }
    v6.i64[0] = *(_QWORD *)&a3->var0;
    v6.i64[1] = HIDWORD(*(_QWORD *)&a3->var0);
    *(float64x2_t *)(v4 + 8) = vcvtq_f64_u64(v6);
  }
  v7 = v4;
LABEL_6:

  return v7;
}

- (GEOLocalTimeInterval)initWithStartTime:(double)a3 endTime:(double)a4
{
  GEOLocalTimeInterval *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLocalTimeInterval;
  result = -[GEOLocalTimeInterval init](&v7, sel_init);
  if (result)
  {
    result->_startTime = a3;
    result->_endTime = a4;
  }
  return result;
}

- (GEOLocalTimeInterval)initWithCoder:(id)a3
{
  id v4;
  GEOLocalTimeInterval *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOLocalTimeInterval;
  v5 = -[GEOLocalTimeInterval init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GEOLocalTimeIntervalStartTimeKey"));
    v5->_startTime = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("GEOLocalTimeIntervalEndTimeKey"));
    v5->_endTime = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double startTime;
  id v5;

  startTime = self->_startTime;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("GEOLocalTimeIntervalStartTimeKey"), startTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("GEOLocalTimeIntervalEndTimeKey"), self->_endTime);

}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

@end
