@implementation HAPPGTemperatureSample

- (HAPPGTemperatureSample)initWithDegreesCelsius:(float)a3
{
  HAPPGTemperatureSample *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAPPGTemperatureSample;
  result = -[HAPPGTemperatureSample init](&v5, sel_init);
  result->_degreesCelsius = a3;
  return result;
}

- (float)degreesCelsius
{
  return self->_degreesCelsius;
}

@end
