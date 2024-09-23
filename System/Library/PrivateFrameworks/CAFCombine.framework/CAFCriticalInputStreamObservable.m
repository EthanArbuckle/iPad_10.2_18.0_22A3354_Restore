@implementation CAFCriticalInputStreamObservable

- (NSString)description
{
  _TtC10CAFCombine32CAFCriticalInputStreamObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFCriticalInputStreamObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine32CAFCriticalInputStreamObservable *v2;

  v2 = self;
  CAFCriticalInputStreamObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine32CAFCriticalInputStreamObservable)init
{
  CAFCriticalInputStreamObservable.init()();
}

- (void)criticalInputStreamService:(id)a3 didUpdateInputStreamUID:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFCriticalInputStreamObservable.criticalInputStreamService(_:didUpdateInputStreamUID:));
}

- (void)criticalInputStreamService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine32CAFCriticalInputStreamObservable *v6;

  v5 = a3;
  v6 = self;
  CAFCriticalInputStreamObservable.criticalInputStreamService(_:didUpdateOn:)();

}

- (void)criticalInputStreamService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFCriticalInputStreamObservable.criticalInputStreamService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine32CAFCriticalInputStreamObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFCriticalInputStreamObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine32CAFCriticalInputStreamObservable *v7;

  v6 = a3;
  v7 = self;
  CAFCriticalInputStreamObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine32CAFCriticalInputStreamObservable *v5;

  v4 = a3;
  v5 = self;
  CAFCriticalInputStreamObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
