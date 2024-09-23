@implementation DIDeviceStateUpdateThrottler

- (DIDeviceStateUpdateThrottler)initWithThrottleTimeInterval:(double)a3
{
  return (DIDeviceStateUpdateThrottler *)DeviceStateUpdateThrottler.init(throttleTimeInterval:)(a3);
}

- (void)dealloc
{
  DIDeviceStateUpdateThrottler *v2;

  v2 = self;
  DeviceStateUpdateThrottler.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

}

- (void)handleState:(int64_t)a3 reason:(id)a4 handler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  DIDeviceStateUpdateThrottler *v12;

  v7 = _Block_copy(a5);
  v8 = sub_23A76949C();
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v7;
  v12 = self;
  sub_23A755380(a3, v8, v10, (uint64_t)sub_23A755B68, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (DIDeviceStateUpdateThrottler)init
{
  DeviceStateUpdateThrottler.init()();
}

@end
