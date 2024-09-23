@implementation CAFPickerObservable

- (NSString)description
{
  _TtC10CAFCombine19CAFPickerObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFPickerObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine19CAFPickerObservable *v2;

  v2 = self;
  CAFPickerObservable.__deallocating_deinit();
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
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine19CAFPickerObservable)init
{
  CAFPickerObservable.init()();
}

- (void)pickerService:(id)a3 didUpdateIdentifier:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFPickerObservable.pickerService(_:didUpdateIdentifier:));
}

- (void)pickerService:(id)a3 didUpdateEntryList:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine19CAFPickerObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFPickerObservable.pickerService(_:didUpdateEntryList:)((uint64_t)v8, v7);

}

- (void)pickerService:(id)a3 didUpdateSelectedEntryIndex:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine19CAFPickerObservable *v6;

  v5 = a3;
  v6 = self;
  CAFPickerObservable.pickerService(_:didUpdateSelectedEntryIndex:)();

}

- (void)pickerService:(id)a3 didUpdateUserSelectionEnabled:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine19CAFPickerObservable *v6;

  v5 = a3;
  v6 = self;
  CAFPickerObservable.pickerService(_:didUpdateUserSelectionEnabled:)();

}

- (void)pickerService:(id)a3 didUpdateDisplayPanelIdentifier:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFPickerObservable.pickerService(_:didUpdateDisplayPanelIdentifier:));
}

- (void)pickerService:(id)a3 didUpdateDisplayZoneIdentifier:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFPickerObservable.pickerService(_:didUpdateDisplayZoneIdentifier:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine19CAFPickerObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFPickerObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine19CAFPickerObservable *v7;

  v6 = a3;
  v7 = self;
  CAFPickerObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine19CAFPickerObservable *v5;

  v4 = a3;
  v5 = self;
  CAFPickerObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
