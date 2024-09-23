@implementation CAFOdometerObservable

- (NSString)description
{
  _TtC10CAFCombine21CAFOdometerObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFOdometerObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine21CAFOdometerObservable *v2;

  v2 = self;
  CAFOdometerObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine21CAFOdometerObservable)init
{
  CAFOdometerObservable.init()();
}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceKM:(id)a4
{
  @objc CAFRemainingRangeObservable.distanceDisplayService(_:didUpdateDistanceKM:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFOdometerObservable.distanceDisplayService(_:didUpdateDistanceKM:));
}

- (void)distanceDisplayService:(id)a3 didUpdateDistanceMiles:(id)a4
{
  @objc CAFRemainingRangeObservable.distanceDisplayService(_:didUpdateDistanceKM:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFOdometerObservable.distanceDisplayService(_:didUpdateDistanceMiles:));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine21CAFOdometerObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFOdometerObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine21CAFOdometerObservable *v7;

  v6 = a3;
  v7 = self;
  CAFOdometerObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine21CAFOdometerObservable *v5;

  v4 = a3;
  v5 = self;
  CAFOdometerObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
