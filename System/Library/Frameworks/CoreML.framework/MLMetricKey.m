@implementation MLMetricKey

- (MLMetricKey)initWithKeyName:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MLMetricKey;
  return -[MLKey initWithKeyName:](&v4, sel_initWithKeyName_, a3);
}

+ (MLMetricKey)lossValue
{
  return -[MLMetricKey initWithKeyName:]([MLMetricKey alloc], "initWithKeyName:", CFSTR("lossValue"));
}

+ (MLMetricKey)epochIndex
{
  return -[MLMetricKey initWithKeyName:]([MLMetricKey alloc], "initWithKeyName:", CFSTR("epochIndex"));
}

+ (MLMetricKey)miniBatchIndex
{
  return -[MLMetricKey initWithKeyName:]([MLMetricKey alloc], "initWithKeyName:", CFSTR("miniBatchIndex"));
}

@end
