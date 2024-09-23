@implementation CAFTirePressureMonitoringSystemObservable

- (NSString)description
{
  _TtC10CAFCombine41CAFTirePressureMonitoringSystemObservable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = CAFTirePressureMonitoringSystemObservable.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x23B811BC4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)dealloc
{
  _TtC10CAFCombine41CAFTirePressureMonitoringSystemObservable *v2;

  v2 = self;
  CAFTirePressureMonitoringSystemObservable.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CAFCombine41CAFTirePressureMonitoringSystemObservable_observed));
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC10CAFCombine41CAFTirePressureMonitoringSystemObservable)init
{
  CAFTirePressureMonitoringSystemObservable.init()();
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  _TtC10CAFCombine41CAFTirePressureMonitoringSystemObservable *v11;

  v8 = a3;
  v9 = a4;
  v11 = self;
  CAFTirePressureMonitoringSystemObservable.serviceDidUpdate(_:characteristic:fromGroupUpdate:)((uint64_t)v11, v10, a5);

}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6;
  _TtC10CAFCombine41CAFTirePressureMonitoringSystemObservable *v7;

  v6 = a3;
  v7 = self;
  CAFTirePressureMonitoringSystemObservable.serviceDidUpdate(_:receivedAllValues:)((uint64_t)v7, a4);

}

- (void)serviceDidFinishGroupUpdate:(id)a3
{
  id v4;
  _TtC10CAFCombine41CAFTirePressureMonitoringSystemObservable *v5;

  v4 = a3;
  v5 = self;
  CAFTirePressureMonitoringSystemObservable.serviceDidFinishGroupUpdate(_:)();

}

@end
