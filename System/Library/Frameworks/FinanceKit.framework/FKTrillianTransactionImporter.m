@implementation FKTrillianTransactionImporter

- (FKTrillianTransactionImporter)init
{
  FKTrillianTransactionImporter *v2;
  uint64_t v3;
  _TtC10FinanceKit27TrillianTransactionImporter *wrappedClass;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FKTrillianTransactionImporter;
  v2 = -[FKTrillianTransactionImporter init](&v7, sel_init);
  if (v2)
  {
    +[TrillianTransactionImporter makeClassAndReturnError:](_TtC10FinanceKit27TrillianTransactionImporter, "makeClassAndReturnError:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    wrappedClass = v2->_wrappedClass;
    v2->_wrappedClass = (_TtC10FinanceKit27TrillianTransactionImporter *)v3;

    if (!v2->_wrappedClass)
    {
      v5 = os_log_create("com.apple.FinanceKit", "Orders");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[FKTrillianTransactionImporter init].cold.1(v5);

    }
  }
  return v2;
}

- (void)registerTransaction:(id)a3
{
  -[TrillianTransactionImporter registerWithTransaction:](self->_wrappedClass, "registerWithTransaction:", a3);
}

- (_TtC10FinanceKit27TrillianTransactionImporter)wrappedClass
{
  return self->_wrappedClass;
}

- (void)setWrappedClass:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedClass, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_233151000, log, OS_LOG_TYPE_ERROR, "Error initializing TrillianTransactionImporter", v1, 2u);
}

@end
