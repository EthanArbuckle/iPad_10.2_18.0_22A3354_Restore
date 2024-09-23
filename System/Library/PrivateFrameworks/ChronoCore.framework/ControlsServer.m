@implementation ControlsServer

- (void)dealloc
{
  void *v3;
  _TtC10ChronoCore14ControlsServer *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore14ControlsServer__listener);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ControlsServer();
  -[ControlsServer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC10ChronoCore14ControlsServer)init
{
  _TtC10ChronoCore14ControlsServer *result;

  result = (_TtC10ChronoCore14ControlsServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC10ChronoCore14ControlsServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1D292B8CC(v8);

  swift_unknownObjectRelease();
}

@end
