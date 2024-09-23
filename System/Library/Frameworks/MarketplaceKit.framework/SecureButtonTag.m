@implementation SecureButtonTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14MarketplaceKit15SecureButtonTag)initWithCoder:(id)a3
{
  id v3;
  _TtC14MarketplaceKit15SecureButtonTag *v4;

  v3 = a3;
  v4 = (_TtC14MarketplaceKit15SecureButtonTag *)sub_233B9A1CC(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14MarketplaceKit15SecureButtonTag *v5;

  v4 = a3;
  v5 = self;
  SecureButtonTag.encode(with:)((NSCoder)v4);

}

- (int64_t)hash
{
  _TtC14MarketplaceKit15SecureButtonTag *v2;
  int64_t v3;

  v2 = self;
  v3 = SecureButtonTag.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC14MarketplaceKit15SecureButtonTag *v4;
  _TtC14MarketplaceKit15SecureButtonTag *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_233BD89E4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = SecureButtonTag.isEqual(_:)((uint64_t)v8);

  sub_233B9A6A4((uint64_t)v8);
  return v6 & 1;
}

- (_TtC14MarketplaceKit15SecureButtonTag)init
{
  _TtC14MarketplaceKit15SecureButtonTag *result;

  result = (_TtC14MarketplaceKit15SecureButtonTag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
