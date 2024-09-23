@implementation ThermalCritical

+ (id)description
{
  return CFSTR("The system behaves as though there is significant thermal impact. At this state, the app should reduce usage of the CPU, GPU and any I/O to minimal levels for user interactions.");
}

+ (id)profileFriendlyName
{
  return CFSTR("Critical");
}

- (ThermalCritical)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ThermalCritical;
  return -[ThermalNominal initWithThermalLevel:](&v3, sel_initWithThermalLevel_, 3);
}

@end
