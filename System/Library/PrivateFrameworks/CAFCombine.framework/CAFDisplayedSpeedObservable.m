@implementation CAFDisplayedSpeedObservable

- (NSString)description
{
  _TtC10CAFCombine27CAFDisplayedSpeedObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFDisplayedSpeedObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine27CAFDisplayedSpeedObservable *v2;

  v2 = self;
  CAFDisplayedSpeedObservable.__deallocating_deinit();
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
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine27CAFDisplayedSpeedObservable)init
{
  CAFDisplayedSpeedObservable.init()();
}

- (void)speedDisplayService:(id)a3 didUpdateSpeed:(id)a4
{
  @objc CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:));
}

- (void)speedDisplayService:(id)a3 didUpdateSpeedKMH:(id)a4
{
  @objc CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeedKMH:));
}

- (void)speedDisplayService:(id)a3 didUpdateSpeedMPH:(id)a4
{
  @objc CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeedMPH:));
}

- (void)displayedSpeedService:(id)a3 didUpdateSpeedMaxKMH:(id)a4
{
  @objc CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFDisplayedSpeedObservable.displayedSpeedService(_:didUpdateSpeedMaxKMH:));
}

- (void)displayedSpeedService:(id)a3 didUpdateSpeedMaxMPH:(id)a4
{
  @objc CAFDisplayedSpeedObservable.speedDisplayService(_:didUpdateSpeed:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFDisplayedSpeedObservable.displayedSpeedService(_:didUpdateSpeedMaxMPH:));
}

- (void)displayedSpeedService:(id)a3 didUpdateShowSecondarySpeed:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine27CAFDisplayedSpeedObservable *v6;

  v5 = a3;
  v6 = self;
  CAFDisplayedSpeedObservable.displayedSpeedService(_:didUpdateShowSecondarySpeed:)();

}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine27CAFDisplayedSpeedObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFDisplayedSpeedObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine27CAFDisplayedSpeedObservable *v7;

  v6 = a3;
  v7 = self;
  CAFDisplayedSpeedObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine27CAFDisplayedSpeedObservable *v5;

  v4 = a3;
  v5 = self;
  CAFDisplayedSpeedObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
