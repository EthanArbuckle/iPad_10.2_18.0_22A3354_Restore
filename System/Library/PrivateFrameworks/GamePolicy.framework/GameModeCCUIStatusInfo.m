@implementation GameModeCCUIStatusInfo

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static GameModeCCUIStatusInfo.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static GameModeCCUIStatusInfo.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy22GameModeCCUIStatusInfo *v5;

  v4 = a3;
  v5 = self;
  GameModeCCUIStatusInfo.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy22GameModeCCUIStatusInfo)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy22GameModeCCUIStatusInfo *)GameModeCCUIStatusInfo.init(coder:)(a3);
}

- (_TtC10GamePolicy22GameModeCCUIStatusInfo)init
{
  _TtC10GamePolicy22GameModeCCUIStatusInfo *result;

  result = (_TtC10GamePolicy22GameModeCCUIStatusInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
