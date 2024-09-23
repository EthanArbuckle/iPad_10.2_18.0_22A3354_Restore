@implementation WorldPoint

- (NSArray)lines
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for WorldLine();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_221653318();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setLines:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for WorldLine();
  v4 = sub_221653324();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (int64_t)type
{
  uint64_t *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  _TtC17MeasureFoundation10WorldPoint *v6;
  int64_t v7;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type);
  swift_beginAccess();
  v4 = *v3;
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  v6 = self;
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v7 = *(_QWORD *)(v4 + 16);
  os_unfair_lock_unlock(v5);

  swift_release();
  return v7;
}

- (void)setType:(int64_t)a3
{
  _TtC17MeasureFoundation10WorldPoint *v4;

  v4 = self;
  WorldPoint.type.setter(a3);

}

- (int64_t)state
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  _TtC17MeasureFoundation10WorldPoint *v4;
  int64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v3 = *(os_unfair_lock_s **)(v2 + 24);
  v4 = self;
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 16);
  os_unfair_lock_unlock(v3);

  swift_release();
  return v5;
}

- (void)setState:(int64_t)a3
{
  _TtC17MeasureFoundation10WorldPoint *v4;

  v4 = self;
  WorldPoint.state.setter(a3);

}

- (_TtC17MeasureFoundation10WorldPoint)init
{
  _TtC17MeasureFoundation10WorldPoint *result;

  result = (_TtC17MeasureFoundation10WorldPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end
