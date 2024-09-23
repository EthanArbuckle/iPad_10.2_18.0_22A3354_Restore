@implementation HostableSceneObserver

- (_TtC12DrawingBoard21HostableSceneObserver)init
{
  _TtC12DrawingBoard21HostableSceneObserver *result;

  result = (_TtC12DrawingBoard21HostableSceneObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12DrawingBoard21HostableSceneObserver___observationRegistrar;
  v4 = sub_23A70D03C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  _TtC12DrawingBoard21HostableSceneObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6EA9A8(v6, a4);

}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  _TtC12DrawingBoard21HostableSceneObserver *v5;

  v4 = a3;
  v5 = self;
  sub_23A6EAE98(v4);

}

- (void)sceneWillActivate:(id)a3
{
  id v4;
  _TtC12DrawingBoard21HostableSceneObserver *v5;
  _OWORD v6[3];
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  memset(v6, 0, sizeof(v6));
  v8 = 0;
  v9 = 0;
  v7 = 0xA000000000000000;
  v4 = a3;
  v5 = self;
  sub_23A6EAB14((uint64_t)v6);

}

- (void)sceneDidActivate:(id)a3
{
  id v5;
  _TtC12DrawingBoard21HostableSceneObserver *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_getKeyPath();
  sub_23A6E1420(&qword_2569B0970, (uint64_t (*)(uint64_t))type metadata accessor for SceneState, (uint64_t)&protocol conformance descriptor for SceneState);
  v5 = a3;
  v6 = self;
  sub_23A70D000();
  swift_release();
  v7 = 1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0;
  v11 = 0xA000000000000000;
  v12 = 0;
  v13 = 0;
  sub_23A6EAB14((uint64_t)&v7);

}

- (void)sceneWillDeactivate:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  _TtC12DrawingBoard21HostableSceneObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6EB440(a4);

}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  id v6;
  id v7;
  _TtC12DrawingBoard21HostableSceneObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6EB57C(v7);

}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12DrawingBoard21HostableSceneObserver *v8;
  uint64_t v9;
  void *v10;

  sub_23A6DD7B4();
  sub_23A6E1420((unint64_t *)&qword_2569AF4F0, (uint64_t (*)(uint64_t))sub_23A6DD7B4, MEMORY[0x24BEE5BD8]);
  v6 = sub_23A70D54C();
  v7 = a3;
  v8 = self;
  v9 = sub_23A6EB930(v6);

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_23A70D540();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

@end
