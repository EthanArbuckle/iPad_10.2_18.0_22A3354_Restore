@implementation CAFCarObservable

- (void)dealloc
{
  _TtC10CAFCombine16CAFCarObservable *v2;

  v2 = self;
  CAFCarObservable.__deallocating_deinit();
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Bool>);
  OUTLINED_FUNCTION_0_3(v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFAudioSettings?>);
  OUTLINED_FUNCTION_0_3(v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFAutomakerExteriorCamera?>);
  OUTLINED_FUNCTION_0_3(v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFAutomakerInputStreams]>);
  OUTLINED_FUNCTION_0_3(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFAutomakerNotificationHistory?>);
  OUTLINED_FUNCTION_0_3(v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFAutomakerNotifications]>);
  OUTLINED_FUNCTION_0_3(v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFAutomakerRequestContent]>);
  OUTLINED_FUNCTION_0_3(v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFAutomakerSettings?>);
  OUTLINED_FUNCTION_0_3(v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFCharging?>);
  OUTLINED_FUNCTION_0_3(v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFClimate?>);
  OUTLINED_FUNCTION_0_3(v12);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFClosure?>);
  OUTLINED_FUNCTION_0_3(v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFDriveState?>);
  OUTLINED_FUNCTION_0_3(v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFDriverAssistance?>);
  OUTLINED_FUNCTION_0_3(v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFElectricEngine?>);
  OUTLINED_FUNCTION_0_3(v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFEnvironmentalConditions?>);
  OUTLINED_FUNCTION_0_3(v17);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFFuel?>);
  OUTLINED_FUNCTION_0_3(v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFHighVoltageBattery?>);
  OUTLINED_FUNCTION_0_3(v19);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFInternalCombustionEngine?>);
  OUTLINED_FUNCTION_0_3(v20);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFMedia?>);
  OUTLINED_FUNCTION_0_3(v21);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFNowPlayingInformation?>);
  OUTLINED_FUNCTION_0_3(v22);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFPairedDevices?>);
  OUTLINED_FUNCTION_0_3(v23);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFSeat?>);
  OUTLINED_FUNCTION_0_3(v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFTestingUseOnly]>);
  OUTLINED_FUNCTION_0_3(v25);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFTire?>);
  OUTLINED_FUNCTION_0_3(v26);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFTripComputer?>);
  OUTLINED_FUNCTION_0_3(v27);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CAFUIControl]>);
  OUTLINED_FUNCTION_0_3(v28);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFVehicleMotion?>);
  OUTLINED_FUNCTION_0_3(v29);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFVehicleResources?>);
  OUTLINED_FUNCTION_0_3(v30);
  v31 = (char *)self + OBJC_IVAR____TtC10CAFCombine16CAFCarObservable__vehicleUnits;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<CAFVehicleUnits?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v32 - 8) + 8))(v31, v32);
}

- (_TtC10CAFCombine16CAFCarObservable)init
{
  CAFCarObservable.init()();
}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine16CAFCarObservable *v7;

  v6 = a3;
  v7 = self;
  CAFCarObservable.carDidUpdate(_:receivedAllValues:)((uint64_t)v6, a4);

}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4;
  _TtC10CAFCombine16CAFCarObservable *v5;

  v4 = a3;
  v5 = self;
  CAFCarObservable.carDidUpdateAccessories(_:)();

}

@end
