@implementation GameModeCCUIStatusBundle

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static GameModeCCUIStatusBundle.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static GameModeCCUIStatusBundle.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy24GameModeCCUIStatusBundle *v5;

  v4 = a3;
  v5 = self;
  GameModeCCUIStatusBundle.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy24GameModeCCUIStatusBundle)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy24GameModeCCUIStatusBundle *)GameModeCCUIStatusBundle.init(coder:)(a3);
}

- (_TtC10GamePolicy24GameModeCCUIStatusBundle)init
{
  _TtC10GamePolicy24GameModeCCUIStatusBundle *result;

  result = (_TtC10GamePolicy24GameModeCCUIStatusBundle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23C969DA4();
}

@end
