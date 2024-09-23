@implementation JSSubscriptionStatusCoordinator

- (JSValue)subscriptionStatus
{
  _TtC7MusicUI31JSSubscriptionStatusCoordinator *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_21D3FA8E0();

  return (JSValue *)v3;
}

- (void)refreshSubscriptionStatus
{
  _TtC7MusicUI31JSSubscriptionStatusCoordinator *v2;

  v2 = self;
  sub_21D3FAA04();

}

- (id)fetch:(id)a3
{
  id v4;
  _TtC7MusicUI31JSSubscriptionStatusCoordinator *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_21D3FAA60();

  return v6;
}

- (_TtC7MusicUI31JSSubscriptionStatusCoordinator)init
{
  sub_21D3FB464();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
