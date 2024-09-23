@implementation CAFHistoricalNotificationObservable

- (NSString)description
{
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  CAFHistoricalNotificationObservable.description.getter();
  v4 = v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x23B811BC4](v4, v6);
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)dealloc
{
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v2;

  v2 = self;
  CAFHistoricalNotificationObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine35CAFHistoricalNotificationObservable_observed));
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
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine35CAFHistoricalNotificationObservable)init
{
  CAFHistoricalNotificationObservable.init()();
}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateUserVisibleLabel:));
}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleDescription:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateUserVisibleDescription:));
}

- (void)historicalNotificationService:(id)a3 didUpdateUserVisibleFullDescription:(id)a4
{
  id v6;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateUserVisibleFullDescription:)();

  swift_bridgeObjectRelease();
}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitDuration>);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CAFTemperature(0, &lazy cache variable for type metadata for NSUnitDuration);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  v11 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateTimestamp:)((uint64_t)v11, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)historicalNotificationService:(id)a3 didUpdateSymbolName:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateSymbolName:));
}

- (void)historicalNotificationService:(id)a3 didUpdateNotificationSeverity:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v6;

  v5 = a3;
  v6 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateNotificationSeverity:)();

}

- (void)historicalNotificationService:(id)a3 didUpdateHistoricalNotificationUserActions:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateHistoricalNotificationUserActions:)((uint64_t)v8, a4);

}

- (void)historicalNotificationService:(id)a3 didUpdateUserDismissible:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v6;

  v5 = a3;
  v6 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateUserDismissible:)();

}

- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v6;

  v5 = a3;
  v6 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateHidden:)();

}

- (void)historicalNotificationService:(id)a3 didUpdateUserAction:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v6;

  v5 = a3;
  v6 = self;
  CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateUserAction:)();

}

- (void)historicalNotificationService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFHistoricalNotificationObservable.historicalNotificationService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFHistoricalNotificationObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v7;

  v6 = a3;
  v7 = self;
  CAFHistoricalNotificationObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine35CAFHistoricalNotificationObservable *v5;

  v4 = a3;
  v5 = self;
  CAFHistoricalNotificationObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
