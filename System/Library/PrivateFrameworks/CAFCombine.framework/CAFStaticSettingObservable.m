@implementation CAFStaticSettingObservable

- (NSString)description
{
  _TtC10CAFCombine26CAFStaticSettingObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFStaticSettingObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine26CAFStaticSettingObservable *v2;

  v2 = self;
  CAFStaticSettingObservable.__deallocating_deinit();
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
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine26CAFStaticSettingObservable)init
{
  CAFStaticSettingObservable.init()();
}

- (void)automakerSettingService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFStaticSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:));
}

- (void)automakerSettingService:(id)a3 didUpdateSectionIdentifier:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFStaticSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:));
}

- (void)automakerSettingService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine26CAFStaticSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFStaticSettingObservable.automakerSettingService(_:didUpdateSortOrder:)();

}

- (void)automakerSettingService:(id)a3 didUpdateCategory:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine26CAFStaticSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFStaticSettingObservable.automakerSettingService(_:didUpdateCategory:)();

}

- (void)automakerSettingService:(id)a3 didUpdateIdentifier:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFStaticSettingObservable.automakerSettingService(_:didUpdateIdentifier:));
}

- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine26CAFStaticSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFStaticSettingObservable.automakerSettingService(_:didUpdateDisabled:)();

}

- (void)automakerSettingService:(id)a3 didUpdateLimitableUIElement:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine26CAFStaticSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFStaticSettingObservable.automakerSettingService(_:didUpdateLimitableUIElement:)();

}

- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine26CAFStaticSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFStaticSettingObservable.automakerSettingService(_:didUpdateHidden:)();

}

- (void)automakerSettingService:(id)a3 didUpdateShowAudioBrandLogo:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine26CAFStaticSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFStaticSettingObservable.automakerSettingService(_:didUpdateShowAudioBrandLogo:)();

}

- (void)automakerSettingService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFStaticSettingObservable.automakerSettingService(_:didUpdateVehicleLayoutKey:));
}

- (void)automakerSettingService:(id)a3 didUpdateSymbolName:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFStaticSettingObservable.automakerSettingService(_:didUpdateSymbolName:));
}

- (void)automakerSettingService:(id)a3 didUpdateProminenceInfo:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine26CAFStaticSettingObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFStaticSettingObservable.automakerSettingService(_:didUpdateProminenceInfo:)((uint64_t)v8, a4);

}

- (void)staticSettingService:(id)a3 didUpdateUserVisibleValue:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFStaticSettingObservable.staticSettingService(_:didUpdateUserVisibleValue:));
}

- (void)staticSettingService:(id)a3 didUpdateChildrenSettingsIdentifiers:(id)a4
{
  id v6;
  _TtC10CAFCombine26CAFStaticSettingObservable *v7;

  if (a4)
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFStaticSettingObservable.staticSettingService(_:didUpdateChildrenSettingsIdentifiers:)();

  swift_bridgeObjectRelease();
}

- (void)staticSettingService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFStaticSettingObservable.staticSettingService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine26CAFStaticSettingObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFStaticSettingObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine26CAFStaticSettingObservable *v7;

  v6 = a3;
  v7 = self;
  CAFStaticSettingObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine26CAFStaticSettingObservable *v5;

  v4 = a3;
  v5 = self;
  CAFStaticSettingObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
