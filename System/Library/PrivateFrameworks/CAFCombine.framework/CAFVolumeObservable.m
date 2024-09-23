@implementation CAFVolumeObservable

- (NSString)description
{
  _TtC10CAFCombine19CAFVolumeObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFVolumeObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine19CAFVolumeObservable *v2;

  v2 = self;
  CAFVolumeObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine19CAFVolumeObservable)init
{
  CAFVolumeObservable.init()();
}

- (void)volumeService:(id)a3 didUpdateVolumeType:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine19CAFVolumeObservable *v6;

  v5 = a3;
  v6 = self;
  CAFVolumeObservable.volumeService(_:didUpdateVolumeType:)();

}

- (void)volumeService:(id)a3 didUpdateVolume:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine19CAFVolumeObservable *v6;

  v5 = a3;
  v6 = self;
  CAFVolumeObservable.volumeService(_:didUpdateVolume:)();

}

- (void)volumeService:(id)a3 didUpdateUserVisibleLabel:(id)a4
{
  id v6;
  _TtC10CAFCombine19CAFVolumeObservable *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFVolumeObservable.volumeService(_:didUpdateUserVisibleLabel:)();

  swift_bridgeObjectRelease();
}

- (void)volumeService:(id)a3 didUpdateName:(id)a4
{
  id v6;
  _TtC10CAFCombine19CAFVolumeObservable *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFVolumeObservable.volumeService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine19CAFVolumeObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFVolumeObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine19CAFVolumeObservable *v7;

  v6 = a3;
  v7 = self;
  CAFVolumeObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine19CAFVolumeObservable *v5;

  v4 = a3;
  v5 = self;
  CAFVolumeObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
