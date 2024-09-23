@implementation HDOntologyTransaction

- (HDOntologyTransaction)init
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

- (HDOntologyTransaction)initWithProfile:(id)a3 databaseTransaction:(id)a4 graphDatabase:(id)a5 isWriteTransaction:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  HDOntologyTransaction *v13;
  HDOntologyTransaction *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDOntologyTransaction;
  v13 = -[HDOntologyTransaction init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v14->_databaseTransaction, a4);
    objc_storeStrong((id *)&v14->_graphDatabase, a5);
    v14->_isWriteTransaction = a6;
  }

  return v14;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDDatabaseTransaction)databaseTransaction
{
  return self->_databaseTransaction;
}

- (HDSimpleGraphDatabase)graphDatabase
{
  return self->_graphDatabase;
}

- (BOOL)isWriteTransaction
{
  return self->_isWriteTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphDatabase, 0);
  objc_storeStrong((id *)&self->_databaseTransaction, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
