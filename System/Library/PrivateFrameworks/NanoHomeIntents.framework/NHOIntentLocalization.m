@implementation NHOIntentLocalization

+ (NSString)launcherWidgetName
{
  return (NSString *)sub_24294B2D4((uint64_t)a1, (uint64_t)a2, &qword_2572076E0);
}

+ (NSString)smartStackWidgetName
{
  return (NSString *)sub_24294B2D4((uint64_t)a1, (uint64_t)a2, &qword_2572076E8);
}

+ (NSString)actionSetRectangularWidgetText
{
  return (NSString *)sub_24294B2D4((uint64_t)a1, (uint64_t)a2, &qword_2572076F0);
}

+ (NSString)forecastEnergyWidgetName
{
  return (NSString *)sub_24294B2D4((uint64_t)a1, (uint64_t)a2, &qword_2572076F8);
}

+ (NSString)currentLocationEnergyWidgetName
{
  return (NSString *)sub_24294B2D4((uint64_t)a1, (uint64_t)a2, &qword_257207700);
}

+ (id)homeSpecificEnergyWidgetNameWithHomeName:(id)a3
{
  return sub_24294B428((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, 0xD000000000000014, 0x80000002429661C0);
}

+ (NSString)electricityUsageWidgetName
{
  return (NSString *)sub_24294B2D4((uint64_t)a1, (uint64_t)a2, &qword_257207708);
}

+ (id)homeSpecificElectricityUsageWidgetNameWithHomeName:(id)a3
{
  return sub_24294B428((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, 0xD000000000000020, 0x80000002429661E0);
}

+ (NSString)electricityRatesWidgetName
{
  return (NSString *)sub_24294B2D4((uint64_t)a1, (uint64_t)a2, &qword_257207710);
}

+ (id)homeSpecificElectricityRatesWidgetNameWithHomeName:(id)a3
{
  return sub_24294B428((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, 0xD000000000000020, 0x8000000242966210);
}

- (NHOIntentLocalization)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[NHOIntentLocalization init](&v3, sel_init);
}

@end
