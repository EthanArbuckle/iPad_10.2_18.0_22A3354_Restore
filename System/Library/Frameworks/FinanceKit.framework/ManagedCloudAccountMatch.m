@implementation ManagedCloudAccountMatch

- (_TtC10FinanceKit24ManagedCloudAccountMatch)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedCloudAccountMatch initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void).cxx_construct
{
  char *v2;
  char *v3;
  _QWORD *v4;

  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_matchingTypeKey;
  strcpy((char *)self + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_matchingTypeKey, "matchingType");
  v2[13] = 0;
  *((_WORD *)v2 + 7) = -5120;
  v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_isMismatchedKey;
  strcpy((char *)self + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_isMismatchedKey, "isMismatched");
  v3[13] = 0;
  *((_WORD *)v3 + 7) = -5120;
  v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit24ManagedCloudAccountMatch_ckSchemaVersionKey);
  *v4 = 0xD000000000000012;
  v4[1] = 0x800000023367CE60;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
