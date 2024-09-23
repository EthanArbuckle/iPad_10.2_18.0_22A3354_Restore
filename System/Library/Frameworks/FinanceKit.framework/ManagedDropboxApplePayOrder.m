@implementation ManagedDropboxApplePayOrder

- (_TtC10FinanceKit27ManagedDropboxApplePayOrder)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedDropboxApplePayOrder initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (void).cxx_construct
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit27ManagedDropboxApplePayOrder_encryptionSchemeKey);
  *v2 = 0xD000000000000010;
  v2[1] = 0x80000002336736F0;
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC10FinanceKit27ManagedDropboxApplePayOrder_ephemeralPublicKeyKey);
  *v3 = 0xD000000000000012;
  v3[1] = 0x8000000233673710;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
