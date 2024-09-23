@implementation RMSSample

- (RMSSample)initWithRMSScore:(double)a3 lastSampleCount:(unint64_t)a4
{
  RMSSample *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RMSSample;
  result = -[RMSSample init](&v7, sel_init);
  if (result)
  {
    result->_RMSScore = a3;
    result->_lastSampleCount = a4;
  }
  return result;
}

- (int64_t)compareScoresDesc:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[RMSSample RMSScore](self, "RMSScore");
  v6 = v5;
  objc_msgSend(v4, "RMSScore");
  v8 = v7;

  return v6 < v8;
}

- (double)RMSScore
{
  return self->_RMSScore;
}

- (void)setRMSScore:(double)a3
{
  self->_RMSScore = a3;
}

- (unint64_t)lastSampleCount
{
  return self->_lastSampleCount;
}

- (void)setLastSampleCount:(unint64_t)a3
{
  self->_lastSampleCount = a3;
}

@end
