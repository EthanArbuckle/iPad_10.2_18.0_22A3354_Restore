@implementation IdentityConfigurationInternal

- (_TtC15ProximityReader29IdentityConfigurationInternal)init
{
  _TtC15ProximityReader29IdentityConfigurationInternal *result;

  result = (_TtC15ProximityReader29IdentityConfigurationInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_25525FFF0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_25525FFF0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader29IdentityConfigurationInternal *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_21C3A7EB4();
  v7 = (id)sub_21C3A7EB4();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (_TtC15ProximityReader29IdentityConfigurationInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader29IdentityConfigurationInternal *)IdentityConfigurationInternal.init(coder:)(a3);
}

@end
