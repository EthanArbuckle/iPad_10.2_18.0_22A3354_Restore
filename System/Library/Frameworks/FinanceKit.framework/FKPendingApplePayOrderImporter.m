@implementation FKPendingApplePayOrderImporter

- (FKPendingApplePayOrderImporter)init
{
  FKPendingApplePayOrderImporter *v2;
  uint64_t v3;
  _TtC10FinanceKit28PendingApplePayOrderImporter *wrappedImporter;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FKPendingApplePayOrderImporter;
  v2 = -[FKPendingApplePayOrderImporter init](&v7, sel_init);
  if (v2)
  {
    +[PendingApplePayOrderImporter makeImporterAndReturnError:](_TtC10FinanceKit28PendingApplePayOrderImporter, "makeImporterAndReturnError:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    wrappedImporter = v2->_wrappedImporter;
    v2->_wrappedImporter = (_TtC10FinanceKit28PendingApplePayOrderImporter *)v3;

    if (!v2->_wrappedImporter)
    {
      v5 = os_log_create("com.apple.FinanceKit", "Orders");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[FKPendingApplePayOrderImporter init].cold.1(v5);

    }
  }
  return v2;
}

- (void)insertOrUpdatePendingApplePayOrder:(id)a3
{
  -[PendingApplePayOrderImporter insertOrUpdatePendingApplePayOrderWithOrderDetails:](self->_wrappedImporter, "insertOrUpdatePendingApplePayOrderWithOrderDetails:", a3);
}

- (_TtC10FinanceKit28PendingApplePayOrderImporter)wrappedImporter
{
  return self->_wrappedImporter;
}

- (void)setWrappedImporter:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedImporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedImporter, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_233151000, log, OS_LOG_TYPE_ERROR, "Error initializing PendingApplePayOrderImporter", v1, 2u);
}

@end
