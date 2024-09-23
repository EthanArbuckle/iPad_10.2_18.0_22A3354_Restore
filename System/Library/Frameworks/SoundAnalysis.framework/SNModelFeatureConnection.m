@implementation SNModelFeatureConnection

- (NSString)sourceFeatureName
{
  return (NSString *)sub_1D4479480((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1D44C97E4);
}

- (void)setSourceFeatureName:(id)a3
{
  sub_1D4479508(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1D44CA954);
}

- (NSString)destinationFeatureName
{
  return (NSString *)sub_1D4479480((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_1D44C97B0);
}

- (void)setDestinationFeatureName:(id)a3
{
  sub_1D4479508(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1D44CA984);
}

- (SNModelFeatureConnection)initWithSourceFeatureName:(id)a3 destinationFeatureName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_1D451A6EC();
  v6 = v5;
  v7 = sub_1D451A6EC();
  return (SNModelFeatureConnection *)sub_1D44CA99C(v4, v6, v7, v8);
}

- (id)copyWithZone:(void *)a3
{
  SNModelFeatureConnection *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1D44CAA5C(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNModelFeatureConnection *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1D44CAB7C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SNModelFeatureConnection *v4;
  SNModelFeatureConnection *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1D44CABD8((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (SNModelFeatureConnection)initWithCoder:(id)a3
{
  return (SNModelFeatureConnection *)sub_1D44CAD58(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SNModelFeatureConnection *v5;

  v4 = a3;
  v5 = self;
  sub_1D44CAE5C((uint64_t)v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SNModelFeatureConnection)init
{
  sub_1D44CAF68();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
