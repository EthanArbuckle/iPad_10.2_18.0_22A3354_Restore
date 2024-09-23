@implementation FKWalletExposedDB

- (FKWalletExposedDB)init
{
  FKWalletExposedDB *v2;
  uint64_t v3;
  id v4;
  _TtC10FinanceKit15WalletExposedDB *walletExposedDB;
  FKWalletExposedDB *v6;
  NSObject *v7;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FKWalletExposedDB;
  v2 = -[FKWalletExposedDB init](&v10, sel_init);
  if (!v2)
    goto LABEL_4;
  v9 = 0;
  +[WalletExposedDB makeClassAndReturnError:](_TtC10FinanceKit15WalletExposedDB, "makeClassAndReturnError:", &v9);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v9;
  walletExposedDB = v2->_walletExposedDB;
  v2->_walletExposedDB = (_TtC10FinanceKit15WalletExposedDB *)v3;

  if (v2->_walletExposedDB)
  {

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  v7 = os_log_create("com.apple.FinanceKit", "Store");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[FKWalletExposedDB init].cold.1((uint64_t)v4, v7);

  v6 = 0;
LABEL_8:

  return v6;
}

- (id)fetchAppleAccountsWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[FKWalletExposedDB walletExposedDB](self, "walletExposedDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAppleAccountsAndReturnError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)insertOrUpdateTransactions:(id)a3 forAppleAccountWithID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[FKWalletExposedDB walletExposedDB](self, "walletExposedDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertOrUpdateTransactions:forAppleAccountWithID:error:", v9, v8, a5);

  if (a5)
    *a5 = 0;
  return 1;
}

- (_TtC10FinanceKit15WalletExposedDB)walletExposedDB
{
  return self->_walletExposedDB;
}

- (void)setWalletExposedDB:(id)a3
{
  objc_storeStrong((id *)&self->_walletExposedDB, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletExposedDB, 0);
}

- (void)init
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_233151000, a2, OS_LOG_TYPE_ERROR, "Error initializing WalletExposedDB: %@", (uint8_t *)&v2, 0xCu);
}

@end
