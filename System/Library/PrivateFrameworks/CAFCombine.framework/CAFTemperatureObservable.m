@implementation CAFTemperatureObservable

- (NSString)description
{
  _TtC10CAFCombine24CAFTemperatureObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFTemperatureObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine24CAFTemperatureObservable *v2;

  v2 = self;
  CAFTemperatureObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine24CAFTemperatureObservable)init
{
  CAFTemperatureObservable.init()();
}

- (void)temperatureService:(id)a3 didUpdateCurrentTemperature:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10CAFCombine24CAFTemperatureObservable *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitTemperature);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
    v11 = (uint64_t)v9;
    v12 = 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
    v11 = (uint64_t)v9;
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  v13 = a3;
  v14 = self;
  CAFTemperatureObservable.temperatureService(_:didUpdateCurrentTemperature:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<NSUnitTemperature>?((uint64_t)v9, &demangling cache variable for type metadata for Measurement<NSUnitTemperature>?);
}

- (void)temperatureService:(id)a3 didUpdateTargetTemperature:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10CAFCombine24CAFTemperatureObservable *v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitTemperature);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  CAFTemperatureObservable.temperatureService(_:didUpdateTargetTemperature:)((uint64_t)v11, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)temperatureService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:));
}

- (void)temperatureService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFTemperatureObservable.temperatureService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine24CAFTemperatureObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFTemperatureObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine24CAFTemperatureObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTemperatureObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine24CAFTemperatureObservable *v5;

  v4 = a3;
  v5 = self;
  CAFTemperatureObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
