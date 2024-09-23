@implementation CLVehicleSpeedInternal

- (CLVehicleSpeedInternal)initWithClientVehicleSpeed:(id)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  CLVehicleSpeedInternal *result;
  objc_super v8;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)CLVehicleSpeedInternal;
  result = -[CLVehicleSpeedInternal init](&v8, sel_init);
  if (result)
  {
    result->fSpeed.speed = var0;
    result->fSpeed.timestamp = var1;
    result->fSpeed.machContinuousTime = var2;
    result->fSpeed.machAbsoluteTime = var3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)objc_msgSend_initWithClientVehicleSpeed_(v8, v9, v10, v11, self->fSpeed.speed, self->fSpeed.timestamp, self->fSpeed.machContinuousTime, self->fSpeed.machAbsoluteTime);
}

@end
