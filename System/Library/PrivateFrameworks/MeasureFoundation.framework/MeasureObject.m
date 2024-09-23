@implementation MeasureObject

- (int64_t)state
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  _TtC17MeasureFoundation13MeasureObject *v4;
  int64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
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
  uint64_t v4;
  os_unfair_lock_s *v5;
  _TtC17MeasureFoundation13MeasureObject *v6;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  v6 = self;
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = a3;
  os_unfair_lock_unlock(v5);

  swift_release();
}

- (_TtC17MeasureFoundation13MeasureObject)init
{
  return (_TtC17MeasureFoundation13MeasureObject *)MeasureObject.init()();
}

- (void)dealloc
{
  _TtC17MeasureFoundation13MeasureObject *v2;

  v2 = self;
  MeasureObject.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___suggest));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___isConfirmable));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___canHandleTouch));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___confirm));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___prepareToclear));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___reconfirm));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___clear));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___percentVisible));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___distanceFromReticle));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___distanceFromCameraPlane));
  sub_2215EE3DC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject____lazy_storage___importanceWeight));
}

- (BOOL)isEqual:(id)a3
{
  _TtC17MeasureFoundation13MeasureObject *v4;
  _TtC17MeasureFoundation13MeasureObject *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_221653768();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = MeasureObject.isEqual(_:)((uint64_t)v8);

  sub_2215DDB1C((uint64_t)v8);
  return v6 & 1;
}

@end
