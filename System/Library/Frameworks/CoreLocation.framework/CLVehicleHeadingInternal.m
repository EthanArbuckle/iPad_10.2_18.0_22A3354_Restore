@implementation CLVehicleHeadingInternal

- (CLVehicleHeadingInternal)initWithClientVehicleHeading:(id)a3
{
  double var1;
  double var0;
  CLVehicleHeadingInternal *result;
  objc_super v6;

  var1 = a3.var1;
  var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)CLVehicleHeadingInternal;
  result = -[CLVehicleHeadingInternal init](&v6, sel_init);
  if (result)
  {
    result->fHeading.trueHeading = var0;
    result->fHeading.timestamp = var1;
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
  return (id)objc_msgSend_initWithClientVehicleHeading_(v8, v9, v10, v11, self->fHeading.trueHeading, self->fHeading.timestamp);
}

@end
