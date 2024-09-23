@implementation _GEOTimeRange

- (_GEOTimeRange)initWithPBTimeRange:(GEOPBTransitTimeRange)a3
{
  $B85216D09A238EDB5177F50F3CAD2EB5 has;
  uint64_t v4;
  _GEOTimeRange *result;
  objc_super v6;

  has = a3._has;
  v4 = *(_QWORD *)&a3._duration;
  v6.receiver = self;
  v6.super_class = (Class)_GEOTimeRange;
  result = -[_GEOTimeRange init](&v6, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_pbTimeRange._duration = v4;
    result->_pbTimeRange._has = has;
    result->_usePB = 1;
  }
  return result;
}

- (_GEOTimeRange)initWithPDTimeRange:(GEOPDTimeRange)a3
{
  $B85216D09A238EDB5177F50F3CAD2EB5 has;
  uint64_t v4;
  _GEOTimeRange *result;
  objc_super v6;

  has = a3._has;
  v4 = *(_QWORD *)&a3._duration;
  v6.receiver = self;
  v6.super_class = (Class)_GEOTimeRange;
  result = -[_GEOTimeRange init](&v6, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_pdTimeRange._duration = v4;
    result->_pdTimeRange._has = has;
    result->_usePB = 0;
  }
  return result;
}

- (double)startTime
{
  unint64_t v2;
  uint64_t v3;

  v3 = 12;
  if (!self->_usePB)
    v3 = 24;
  LODWORD(v2) = *(_DWORD *)((char *)&self->super.isa + v3);
  return (double)v2;
}

- (double)duration
{
  unint64_t v2;
  uint64_t v3;

  v3 = 8;
  if (!self->_usePB)
    v3 = 20;
  LODWORD(v2) = *(_DWORD *)((char *)&self->super.isa + v3);
  return (double)v2;
}

- (NSDate)startDate
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[_GEOTimeRange startTime](self, "startTime");
  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (NSDate)endDate
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  -[_GEOTimeRange startTime](self, "startTime");
  v5 = v4;
  -[_GEOTimeRange duration](self, "duration");
  return (NSDate *)objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:", v5 + v6);
}

- (BOOL)contains:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[_GEOTimeRange endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", v4);

  if (v6 == -1)
  {
    v8 = 0;
  }
  else
  {
    -[_GEOTimeRange startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "compare:", v4) != 1;

  }
  return v8;
}

@end
