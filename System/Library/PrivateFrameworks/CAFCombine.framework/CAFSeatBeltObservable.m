@implementation CAFSeatBeltObservable

- (NSString)description
{
  _TtC10CAFCombine21CAFSeatBeltObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFSeatBeltObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine21CAFSeatBeltObservable *v2;

  v2 = self;
  CAFSeatBeltObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine21CAFSeatBeltObservable)init
{
  CAFSeatBeltObservable.init()();
}

- (void)seatBeltService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFSeatBeltObservable.seatBeltService(_:didUpdateVehicleLayoutKey:));
}

- (void)seatBeltService:(id)a3 didUpdateSeatOccupancy:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine21CAFSeatBeltObservable *v7;

  v6 = a3;
  v7 = self;
  CAFSeatBeltObservable.seatBeltService(_:didUpdateSeatOccupancy:)((uint64_t)v7, a4);

}

- (void)seatBeltService:(id)a3 didUpdateBuckleState:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine21CAFSeatBeltObservable *v7;

  v6 = a3;
  v7 = self;
  CAFSeatBeltObservable.seatBeltService(_:didUpdateBuckleState:)((uint64_t)v7, a4);

}

- (void)seatBeltService:(id)a3 didUpdateSeatBeltIndicator:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine21CAFSeatBeltObservable *v6;

  v5 = a3;
  v6 = self;
  CAFSeatBeltObservable.seatBeltService(_:didUpdateSeatBeltIndicator:)();

}

- (void)seatBeltService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFSeatBeltObservable.seatBeltService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine21CAFSeatBeltObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFSeatBeltObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine21CAFSeatBeltObservable *v7;

  v6 = a3;
  v7 = self;
  CAFSeatBeltObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine21CAFSeatBeltObservable *v5;

  v4 = a3;
  v5 = self;
  CAFSeatBeltObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
