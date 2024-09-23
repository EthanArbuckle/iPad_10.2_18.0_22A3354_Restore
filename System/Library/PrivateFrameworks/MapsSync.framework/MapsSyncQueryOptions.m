@implementation MapsSyncQueryOptions

- (_TtC8MapsSync22MapsSyncQueryPredicate)predicate
{
  return (_TtC8MapsSync22MapsSyncQueryPredicate *)sub_1A41D5DE8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_predicate);
}

- (void)setPredicate:(id)a3
{
  sub_1A41D5E84((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_predicate);
}

- (_TtC8MapsSync13MapsSyncRange)range
{
  return (_TtC8MapsSync13MapsSyncRange *)sub_1A41D5DE8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_range);
}

- (void)setRange:(id)a3
{
  sub_1A41D5E84((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_range);
}

- (NSArray)sortDescriptors
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_sortDescriptors);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1A423C1B8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setSortDescriptors:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
    v3 = sub_1A423C1C4();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_sortDescriptors);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (BOOL)notifyOnLoad
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_notifyOnLoad);
}

- (void)setNotifyOnLoad:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_notifyOnLoad) = a3;
}

- (BOOL)lazyLoad
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_lazyLoad;
  swift_beginAccess();
  return *v2;
}

- (void)setLazyLoad:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC8MapsSync20MapsSyncQueryOptions_lazyLoad;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC8MapsSync20MapsSyncQueryOptions)initWithPredicate:(id)a3 sortDescriptors:(id)a4 range:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  _TtC8MapsSync20MapsSyncQueryOptions *v10;

  v6 = (uint64_t)a4;
  if (a4)
  {
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
    v6 = sub_1A423C1C4();
  }
  v8 = a3;
  v9 = a5;
  v10 = (_TtC8MapsSync20MapsSyncQueryOptions *)sub_1A41D7E8C(a3, v6, a5);

  return v10;
}

- (_TtC8MapsSync20MapsSyncQueryOptions)initWithOptions:(id)a3
{
  id v3;
  _TtC8MapsSync20MapsSyncQueryOptions *v4;

  v3 = a3;
  v4 = (_TtC8MapsSync20MapsSyncQueryOptions *)sub_1A41D8134((uint64_t)v3);

  return v4;
}

+ (id)restrictOptionsWithOptions:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  unint64_t v5;
  id v8;
  id v9;
  char *v10;

  v5 = (unint64_t)a5;
  if (a5)
  {
    sub_1A40D19C0(0, (unint64_t *)&unk_1ED1AC480);
    v5 = sub_1A423C1C4();
  }
  v8 = a3;
  v9 = a4;
  v10 = sub_1A41D82EC(a3, a4, v5);

  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC8MapsSync20MapsSyncQueryOptions)init
{
  _TtC8MapsSync20MapsSyncQueryOptions *result;

  result = (_TtC8MapsSync20MapsSyncQueryOptions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
