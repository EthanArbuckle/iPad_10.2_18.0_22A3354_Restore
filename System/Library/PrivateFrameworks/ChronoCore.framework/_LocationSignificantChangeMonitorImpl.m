@implementation _LocationSignificantChangeMonitorImpl

- (void)dealloc
{
  id v2;
  objc_super v3;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore37_LocationSignificantChangeMonitorImpl_manager))
  {
    __break(1u);
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)swift_getObjectType();
    v2 = v3.receiver;
    -[_LocationSignificantChangeMonitorImpl dealloc](&v3, sel_dealloc);
  }
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1D273E950(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ChronoCore37_LocationSignificantChangeMonitorImpl__didChangeHandler));
  swift_unknownObjectRelease();
  swift_release();
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  _TtC10ChronoCore37_LocationSignificantChangeMonitorImpl *v6;

  v5 = a3;
  v6 = self;
  sub_1D2811C90();

}

- (_TtC10ChronoCore37_LocationSignificantChangeMonitorImpl)init
{
  _TtC10ChronoCore37_LocationSignificantChangeMonitorImpl *result;

  result = (_TtC10ChronoCore37_LocationSignificantChangeMonitorImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
