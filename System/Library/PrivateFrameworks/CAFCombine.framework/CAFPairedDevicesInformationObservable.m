@implementation CAFPairedDevicesInformationObservable

- (NSString)description
{
  _TtC10CAFCombine37CAFPairedDevicesInformationObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFPairedDevicesInformationObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine37CAFPairedDevicesInformationObservable *v2;

  v2 = self;
  CAFPairedDevicesInformationObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine37CAFPairedDevicesInformationObservable_observed));
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine37CAFPairedDevicesInformationObservable)init
{
  CAFPairedDevicesInformationObservable.init()();
}

- (void)pairedDevicesInformationService:(id)a3 didUpdatePairedDeviceList:(id)a4
{
  id v6;
  id v7;
  _TtC10CAFCombine37CAFPairedDevicesInformationObservable *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CAFPairedDevicesInformationObservable.pairedDevicesInformationService(_:didUpdatePairedDeviceList:)((uint64_t)v8, v7);

}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine37CAFPairedDevicesInformationObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFPairedDevicesInformationObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine37CAFPairedDevicesInformationObservable *v7;

  v6 = a3;
  v7 = self;
  CAFPairedDevicesInformationObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine37CAFPairedDevicesInformationObservable *v5;

  v4 = a3;
  v5 = self;
  CAFPairedDevicesInformationObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
