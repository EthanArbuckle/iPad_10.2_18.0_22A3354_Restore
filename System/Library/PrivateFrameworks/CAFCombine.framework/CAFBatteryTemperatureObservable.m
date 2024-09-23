@implementation CAFBatteryTemperatureObservable

- (NSString)description
{
  _TtC10CAFCombine31CAFBatteryTemperatureObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFBatteryTemperatureObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine31CAFBatteryTemperatureObservable *v2;

  v2 = self;
  CAFBatteryTemperatureObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine31CAFBatteryTemperatureObservable)init
{
  CAFBatteryTemperatureObservable.init()();
}

- (void)batteryTemperatureService:(id)a3 didUpdateTemperature:(id)a4
{
  @objc CAFEngineTemperatureObservable.engineTemperatureService(_:didUpdateTemperature:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFBatteryTemperatureObservable.batteryTemperatureService(_:didUpdateTemperature:));
}

- (void)batteryTemperatureService:(id)a3 didUpdateTemperatureState:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine31CAFBatteryTemperatureObservable *v6;

  v5 = a3;
  v6 = self;
  CAFBatteryTemperatureObservable.batteryTemperatureService(_:didUpdateTemperatureState:)();

}

- (void)batteryTemperatureService:(id)a3 didUpdateTemperatureMin:(id)a4
{
  @objc CAFEngineTemperatureObservable.engineTemperatureService(_:didUpdateTemperature:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFBatteryTemperatureObservable.batteryTemperatureService(_:didUpdateTemperatureMin:));
}

- (void)batteryTemperatureService:(id)a3 didUpdateTemperatureMax:(id)a4
{
  @objc CAFEngineTemperatureObservable.engineTemperatureService(_:didUpdateTemperature:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFBatteryTemperatureObservable.batteryTemperatureService(_:didUpdateTemperatureMax:));
}

- (void)batteryTemperatureService:(id)a3 didUpdateTemperatureMarkerCold:(id)a4
{
  @objc CAFEngineTemperatureObservable.engineTemperatureService(_:didUpdateTemperatureMarkerCold:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFBatteryTemperatureObservable.batteryTemperatureService(_:didUpdateTemperatureMarkerCold:));
}

- (void)batteryTemperatureService:(id)a3 didUpdateTemperatureMarkerHot:(id)a4
{
  @objc CAFEngineTemperatureObservable.engineTemperatureService(_:didUpdateTemperatureMarkerCold:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFBatteryTemperatureObservable.batteryTemperatureService(_:didUpdateTemperatureMarkerHot:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine31CAFBatteryTemperatureObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFBatteryTemperatureObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine31CAFBatteryTemperatureObservable *v7;

  v6 = a3;
  v7 = self;
  CAFBatteryTemperatureObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine31CAFBatteryTemperatureObservable *v5;

  v4 = a3;
  v5 = self;
  CAFBatteryTemperatureObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
