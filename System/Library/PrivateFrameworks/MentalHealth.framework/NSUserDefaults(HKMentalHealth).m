@implementation NSUserDefaults(HKMentalHealth)

+ (id)hkmh_mentalHealthDefaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.private.health.mental-health"));
}

@end
