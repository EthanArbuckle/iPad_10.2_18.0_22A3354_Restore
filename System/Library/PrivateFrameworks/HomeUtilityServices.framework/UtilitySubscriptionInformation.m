@implementation UtilitySubscriptionInformation

- (NSString)subscriptionID
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)state
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)startDate
{
  return (NSString *)sub_23EBABEB4();
}

- (_TtC19HomeUtilityServices22UtilityServiceLocation)serviceLocation
{
  return (_TtC19HomeUtilityServices22UtilityServiceLocation *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_serviceLocation);
}

- (NSArray)customerAgreements
{
  return (NSArray *)sub_23EBB4050((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_customerAgreements, (void (*)(void))type metadata accessor for UtilityCustomerAgreement);
}

- (_TtC19HomeUtilityServices30UtilitySubscriptionInformation)initWithSubscriptionID:(id)a3 state:(id)a4 startDate:(id)a5 serviceLocation:(id)a6 customerAgreements:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  id v22;
  objc_super v24;

  v9 = sub_23EC2E780();
  v11 = v10;
  v12 = sub_23EC2E780();
  v14 = v13;
  v15 = sub_23EC2E780();
  v17 = v16;
  type metadata accessor for UtilityCustomerAgreement();
  v18 = (objc_class *)sub_23EC2E930();
  v19 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_subscriptionID);
  *v19 = v9;
  v19[1] = v11;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_state);
  *v20 = v12;
  v20[1] = v14;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_startDate);
  *v21 = v15;
  v21[1] = v17;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_serviceLocation) = (Class)a6;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_customerAgreements) = v18;
  v24.receiver = self;
  v24.super_class = (Class)type metadata accessor for UtilitySubscriptionInformation();
  v22 = a6;
  return -[UtilitySubscriptionInformation init](&v24, sel_init);
}

- (_TtC19HomeUtilityServices30UtilitySubscriptionInformation)init
{
  _TtC19HomeUtilityServices30UtilitySubscriptionInformation *result;

  result = (_TtC19HomeUtilityServices30UtilitySubscriptionInformation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_serviceLocation));
  swift_bridgeObjectRelease();
}

@end
