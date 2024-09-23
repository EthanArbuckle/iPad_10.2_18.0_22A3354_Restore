@implementation CAFRemoteNotificationObservable

- (NSString)description
{
  _TtC10CAFCombine31CAFRemoteNotificationObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFRemoteNotificationObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine31CAFRemoteNotificationObservable *v2;

  v2 = self;
  CAFRemoteNotificationObservable.__deallocating_deinit();
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
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine31CAFRemoteNotificationObservable)init
{
  CAFRemoteNotificationObservable.init()();
}

- (void)remoteNotificationService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateUserVisibleLabel:));
}

- (void)remoteNotificationService:(id)a3 didUpdateUserVisibleDescription:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateUserVisibleDescription:));
}

- (void)remoteNotificationService:(id)a3 didUpdateIdentifier:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateIdentifier:));
}

- (void)remoteNotificationService:(id)a3 didUpdateNotificationUserActions:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine31CAFRemoteNotificationObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateNotificationUserActions:)((uint64_t)v8, v7);

}

- (void)remoteNotificationService:(id)a3 didUpdateUserAction:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine31CAFRemoteNotificationObservable *v6;

  v5 = a3;
  v6 = self;
  CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateUserAction:)();

}

- (void)remoteNotificationService:(id)a3 didUpdateSymbolNameAndColor:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine31CAFRemoteNotificationObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateSymbolNameAndColor:)((uint64_t)v8, a4);

}

- (void)remoteNotificationService:(id)a3 didUpdateDisplayPanelIdentifier:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateDisplayPanelIdentifier:));
}

- (void)remoteNotificationService:(id)a3 didUpdateDisplayZoneIdentifier:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateDisplayZoneIdentifier:));
}

- (void)remoteNotificationService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFTemperatureObservable.temperatureService(_:didUpdateVehicleLayoutKey:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFRemoteNotificationObservable.remoteNotificationService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine31CAFRemoteNotificationObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFRemoteNotificationObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine31CAFRemoteNotificationObservable *v7;

  v6 = a3;
  v7 = self;
  CAFRemoteNotificationObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine31CAFRemoteNotificationObservable *v5;

  v4 = a3;
  v5 = self;
  CAFRemoteNotificationObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
