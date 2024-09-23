@implementation __GamePolicyAgentUpdateGameEvent

- (NSString)description
{
  return (NSString *)sub_23C966BC4(self, (uint64_t)a2, (void (*)(void))GamePolicyAgentUpdate.GameEvent.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static GamePolicyAgentUpdate.GameEvent.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  __GamePolicyAgentUpdateGameEvent *v5;

  v4 = a3;
  v5 = self;
  GamePolicyAgentUpdate.GameEvent.encode(with:)((NSCoder)v4);

}

- (__GamePolicyAgentUpdateGameEvent)initWithCoder:(id)a3
{
  return (__GamePolicyAgentUpdateGameEvent *)GamePolicyAgentUpdate.GameEvent.init(coder:)(a3);
}

- (__GamePolicyAgentUpdateGameEvent)init
{
  __GamePolicyAgentUpdateGameEvent *result;

  result = (__GamePolicyAgentUpdateGameEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
