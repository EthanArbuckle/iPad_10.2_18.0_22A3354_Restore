@implementation ML3DatabaseOperation

- (ML3DatabaseOperation)initWithLibrary:(id)a3 writer:(id)a4
{
  id v7;
  id v8;
  ML3DatabaseOperation *v9;
  ML3DatabaseOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3DatabaseOperation;
  v9 = -[ML3DatabaseOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    v10->_type = 0;
    objc_storeWeak((id *)&v10->_writer, v8);
  }

  return v10;
}

- (void)main
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  ML3ActiveTransaction *transaction;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  ML3DatabaseOperation *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v3 = -[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](self, "_verifyLibraryConnectionAndAttributesProperties:", &v14);
  v4 = v14;
  v5 = v4;
  if ((_DWORD)v3)
  {
    v13 = v4;
    v3 = -[ML3DatabaseOperation _execute:](self, "_execute:", &v13);
    v6 = v13;

    if ((_DWORD)v3)
    {
      if (-[ML3DatabaseOperation isCancelled](self, "isCancelled"))
      {
        +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 400, CFSTR("Operation cancelled."));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v3 = 0;
        goto LABEL_7;
      }
      v3 = 1;
    }
    v5 = v6;
  }
LABEL_7:
  if (self->_beganNewTransaction)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
    -[ML3ActiveTransaction identifier](self->_transaction, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    v3 = objc_msgSend(WeakRetained, "endTransaction:shouldCommit:error:", v8, v3, &v12);
    v9 = v12;

    if ((v3 & 1) == 0)
    {
      v10 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = v9;
        _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_ERROR, "Failed to end transaction for operation %{public}@. %{public}@", buf, 0x16u);
      }

    }
    transaction = self->_transaction;
    self->_transaction = 0;

  }
  else
  {
    v9 = v5;
  }
  -[ML3DatabaseOperation setSuccess:](self, "setSuccess:", v3);
  -[ML3DatabaseOperation setError:](self, "setError:", v9);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[ML3DatabaseOperation _operationTypeDescription](self, "_operationTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p operationType = %@, attributes = %@>"), v4, self, v5, self->_attributes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ML3ActiveTransaction)transaction
{
  ML3ActiveTransaction *transaction;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  ML3ActiveTransaction *v8;
  ML3ActiveTransaction *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  ML3MusicLibrary *library;
  void *v15;
  ML3ActiveTransaction *v16;
  id v17;
  ML3ActiveTransaction *v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  ML3DatabaseOperation *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  transaction = self->_transaction;
  if (!transaction)
  {
    -[ML3DatabaseOperation options](self, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("MLDatabaseOperationOptionTransactionIdentifierKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_writer);
    v7 = WeakRetained;
    if (v5)
    {
      objc_msgSend(WeakRetained, "_transactionForIdentifier:", v5);
      v8 = (ML3ActiveTransaction *)objc_claimAutoreleasedReturnValue();
      v9 = self->_transaction;
      self->_transaction = v8;

    }
    if (!self->_transaction)
    {
      -[ML3DatabaseOperation options](self, "options");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("MLDatabaseOperationOptionReadOnlyKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      if (v12)
        v13 = 2;
      else
        v13 = 0;
      library = self->_library;
      +[ML3Client daemonClient](ML3Client, "daemonClient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      objc_msgSend(v7, "beginTransactionForLibrary:withClient:options:error:", library, v15, v13, &v21);
      v16 = (ML3ActiveTransaction *)objc_claimAutoreleasedReturnValue();
      v17 = v21;
      v18 = self->_transaction;
      self->_transaction = v16;

      -[ML3ActiveTransaction setInUseByOperation:](self->_transaction, "setInUseByOperation:", 1);
      if (self->_transaction)
      {
        self->_beganNewTransaction = 1;
      }
      else
      {
        v19 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v23 = self;
          v24 = 2114;
          v25 = v17;
          _os_log_impl(&dword_1AC149000, v19, OS_LOG_TYPE_ERROR, "Error creating new transaction for operation %{public}@. %{public}@", buf, 0x16u);
        }

        -[ML3DatabaseOperation setError:](self, "setError:", v17);
      }

    }
    transaction = self->_transaction;
  }
  -[ML3ActiveTransaction updateLastUsed](transaction, "updateLastUsed");
  return self->_transaction;
}

- (BOOL)_execute:(id *)a3
{
  -[ML3DatabaseOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;

  -[ML3DatabaseOperation attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ML3DatabaseOperation library](self, "library");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ML3DatabaseOperation transaction](self, "transaction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = 0;
        goto LABEL_12;
      }
      v12 = CFSTR("Operation does not have a transaction set.");
    }
    else
    {
      v12 = CFSTR("Operation does not have library reference.");
    }
    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 600, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_12;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[ML3DatabaseOperation _operationTypeDescription](self, "_operationTypeDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Missing attributes for operation type: %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[ML3MediaLibraryWriter writerErrorWithCode:description:](ML3MediaLibraryWriter, "writerErrorWithCode:description:", 500, v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_12;
  }
  if (v8)
  {
    v8 = objc_retainAutorelease(v8);
    *a3 = v8;
  }
LABEL_12:

  return v8 == 0;
}

- (id)_operationTypeDescription
{
  unint64_t v2;

  v2 = -[ML3DatabaseOperation type](self, "type");
  if (v2 - 1 > 8)
    return CFSTR("<Unknown Write Operation Type>");
  else
    return off_1E5B64D98[v2 - 1];
}

- (unint64_t)type
{
  return self->_type;
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (ML3Client)originatingClient
{
  return self->_originatingClient;
}

- (void)setOriginatingClient:(id)a3
{
  objc_storeStrong((id *)&self->_originatingClient, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_originatingClient, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_writer);
}

+ (id)databaseOperationForType:(unint64_t)a3 withLibrary:(id)a4 writer:(id)a5
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  if (a3 - 1 <= 8 && (v9 = (objc_class *)objc_opt_class()) != 0)
    v10 = (void *)objc_msgSend([v9 alloc], "initWithLibrary:writer:", v7, v8);
  else
    v10 = 0;

  return v10;
}

@end
