@implementation ImbalanceUserNotificationCoordinator

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  id v5;
  _TtC19HealthBalanceDaemon36ImbalanceUserNotificationCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_23DC969D8(v5);

}

- (_TtC19HealthBalanceDaemon36ImbalanceUserNotificationCoordinator)init
{
  _TtC19HealthBalanceDaemon36ImbalanceUserNotificationCoordinator *result;

  result = (_TtC19HealthBalanceDaemon36ImbalanceUserNotificationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon36ImbalanceUserNotificationCoordinator_notificationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon36ImbalanceUserNotificationCoordinator_notificationStateKeyValueDomain));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon36ImbalanceUserNotificationCoordinator_notificationSyncClient));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon36ImbalanceUserNotificationCoordinator_analyticsEventSubmissionManager));
  swift_release();
}

@end
