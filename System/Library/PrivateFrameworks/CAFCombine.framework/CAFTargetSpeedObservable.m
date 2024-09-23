@implementation CAFTargetSpeedObservable

- (NSString)description
{
  _TtC10CAFCombine24CAFTargetSpeedObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFTargetSpeedObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine24CAFTargetSpeedObservable *v2;

  v2 = self;
  CAFTargetSpeedObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_0();
}

- (_TtC10CAFCombine24CAFTargetSpeedObservable)init
{
  CAFTargetSpeedObservable.init()();
}

- (void)targetSpeedService:(id)a3 didUpdateTargetSpeedState:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine24CAFTargetSpeedObservable *v6;

  v5 = a3;
  v6 = self;
  CAFTargetSpeedObservable.targetSpeedService(_:didUpdateTargetSpeedState:)();

}

- (void)targetSpeedService:(id)a3 didUpdateSpeedKMH:(id)a4
{
  @objc CAFTargetSpeedObservable.targetSpeedService(_:didUpdateSpeedKMH:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFTargetSpeedObservable.targetSpeedService(_:didUpdateSpeedKMH:));
}

- (void)targetSpeedService:(id)a3 didUpdateSpeedMPH:(id)a4
{
  @objc CAFTargetSpeedObservable.targetSpeedService(_:didUpdateSpeedKMH:)(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))CAFTargetSpeedObservable.targetSpeedService(_:didUpdateSpeedMPH:));
}

- (void)targetSpeedService:(id)a3 didUpdateSpeedLimited:(BOOL)a4
{
  id v5;
  _TtC10CAFCombine24CAFTargetSpeedObservable *v6;

  v5 = a3;
  v6 = self;
  CAFTargetSpeedObservable.targetSpeedService(_:didUpdateSpeedLimited:)();

}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine24CAFTargetSpeedObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFTargetSpeedObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine24CAFTargetSpeedObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTargetSpeedObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine24CAFTargetSpeedObservable *v5;

  v4 = a3;
  v5 = self;
  CAFTargetSpeedObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
