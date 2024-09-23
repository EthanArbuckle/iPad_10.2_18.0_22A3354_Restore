@implementation FKPaymentTransactionProcessor

- (FKPaymentTransactionProcessor)init
{
  FKPaymentTransactionProcessor *v2;
  _TtC10FinanceKit27PaymentTransactionProcessor *v3;
  _TtC10FinanceKit27PaymentTransactionProcessor *importer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKPaymentTransactionProcessor;
  v2 = -[FKPaymentTransactionProcessor init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10FinanceKit27PaymentTransactionProcessor);
    importer = v2->_importer;
    v2->_importer = v3;

  }
  return v2;
}

- (void)insertOrUpdateTransaction:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
  -[PaymentTransactionProcessor insertOrUpdateTransaction:forPrimaryAccountIdentifier:](self->_importer, "insertOrUpdateTransaction:forPrimaryAccountIdentifier:", a3, a4);
}

- (void)deleteTransactionWithIdentifier:(id)a3 forPrimaryAccountIdentifier:(id)a4
{
  -[PaymentTransactionProcessor deleteTransactionWithIdentifier:forPrimaryAccountIdentifier:](self->_importer, "deleteTransactionWithIdentifier:forPrimaryAccountIdentifier:", a3, a4);
}

- (_TtC10FinanceKit27PaymentTransactionProcessor)importer
{
  return self->_importer;
}

- (void)setImporter:(id)a3
{
  objc_storeStrong((id *)&self->_importer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importer, 0);
}

@end
