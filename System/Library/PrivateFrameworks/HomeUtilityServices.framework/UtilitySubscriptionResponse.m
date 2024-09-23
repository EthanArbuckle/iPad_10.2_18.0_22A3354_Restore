@implementation UtilitySubscriptionResponse

- (_TtC19HomeUtilityServices30UtilitySubscriptionInformation)subscription
{
  return (_TtC19HomeUtilityServices30UtilitySubscriptionInformation *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_subscription);
}

- (NSString)authorizationToken
{
  return (NSString *)sub_23EBB78E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_authorizationToken);
}

- (_TtC19HomeUtilityServices27UtilitySubscriptionResponse)initWithSubscription:(id)a3 authorizationToken:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  id v9;
  objc_super v11;

  if (a4)
  {
    v6 = sub_23EC2E780();
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_subscription) = (Class)a3;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_authorizationToken);
  *v8 = v6;
  v8[1] = v7;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for UtilitySubscriptionResponse();
  v9 = a3;
  return -[UtilitySubscriptionResponse init](&v11, sel_init);
}

- (_TtC19HomeUtilityServices27UtilitySubscriptionResponse)init
{
  _TtC19HomeUtilityServices27UtilitySubscriptionResponse *result;

  result = (_TtC19HomeUtilityServices27UtilitySubscriptionResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_subscription));
  swift_bridgeObjectRelease();
}

@end
