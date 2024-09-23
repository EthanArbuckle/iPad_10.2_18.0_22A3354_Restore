@implementation CAFBatteryLevelObservable

- (NSString)description
{
  _TtC10CAFCombine25CAFBatteryLevelObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFBatteryLevelObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine25CAFBatteryLevelObservable *v2;

  v2 = self;
  CAFBatteryLevelObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine25CAFBatteryLevelObservable)init
{
  CAFBatteryLevelObservable.init()();
}

- (void)batteryLevelService:(id)a3 didUpdateBatteryLevel:(id)a4
{
  @objc CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevel:));
}

- (void)batteryLevelService:(id)a3 didUpdateBatteryLevelState:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine25CAFBatteryLevelObservable *v6;

  v5 = a3;
  v6 = self;
  CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevelState:)();

}

- (void)batteryLevelService:(id)a3 didUpdateBatteryLevelMarkerLow:(id)a4
{
  @objc CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevelMarkerLow:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevelMarkerLow:));
}

- (void)batteryLevelService:(id)a3 didUpdateBatteryLevelMarkerCriticalLow:(id)a4
{
  @objc CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevelMarkerLow:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevelMarkerCriticalLow:));
}

- (void)batteryLevelService:(id)a3 didUpdateBatteryTargetChargeLevel:(id)a4
{
  @objc CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryLevel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFBatteryLevelObservable.batteryLevelService(_:didUpdateBatteryTargetChargeLevel:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine25CAFBatteryLevelObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFBatteryLevelObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine25CAFBatteryLevelObservable *v7;

  v6 = a3;
  v7 = self;
  CAFBatteryLevelObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine25CAFBatteryLevelObservable *v5;

  v4 = a3;
  v5 = self;
  CAFBatteryLevelObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
