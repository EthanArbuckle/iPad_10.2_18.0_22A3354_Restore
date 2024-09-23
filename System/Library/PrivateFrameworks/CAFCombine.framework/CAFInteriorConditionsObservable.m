@implementation CAFInteriorConditionsObservable

- (NSString)description
{
  _TtC10CAFCombine31CAFInteriorConditionsObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  CAFInteriorConditionsObservable.description.getter();
  v4 = v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x23B811BC4](v4, v6);
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)dealloc
{
  _TtC10CAFCombine31CAFInteriorConditionsObservable *v2;

  v2 = self;
  CAFInteriorConditionsObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine31CAFInteriorConditionsObservable)init
{
  CAFInteriorConditionsObservable.init()();
}

- (void)interiorConditionsService:(id)a3 didUpdateAqi:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10CAFCombine31CAFInteriorConditionsObservable *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitAirQuality>?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for CAFUnitAirQuality);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitAirQuality>);
    v11 = (uint64_t)v9;
    v12 = 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitAirQuality>);
    v11 = (uint64_t)v9;
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  v13 = a3;
  v14 = self;
  CAFInteriorConditionsObservable.interiorConditionsService(_:didUpdateAqi:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitAirQuality>?((uint64_t)v9);
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine31CAFInteriorConditionsObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFInteriorConditionsObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine31CAFInteriorConditionsObservable *v7;

  v6 = a3;
  v7 = self;
  CAFInteriorConditionsObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine31CAFInteriorConditionsObservable *v5;

  v4 = a3;
  v5 = self;
  CAFInteriorConditionsObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
