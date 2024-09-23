@implementation SubscriptionPreferencesObservationClient

- (_TtC11ActivityKit40SubscriptionPreferencesObservationClient)init
{
  return (_TtC11ActivityKit40SubscriptionPreferencesObservationClient *)SubscriptionPreferencesObservationClient.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKit40SubscriptionPreferencesObservationClient_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKit40SubscriptionPreferencesObservationClient_connection));
  swift_release();
}

- (void)subscriptionPreferencesDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC11ActivityKit40SubscriptionPreferencesObservationClient *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_232E6EE44();
  v7 = v6;

  SubscriptionPreferencesObservationClient.subscriptionPreferencesDidChange(_:)();
  sub_232DE8D98(v5, v7);

}

@end
