@implementation FPDurationStatistics

- (void)reset
{
  self->_count = 0;
  self->_totalDurationSecSquared = 0.0;
  self->_internalMinSec = 1.79769313e308;
  self->_maxSec = 0.0;
  self->_totalDurationSec = 0.0;
}

- (void)addDurationSec:(double)a3
{
  double v5;
  double v6;
  double totalDurationSecSquared;
  double v8;

  if (a3 != -1.0 && a3 >= 0.0)
  {
    ++self->_count;
    -[FPDurationStatistics internalMinSec](self, "internalMinSec");
    if (v5 >= a3)
      v5 = a3;
    self->_internalMinSec = v5;
    -[FPDurationStatistics maxSec](self, "maxSec");
    if (v6 < a3)
      v6 = a3;
    totalDurationSecSquared = self->_totalDurationSecSquared;
    v8 = self->_totalDurationSec + a3;
    self->_maxSec = v6;
    self->_totalDurationSec = v8;
    self->_totalDurationSecSquared = totalDurationSecSquared + a3 * a3;
  }
}

- (double)averageSec
{
  double v3;

  if (!-[FPDurationStatistics count](self, "count"))
    return 0.0;
  -[FPDurationStatistics totalDurationSec](self, "totalDurationSec");
  return v3 / (double)-[FPDurationStatistics count](self, "count");
}

- (double)stddevSec
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (-[FPDurationStatistics count](self, "count") < 2)
    return 0.0;
  -[FPDurationStatistics totalDurationSecSquared](self, "totalDurationSecSquared");
  v5 = v4;
  -[FPDurationStatistics totalDurationSec](self, "totalDurationSec");
  v7 = v6;
  -[FPDurationStatistics totalDurationSec](self, "totalDurationSec");
  return sqrt((v5 - v7 * v8 / (double)-[FPDurationStatistics count](self, "count"))/ (double)-[FPDurationStatistics count](self, "count"));
}

- (double)minSec
{
  double v3;
  double result;

  -[FPDurationStatistics internalMinSec](self, "internalMinSec");
  if (v3 == 1.79769313e308)
    return 0.0;
  -[FPDurationStatistics internalMinSec](self, "internalMinSec");
  return result;
}

- (double)minNs
{
  double v2;

  -[FPDurationStatistics minSec](self, "minSec");
  return v2 * 1000000000.0;
}

- (double)maxNs
{
  double v2;

  -[FPDurationStatistics maxSec](self, "maxSec");
  return v2 * 1000000000.0;
}

- (double)averageNs
{
  double v2;

  -[FPDurationStatistics averageSec](self, "averageSec");
  return v2 * 1000000000.0;
}

- (double)stddevNs
{
  double v2;

  -[FPDurationStatistics stddevSec](self, "stddevSec");
  return v2 * 1000000000.0;
}

- (double)totalDurationNs
{
  double v2;

  -[FPDurationStatistics totalDurationSec](self, "totalDurationSec");
  return v2 * 1000000000.0;
}

- (double)minMs
{
  double v2;

  -[FPDurationStatistics minSec](self, "minSec");
  return v2 * 1000.0;
}

- (double)maxMs
{
  double v2;

  -[FPDurationStatistics maxSec](self, "maxSec");
  return v2 * 1000.0;
}

- (double)averageMs
{
  double v2;

  -[FPDurationStatistics averageSec](self, "averageSec");
  return v2 * 1000.0;
}

- (double)stddevMs
{
  double v2;

  -[FPDurationStatistics stddevSec](self, "stddevSec");
  return v2 * 1000.0;
}

- (double)totalDurationMs
{
  double v2;

  -[FPDurationStatistics totalDurationSec](self, "totalDurationSec");
  return v2 * 1000.0;
}

- (FPDurationStatistics)init
{
  FPDurationStatistics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPDurationStatistics;
  result = -[FPDurationStatistics init](&v3, sel_init);
  if (result)
    result->_internalMinSec = 1.79769313e308;
  return result;
}

- (unsigned)count
{
  return self->_count;
}

- (double)maxSec
{
  return self->_maxSec;
}

- (double)totalDurationSec
{
  return self->_totalDurationSec;
}

- (void)setTotalDurationSec:(double)a3
{
  self->_totalDurationSec = a3;
}

- (double)totalDurationSecSquared
{
  return self->_totalDurationSecSquared;
}

- (void)setTotalDurationSecSquared:(double)a3
{
  self->_totalDurationSecSquared = a3;
}

- (double)internalMinSec
{
  return self->_internalMinSec;
}

@end
