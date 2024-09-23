@implementation MapsSyncRange

- (_TtC8MapsSync13MapsSyncRange)initWithOffset:(int64_t)a3 limit:(int64_t)a4
{
  int64_t *v4;
  objc_super v6;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range);
  *v4 = a3;
  v4[1] = a4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MapsSyncRange();
  return -[MapsSyncRange init](&v6, sel_init);
}

- (int64_t)offset
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range);
}

- (int64_t)limit
{
  return *(_QWORD *)&self->_range[OBJC_IVAR____TtC8MapsSync13MapsSyncRange__range];
}

- (_TtC8MapsSync13MapsSyncRange)init
{
  _TtC8MapsSync13MapsSyncRange *result;

  result = (_TtC8MapsSync13MapsSyncRange *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
