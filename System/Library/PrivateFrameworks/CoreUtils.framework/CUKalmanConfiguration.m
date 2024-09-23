@implementation CUKalmanConfiguration

- (CUKalmanConfiguration)initWithParamR:(double)a3 paramQ:(double)a4 paramA:(double)a5 paramB:(double)a6 paramC:(double)a7
{
  CUKalmanConfiguration *v12;
  CUKalmanConfiguration *v13;
  CUKalmanConfiguration *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CUKalmanConfiguration;
  v12 = -[CUKalmanConfiguration init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_paramR = a3;
    v12->_paramQ = a4;
    v12->_paramA = a5;
    v12->_paramB = a6;
    v12->_paramC = a7;
    v14 = v12;
  }

  return v13;
}

- (double)paramR
{
  return self->_paramR;
}

- (double)paramQ
{
  return self->_paramQ;
}

- (double)paramA
{
  return self->_paramA;
}

- (double)paramB
{
  return self->_paramB;
}

- (double)paramC
{
  return self->_paramC;
}

+ (id)bluetoothRSSIConfiguration
{
  if (bluetoothRSSIConfiguration_sOnce != -1)
    dispatch_once(&bluetoothRSSIConfiguration_sOnce, &__block_literal_global_3623);
  return (id)bluetoothRSSIConfiguration_sConfig;
}

+ (id)defaultConfiguration
{
  return -[CUKalmanConfiguration initWithParamR:paramQ:paramA:paramB:paramC:]([CUKalmanConfiguration alloc], "initWithParamR:paramQ:paramA:paramB:paramC:", 1.0, 1.0, 1.0, 0.0, 1.0);
}

void __51__CUKalmanConfiguration_bluetoothRSSIConfiguration__block_invoke()
{
  CUKalmanConfiguration *v0;
  void *v1;

  v0 = -[CUKalmanConfiguration initWithParamR:paramQ:paramA:paramB:paramC:]([CUKalmanConfiguration alloc], "initWithParamR:paramQ:paramA:paramB:paramC:", 0.008, 6.0, 1.0, 0.0, 1.0);
  v1 = (void *)bluetoothRSSIConfiguration_sConfig;
  bluetoothRSSIConfiguration_sConfig = (uint64_t)v0;

}

@end
