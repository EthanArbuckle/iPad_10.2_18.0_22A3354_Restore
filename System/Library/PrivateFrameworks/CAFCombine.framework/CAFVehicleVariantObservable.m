@implementation CAFVehicleVariantObservable

- (NSString)description
{
  _TtC10CAFCombine27CAFVehicleVariantObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFVehicleVariantObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine27CAFVehicleVariantObservable *v2;

  v2 = self;
  CAFVehicleVariantObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine27CAFVehicleVariantObservable)init
{
  CAFVehicleVariantObservable.init()();
}

- (void)vehicleVariantService:(id)a3 didUpdateExteriorStyle:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateExteriorStyle:));
}

- (void)vehicleVariantService:(id)a3 didUpdateInteriorStyle:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateInteriorStyle:));
}

- (void)vehicleVariantService:(id)a3 didUpdateVehicleLayout:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateVehicleLayout:));
}

- (void)vehicleVariantService:(id)a3 didUpdateAudioLogo:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateAudioLogo:));
}

- (void)vehicleVariantService:(id)a3 didUpdateVehicleLogo:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFVehicleVariantObservable.vehicleVariantService(_:didUpdateVehicleLogo:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine27CAFVehicleVariantObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFVehicleVariantObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine27CAFVehicleVariantObservable *v7;

  v6 = a3;
  v7 = self;
  CAFVehicleVariantObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine27CAFVehicleVariantObservable *v5;

  v4 = a3;
  v5 = self;
  CAFVehicleVariantObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
