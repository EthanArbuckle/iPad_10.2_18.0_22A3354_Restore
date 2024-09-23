@implementation AISChildAccountCutOffAgeResponse

- (NSString)childCutOffAgeLocalized
{
  AISChildAccountCutOffAgeResponse *v2;
  void *v3;

  v2 = self;
  sub_2365AFA8C();

  v3 = (void *)sub_2365B0038();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)childCutOffAge
{
  AISChildAccountCutOffAgeResponse *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_2365AFA80();

  return v3;
}

- (AISChildAccountCutOffAgeResponse)init
{
  AISChildAccountCutOffAgeResponse *result;

  result = (AISChildAccountCutOffAgeResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
