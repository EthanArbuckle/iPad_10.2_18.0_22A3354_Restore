@implementation CloudSyncStateObserver

- (_TtC18HealthExperienceUI22CloudSyncStateObserver)init
{
  _TtC18HealthExperienceUI22CloudSyncStateObserver *result;

  result = (_TtC18HealthExperienceUI22CloudSyncStateObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI22CloudSyncStateObserver_firstRestoreStateChangeHandler));
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI22CloudSyncStateObserver_stateChangeHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22CloudSyncStateObserver_cloudSyncObserver));
  sub_1A99C9680((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22CloudSyncStateObserver_store);
}

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
  id v6;
  id v7;
  _TtC18HealthExperienceUI22CloudSyncStateObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A99CA334(0xD000000000000026, 0x80000001A9AEA170, MEMORY[0x1E0D29F30], (uint64_t)sub_1A99CAC54);

}

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v6;
  _TtC18HealthExperienceUI22CloudSyncStateObserver *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  CloudSyncStateObserver.cloudSyncObserver(_:syncFailedWithError:)(v6, a4);

}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI22CloudSyncStateObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1A99CA334(0xD000000000000022, 0x80000001A9AEA140, MEMORY[0x1E0D29F50], (uint64_t)sub_1A99CAC54);

}

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  _TtC18HealthExperienceUI22CloudSyncStateObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A99CA684(v7);

}

@end
