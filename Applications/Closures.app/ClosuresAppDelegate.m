@implementation ClosuresAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  _TtC8Closures19ClosuresAppDelegate *v11;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_100004658();
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  CAFSignpostEmit_Launched();

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (_TtC8Closures19ClosuresAppDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___assetManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClosuresAppDelegate();
  return -[ClosuresAppDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___carManager));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Closures19ClosuresAppDelegate____lazy_storage___assetManager));
}

@end
