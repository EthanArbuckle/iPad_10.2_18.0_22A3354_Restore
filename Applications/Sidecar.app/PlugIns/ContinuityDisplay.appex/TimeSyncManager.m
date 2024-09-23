@implementation TimeSyncManager

- (_TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager)init
{
  return (_TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager *)sub_10004DF50();
}

- (void).cxx_destruct
{
  sub_100051268(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager_activation), self->activation[OBJC_IVAR____TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager_activation]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager_clocks));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager_completions));
}

- (void)interruptedConnectionForClockManager:(id)a3
{
  id v4;
  _TtC15SidecarTimeSyncP33_52E478E0294A7D1A30B0593D640BE43C15TimeSyncManager *v5;

  v4 = a3;
  v5 = self;
  sub_10004EAFC();

}

@end
