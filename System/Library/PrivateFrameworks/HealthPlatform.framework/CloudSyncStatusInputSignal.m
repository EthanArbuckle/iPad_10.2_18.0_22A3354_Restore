@implementation CloudSyncStatusInputSignal

- (void)cloudSyncObserver:(id)a3 syncDidStartWithProgress:(id)a4
{
  id v6;
  id v7;
  _TtC14HealthPlatform26CloudSyncStatusInputSignal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1BC7FA93C(v7);

}

- (void)cloudSyncObserver:(id)a3 syncFailedWithError:(id)a4
{
  id v6;
  _TtC14HealthPlatform26CloudSyncStatusInputSignal *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_1BC7FABE0(a4);

}

- (void)cloudSyncObserverSyncCompleted:(id)a3
{
  id v4;
  _TtC14HealthPlatform26CloudSyncStatusInputSignal *v5;

  v4 = a3;
  v5 = self;
  _s14HealthPlatform26CloudSyncStatusInputSignalC05cloudd8ObserverD9CompletedyySo07HKClouddI0CF_0();

}

- (void)cloudSyncObserverStatusUpdated:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  _TtC14HealthPlatform26CloudSyncStatusInputSignal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1BC7FB0EC(v7);

}

- (void)cloudSyncObserver:(id)a3 syncStartedForRequest:(id)a4 withProgress:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC14HealthPlatform26CloudSyncStatusInputSignal *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1BC7FB328(v9, v10);

}

- (void)cloudSyncObserver:(id)a3 syncFailedForRequest:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC14HealthPlatform26CloudSyncStatusInputSignal *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1BC7FB678(v9, a5);

}

- (void)cloudSyncObserver:(id)a3 syncCompletedForRequest:(id)a4
{
  id v6;
  id v7;
  _TtC14HealthPlatform26CloudSyncStatusInputSignal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1BC7FBA2C(v7);

}

- (_TtC14HealthPlatform26CloudSyncStatusInputSignal)init
{
  _TtC14HealthPlatform26CloudSyncStatusInputSignal *result;

  result = (_TtC14HealthPlatform26CloudSyncStatusInputSignal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end
