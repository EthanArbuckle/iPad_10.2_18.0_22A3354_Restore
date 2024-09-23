@implementation ManagedWalletMessage

- (void)didSave
{
  _TtC10FinanceKit20ManagedWalletMessage *v2;
  _TtC10FinanceKit20ManagedWalletMessage *v3;
  _TtC10FinanceKit20ManagedWalletMessage *v4;

  v4 = self;
  if ((PKRunningInPassd() & 1) != 0)
  {
    v2 = v4;
  }
  else
  {
    v3 = (_TtC10FinanceKit20ManagedWalletMessage *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6ED30]), sel_init);
    -[ManagedWalletMessage updateFinanceKitApplicationMessages](v3, sel_updateFinanceKitApplicationMessages);

    v2 = v3;
  }

}

- (_TtC10FinanceKit20ManagedWalletMessage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedWalletMessage initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

@end
