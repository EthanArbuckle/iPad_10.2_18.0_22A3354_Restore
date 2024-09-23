@implementation WorldRectangle

- (int64_t)state
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  _TtC17MeasureFoundation14WorldRectangle *v4;
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
  _TtC17MeasureFoundation14WorldRectangle *v4;

  v4 = self;
  WorldRectangle.state.setter(a3);

}

- (_TtC17MeasureFoundation14WorldRectangle)init
{
  _TtC17MeasureFoundation14WorldRectangle *result;

  result = (_TtC17MeasureFoundation14WorldRectangle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[304];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2215C6540((uint64_t)self + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data, (uint64_t)v3, qword_2556D8F80);
  sub_22164A72C((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22164A7B0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction));
}

@end
