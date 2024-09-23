@implementation CAFDimensionObservable

- (void)dealloc
{
  _TtC10CAFCombine22CAFDimensionObservable *v2;

  v2 = self;
  CAFDimensionObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Locale>);
  OUTLINED_FUNCTION_0_3(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFMeasurementSystem>);
  OUTLINED_FUNCTION_0_3(v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitTemperature>);
  OUTLINED_FUNCTION_0_3(v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitPressure>);
  OUTLINED_FUNCTION_0_3(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitSpeed>);
  OUTLINED_FUNCTION_0_3(v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitLength>);
  OUTLINED_FUNCTION_0_3(v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<NSUnitFuelEfficiency>);
  OUTLINED_FUNCTION_0_3(v9);
  v10 = (char *)self + OBJC_IVAR____TtC10CAFCombine22CAFDimensionObservable__vehicleChargePowerUnit;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<NSUnitPower>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

- (_TtC10CAFCombine22CAFDimensionObservable)init
{
  CAFDimensionObservable.init()();
}

- (void)dimensionManager:(id)a3 didUpdateLocale:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10CAFCombine22CAFDimensionObservable *v11;
  uint64_t v12;

  v6 = type metadata accessor for Locale();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdate:)((uint64_t)v11, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)dimensionManager:(id)a3 didUpdateMeasurementSystem:(unint64_t)a4
{
  id v5;
  _TtC10CAFCombine22CAFDimensionObservable *v6;

  v5 = a3;
  v6 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdate:)();

}

- (void)dimensionManager:(id)a3 didUpdateTemperatureUnit:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine22CAFDimensionObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateTemperatureUnit:)((uint64_t)v8, v7);

}

- (void)dimensionManager:(id)a3 didUpdateTirePressureUnit:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine22CAFDimensionObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateTirePressureUnit:)((uint64_t)v8, v7);

}

- (void)dimensionManager:(id)a3 didUpdateVehicleSpeedUnit:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine22CAFDimensionObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateVehicleSpeedUnit:)((uint64_t)v8, v7);

}

- (void)dimensionManager:(id)a3 didUpdateVehicleRangeUnit:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine22CAFDimensionObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateVehicleRangeUnit:)((uint64_t)v8, v7);

}

- (void)dimensionManager:(id)a3 didUpdateVehicleFuelEfficiencyUnit:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine22CAFDimensionObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateVehicleFuelEfficiencyUnit:)((uint64_t)v8, v7);

}

- (void)dimensionManager:(id)a3 didUpdateVehicleChargePowerUnit:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine22CAFDimensionObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFDimensionObservable.dimensionManager(_:didUpdateVehicleChargePowerUnit:)((uint64_t)v8, v7);

}

@end
