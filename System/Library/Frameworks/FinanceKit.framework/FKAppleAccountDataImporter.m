@implementation FKAppleAccountDataImporter

- (FKAppleAccountDataImporter)init
{
  FKAppleAccountDataImporter *v2;
  uint64_t v3;
  _TtC10FinanceKit24AppleAccountDataImporter *wrappedClass;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FKAppleAccountDataImporter;
  v2 = -[FKAppleAccountDataImporter init](&v7, sel_init);
  if (v2)
  {
    +[AppleAccountDataImporter makeClassAndReturnError:](_TtC10FinanceKit24AppleAccountDataImporter, "makeClassAndReturnError:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    wrappedClass = v2->_wrappedClass;
    v2->_wrappedClass = (_TtC10FinanceKit24AppleAccountDataImporter *)v3;

    if (!v2->_wrappedClass)
    {
      v5 = os_log_create("com.apple.FinanceKit", "BankConnect");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[FKAppleAccountDataImporter init].cold.1(v5);

    }
  }
  return v2;
}

- (BOOL)insertOrUpdateAccount:(id)a3 error:(id *)a4
{
  _TtC10FinanceKit24AppleAccountDataImporter *wrappedClass;
  id v6;
  void *v7;
  id v9;

  wrappedClass = self->_wrappedClass;
  v9 = 0;
  -[AppleAccountDataImporter insertOrUpdateWithAppleAccount:error:](wrappedClass, "insertOrUpdateWithAppleAccount:error:", a3, &v9);
  v6 = v9;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v7 == 0;
}

- (BOOL)insertOrUpdateAppleAccounts:(id)a3 error:(id *)a4
{
  _TtC10FinanceKit24AppleAccountDataImporter *wrappedClass;
  id v6;
  void *v7;
  id v9;

  wrappedClass = self->_wrappedClass;
  v9 = 0;
  -[AppleAccountDataImporter insertOrUpdateWithAppleAccounts:error:](wrappedClass, "insertOrUpdateWithAppleAccounts:error:", a3, &v9);
  v6 = v9;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v7 == 0;
}

- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAssociatedAppleAccountWithIdentifier:(id)a4 error:(id *)a5
{
  _TtC10FinanceKit24AppleAccountDataImporter *wrappedClass;
  id v7;
  void *v8;
  id v10;

  wrappedClass = self->_wrappedClass;
  v10 = 0;
  -[AppleAccountDataImporter deleteTransactionsWithIdentifiers:forAppleAccountIdentifier:error:](wrappedClass, "deleteTransactionsWithIdentifiers:forAppleAccountIdentifier:error:", a3, a4, &v10);
  v7 = v10;
  v8 = v7;
  if (a5)
    *a5 = objc_retainAutorelease(v7);

  return v8 == 0;
}

- (BOOL)deleteAllTransactionsForAppleAccountWithIdentifier:(id)a3 error:(id *)a4
{
  _TtC10FinanceKit24AppleAccountDataImporter *wrappedClass;
  id v6;
  void *v7;
  id v9;

  wrappedClass = self->_wrappedClass;
  v9 = 0;
  -[AppleAccountDataImporter deleteAllTransactionsFor:error:](wrappedClass, "deleteAllTransactionsFor:error:", a3, &v9);
  v6 = v9;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v7 == 0;
}

- (BOOL)deleteAppleAccountWithIdentifier:(id)a3 error:(id *)a4
{
  _TtC10FinanceKit24AppleAccountDataImporter *wrappedClass;
  id v6;
  void *v7;
  id v9;

  wrappedClass = self->_wrappedClass;
  v9 = 0;
  -[AppleAccountDataImporter deleteAppleAccountWith:error:](wrappedClass, "deleteAppleAccountWith:error:", a3, &v9);
  v6 = v9;
  v7 = v6;
  if (a4)
    *a4 = objc_retainAutorelease(v6);

  return v7 == 0;
}

- (_TtC10FinanceKit24AppleAccountDataImporter)wrappedClass
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
  _os_log_error_impl(&dword_233151000, log, OS_LOG_TYPE_ERROR, "Error initializing AppleAccountDataImporter", v1, 2u);
}

@end
