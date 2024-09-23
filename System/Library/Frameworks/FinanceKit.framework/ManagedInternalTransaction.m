@implementation ManagedInternalTransaction

- (_TtC10FinanceKit26ManagedInternalTransaction)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[ManagedInternalTransaction initWithEntity:insertIntoManagedObjectContext:](&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_23319DAF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedInternalTransaction.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_23319DAF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedInternalTransaction.validateForUpdate());
}

- (NSUUID)id
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC10FinanceKit26ManagedInternalTransaction *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;

  v3 = sub_23361D6A0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = -[ManagedInternalTransaction publicTransactionObject](v7, sel_publicTransactionObject);
  v9 = objc_msgSend(v8, "id");

  sub_23361D67C();
  v10 = (void *)sub_23361D658();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v10;
}

- (NSDecimalNumber)amount
{
  return (NSDecimalNumber *)sub_2335A06B8(self, (uint64_t)a2, (SEL *)&selRef_amount);
}

- (NSString)currency
{
  _TtC10FinanceKit26ManagedInternalTransaction *v2;
  id v3;
  id v4;
  void *v5;

  v2 = self;
  v3 = -[ManagedInternalTransaction publicTransactionObject](v2, sel_publicTransactionObject);
  v4 = objc_msgSend(v3, sel_currency);

  sub_23361E150();
  v5 = (void *)sub_23361E12C();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSDecimalNumber)foreignAmount
{
  return (NSDecimalNumber *)sub_2335A06B8(self, (uint64_t)a2, (SEL *)&selRef_foreignAmount);
}

- (NSString)foreignCurrency
{
  _TtC10FinanceKit26ManagedInternalTransaction *v2;
  id v3;
  id v4;
  void *v5;

  v2 = self;
  v3 = -[ManagedInternalTransaction publicTransactionObject](v2, sel_publicTransactionObject);
  v4 = objc_msgSend(v3, sel_foreignCurrency);

  if (v4)
  {
    sub_23361E150();

    v5 = (void *)sub_23361E12C();
    swift_bridgeObjectRelease();
  }
  else
  {

    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSDecimalNumber)foreignCurrencyExchangeRate
{
  return (NSDecimalNumber *)sub_2335A06B8(self, (uint64_t)a2, (SEL *)&selRef_foreignCurrencyExchangeRate);
}

@end
