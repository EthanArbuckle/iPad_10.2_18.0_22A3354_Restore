@implementation HKAudiogramChartData

- (HKAudiogramChartData)initWithFrequency:(double)a3 sensitivity:(double)a4 isLeftEar:(BOOL)a5
{
  HKAudiogramChartData *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKAudiogramChartData;
  result = -[HKAudiogramChartData init](&v9, sel_init);
  if (result)
  {
    result->_frequencyHertz = a3;
    result->_sensitivityDBHL = a4;
    result->_isLeftEar = a5;
  }
  return result;
}

- (double)frequencyHertz
{
  return self->_frequencyHertz;
}

- (double)sensitivityDBHL
{
  return self->_sensitivityDBHL;
}

- (BOOL)isLeftEar
{
  return self->_isLeftEar;
}

@end
