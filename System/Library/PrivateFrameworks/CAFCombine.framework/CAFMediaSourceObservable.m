@implementation CAFMediaSourceObservable

- (NSString)description
{
  _TtC10CAFCombine24CAFMediaSourceObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFMediaSourceObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine24CAFMediaSourceObservable *v2;

  v2 = self;
  CAFMediaSourceObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine24CAFMediaSourceObservable)init
{
  CAFMediaSourceObservable.init()();
}

- (void)mediaSourceService:(id)a3 didUpdateCurrentFrequency:(unsigned int)a4
{
  id v5;
  _TtC10CAFCombine24CAFMediaSourceObservable *v6;

  v5 = a3;
  v6 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateCurrentFrequency:)();

}

- (void)mediaSourceService:(id)a3 didUpdateCurrentMediaItemIdentifier:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFMediaSourceObservable.mediaSourceService(_:didUpdateCurrentMediaItemIdentifier:));
}

- (void)mediaSourceService:(id)a3 didUpdateMediaItems:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine24CAFMediaSourceObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateMediaItems:)((uint64_t)v8, a4);

}

- (void)mediaSourceService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  @objc CAFButtonSettingObservable.automakerSettingService(_:didUpdateSectionIdentifier:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFMediaSourceObservable.mediaSourceService(_:didUpdateUserVisibleLabel:));
}

- (void)mediaSourceService:(id)a3 didUpdateIdentifier:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFMediaSourceObservable.mediaSourceService(_:didUpdateIdentifier:));
}

- (void)mediaSourceService:(id)a3 didUpdateMediaSourceSemanticType:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine24CAFMediaSourceObservable *v6;

  v5 = a3;
  v6 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateMediaSourceSemanticType:)();

}

- (void)mediaSourceService:(id)a3 didUpdateDisabled:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine24CAFMediaSourceObservable *v6;

  v5 = a3;
  v6 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateDisabled:)();

}

- (void)mediaSourceService:(id)a3 didUpdateMediaItemImages:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine24CAFMediaSourceObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFMediaSourceObservable.mediaSourceService(_:didUpdateMediaItemImages:)((uint64_t)v8, a4);

}

- (void)mediaSourceService:(id)a3 didUpdateName:(id)a4
{
  @objc CAFMultipleSelectImageSettingObservable.automakerSettingService(_:didUpdateUserVisibleLabel:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFMediaSourceObservable.mediaSourceService(_:didUpdateName:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine24CAFMediaSourceObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFMediaSourceObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine24CAFMediaSourceObservable *v7;

  v6 = a3;
  v7 = self;
  CAFMediaSourceObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine24CAFMediaSourceObservable *v5;

  v4 = a3;
  v5 = self;
  CAFMediaSourceObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
