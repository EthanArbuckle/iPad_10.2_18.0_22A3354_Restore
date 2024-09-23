@implementation StorableColor

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2560473E0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2560473E0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10FinanceKit13StorableColor *v5;

  v4 = a3;
  v5 = self;
  sub_23326BF50(v4);

}

- (_TtC10FinanceKit13StorableColor)initWithCoder:(id)a3
{
  id v3;
  _TtC10FinanceKit13StorableColor *v4;

  v3 = a3;
  v4 = (_TtC10FinanceKit13StorableColor *)sub_23326C6AC(v3);

  return v4;
}

- (_TtC10FinanceKit13StorableColor)init
{
  _TtC10FinanceKit13StorableColor *result;

  result = (_TtC10FinanceKit13StorableColor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
