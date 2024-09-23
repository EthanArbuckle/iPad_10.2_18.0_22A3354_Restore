@implementation ML3ImportOperation

- (ML3ImportOperation)initWithDatabaseImport:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  ML3ImportOperation *v9;
  ML3ImportOperation *v10;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ImportOperation.mm"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("import"));

  }
  objc_msgSend(v6, "writer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ImportOperation.mm"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("import.writer"));

  }
  objc_msgSend(v6, "library");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3ImportOperation.mm"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("import.library"));

  }
  v15.receiver = self;
  v15.super_class = (Class)ML3ImportOperation;
  v9 = -[ML3ImportOperation init](&v15, sel_init);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_import, a3);

  return v10;
}

- (ML3ImportOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = objc_opt_class();
  NSStringFromSelector(sel_initWithDatabaseImport_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99750], CFSTR("You must provide %@ with a database import. Use %@ instead."), v4, v5);

  return 0;
}

- (unint64_t)importSource
{
  return 0;
}

- (id)longDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 success;
  NSError *error;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  objc_super v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)ML3ImportOperation;
  -[ML3ImportOperation description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ServiceDatabaseImport writer](self->_import, "writer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ServiceDatabaseImport library](self->_import, "library");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseImport trackData](self->_import, "trackData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  success = self->_success;
  error = self->_error;
  v11 = -[ML3ImportOperation isCancelled](self, "isCancelled");
  v12 = CFSTR("YES");
  if (success)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (v11)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (!self->_suspended)
    v12 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\n\twriter:             %p\n\tlibrary:            %@\n\timport data size:   %lu\n\tsuccess:            %@\n\terror:              %@\n\n\tcancelled:          %@\n\tsuspended:          %@\n"), v4, v5, v6, v8, v13, error, v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)main
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Warning: Empty import operation started.", v4, 2u);
  }

  -[ML3ImportOperation setSuccess:](self, "setSuccess:", 1);
}

- (void)setProgress:(float)a3
{
  void *v5;
  void (**v6)(float);

  self->_progress = a3;
  -[ML3ImportOperation progressBlock](self, "progressBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ML3ImportOperation progressBlock](self, "progressBlock");
    v6 = (void (**)(float))objc_claimAutoreleasedReturnValue();
    v6[2](a3);

  }
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setReturnData:(id)a3
{
  objc_storeStrong((id *)&self->_returnData, a3);
}

- (void)_writerTransactionWithBlock:(id)a3
{
  uint64_t (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = (uint64_t (**)(id, void *, id))a3;
  -[ML3ServiceDatabaseImport writer](self->_import, "writer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ML3Client daemonClient](ML3Client, "daemonClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ServiceDatabaseImport library](self->_import, "library");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "beginTransactionForLibrary:withClient:options:error:", v7, v6, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  objc_msgSend(v8, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setCloseConnectionWhenCheckingIn");

  objc_msgSend(v8, "setInUseByOperation:", 1);
  v11 = v4[2](v4, v8, v9);
  objc_msgSend(v8, "updateLastUsed");
  objc_msgSend(v8, "setInUseByOperation:", 0);
  objc_msgSend(v8, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endTransaction:shouldCommit:error:", v12, v11, 0);

}

- (id)_clientCompletionHandler
{
  return (id)MEMORY[0x1AF43CDE0](self->_clientCompletionHandler, a2);
}

- (void)_setClientCompletionHandler:(id)a3
{
  void *v4;
  id clientCompletionHandler;
  id v6;

  v6 = a3;
  v4 = (void *)objc_msgSend(v6, "copy");
  clientCompletionHandler = self->_clientCompletionHandler;
  self->_clientCompletionHandler = v4;

}

- (ML3ServiceDatabaseImport)import
{
  return self->_import;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (float)progress
{
  return self->_progress;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (NSData)returnData
{
  return self->_returnData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_import, 0);
  objc_storeStrong(&self->_clientCompletionHandler, 0);
}

+ (id)importOperationWithSourceType:(unint64_t)a3 databaseImport:(id)a4
{
  id v6;
  void *v7;
  void *v9;

  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ML3ImportOperation.mm"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("import"));

  }
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDatabaseImport:", v6);

  return v7;
}

@end
