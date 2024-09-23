@implementation ICSPillStateMonitor

- (id)hasCurrentCalls
{
  return sub_100159B2C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_10019532C, (uint64_t)&unk_10028D710);
}

- (void)setHasCurrentCalls:(id)a3
{
  sub_100196408((int)self, (int)a2, a3);
}

- (ICSPillStateMonitor)init
{
  return (ICSPillStateMonitor *)sub_10019536C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_100110F0C();
  swift_release();
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSPillStateMonitor_subscriptions));
  sub_100198320((Class *)((char *)&self->super.isa + OBJC_IVAR___ICSPillStateMonitor_timerState));
  sub_10015C804((uint64_t)self + OBJC_IVAR___ICSPillStateMonitor_state, type metadata accessor for PillStateMonitor.State);

}

- (id)hasOutstandingPillAssertions
{
  return sub_100159B2C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_1001963C8, (uint64_t)&unk_10028D698);
}

- (void)setHasOutstandingPillAssertions:(id)a3
{
  sub_100196408((int)self, (int)a2, a3);
}

- (id)isDismissedWithoutPictureInPicture
{
  return sub_100159B2C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_10019646C, (uint64_t)&unk_10028D648);
}

- (void)setIsDismissedWithoutPictureInPicture:(id)a3
{
  sub_1001964B4((int)self, (int)a2, a3);
}

- (id)isActiveAndHiddenPictureInPicture
{
  return sub_100159B2C((uint64_t)self, (uint64_t)a2, (uint64_t (*)(void))sub_100196518, (uint64_t)&unk_10028D5F8);
}

- (void)setIsActiveAndHiddenPictureInPicture:(id)a3
{
  sub_1001964B4((int)self, (int)a2, a3);
}

@end
