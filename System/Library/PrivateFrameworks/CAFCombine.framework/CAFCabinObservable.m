@implementation CAFCabinObservable

- (NSString)description
{
  _TtC10CAFCombine18CAFCabinObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFCabinObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine18CAFCabinObservable *v2;

  v2 = self;
  CAFCabinObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine18CAFCabinObservable)init
{
  CAFCabinObservable.init()();
}

- (void)cabinService:(id)a3 didUpdateMaxACOn:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine18CAFCabinObservable *v6;

  v5 = a3;
  v6 = self;
  CAFCabinObservable.cabinService(_:didUpdateMaxACOn:)();

}

- (void)cabinService:(id)a3 didUpdateHvacOn:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine18CAFCabinObservable *v6;

  v5 = a3;
  v6 = self;
  CAFCabinObservable.cabinService(_:didUpdateHvacOn:)();

}

- (void)cabinService:(id)a3 didUpdateCompressorOn:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine18CAFCabinObservable *v6;

  v5 = a3;
  v6 = self;
  CAFCabinObservable.cabinService(_:didUpdateCompressorOn:)();

}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine18CAFCabinObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFCabinObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine18CAFCabinObservable *v7;

  v6 = a3;
  v7 = self;
  CAFCabinObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine18CAFCabinObservable *v5;

  v4 = a3;
  v5 = self;
  CAFCabinObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
