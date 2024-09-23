@implementation SerializableColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14MarketplaceKit17SerializableColor *v5;

  v4 = a3;
  v5 = self;
  sub_233B99F40(v4);

}

- (_TtC14MarketplaceKit17SerializableColor)initWithCoder:(id)a3
{
  id v3;
  _TtC14MarketplaceKit17SerializableColor *v4;

  v3 = a3;
  v4 = (_TtC14MarketplaceKit17SerializableColor *)sub_233B9A834(v3);

  return v4;
}

- (_TtC14MarketplaceKit17SerializableColor)init
{
  _TtC14MarketplaceKit17SerializableColor *result;

  result = (_TtC14MarketplaceKit17SerializableColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
