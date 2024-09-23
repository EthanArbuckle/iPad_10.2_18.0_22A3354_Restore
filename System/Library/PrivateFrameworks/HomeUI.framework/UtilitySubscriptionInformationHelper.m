@implementation UtilitySubscriptionInformationHelper

- (NSString)subscriptionID
{
  return (NSString *)sub_1B8F74570();
}

- (NSDictionary)serviceLocation
{
  void *v2;

  sub_1B93ECF74();
  v2 = (void *)sub_1B93EDCE8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (NSArray)accountIds
{
  void *v2;

  sub_1B93ECF74();
  v2 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC6HomeUI36UtilitySubscriptionInformationHelper)initWithSubscriptionID:(id)a3 serviceLocation:(id)a4 accountIds:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  objc_class *v10;
  uint64_t *v11;
  objc_super v13;

  v6 = sub_1B93EDDB4();
  v8 = v7;
  v9 = (objc_class *)sub_1B93EDD00();
  v10 = (objc_class *)sub_1B93EDF4C();
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI36UtilitySubscriptionInformationHelper_subscriptionID);
  *v11 = v6;
  v11[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6HomeUI36UtilitySubscriptionInformationHelper_serviceLocation) = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6HomeUI36UtilitySubscriptionInformationHelper_accountIds) = v10;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for UtilitySubscriptionInformationHelper();
  return -[UtilitySubscriptionInformationHelper init](&v13, sel_init);
}

- (_TtC6HomeUI36UtilitySubscriptionInformationHelper)init
{
  _TtC6HomeUI36UtilitySubscriptionInformationHelper *result;

  result = (_TtC6HomeUI36UtilitySubscriptionInformationHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
