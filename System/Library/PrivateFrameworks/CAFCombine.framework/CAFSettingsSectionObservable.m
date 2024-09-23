@implementation CAFSettingsSectionObservable

- (NSString)description
{
  _TtC10CAFCombine28CAFSettingsSectionObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFSettingsSectionObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine28CAFSettingsSectionObservable *v2;

  v2 = self;
  CAFSettingsSectionObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine28CAFSettingsSectionObservable)init
{
  CAFSettingsSectionObservable.init()();
}

- (void)settingsSectionService:(id)a3 didUpdateIdentifier:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFSettingsSectionObservable.settingsSectionService(_:didUpdateIdentifier:));
}

- (void)settingsSectionService:(id)a3 didUpdateUserVisibleSectionName:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFSettingsSectionObservable.settingsSectionService(_:didUpdateUserVisibleSectionName:));
}

- (void)settingsSectionService:(id)a3 didUpdateUserVisibleFooter:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFSettingsSectionObservable.settingsSectionService(_:didUpdateUserVisibleFooter:));
}

- (void)settingsSectionService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine28CAFSettingsSectionObservable *v6;

  v5 = a3;
  v6 = self;
  CAFSettingsSectionObservable.settingsSectionService(_:didUpdateSortOrder:)();

}

- (void)settingsSectionService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFSettingsSectionObservable.settingsSectionService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine28CAFSettingsSectionObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFSettingsSectionObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine28CAFSettingsSectionObservable *v7;

  v6 = a3;
  v7 = self;
  CAFSettingsSectionObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine28CAFSettingsSectionObservable *v5;

  v4 = a3;
  v5 = self;
  CAFSettingsSectionObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
