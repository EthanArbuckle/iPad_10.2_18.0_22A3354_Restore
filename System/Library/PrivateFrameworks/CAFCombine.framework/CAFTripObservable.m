@implementation CAFTripObservable

- (NSString)description
{
  _TtC10CAFCombine17CAFTripObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFTripObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine17CAFTripObservable *v2;

  v2 = self;
  CAFTripObservable.__deallocating_deinit();
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
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine17CAFTripObservable)init
{
  CAFTripObservable.init()();
}

- (void)tripService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  id v6;
  _TtC10CAFCombine17CAFTripObservable *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFTripObservable.tripService(_:didUpdateUserVisibleLabel:)();

  swift_bridgeObjectRelease();
}

- (void)tripService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine17CAFTripObservable *v6;

  v5 = a3;
  v6 = self;
  CAFTripObservable.tripService(_:didUpdateSortOrder:)();

}

- (void)tripService:(id)a3 didUpdateTripReset:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine17CAFTripObservable *v6;

  v5 = a3;
  v6 = self;
  CAFTripObservable.tripService(_:didUpdateTripReset:)();

}

- (void)tripService:(id)a3 didUpdateAverageSpeed:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10CAFCombine17CAFTripObservable *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitSpeed);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
    v11 = (uint64_t)v9;
    v12 = 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
    v11 = (uint64_t)v9;
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateAverageSpeed:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitPercent>?((uint64_t)v9, &demangling cache variable for type metadata for Measurement<NSUnitSpeed>?);
}

- (void)tripService:(id)a3 didUpdateDistance:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10CAFCombine17CAFTripObservable *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitLength>?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for NSUnitLength);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitLength>);
    v11 = (uint64_t)v9;
    v12 = 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitLength>);
    v11 = (uint64_t)v9;
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateDistance:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitPercent>?((uint64_t)v9, (uint64_t *)&demangling cache variable for type metadata for Measurement<NSUnitLength>?);
}

- (void)tripService:(id)a3 didUpdateDuration:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10CAFCombine17CAFTripObservable *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for NSUnitDuration);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
    v11 = (uint64_t)v9;
    v12 = 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
    v11 = (uint64_t)v9;
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateDuration:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitPercent>?((uint64_t)v9, &demangling cache variable for type metadata for Measurement<NSUnitDuration>?);
}

- (void)tripService:(id)a3 didUpdateEnergy:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10CAFCombine17CAFTripObservable *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitEnergy>?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitEnergy);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitEnergy>);
    v11 = (uint64_t)v9;
    v12 = 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitEnergy>);
    v11 = (uint64_t)v9;
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateEnergy:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitPercent>?((uint64_t)v9, &demangling cache variable for type metadata for Measurement<NSUnitEnergy>?);
}

- (void)tripService:(id)a3 didUpdateEnergyEfficiency:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10CAFCombine17CAFTripObservable *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitEnergyEfficiency>?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for CAFUnitEnergyEfficiency);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitEnergyEfficiency>);
    v11 = (uint64_t)v9;
    v12 = 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitEnergyEfficiency>);
    v11 = (uint64_t)v9;
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateEnergyEfficiency:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitPercent>?((uint64_t)v9, &demangling cache variable for type metadata for Measurement<CAFUnitEnergyEfficiency>?);
}

- (void)tripService:(id)a3 didUpdateFuelEfficiency:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10CAFCombine17CAFTripObservable *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitFuelEfficiency>?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for NSUnitFuelEfficiency);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitFuelEfficiency>);
    v11 = (uint64_t)v9;
    v12 = 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitFuelEfficiency>);
    v11 = (uint64_t)v9;
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  v13 = a3;
  v14 = self;
  CAFTripObservable.tripService(_:didUpdateFuelEfficiency:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitPercent>?((uint64_t)v9, &demangling cache variable for type metadata for Measurement<NSUnitFuelEfficiency>?);
}

- (void)tripService:(id)a3 didUpdateShowOdometer:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine17CAFTripObservable *v6;

  v5 = a3;
  v6 = self;
  CAFTripObservable.tripService(_:didUpdateShowOdometer:)();

}

- (void)tripService:(id)a3 didUpdateName:(id)a4
{
  id v6;
  _TtC10CAFCombine17CAFTripObservable *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFTripObservable.tripService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine17CAFTripObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFTripObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine17CAFTripObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTripObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine17CAFTripObservable *v5;

  v4 = a3;
  v5 = self;
  CAFTripObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
