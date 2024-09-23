@implementation IdentityActiveLivenessConfig

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EFBC0BA1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EFBC0BA1 = a3;
}

- (_TtC13CoreIDVShared28IdentityActiveLivenessConfig)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared28IdentityActiveLivenessConfig *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared28IdentityActiveLivenessConfig *)sub_1CF9D2E34(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared28IdentityActiveLivenessConfig *v5;

  v4 = a3;
  v5 = self;
  IdentityActiveLivenessConfig.encode(with:)((NSCoder)v4);

}

- (NSString)debugDescription
{
  _TtC13CoreIDVShared28IdentityActiveLivenessConfig *v2;
  void *v3;

  v2 = self;
  IdentityActiveLivenessConfig.debugDescription.getter();

  v3 = (void *)sub_1CFB01A04();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC13CoreIDVShared28IdentityActiveLivenessConfig)init
{
  _TtC13CoreIDVShared28IdentityActiveLivenessConfig *result;

  result = (_TtC13CoreIDVShared28IdentityActiveLivenessConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
