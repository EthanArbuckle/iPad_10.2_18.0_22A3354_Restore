@implementation GamePolicyAppXPC

+ (id)GamePolicyAppServerInterface
{
  return sub_23C962448((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP10GamePolicy19GamePolicyAppServer_);
}

+ (id)GamePolicyAppClientInterface
{
  return sub_23C962448((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP10GamePolicy19GamePolicyAppClient_);
}

- (_TtC10GamePolicy16GamePolicyAppXPC)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GamePolicyAppXPC();
  return -[GamePolicyAppXPC init](&v3, sel_init);
}

@end
