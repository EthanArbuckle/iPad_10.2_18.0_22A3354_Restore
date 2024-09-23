@implementation LocalSceneExtension

+ (id)settingsExtensions
{
  return sub_23A6F0658((uint64_t)a1, (uint64_t)a2, 0, (uint64_t (*)(uint64_t))type metadata accessor for LocalSceneSettingsExtension);
}

+ (id)hostComponents
{
  uint64_t v2;

  return sub_23A6F0658((uint64_t)a1, (uint64_t)a2, v2, (uint64_t (*)(uint64_t))type metadata accessor for LocalSceneExtension.HostComponent);
}

+ (id)clientComponents
{
  uint64_t v2;

  return sub_23A6F0658((uint64_t)a1, (uint64_t)a2, v2, (uint64_t (*)(uint64_t))type metadata accessor for LocalSceneExtension.ClientComponent);
}

- (_TtC12DrawingBoard19LocalSceneExtension)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[LocalSceneExtension init](&v3, sel_init);
}

@end
