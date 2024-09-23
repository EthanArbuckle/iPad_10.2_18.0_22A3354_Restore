@implementation ML3ActiveTransaction

- (ML3Client)client
{
  return self->_client;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setTerminable:(BOOL)a3
{
  self->_terminable = a3;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void)unlock
{
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)lock
{
  -[NSLock lock](self->_lock, "lock");
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (ML3ActiveTransaction)initWithLibrary:(id)a3 connection:(id)a4 client:(id)a5
{
  id v10;
  id v11;
  id v12;
  ML3ActiveTransaction *v13;
  ML3ActiveTransaction *v14;
  void *v15;
  void *v16;
  NSUUID *v17;
  NSUUID *identifier;
  NSLock *v19;
  NSLock *lock;
  id v21;
  void *v22;
  uint64_t v23;
  MSVXPCTransaction *xpcTransaction;
  void *v26;
  void *v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ActiveTransaction.m"), 32, CFSTR("Tried to create a transaction object with a nil connection."));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ActiveTransaction.m"), 33, CFSTR("Tried to create a transaction object without a library."));

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)ML3ActiveTransaction;
  v13 = -[ML3ActiveTransaction init](&v28, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_library, a3);
    objc_storeStrong((id *)&v14->_client, a5);
    objc_storeStrong((id *)&v14->_connection, a4);
    -[ML3DatabaseConnection currentTransactionID](v14->_connection, "currentTransactionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v14->_identifier;
    v14->_identifier = v17;

    v14->_terminable = 1;
    v19 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v14->_lock;
    v14->_lock = v19;

    v21 = objc_alloc(MEMORY[0x1E0D4D130]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Database transaction %@"), v14->_identifier);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "initWithName:", v22);
    xpcTransaction = v14->_xpcTransaction;
    v14->_xpcTransaction = (MSVXPCTransaction *)v23;

    -[MSVXPCTransaction beginTransaction](v14->_xpcTransaction, "beginTransaction");
    -[ML3ActiveTransaction updateLastUsed](v14, "updateLastUsed");

  }
  return v14;
}

- (ML3DatabaseConnection)connection
{
  -[ML3ActiveTransaction updateLastUsed](self, "updateLastUsed");
  return self->_connection;
}

- (void)updateLastUsed
{
  double v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_lastUsedTime = v3;
}

- (id)_relinquishConnection
{
  ML3DatabaseConnection *v3;
  ML3DatabaseConnection *connection;

  v3 = self->_connection;
  connection = self->_connection;
  self->_connection = 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_xpcTransaction, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (ML3ActiveTransaction)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithLibrary_connection_client_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is invalid. use %@ instead"), v5, v6);

  return 0;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = -[ML3Client processID](self->_client, "processID");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_readOnly)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[ML3Client bundleID](self->_client, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p\n\tidentifier:             %@\n\treadonly:               %@\n\toriginating process:    %@ [%d]\n\tconnection:             %@\n\tlast used time:         %f"), v5, self, v6, v7, v8, v3, self->_connection, *(_QWORD *)&self->_lastUsedTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)debugDescription
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[ML3Client processID](self->_client, "processID");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_readOnly)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[ML3Client bundleID](self->_client, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseConnection debugDescription](self->_connection, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p\n\tidentifier:             %@\n\treadonly:               %@\n\toriginating process:    %@ [%d]\n\tconnection:             %@\n\tlast used time:         %f"), v5, self, v6, v7, v8, v3, v9, *(_QWORD *)&self->_lastUsedTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(double)a3
{
  self->_lastUsedTime = a3;
}

- (BOOL)terminable
{
  return self->_terminable;
}

- (BOOL)inUseByOperation
{
  return self->_inUseByOperation;
}

- (void)setInUseByOperation:(BOOL)a3
{
  self->_inUseByOperation = a3;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

@end
