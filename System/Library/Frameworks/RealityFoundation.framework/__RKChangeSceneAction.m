@implementation __RKChangeSceneAction

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)self + OBJC_IVAR____TtC10RealityKit21__RKChangeSceneAction_targetSceneIdentifier, v4);
  type metadata accessor for __RKChangeSceneAction();
  swift_allocObject();
  v8 = swift_retain();
  v9 = (void *)specialized __RKChangeSceneAction.init(rootEntity:targetSceneIdentifier:)(v8, (uint64_t)v7);
  swift_release();
  return v9;
}

@end
