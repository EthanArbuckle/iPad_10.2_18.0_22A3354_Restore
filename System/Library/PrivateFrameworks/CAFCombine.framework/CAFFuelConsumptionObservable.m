@implementation CAFFuelConsumptionObservable

- (NSString)description
{
  _TtC10CAFCombine28CAFFuelConsumptionObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFFuelConsumptionObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine28CAFFuelConsumptionObservable *v2;

  v2 = self;
  CAFFuelConsumptionObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine28CAFFuelConsumptionObservable)init
{
  CAFFuelConsumptionObservable.init()();
}

- (void)fuelConsumptionService:(id)a3 didUpdateFuelEfficiency:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10CAFCombine28CAFFuelConsumptionObservable *v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitFuelEfficiency>);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitFuelEfficiency);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  CAFFuelConsumptionObservable.fuelConsumptionService(_:didUpdateFuelEfficiency:)((uint64_t)v11, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine28CAFFuelConsumptionObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFFuelConsumptionObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine28CAFFuelConsumptionObservable *v7;

  v6 = a3;
  v7 = self;
  CAFFuelConsumptionObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine28CAFFuelConsumptionObservable *v5;

  v4 = a3;
  v5 = self;
  CAFFuelConsumptionObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
