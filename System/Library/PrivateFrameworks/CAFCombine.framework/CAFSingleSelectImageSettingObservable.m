@implementation CAFSingleSelectImageSettingObservable

- (NSString)description
{
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFSingleSelectImageSettingObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v2;

  v2 = self;
  CAFSingleSelectImageSettingObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine37CAFSingleSelectImageSettingObservable_observed));
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
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine37CAFSingleSelectImageSettingObservable)init
{
  CAFSingleSelectImageSettingObservable.init()();
}

- (void)automakerSettingService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:));
}

- (void)automakerSettingService:(id)a3 didUpdateSectionIdentifier:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t, uint64_t))CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:));
}

- (void)automakerSettingService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateSortOrder:)();

}

- (void)automakerSettingService:(id)a3 didUpdateCategory:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateCategory:)();

}

- (void)automakerSettingService:(id)a3 didUpdateIdentifier:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateIdentifier:));
}

- (void)automakerSettingService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateDisabled:)();

}

- (void)automakerSettingService:(id)a3 didUpdateLimitableUIElement:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateLimitableUIElement:)();

}

- (void)automakerSettingService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateHidden:)();

}

- (void)automakerSettingService:(id)a3 didUpdateShowAudioBrandLogo:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateShowAudioBrandLogo:)();

}

- (void)automakerSettingService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t, uint64_t))CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateVehicleLayoutKey:));
}

- (void)automakerSettingService:(id)a3 didUpdateSymbolName:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t, uint64_t))CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateSymbolName:));
}

- (void)automakerSettingService:(id)a3 didUpdateProminenceInfo:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFSingleSelectImageSettingObservable.automakerSettingService(_:didUpdateProminenceInfo:)((uint64_t)v8, a4);

}

- (void)singleSelectImageSettingService:(id)a3 didUpdateCurrentUserVisibleValue:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v6;

  v5 = a3;
  v6 = self;
  CAFSingleSelectImageSettingObservable.singleSelectImageSettingService(_:didUpdateCurrentUserVisibleValue:)();

}

- (void)singleSelectImageSettingService:(id)a3 didUpdateListUserVisibleValue:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.multipleSelectImageSettingService(_:didUpdateListUserVisibleValue:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, MEMORY[0x24BEE0D00], (void (*)(void))CAFSingleSelectImageSettingObservable.singleSelectImageSettingService(_:didUpdateListUserVisibleValue:));
}

- (void)singleSelectImageSettingService:(id)a3 didUpdateImages:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.multipleSelectImageSettingService(_:didUpdateListUserVisibleValue:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, MEMORY[0x24BDCDDE8], (void (*)(void))CAFSingleSelectImageSettingObservable.singleSelectImageSettingService(_:didUpdateImages:));
}

- (void)singleSelectImageSettingService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFSingleSelectImageSettingObservable.singleSelectImageSettingService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFSingleSelectImageSettingObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v7;

  v6 = a3;
  v7 = self;
  CAFSingleSelectImageSettingObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine37CAFSingleSelectImageSettingObservable *v5;

  v4 = a3;
  v5 = self;
  CAFSingleSelectImageSettingObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
