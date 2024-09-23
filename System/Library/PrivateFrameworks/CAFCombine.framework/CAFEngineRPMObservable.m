@implementation CAFEngineRPMObservable

- (NSString)description
{
  _TtC10CAFCombine22CAFEngineRPMObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFEngineRPMObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine22CAFEngineRPMObservable *v2;

  v2 = self;
  CAFEngineRPMObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine22CAFEngineRPMObservable)init
{
  CAFEngineRPMObservable.init()();
}

- (void)engineRPMService:(id)a3 didUpdateRotationalSpeed:(id)a4
{
  @objc CAFEngineRPMObservable.engineRPMService(_:didUpdateRotationalSpeed:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFEngineRPMObservable.engineRPMService(_:didUpdateRotationalSpeed:));
}

- (void)engineRPMService:(id)a3 didUpdateRotationalSpeedState:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine22CAFEngineRPMObservable *v6;

  v5 = a3;
  v6 = self;
  CAFEngineRPMObservable.engineRPMService(_:didUpdateRotationalSpeedState:)();

}

- (void)engineRPMService:(id)a3 didUpdateRotationalSpeedMarkerRedline:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC10CAFCombine22CAFEngineRPMObservable *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitRotationalSpeed>?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    type metadata accessor for CAFTemperature(0, (unint64_t *)&lazy cache variable for type metadata for CAFUnitRotationalSpeed);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitRotationalSpeed>);
    v11 = (uint64_t)v9;
    v12 = 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<CAFUnitRotationalSpeed>);
    v11 = (uint64_t)v9;
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v11, v12, 1, v10);
  v13 = a3;
  v14 = self;
  CAFEngineRPMObservable.engineRPMService(_:didUpdateRotationalSpeedMarkerRedline:)((uint64_t)v14, (uint64_t)v9);

  outlined destroy of Measurement<CAFUnitRotationalSpeed>?((uint64_t)v9);
}

- (void)engineRPMService:(id)a3 didUpdateRotationalSpeedMax:(id)a4
{
  @objc CAFEngineRPMObservable.engineRPMService(_:didUpdateRotationalSpeed:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFEngineRPMObservable.engineRPMService(_:didUpdateRotationalSpeedMax:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine22CAFEngineRPMObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFEngineRPMObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine22CAFEngineRPMObservable *v7;

  v6 = a3;
  v7 = self;
  CAFEngineRPMObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine22CAFEngineRPMObservable *v5;

  v4 = a3;
  v5 = self;
  CAFEngineRPMObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
