@implementation ForegroundApp

- (NSString)debugDescription
{
  _TtC15ConversationKit13ForegroundApp *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = ForegroundApp.debugDescription.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1C3B72E00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC15ConversationKit13ForegroundApp)init
{
  ForegroundApp.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
