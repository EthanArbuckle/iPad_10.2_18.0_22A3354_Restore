@implementation WidgetReaper

- (NSProgress)progress
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC9ChronoKit12WidgetReaper_progress);
  swift_beginAccess();
  return (NSProgress *)*v2;
}

- (void)setProgress:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC9ChronoKit12WidgetReaper_progress);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC9ChronoKit12WidgetReaper)init
{
  _TtC9ChronoKit12WidgetReaper *result;

  result = (_TtC9ChronoKit12WidgetReaper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1D25D014C((uint64_t)self + OBJC_IVAR____TtC9ChronoKit12WidgetReaper_cutoffDate);
  swift_bridgeObjectRelease();

}

@end
