@implementation HDSwimTracker

- (_TtP12HealthDaemon20HDCMSwimTrackerProxy_)tracker
{
  _TtC12HealthDaemon13HDSwimTracker *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B7853BBC();

  return (_TtP12HealthDaemon20HDCMSwimTrackerProxy_ *)v3;
}

- (void)setTracker:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon13HDSwimTracker____lazy_storage___tracker) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC12HealthDaemon13HDSwimTracker)initWithProfile:(id)a3
{
  return (_TtC12HealthDaemon13HDSwimTracker *)HDSwimTracker.init(profile:)(a3);
}

- (id)makeSwimTracker
{
  id v3;
  _TtC12HealthDaemon13HDSwimTracker *v4;
  id v5;
  objc_class *v6;
  char *v7;
  id v8;
  _TtC12HealthDaemon13HDSwimTracker *v9;
  objc_super v11;

  v3 = objc_allocWithZone(MEMORY[0x1E0CA56E8]);
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  v6 = (objc_class *)type metadata accessor for HDCMSwimTracker();
  v7 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v7[OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker] = v5;
  v11.receiver = v7;
  v11.super_class = v6;
  v8 = v5;
  v9 = -[HDSwimTracker init](&v11, sel_init);

  return v9;
}

- (void)startWith:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC12HealthDaemon13HDSwimTracker *v8;
  uint64_t v9;

  v4 = sub_1B7EF9C20();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B7EF9C14();
  v8 = self;
  sub_1B7854074();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)stop
{
  _TtC12HealthDaemon13HDSwimTracker *v2;

  v2 = self;
  sub_1B785481C();

}

- (void)registerObserver:(id)a3
{
  _TtC12HealthDaemon13HDSwimTracker *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1B78557E0((uint64_t)a3, (uint64_t)v5);
  swift_unknownObjectRelease();

}

- (void)unregisterObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon13HDSwimTracker_observers), sel_unregisterObserver_, a3);
}

- (_TtC12HealthDaemon13HDSwimTracker)init
{
  _TtC12HealthDaemon13HDSwimTracker *result;

  result = (_TtC12HealthDaemon13HDSwimTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();

}

@end
