@implementation _HDOntologyShardRegistryInsertOperation

- (_HDOntologyShardRegistryInsertOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v8 = a4;
  objc_msgSend(a3, "daemon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ontologyUpdateCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80___HDOntologyShardRegistryInsertOperation_performWithProfile_transaction_error___block_invoke;
  v12[3] = &unk_1E6CEFA20;
  v12[4] = self;
  LOBYTE(a5) = objc_msgSend(v10, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, v8, a5, v12);

  return (char)a5;
}

- (id)transactionContext
{
  void *v2;
  void *v3;

  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsJournalingDuringProtectedRead:", 1);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_entries, CFSTR("entries"));
}

- (_HDOntologyShardRegistryInsertOperation)initWithCoder:(id)a3
{
  id v4;
  _HDOntologyShardRegistryInsertOperation *v5;
  void *v6;
  uint64_t v7;
  NSArray *entries;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HDOntologyShardRegistryInsertOperation;
  v5 = -[_HDOntologyShardRegistryInsertOperation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("entries"));
    v7 = objc_claimAutoreleasedReturnValue();
    entries = v5->_entries;
    v5->_entries = (NSArray *)v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
