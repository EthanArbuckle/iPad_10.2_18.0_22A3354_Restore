@implementation _LocationAuthorizationMonitorImpl

- (void)dealloc
{
  id v2;
  objc_super v3;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_manager))
  {
    __break(1u);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)swift_getObjectType();
    v2 = v3.receiver;
    -[_LocationAuthorizationMonitorImpl dealloc](&v3, sel_dealloc);
  }
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl_containerIdentifier;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED955F50);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1D273E950(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ChronoCore33_LocationAuthorizationMonitorImpl__didChangeHandler));
  swift_unknownObjectRelease();
  swift_release();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC10ChronoCore33_LocationAuthorizationMonitorImpl *v5;

  v4 = a3;
  v5 = self;
  sub_1D29BFAF8();

}

- (_TtC10ChronoCore33_LocationAuthorizationMonitorImpl)init
{
  _TtC10ChronoCore33_LocationAuthorizationMonitorImpl *result;

  result = (_TtC10ChronoCore33_LocationAuthorizationMonitorImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
