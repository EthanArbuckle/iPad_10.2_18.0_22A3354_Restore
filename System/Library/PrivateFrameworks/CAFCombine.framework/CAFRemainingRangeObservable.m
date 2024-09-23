@implementation CAFRemainingRangeObservable

- (NSString)description
{
  _TtC10CAFCombine27CAFRemainingRangeObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFRemainingRangeObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine27CAFRemainingRangeObservable *v2;

  v2 = self;
  CAFRemainingRangeObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine27CAFRemainingRangeObservable)init
{
  CAFRemainingRangeObservable.init()();
}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceKM:(id)a4
{
  @objc CAFRemainingRangeObservable.distanceDisplayService(_:didUpdateDistanceKM:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFRemainingRangeObservable.distanceDisplayService(_:didUpdateDistanceKM:));
}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceMiles:(id)a4
{
  @objc CAFRemainingRangeObservable.distanceDisplayService(_:didUpdateDistanceKM:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFRemainingRangeObservable.distanceDisplayService(_:didUpdateDistanceMiles:));
}

- (void)remainingRangeService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine27CAFRemainingRangeObservable *v6;

  v5 = a3;
  v6 = self;
  CAFRemainingRangeObservable.remainingRangeService(_:didUpdateHidden:)();

}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine27CAFRemainingRangeObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFRemainingRangeObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine27CAFRemainingRangeObservable *v7;

  v6 = a3;
  v7 = self;
  CAFRemainingRangeObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine27CAFRemainingRangeObservable *v5;

  v4 = a3;
  v5 = self;
  CAFRemainingRangeObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
