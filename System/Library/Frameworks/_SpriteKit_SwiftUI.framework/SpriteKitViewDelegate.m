@implementation SpriteKitViewDelegate

- (BOOL)view:(id)a3 shouldRenderAtTime:(double)a4
{
  uint64_t (*v6)(uint64_t, double);
  id v7;
  _TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate *v8;
  uint64_t v9;

  v6 = *(uint64_t (**)(uint64_t, double))((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate_callback);
  v7 = a3;
  v8 = self;
  v9 = swift_retain();
  LOBYTE(v6) = v6(v9, a4);

  swift_release();
  return v6 & 1;
}

- (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate)init
{
  _TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate *result;

  result = (_TtC18_SpriteKit_SwiftUIP33_4A29C38A751B2448A1E2FA85CDDEAA5321SpriteKitViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
