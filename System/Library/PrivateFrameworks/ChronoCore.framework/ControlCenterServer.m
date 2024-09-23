@implementation ControlCenterServer

- (void)dealloc
{
  void *v3;
  _TtC10ChronoCore19ControlCenterServer *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore19ControlCenterServer__listener);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ControlCenterServer();
  -[ControlCenterServer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC10ChronoCore19ControlCenterServer)init
{
  _TtC10ChronoCore19ControlCenterServer *result;

  result = (_TtC10ChronoCore19ControlCenterServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC10ChronoCore19ControlCenterServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1D2942760(v8);

  swift_unknownObjectRelease();
}

@end
