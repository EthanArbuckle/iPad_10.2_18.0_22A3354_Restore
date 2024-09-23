@implementation ThermalFair

+ (id)description
{
  return CFSTR("The system behaves as though under slightly elevated thermal state");
}

+ (id)profileFriendlyName
{
  return CFSTR("Fair");
}

- (ThermalFair)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ThermalFair;
  return -[ThermalNominal initWithThermalLevel:](&v3, sel_initWithThermalLevel_, 1);
}

@end
