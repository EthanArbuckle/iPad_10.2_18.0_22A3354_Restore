@implementation CSFEligibility

- (BOOL)regionEligible
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CSFEligibility_regionEligible);
}

- (BOOL)languageEligible
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CSFEligibility_languageEligible);
}

- (BOOL)siriLanguageEligible
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CSFEligibility_siriLanguageEligible);
}

- (BOOL)locationEligible
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CSFEligibility_locationEligible);
}

- (BOOL)deviceEligibile
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CSFEligibility_deviceEligibile);
}

- (NSString)description
{
  CSFEligibility *v2;
  void *v3;

  v2 = self;
  sub_1A5BBEA70();

  v3 = (void *)sub_1A5BC9B3C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CSFEligibility)init
{
  CSFEligibility *result;

  result = (CSFEligibility *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
