@implementation CAFProtocolPerfTestObservable

- (NSString)description
{
  _TtC10CAFCombine29CAFProtocolPerfTestObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  CAFProtocolPerfTestObservable.description.getter();
  v4 = v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x23B811BC4](v4, v6);
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)dealloc
{
  _TtC10CAFCombine29CAFProtocolPerfTestObservable *v2;

  v2 = self;
  CAFProtocolPerfTestObservable.__deallocating_deinit();
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
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine29CAFProtocolPerfTestObservable)init
{
  CAFProtocolPerfTestObservable.init()();
}

- (void)protocolPerfTestService:(id)a3 didUpdateTestInt32:(int)a4
{
  id v6;
  _TtC10CAFCombine29CAFProtocolPerfTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestInt32:)((uint64_t)v7, a4);

}

- (void)protocolPerfTestService:(id)a3 didUpdateTestInt16:(signed __int16)a4
{
  id v5;
  _TtC10CAFCombine29CAFProtocolPerfTestObservable *v6;

  v5 = a3;
  v6 = self;
  CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestInt16:)();

}

- (void)protocolPerfTestService:(id)a3 didUpdateTestUInt32:(unsigned int)a4
{
  id v6;
  _TtC10CAFCombine29CAFProtocolPerfTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestUInt32:)((uint64_t)v7, a4);

}

- (void)protocolPerfTestService:(id)a3 didUpdateTestUInt16:(unsigned __int16)a4
{
  id v5;
  _TtC10CAFCombine29CAFProtocolPerfTestObservable *v6;

  v5 = a3;
  v6 = self;
  CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestUInt16:)();

}

- (void)protocolPerfTestService:(id)a3 didUpdateTestString:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestString:));
}

- (void)protocolPerfTestService:(id)a3 didUpdateTestString2:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateTestString2:));
}

- (void)protocolPerfTestService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFProtocolPerfTestObservable.protocolPerfTestService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine29CAFProtocolPerfTestObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFProtocolPerfTestObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine29CAFProtocolPerfTestObservable *v7;

  v6 = a3;
  v7 = self;
  CAFProtocolPerfTestObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine29CAFProtocolPerfTestObservable *v5;

  v4 = a3;
  v5 = self;
  CAFProtocolPerfTestObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
