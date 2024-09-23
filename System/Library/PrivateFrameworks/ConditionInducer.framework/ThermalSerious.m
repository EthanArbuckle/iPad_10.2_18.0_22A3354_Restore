@implementation ThermalSerious

+ (id)description
{
  return CFSTR("The system behaves as though under a high thermal state. At this state, the app should reduce usage of the CPU, GPU and any I/O (such as networking or Bluetooth).");
}

+ (id)profileFriendlyName
{
  return CFSTR("Serious");
}

- (ThermalSerious)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ThermalSerious;
  return -[ThermalNominal initWithThermalLevel:](&v3, sel_initWithThermalLevel_, 2);
}

@end
