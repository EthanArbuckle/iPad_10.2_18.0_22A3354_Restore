@implementation MTRPumpConfigurationAndControlClusterElectronicTemperatureHighEvent

- (MTRPumpConfigurationAndControlClusterElectronicTemperatureHighEvent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTRPumpConfigurationAndControlClusterElectronicTemperatureHighEvent;
  return -[MTRPumpConfigurationAndControlClusterElectronicTemperatureHighEvent init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(MTRPumpConfigurationAndControlClusterElectronicTemperatureHighEvent);
}

- (id)description
{
  void *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v2, v5, (uint64_t)CFSTR("<%@: >"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
