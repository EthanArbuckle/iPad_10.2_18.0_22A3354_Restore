@implementation CAUAssetLibrary

- (void)dealloc
{
  _TtC13CarAssetUtils15CAUAssetLibrary *v2;
  objc_super v3;

  v2 = self;
  sub_237825EA4();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CAUAssetLibrary();
  -[CAUAssetLibrary dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_securityScopedBasePathURL));
  v3 = (char *)self + OBJC_IVAR____TtC13CarAssetUtils15CAUAssetLibrary_basePathURL;
  v4 = sub_237825ED4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC13CarAssetUtils15CAUAssetLibrary)init
{
  _TtC13CarAssetUtils15CAUAssetLibrary *result;

  result = (_TtC13CarAssetUtils15CAUAssetLibrary *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
