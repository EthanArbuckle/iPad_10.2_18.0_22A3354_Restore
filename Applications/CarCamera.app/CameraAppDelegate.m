@implementation CameraAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  _TtC9CarCamera17CameraAppDelegate *v11;
  void *v12;

  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100007C30();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  CAFSignpostEmit_Launched();
  v12 = (void *)qword_100035080;
  qword_100035080 = (uint64_t)v11;

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC9CarCamera17CameraAppDelegate)init
{
  objc_super v3;

  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC9CarCamera17CameraAppDelegate_layoutConfig) = 2;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CameraAppDelegate();
  return -[CameraAppDelegate init](&v3, "init");
}

@end
