@implementation ClimateAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  _TtC7Climate18ClimateAppDelegate *v11;

  v4 = a4;
  if (a4)
  {
    type metadata accessor for LaunchOptionsKey(0);
    v8 = v7;
    v9 = sub_10006B6B8();
    v4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v4, v8, (char *)&type metadata for Any + 8, v9);
  }
  v10 = a3;
  v11 = self;
  CAFSignpostEmit_Launched();

  swift_bridgeObjectRelease(v4);
  return 1;
}

- (_TtC7Climate18ClimateAppDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Climate18ClimateAppDelegate____lazy_storage___coordinator) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateAppDelegate();
  return -[ClimateAppDelegate init](&v3, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Climate18ClimateAppDelegate____lazy_storage___coordinator));
}

@end
