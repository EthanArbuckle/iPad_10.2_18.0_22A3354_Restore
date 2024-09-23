@implementation CameraCAFManager

- (void)sessionDidConnect:(id)a3
{
  id v4;
  _TtC9CarCamera16CameraCAFManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000208C8(v4);

}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  _TtC9CarCamera16CameraCAFManager *v5;

  v4 = a3;
  v5 = self;
  sub_100021120();

}

- (_TtC9CarCamera16CameraCAFManager)init
{
  _TtC9CarCamera16CameraCAFManager *result;

  result = (_TtC9CarCamera16CameraCAFManager *)_swift_stdlib_reportUnimplementedInitializer("CarCamera.CameraCAFManager", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9CarCamera16CameraCAFManager__model;
  v4 = sub_10000383C(&qword_100033950);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9CarCamera16CameraCAFManager_requestContentManager));
  swift_bridgeObjectRelease();

}

@end
