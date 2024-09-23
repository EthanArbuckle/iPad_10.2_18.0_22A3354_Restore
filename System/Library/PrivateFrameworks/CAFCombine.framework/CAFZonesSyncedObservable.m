@implementation CAFZonesSyncedObservable

- (NSString)description
{
  _TtC10CAFCombine24CAFZonesSyncedObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFZonesSyncedObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine24CAFZonesSyncedObservable *v2;

  v2 = self;
  CAFZonesSyncedObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine24CAFZonesSyncedObservable)init
{
  CAFZonesSyncedObservable.init()();
}

- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine24CAFZonesSyncedObservable *v6;

  v5 = a3;
  v6 = self;
  CAFZonesSyncedObservable.zonesSyncedService(_:didUpdateOn:)();

}

- (void)zonesSyncedService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
  id v6;
  _TtC10CAFCombine24CAFZonesSyncedObservable *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFZonesSyncedObservable.zonesSyncedService(_:didUpdateVehicleLayoutKey:)();

  swift_bridgeObjectRelease();
}

- (void)zonesSyncedService:(id)a3 didUpdateName:(id)a4
{
  id v6;
  _TtC10CAFCombine24CAFZonesSyncedObservable *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFZonesSyncedObservable.zonesSyncedService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine24CAFZonesSyncedObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFZonesSyncedObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine24CAFZonesSyncedObservable *v7;

  v6 = a3;
  v7 = self;
  CAFZonesSyncedObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine24CAFZonesSyncedObservable *v5;

  v4 = a3;
  v5 = self;
  CAFZonesSyncedObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
