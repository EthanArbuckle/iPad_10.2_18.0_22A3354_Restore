@implementation SerializableColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15AppDistribution17SerializableColor *v5;

  v4 = a3;
  v5 = self;
  sub_2360CFE04(v4);

}

- (_TtC15AppDistribution17SerializableColor)initWithCoder:(id)a3
{
  id v3;
  _TtC15AppDistribution17SerializableColor *v4;

  v3 = a3;
  v4 = (_TtC15AppDistribution17SerializableColor *)sub_2360D0670(v3);

  return v4;
}

- (_TtC15AppDistribution17SerializableColor)init
{
  _TtC15AppDistribution17SerializableColor *result;

  result = (_TtC15AppDistribution17SerializableColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
