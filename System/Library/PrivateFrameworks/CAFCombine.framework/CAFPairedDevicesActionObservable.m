@implementation CAFPairedDevicesActionObservable

- (NSString)description
{
  _TtC10CAFCombine32CAFPairedDevicesActionObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  CAFPairedDevicesActionObservable.description.getter();
  v4 = v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x23B811BC4](v4, v6);
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (void)dealloc
{
  _TtC10CAFCombine32CAFPairedDevicesActionObservable *v2;

  v2 = self;
  CAFPairedDevicesActionObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (_TtC10CAFCombine32CAFPairedDevicesActionObservable)init
{
  CAFPairedDevicesActionObservable.init()();
}

- (void)pairedDevicesActionService:(id)a3 didUpdatePairedDeviceActionRequest:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine32CAFPairedDevicesActionObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFPairedDevicesActionObservable.pairedDevicesActionService(_:didUpdatePairedDeviceActionRequest:)((uint64_t)v8, a4);

}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine32CAFPairedDevicesActionObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFPairedDevicesActionObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine32CAFPairedDevicesActionObservable *v7;

  v6 = a3;
  v7 = self;
  CAFPairedDevicesActionObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine32CAFPairedDevicesActionObservable *v5;

  v4 = a3;
  v5 = self;
  CAFPairedDevicesActionObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
