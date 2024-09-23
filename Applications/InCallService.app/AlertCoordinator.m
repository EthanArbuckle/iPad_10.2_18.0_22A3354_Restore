@implementation AlertCoordinator

+ (double)countdownDuration
{
  return 10.0;
}

+ (NSString)automaticallyInvokedKey
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_1001A4CCC();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (_TtP13InCallService24AlertCoordinatorDelegate_)delegate
{
  return (_TtP13InCallService24AlertCoordinatorDelegate_ *)(id)sub_1001A4D44();
}

- (void)setDelegate:(id)a3
{
  _TtC13InCallService16AlertCoordinator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1001A4DA0((uint64_t)a3);

}

- (BOOL)isAlertRequestPending
{
  return sub_1001A4DF8() & 1;
}

- (void)setIsAlertRequestPending:(BOOL)a3
{
  sub_1001A4E2C(a3);
}

- (BOOL)isAvailable
{
  _TtC13InCallService16AlertCoordinator *v2;
  __n128 v3;
  unsigned __int8 v4;

  v2 = self;
  v4 = sub_1001A4E80(v3);

  return v4 & 1;
}

- (_TtC13InCallService16AlertCoordinator)init
{
  return (_TtC13InCallService16AlertCoordinator *)sub_1001A5380();
}

- (void).cxx_destruct
{
  sub_100123A08((uint64_t)self + OBJC_IVAR____TtC13InCallService16AlertCoordinator_delegate);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13InCallService16AlertCoordinator_cancellables));
  sub_10015C898(OBJC_IVAR____TtC13InCallService16AlertCoordinator_stateMonitorProvider);
  sub_10015C898(OBJC_IVAR____TtC13InCallService16AlertCoordinator_carPlayProvider);
  sub_1001A7EE0(OBJC_IVAR____TtC13InCallService16AlertCoordinator_callCenter);
  sub_1001A7EE0(OBJC_IVAR____TtC13InCallService16AlertCoordinator_stateMonitor);
  sub_1001A7EE0(OBJC_IVAR____TtC13InCallService16AlertCoordinator_telephonyClient);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService16AlertCoordinator_backgroundCountdownTimer));
}

- (BOOL)isMonitoring
{
  return sub_1001A5EE8();
}

- (BOOL)isStewieActive
{
  _TtC13InCallService16AlertCoordinator *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1001A6404(&OBJC_IVAR____TtC13InCallService16AlertCoordinator_stateMonitor, (SEL *)&selRef_isAlertActive);

  return v3 & 1;
}

- (void)startMonitoring
{
  _TtC13InCallService16AlertCoordinator *v2;

  v2 = self;
  sub_1001A5F40((uint64_t)v2);

}

- (void)stopMonitoring
{
  __n128 v2;
  _TtC13InCallService16AlertCoordinator *v3;

  v3 = self;
  sub_1001A6118(v2);

}

- (void)refreshDelegateWithState
{
  _TtC13InCallService16AlertCoordinator *v2;

  v2 = self;
  sub_1001A61C0();

}

- (void)invokeAlertWithRequestUnlock:(BOOL)a3 automaticallyInvoked:(BOOL)a4
{
  __n128 v6;
  _TtC13InCallService16AlertCoordinator *v7;

  v7 = self;
  sub_1001A62B0(a3, a4, v6);

}

- (double)currentBackgroundCountdownDuration
{
  return sub_1001A63B4();
}

- (BOOL)isBackgroundCountdownRunning
{
  _TtC13InCallService16AlertCoordinator *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1001A6404(&OBJC_IVAR____TtC13InCallService16AlertCoordinator_backgroundCountdownTimer, (SEL *)&selRef_isValid);

  return v3 & 1;
}

- (void)stopBackgroundCountdown
{
  _TtC13InCallService16AlertCoordinator *v2;

  v2 = self;
  sub_1001A6428();

}

- (void)performAlertRequestWithRequestUnlock:(BOOL)a3 automaticallyInvoked:(BOOL)a4
{
  __n128 v6;
  _TtC13InCallService16AlertCoordinator *v7;

  v7 = self;
  sub_1001A6464(a3, a4, v6);

}

- (void)stateChanged:(id)a3
{
  id v4;
  _TtC13InCallService16AlertCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1001A7380(v4);

}

- (void)statusChanged:(int64_t)a3
{
  _TtC13InCallService16AlertCoordinator *v3;

  v3 = self;
  sub_1001A7510();

}

@end
