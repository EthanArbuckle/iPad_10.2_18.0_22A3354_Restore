@implementation CAFClimateControlsLockedObservable

- (NSString)description
{
  _TtC10CAFCombine34CAFClimateControlsLockedObservable *v2;
  uint64_t locked;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  locked = CAFClimateControlsLockedObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](locked, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine34CAFClimateControlsLockedObservable *v2;

  v2 = self;
  CAFClimateControlsLockedObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine34CAFClimateControlsLockedObservable_observed));
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  swift_release();
}

- (_TtC10CAFCombine34CAFClimateControlsLockedObservable)init
{
  CAFClimateControlsLockedObservable.init()();
}

- (void)climateControlsLockedService:(id)a3 didUpdateLockState:(unsigned __int8)a4
{
  id v5;
  _TtC10CAFCombine34CAFClimateControlsLockedObservable *v6;

  v5 = a3;
  v6 = self;
  CAFClimateControlsLockedObservable.climateControlsLockedService(_:didUpdateLockState:)();

}

- (void)climateControlsLockedService:(id)a3 didUpdateVehicleLayoutKey:(id)a4
{
  id v6;
  _TtC10CAFCombine34CAFClimateControlsLockedObservable *v7;

  if (a4)
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFClimateControlsLockedObservable.climateControlsLockedService(_:didUpdateVehicleLayoutKey:)();

  swift_bridgeObjectRelease();
}

- (void)climateControlsLockedService:(id)a3 didUpdateName:(id)a4
{
  id v6;
  _TtC10CAFCombine34CAFClimateControlsLockedObservable *v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = a3;
  v7 = self;
  CAFClimateControlsLockedObservable.climateControlsLockedService(_:didUpdateName:)();

  swift_bridgeObjectRelease();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine34CAFClimateControlsLockedObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFClimateControlsLockedObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine34CAFClimateControlsLockedObservable *v7;

  v6 = a3;
  v7 = self;
  CAFClimateControlsLockedObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine34CAFClimateControlsLockedObservable *v5;

  v4 = a3;
  v5 = self;
  CAFClimateControlsLockedObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
