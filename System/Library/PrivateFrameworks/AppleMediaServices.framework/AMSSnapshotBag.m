@implementation AMSSnapshotBag

- (id)integerForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSSnapshotBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 3);

  return v7;
}

- (id)URLForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSSnapshotBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 5);

  return v7;
}

- (id)doubleForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSSnapshotBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 2);

  return v7;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSSnapshotBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 6);

  return v7;
}

- (id)stringForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSSnapshotBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 4);

  return v7;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSSnapshotBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 0);

  return v7;
}

- (id)BOOLForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSSnapshotBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 1);

  return v7;
}

- (AMSBagFrozenDataSource)dataSource
{
  return self->_dataSource;
}

void __47__AMSSnapshotBag_createSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  AMSBagFrozenDataSourceBuilder *v2;
  void *v3;
  AMSSnapshotBag *v4;
  void *v5;
  id v6;
  AMSBagFrozenDataSourceBuilder *v7;

  v2 = [AMSBagFrozenDataSourceBuilder alloc];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagFrozenDataSourceBuilder initWithFrozenDataSource:](v2, "initWithFrozenDataSource:", v3);

  v4 = [AMSSnapshotBag alloc];
  -[AMSBagFrozenDataSourceBuilder createFrozenDataSource](v7, "createFrozenDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AMSSnapshotBag _initWithDataSource:](v4, "_initWithDataSource:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (id)_initWithDataSource:(id)a3
{
  id v5;
  AMSSnapshotBag *v6;
  uint64_t v7;
  NSDate *creationDate;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSSnapshotBag;
  v6 = -[AMSSnapshotBag init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = objc_claimAutoreleasedReturnValue();
    creationDate = v6->_creationDate;
    v6->_creationDate = (NSDate *)v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

- (AMSSnapshotBag)initWithData:(id)a3
{
  id v4;
  AMSSnapshotBag *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
  v5 = (AMSSnapshotBag *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchived snapshot bag. Error: %{public}@", buf, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

- (NSString)profile
{
  void *v2;
  void *v3;

  -[AMSSnapshotBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  void *v2;
  void *v3;

  -[AMSSnapshotBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (AMSSnapshotBag)initWithCoder:(id)a3
{
  id v4;
  AMSSnapshotBag *v5;
  uint64_t v6;
  NSDate *creationDate;
  uint64_t v8;
  AMSBagFrozenDataSource *dataSource;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSSnapshotBag;
  v5 = -[AMSSnapshotBag init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationData"));
    v6 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataSource"));
    v8 = objc_claimAutoreleasedReturnValue();
    dataSource = v5->_dataSource;
    v5->_dataSource = (AMSBagFrozenDataSource *)v8;

  }
  return v5;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__AMSSnapshotBag_createSnapshotWithCompletion___block_invoke;
  v7[3] = &unk_1E253E7B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AMSSnapshotBag expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "compare:", v2) == 1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;

  -[AMSSnapshotBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (AMSSnapshotBag)init
{
  void *v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "OSLogObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v8 = objc_opt_class();
    _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_ERROR, "%{public}@: The default initializer is deprecated and should not be used", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)AMSSnapshotBag;
  return -[AMSSnapshotBag init](&v6, sel_init);
}

- (id)_initWithSnapshotBag:(id)a3
{
  id v4;
  AMSSnapshotBag *v5;
  void *v6;
  uint64_t v7;
  AMSBagFrozenDataSource *dataSource;
  void *v9;
  uint64_t v10;
  NSDate *creationDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMSSnapshotBag;
  v5 = -[AMSSnapshotBag init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    dataSource = v5->_dataSource;
    v5->_dataSource = (AMSBagFrozenDataSource *)v7;

    objc_msgSend(v4, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

  }
  return v5;
}

- (BOOL)isLoaded
{
  void *v2;
  char v3;

  -[AMSSnapshotBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoaded");

  return v3;
}

- (id)compile
{
  AMSMutablePromise *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v3 = objc_alloc_init(AMSMutablePromise);
  -[AMSSnapshotBag dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[AMSSnapshotBag profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSSnapshotBag profileVersion](self, "profileVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[AMSPromise completionHandlerAdapter](v3, "completionHandlerAdapter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createSnapshotWithCompletion:", v8);

LABEL_6:
    goto LABEL_7;
  }
  if (!-[AMSSnapshotBag isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    v7 = -[AMSSnapshotBag _initWithSnapshotBag:]([AMSSnapshotBag alloc], "_initWithSnapshotBag:", self);
    -[AMSMutablePromise finishWithResult:](v3, "finishWithResult:", v7);
    goto LABEL_6;
  }
  -[AMSMutablePromise finishWithResult:](v3, "finishWithResult:", self);
LABEL_7:
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __25__AMSSnapshotBag_compile__block_invoke;
  v11[3] = &unk_1E2545948;
  v11[4] = self;
  -[AMSMutablePromise thenWithBlock:](v3, "thenWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

AMSMutablePromise *__25__AMSSnapshotBag_compile__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  AMSMutablePromise *v7;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  if (v3)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v3;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to archive snapshot bag. Error: %{public}@", buf, 0x16u);
    }

    +[AMSPromise promiseWithError:](AMSPromise, "promiseWithError:", v3);
    v7 = (AMSMutablePromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc_init(AMSMutablePromise);
    -[AMSMutablePromise finishWithResult:error:](v7, "finishWithResult:error:", v2, 0);
  }

  return v7;
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  AMSBagValue *v8;
  void *v9;
  AMSBagValue *v10;

  v6 = a3;
  v7 = a4;
  v8 = [AMSBagValue alloc];
  -[AMSSnapshotBag dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSBagValue initWithDataSource:key:valueType:account:](v8, "initWithDataSource:key:valueType:account:", v9, v6, 5, v7);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AMSSnapshotBag creationDate](self, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("creationData"));

  -[AMSSnapshotBag dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("dataSource"));

}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

@end
