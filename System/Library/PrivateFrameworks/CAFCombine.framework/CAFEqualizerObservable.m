@implementation CAFEqualizerObservable

- (NSString)description
{
  _TtC10CAFCombine22CAFEqualizerObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFEqualizerObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine22CAFEqualizerObservable *v2;

  v2 = self;
  CAFEqualizerObservable.__deallocating_deinit();
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

- (_TtC10CAFCombine22CAFEqualizerObservable)init
{
  CAFEqualizerObservable.init()();
}

- (void)equalizerService:(id)a3 didUpdateType:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine22CAFEqualizerObservable *v7;

  v6 = a3;
  v7 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateType:)((uint64_t)v7, a4);

}

- (void)equalizerService:(id)a3 didUpdateSortOrder:(unsigned __int8)a4
{
  id v6;
  _TtC10CAFCombine22CAFEqualizerObservable *v7;

  v6 = a3;
  v7 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateSortOrder:)((uint64_t)v7, a4);

}

- (void)equalizerService:(id)a3 didUpdateValue:(char)a4
{
  id v5;
  _TtC10CAFCombine22CAFEqualizerObservable *v6;

  v5 = a3;
  v6 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateValue:)();

}

- (void)equalizerService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  id v6;
  _TtC10CAFCombine22CAFEqualizerObservable *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateUserVisibleLabel:)();

  swift_bridgeObjectRelease();
}

- (void)equalizerService:(id)a3 didUpdateName:(id)a4
{
  id v6;
  _TtC10CAFCombine22CAFEqualizerObservable *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFEqualizerObservable.equalizerService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine22CAFEqualizerObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFEqualizerObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine22CAFEqualizerObservable *v7;

  v6 = a3;
  v7 = self;
  CAFEqualizerObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine22CAFEqualizerObservable *v5;

  v4 = a3;
  v5 = self;
  CAFEqualizerObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
