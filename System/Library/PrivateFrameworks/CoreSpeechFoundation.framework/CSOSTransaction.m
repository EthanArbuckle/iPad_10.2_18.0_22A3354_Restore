@implementation CSOSTransaction

- (CSOSTransaction)initWithDescription:(id)a3
{
  id v4;
  CSOSTransaction *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *description;
  uint64_t v12;
  OS_os_transaction *transaction;
  NSObject *v14;
  NSString *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  NSString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSOSTransaction;
  v5 = -[CSOSTransaction init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    description = v5->_description;
    v5->_description = (NSString *)v10;

    -[NSString UTF8String](v5->_description, "UTF8String");
    v12 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v12;

    v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v5->_description;
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSOSTransaction initWithDescription:]";
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Creating OS Transaction for %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *description;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSOSTransaction dealloc]";
    v8 = 2114;
    v9 = description;
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s Release OS Transaction for %{public}@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSOSTransaction;
  -[CSOSTransaction dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
