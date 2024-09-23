@implementation CloudSyncEventPublisherObserver

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
  sub_1BC897560(self, (uint64_t)a2, a3, a4);
}

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v6;
  _TtC16HealthExperience31CloudSyncEventPublisherObserver *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1BC933A5C();

}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  id v4;
  _TtC16HealthExperience31CloudSyncEventPublisherObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1BC933A5C();

}

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
  sub_1BC897560(self, (uint64_t)a2, a3, a4);
}

- (_TtC16HealthExperience31CloudSyncEventPublisherObserver)init
{
  _TtC16HealthExperience31CloudSyncEventPublisherObserver *result;

  result = (_TtC16HealthExperience31CloudSyncEventPublisherObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience31CloudSyncEventPublisherObserver_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience31CloudSyncEventPublisherObserver_observer));
  swift_release();
  swift_release();
}

@end
