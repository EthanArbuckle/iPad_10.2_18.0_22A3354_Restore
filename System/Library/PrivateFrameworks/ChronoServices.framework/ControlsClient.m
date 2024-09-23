@implementation ControlsClient

- (_TtC14ChronoServices14ControlsClient)init
{
  return (_TtC14ChronoServices14ControlsClient *)ControlsClient.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18FB840E0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14ChronoServices14ControlsClient__lock_environmentData), *(_QWORD *)&self->_calloutQueue[OBJC_IVAR____TtC14ChronoServices14ControlsClient__lock_environmentData]);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18FB7C270(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14ChronoServices14ControlsClient_handleSystemEnvironmentDidChange));
}

- (void)systemEnvironmentDidChange:(id)a3
{
  sub_18FBA20E4(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))ControlsClient.systemEnvironmentDidChange(_:));
}

- (void)liveControlsDidChange:(id)a3
{
  sub_18FBA20E4(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))ControlsClient.liveControlsDidChange(_:));
}

- (void)previewControlsDidChange:(id)a3
{
  sub_18FBA20E4(self, (uint64_t)a2, a3, (void (*)(uint64_t, unint64_t))ControlsClient.previewControlsDidChange(_:));
}

@end
