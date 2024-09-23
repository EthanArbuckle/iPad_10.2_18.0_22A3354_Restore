@implementation SystemCoordinatorHost

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC15GroupActivities21SystemCoordinatorHost *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15GroupActivities21SystemCoordinatorHost_listener);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[SystemCoordinatorHost dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC15GroupActivities21SystemCoordinatorHost_uuid;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  outlined destroy of weak SystemCoordinatorHostDelegate?((uint64_t)self + OBJC_IVAR____TtC15GroupActivities21SystemCoordinatorHost_delegate);
  swift_release();

}

- (_TtC15GroupActivities21SystemCoordinatorHost)init
{
  _TtC15GroupActivities21SystemCoordinatorHost *result;

  result = (_TtC15GroupActivities21SystemCoordinatorHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC15GroupActivities21SystemCoordinatorHost *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized SystemCoordinatorHost.listener(_:shouldAcceptNewConnection:)(v7);

  return v9;
}

@end
