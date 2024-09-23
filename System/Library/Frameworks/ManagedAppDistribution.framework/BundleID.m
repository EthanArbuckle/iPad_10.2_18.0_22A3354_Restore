@implementation BundleID

- (id)description
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_233B57F6C();
  swift_bridgeObjectRelease();
  return v0;
}

- (BOOL)isEqual:(id)a3
{
  _TtC22ManagedAppDistribution8BundleID *v4;
  _TtC22ManagedAppDistribution8BundleID *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_233B58218();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = BundleID.isEqual(_:)((uint64_t)v8);

  sub_233B034D8((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC22ManagedAppDistribution8BundleID *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_233B57FF0();

  return v3;
}

- (_TtC22ManagedAppDistribution8BundleID)init
{
  _TtC22ManagedAppDistribution8BundleID *result;

  result = (_TtC22ManagedAppDistribution8BundleID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
