@implementation CAFUIInputDeviceButtonObservable

- (NSString)description
{
  _TtC10CAFCombine32CAFUIInputDeviceButtonObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFUIInputDeviceButtonObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine32CAFUIInputDeviceButtonObservable *v2;

  v2 = self;
  CAFUIInputDeviceButtonObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine32CAFUIInputDeviceButtonObservable)init
{
  CAFUIInputDeviceButtonObservable.init()();
}

- (void)uIInputDeviceService:(id)a3 didUpdateUiInputDevicePurpose:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine32CAFUIInputDeviceButtonObservable *v7;

  v6 = a3;
  v7 = self;
  CAFUIInputDeviceButtonObservable.uIInputDeviceService(_:didUpdateUiInputDevicePurpose:)((uint64_t)v7, a4);

}

- (void)uiInputDeviceButtonService:(id)a3 didUpdateUiInputDeviceButtonEvent:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine32CAFUIInputDeviceButtonObservable *v7;

  v6 = a3;
  v7 = self;
  CAFUIInputDeviceButtonObservable.uiInputDeviceButtonService(_:didUpdateUiInputDeviceButtonEvent:)((uint64_t)v7, a4);

}

- (void)uiInputDeviceButtonService:(id)a3 didUpdateName:(id)a4
{
  id v6;
  _TtC10CAFCombine32CAFUIInputDeviceButtonObservable *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFUIInputDeviceButtonObservable.uiInputDeviceButtonService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine32CAFUIInputDeviceButtonObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFUIInputDeviceButtonObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine32CAFUIInputDeviceButtonObservable *v7;

  v6 = a3;
  v7 = self;
  CAFUIInputDeviceButtonObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine32CAFUIInputDeviceButtonObservable *v5;

  v4 = a3;
  v5 = self;
  CAFUIInputDeviceButtonObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
