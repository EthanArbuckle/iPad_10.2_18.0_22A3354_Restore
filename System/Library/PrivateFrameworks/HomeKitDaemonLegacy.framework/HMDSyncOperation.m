@implementation HMDSyncOperation

- (id)_initWithOptions:(id)a3 syncBlock:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDSyncOperation *v12;
  HMDSyncOperation *v13;
  uint64_t v14;
  NSUUID *identifier;
  void *v16;
  id operationBlock;
  uint64_t v18;
  NSMutableArray *operationCompletions;
  NSMutableArray *v20;
  void *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDSyncOperation;
  v12 = -[HMDSyncOperation init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v13->_identifier;
    v13->_identifier = (NSUUID *)v14;

    objc_storeStrong((id *)&v13->_options, a3);
    v16 = _Block_copy(v10);
    operationBlock = v13->_operationBlock;
    v13->_operationBlock = v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    operationCompletions = v13->_operationCompletions;
    v13->_operationCompletions = (NSMutableArray *)v18;

    if (v11)
    {
      v20 = v13->_operationCompletions;
      v21 = _Block_copy(v11);
      -[NSMutableArray addObject:](v20, "addObject:", v21);

    }
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[HMDSyncOperation operationType](self, "operationType") - 1;
  if (v5 > 8)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E89B17C8[v5];
  -[HMDSyncOperation options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSyncOperation identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Operation Type = %@, Options = %@, Identifier = %@>"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)operationType
{
  void *v2;
  unint64_t v3;

  -[HMDSyncOperation options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "operationType");

  return v3;
}

- (NSString)zoneName
{
  void *v2;
  void *v3;

  -[HMDSyncOperation options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zoneName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)operationCompletions
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_operationCompletions, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)updateOperationCompletionsWithArray:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObjectsFromArray:](self->_operationCompletions, "addObjectsFromArray:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeAllOperationCompletions
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeAllObjects](self->_operationCompletions, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMFTimer)delayTimer
{
  return self->_delayTimer;
}

- (void)setDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delayTimer, a3);
}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (void)setOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (HMDSyncOperationOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_operationBlock, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_operationCompletions, 0);
}

+ (id)queryDatabaseOperationWithBlock:(id)a3
{
  id v3;
  HMDSyncOperationOptions *v4;
  id v5;

  v3 = a3;
  v4 = -[HMDSyncOperationOptions initWithOperationType:zoneName:cloudConflict:delayRespected:]([HMDSyncOperationOptions alloc], "initWithOperationType:zoneName:cloudConflict:delayRespected:", 8, CFSTR("QueryDatabase"), 0, 0);
  v5 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v4, v3, 0);

  return v5;
}

+ (id)postFetchOperationWithBlock:(id)a3
{
  id v3;
  HMDSyncOperationOptions *v4;
  id v5;

  v3 = a3;
  v4 = -[HMDSyncOperationOptions initWithOperationType:zoneName:cloudConflict:delayRespected:]([HMDSyncOperationOptions alloc], "initWithOperationType:zoneName:cloudConflict:delayRespected:", 9, CFSTR("PostFetch"), 0, 0);
  v5 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v4, v3, 0);

  return v5;
}

+ (id)cancelOperationWithBlock:(id)a3
{
  id v3;
  HMDSyncOperationOptions *v4;
  id v5;

  v3 = a3;
  v4 = -[HMDSyncOperationOptions initWithOperationType:zoneName:cloudConflict:delayRespected:]([HMDSyncOperationOptions alloc], "initWithOperationType:zoneName:cloudConflict:delayRespected:", 7, CFSTR("CancelAll"), 0, 0);
  v5 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v4, v3, 0);

  return v5;
}

+ (id)cloudPushSyncOperationWithBlock:(id)a3
{
  id v3;
  HMDSyncOperationOptions *v4;
  id v5;

  v3 = a3;
  v4 = -[HMDSyncOperationOptions initWithOperationType:zoneName:delayRespected:]([HMDSyncOperationOptions alloc], "initWithOperationType:zoneName:delayRespected:", 1, CFSTR("HomeDataBlobZone"), 0);
  v5 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v4, v3, 0);

  return v5;
}

+ (id)cloudForcePushSyncOperationWithBlock:(id)a3
{
  id v3;
  HMDSyncOperationOptions *v4;
  id v5;

  v3 = a3;
  v4 = -[HMDSyncOperationOptions initWithOperationType:zoneName:delayRespected:]([HMDSyncOperationOptions alloc], "initWithOperationType:zoneName:delayRespected:", 2, CFSTR("HomeDataBlobZone"), 0);
  v5 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v4, v3, 0);

  return v5;
}

+ (id)cloudVerifyAccountSyncOperationWithBlock:(id)a3
{
  id v3;
  HMDSyncOperationOptions *v4;
  id v5;

  v3 = a3;
  v4 = -[HMDSyncOperationOptions initWithOperationType:zoneName:cloudConflict:delayRespected:]([HMDSyncOperationOptions alloc], "initWithOperationType:zoneName:cloudConflict:delayRespected:", 3, CFSTR("VerifyZones"), 0, 0);
  v5 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v4, v3, 0);

  return v5;
}

+ (id)cloudFetchSyncOperationWithCloudConflict:(BOOL)a3 block:(id)a4
{
  _BOOL8 v4;
  id v5;
  HMDSyncOperationOptions *v6;
  id v7;

  v4 = a3;
  v5 = a4;
  v6 = -[HMDSyncOperationOptions initWithOperationType:zoneName:cloudConflict:delayRespected:]([HMDSyncOperationOptions alloc], "initWithOperationType:zoneName:cloudConflict:delayRespected:", 4, CFSTR("HomeDataBlobZone"), v4, 0);
  v7 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v6, v5, 0);

  return v7;
}

+ (id)cloudZonePushSyncOperation:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  HMDSyncOperationOptions *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = -[HMDSyncOperationOptions initWithOperationType:zoneName:delayRespected:]([HMDSyncOperationOptions alloc], "initWithOperationType:zoneName:delayRespected:", 5, v6, 0);

  v8 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v7, v5, 0);
  return v8;
}

+ (id)cloudZoneFetchSyncOperation:(id)a3 cloudConflict:(BOOL)a4 block:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  HMDSyncOperationOptions *v12;
  id v13;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[HMDSyncOperationOptions initWithOperationType:zoneName:cloudConflict:delayRespected:]([HMDSyncOperationOptions alloc], "initWithOperationType:zoneName:cloudConflict:delayRespected:", 6, v11, v7, 0);

  v13 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v12, v10, v9);
  return v13;
}

+ (id)cloudOperation:(id)a3 withBlock:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDSyncOperation _initWithOptions:syncBlock:completion:]([HMDSyncOperation alloc], "_initWithOptions:syncBlock:completion:", v9, v8, v7);

  return v10;
}

@end
