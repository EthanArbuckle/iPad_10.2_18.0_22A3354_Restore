@implementation CAFCameraButtonObservable

- (NSString)description
{
  _TtC10CAFCombine25CAFCameraButtonObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFCameraButtonObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine25CAFCameraButtonObservable *v2;

  v2 = self;
  CAFCameraButtonObservable.__deallocating_deinit();
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
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine25CAFCameraButtonObservable)init
{
  CAFCameraButtonObservable.init()();
}

- (void)cameraButtonService:(id)a3 didUpdateButtonAction:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine25CAFCameraButtonObservable *v7;

  v6 = a3;
  v7 = self;
  CAFCameraButtonObservable.cameraButtonService(_:didUpdateButtonAction:)((uint64_t)v7, a4);

}

- (void)cameraButtonService:(id)a3 didUpdateContentURLAction:(id)a4
{
  id v6;
  _TtC10CAFCombine25CAFCameraButtonObservable *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFCameraButtonObservable.cameraButtonService(_:didUpdateContentURLAction:)();

  swift_bridgeObjectRelease();
}

- (void)cameraButtonService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine25CAFCameraButtonObservable *v6;

  v5 = a3;
  v6 = self;
  CAFCameraButtonObservable.cameraButtonService(_:didUpdateSortOrder:)();

}

- (void)cameraButtonService:(id)a3 didUpdateSymbolName:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFCameraButtonObservable.cameraButtonService(_:didUpdateSymbolName:));
}

- (void)cameraButtonService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine25CAFCameraButtonObservable *v6;

  v5 = a3;
  v6 = self;
  CAFCameraButtonObservable.cameraButtonService(_:didUpdateDisabled:)();

}

- (void)cameraButtonService:(id)a3 didUpdateSelected:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine25CAFCameraButtonObservable *v6;

  v5 = a3;
  v6 = self;
  CAFCameraButtonObservable.cameraButtonService(_:didUpdateSelected:)();

}

- (void)cameraButtonService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine25CAFCameraButtonObservable *v6;

  v5 = a3;
  v6 = self;
  CAFCameraButtonObservable.cameraButtonService(_:didUpdateHidden:)();

}

- (void)cameraButtonService:(id)a3 didUpdateIdentifier:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFCameraButtonObservable.cameraButtonService(_:didUpdateIdentifier:));
}

- (void)cameraButtonService:(id)a3 didUpdateChildrenIdentifiers:(id)a4
{
  id v6;
  _TtC10CAFCombine25CAFCameraButtonObservable *v7;

  if (a4)
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFCameraButtonObservable.cameraButtonService(_:didUpdateChildrenIdentifiers:)();

  swift_bridgeObjectRelease();
}

- (void)cameraButtonService:(id)a3 didUpdateSelectedEntryIndex:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine25CAFCameraButtonObservable *v7;

  v6 = a3;
  v7 = self;
  CAFCameraButtonObservable.cameraButtonService(_:didUpdateSelectedEntryIndex:)((uint64_t)v7, a4);

}

- (void)cameraButtonService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFCameraButtonObservable.cameraButtonService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine25CAFCameraButtonObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFCameraButtonObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine25CAFCameraButtonObservable *v7;

  v6 = a3;
  v7 = self;
  CAFCameraButtonObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine25CAFCameraButtonObservable *v5;

  v4 = a3;
  v5 = self;
  CAFCameraButtonObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
