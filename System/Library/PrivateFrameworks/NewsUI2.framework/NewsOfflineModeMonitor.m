@implementation NewsOfflineModeMonitor

- (_TtC7NewsUI222NewsOfflineModeMonitor)init
{
  _TtC7NewsUI222NewsOfflineModeMonitor *result;

  result = (_TtC7NewsUI222NewsOfflineModeMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)networkReachabilityDidChange:(id)a3
{
  sub_1D6C18D58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1D6C181B4);
}

- (void)wifiReachabilityDidChange:(id)a3
{
  sub_1D6C18D58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1D6C18B74);
}

@end
