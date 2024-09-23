@implementation HKBeatToBeatInstantaneousBPM

- (HKBeatToBeatInstantaneousBPM)initWithBPM:(double)a3 time:(double)a4
{
  HKBeatToBeatInstantaneousBPM *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKBeatToBeatInstantaneousBPM;
  result = -[HKBeatToBeatInstantaneousBPM init](&v7, sel_init);
  if (result)
  {
    result->_bpm = a3;
    result->_time = a4;
  }
  return result;
}

- (double)bpm
{
  return self->_bpm;
}

- (double)time
{
  return self->_time;
}

@end
