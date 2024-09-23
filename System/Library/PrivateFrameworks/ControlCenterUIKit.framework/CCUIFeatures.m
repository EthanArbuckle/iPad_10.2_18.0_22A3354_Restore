@implementation CCUIFeatures

+ (BOOL)isFeatureEnabled:(int64_t)a3
{
  uint64_t v4;
  _QWORD v6[5];

  type metadata accessor for Feature(0);
  v6[3] = v4;
  v6[4] = sub_1D031A3E4();
  v6[0] = a3;
  LOBYTE(a3) = sub_1D031D4CC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return a3 & 1;
}

- (CCUIFeatures)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Features();
  return -[CCUIFeatures init](&v3, sel_init);
}

@end
