@implementation PresenceSessionParticipant

- (NSString)description
{
  _TtC14CopresenceCore26PresenceSessionParticipant *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = PresenceSessionParticipant.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1AF4480F4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC14CopresenceCore26PresenceSessionParticipant *v5;

  v4 = a3;
  v5 = self;
  PresenceSessionParticipant.encode(with:)((NSCoder)v4);

}

- (_TtC14CopresenceCore26PresenceSessionParticipant)initWithCoder:(id)a3
{
  return (_TtC14CopresenceCore26PresenceSessionParticipant *)PresenceSessionParticipant.init(coder:)(a3);
}

- (_TtC14CopresenceCore26PresenceSessionParticipant)init
{
  _TtC14CopresenceCore26PresenceSessionParticipant *result;

  result = (_TtC14CopresenceCore26PresenceSessionParticipant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
