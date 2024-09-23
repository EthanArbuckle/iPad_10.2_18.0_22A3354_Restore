@implementation GameModeCCUIStatus

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static GameModeCCUIStatus.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static GameModeCCUIStatus.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy18GameModeCCUIStatus *v5;

  v4 = a3;
  v5 = self;
  GameModeCCUIStatus.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy18GameModeCCUIStatus)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy18GameModeCCUIStatus *)GameModeCCUIStatus.init(coder:)(a3);
}

- (_TtC10GamePolicy18GameModeCCUIStatus)init
{
  _TtC10GamePolicy18GameModeCCUIStatus *result;

  result = (_TtC10GamePolicy18GameModeCCUIStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
