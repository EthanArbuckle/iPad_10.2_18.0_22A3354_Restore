@implementation AgentRequestMessageLoadResult

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE503511;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE503511 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC17IMSharedUtilities29AgentRequestMessageLoadResult *v5;

  v4 = a3;
  v5 = self;
  sub_19E363158(v4);

}

- (_TtC17IMSharedUtilities29AgentRequestMessageLoadResult)initWithCoder:(id)a3
{
  id v3;
  _TtC17IMSharedUtilities29AgentRequestMessageLoadResult *v4;

  v3 = a3;
  v4 = (_TtC17IMSharedUtilities29AgentRequestMessageLoadResult *)sub_19E363D2C();

  return v4;
}

- (_TtC17IMSharedUtilities29AgentRequestMessageLoadResult)init
{
  _TtC17IMSharedUtilities29AgentRequestMessageLoadResult *result;

  result = (_TtC17IMSharedUtilities29AgentRequestMessageLoadResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
