@implementation ICSCameraStateMonitor

- (ICSCameraStateMonitor)init
{
  return (ICSCameraStateMonitor *)sub_10015848C();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)&self->viewState[OBJC_IVAR___ICSCameraStateMonitor_viewState + 16];
  v4 = *(_QWORD *)&self->viewState[OBJC_IVAR___ICSCameraStateMonitor_viewState + 32];
  v5 = *(_QWORD *)&self->viewState[OBJC_IVAR___ICSCameraStateMonitor_viewState + 48];
  swift_release(*(_QWORD *)&self->viewState[OBJC_IVAR___ICSCameraStateMonitor_viewState + 64]);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  sub_100110F0C();
  sub_10015C898(OBJC_IVAR___ICSCameraStateMonitor_activeVideoCall);
  sub_10015C898(OBJC_IVAR___ICSCameraStateMonitor_isPreviewRunning);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSCameraStateMonitor_subscriptions));
  sub_10015C7D8((Class *)((char *)&self->super.isa + OBJC_IVAR___ICSCameraStateMonitor_timerState));
  sub_10015C804((uint64_t)self + OBJC_IVAR___ICSCameraStateMonitor_state, type metadata accessor for CameraStateMonitor.State);

}

- (id)isDisplayedInBanner
{
  return sub_100159B2C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_100159A44, (uint64_t)&unk_10028AEC8);
}

- (void)setIsDisplayedInBanner:(id)a3
{
  sub_100159BE0(self, (int)a2, a3, (uint64_t)&unk_10028AEB0, (uint64_t)sub_10015C83C, (void (*)(uint64_t, uint64_t))sub_100159A8C);
}

- (id)isDisplayedInMiniWindow
{
  return sub_100159B2C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_100159AB8, (uint64_t)&unk_10028AE78);
}

- (void)setIsDisplayedInMiniWindow:(id)a3
{
  sub_100159BE0(self, (int)a2, a3, (uint64_t)&unk_10028AE60, (uint64_t)sub_10015C83C, (void (*)(uint64_t, uint64_t))sub_100159B00);
}

- (id)isDismissed
{
  return sub_100159B2C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_100159B98, (uint64_t)&unk_10028AE28);
}

- (void)setIsDismissed:(id)a3
{
  sub_100159BE0(self, (int)a2, a3, (uint64_t)&unk_10028AE10, (uint64_t)sub_10015AD08, (void (*)(uint64_t, uint64_t))sub_10015AD10);
}

@end
