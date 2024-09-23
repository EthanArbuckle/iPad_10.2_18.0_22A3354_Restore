@implementation UtilityCustomerAgreement

- (NSString)customerAgreementID
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)accountID
{
  return (NSString *)sub_23EBABEB4();
}

- (NSArray)programs
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_programs))
  {
    type metadata accessor for UtilityProgram();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_23EC2E924();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (NSArray)meters
{
  return (NSArray *)sub_23EBB4050((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_meters, (void (*)(void))type metadata accessor for UtilityMeter);
}

- (NSString)alternateSupplier
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_alternateSupplier;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23EC2E774();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setAlternateSupplier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_23EC2E780();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_alternateSupplier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC19HomeUtilityServices24UtilityCustomerAgreement)initWithCustomerAgreementID:(id)a3 accountID:(id)a4 meters:(id)a5 programs:(id)a6 alternateSupplier:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id *v19;
  uint64_t *v20;
  uint64_t *v21;
  objc_super v23;

  v10 = sub_23EC2E780();
  v12 = v11;
  v13 = sub_23EC2E780();
  v15 = v14;
  type metadata accessor for UtilityMeter();
  v16 = (objc_class *)sub_23EC2E930();
  if (a6)
  {
    type metadata accessor for UtilityProgram();
    a6 = (id)sub_23EC2E930();
  }
  if (a7)
  {
    a7 = (id)sub_23EC2E780();
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = (id *)((char *)&self->super.isa
             + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_alternateSupplier);
  *v19 = 0;
  v19[1] = 0;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_customerAgreementID);
  *v20 = v10;
  v20[1] = v12;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_accountID);
  *v21 = v13;
  v21[1] = v15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_programs) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_meters) = v16;
  swift_beginAccess();
  *v19 = a7;
  v19[1] = v18;
  swift_bridgeObjectRelease();
  v23.receiver = self;
  v23.super_class = (Class)type metadata accessor for UtilityCustomerAgreement();
  return -[UtilityCustomerAgreement init](&v23, sel_init);
}

- (_TtC19HomeUtilityServices24UtilityCustomerAgreement)init
{
  _TtC19HomeUtilityServices24UtilityCustomerAgreement *result;

  result = (_TtC19HomeUtilityServices24UtilityCustomerAgreement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
