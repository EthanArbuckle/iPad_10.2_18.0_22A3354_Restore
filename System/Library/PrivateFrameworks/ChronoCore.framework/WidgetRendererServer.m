@implementation WidgetRendererServer

- (void)dealloc
{
  void *v3;
  _TtC10ChronoCore20WidgetRendererServer *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore20WidgetRendererServer__listener);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WidgetRendererServer();
  -[WidgetRendererServer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC10ChronoCore20WidgetRendererServer)init
{
  _TtC10ChronoCore20WidgetRendererServer *result;

  result = (_TtC10ChronoCore20WidgetRendererServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC10ChronoCore20WidgetRendererServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1D28F7900(v8);

  swift_unknownObjectRelease();
}

@end
