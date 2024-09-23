@implementation HDCMSwimTracker

- (CMSwimTracker)tracker
{
  return (CMSwimTracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker));
}

- (void)setTracker:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker) = (Class)a3;
  v3 = a3;

}

- (void)startUpdatesFromRecord:(id)a3 handler:(id)a4
{
  sub_1B7859204(self, (int)a2, a3, a4, (uint64_t)&unk_1E6CE76E0, (uint64_t)sub_1B78595FC, (void (*)(void *, uint64_t, uint64_t))sub_1B7858D64);
}

- (void)stopUpdates
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker), sel_stopUpdates);
}

- (void)querySwimUpdatesFromRecord:(id)a3 handler:(id)a4
{
  sub_1B7859204(self, (int)a2, a3, a4, (uint64_t)&unk_1E6CE76B8, (uint64_t)sub_1B7859554, (void (*)(void *, uint64_t, uint64_t))sub_1B7858F24);
}

- (id)init:(id)a3
{
  id v4;
  _TtC12HealthDaemon15HDCMSwimTracker *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HDCMSwimTracker();
  v4 = a3;
  v5 = -[HDCMSwimTracker init](&v7, sel_init);

  return v5;
}

- (_TtC12HealthDaemon15HDCMSwimTracker)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon15HDCMSwimTracker_tracker) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HDCMSwimTracker();
  return -[HDCMSwimTracker init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
