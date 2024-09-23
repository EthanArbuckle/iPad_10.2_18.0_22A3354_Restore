@implementation CAUVariantsService

+ (NSString)entitlement
{
  return (NSString *)(id)sub_237825FA0();
}

+ (NSString)identifier
{
  return (NSString *)(id)sub_237825FA0();
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)sub_237818674((uint64_t)a1, (uint64_t)a2, &qword_256811290, (id *)&qword_2568117D0);
}

+ (BSServiceInterface)interface
{
  return (BSServiceInterface *)sub_237818674((uint64_t)a1, (uint64_t)a2, &qword_256811298, (id *)&qword_2568117D8);
}

- (_TtC13CarAssetUtils18CAUVariantsService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAUVariantsService();
  return -[CAUVariantsService init](&v3, sel_init);
}

@end
