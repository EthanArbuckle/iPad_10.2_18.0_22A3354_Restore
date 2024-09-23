@implementation ATSessionTask

- (ATSessionTask)init
{
  return -[ATSessionTask initWithDataClass:](self, "initWithDataClass:", 0);
}

- (ATSessionTask)initWithDataClass:(id)a3
{
  id v5;
  ATSessionTask *v6;
  ATSessionTask *v7;
  void *v8;
  uint64_t v9;
  NSString *sessionTaskIdentifier;
  objc_class *v11;
  uint64_t v12;
  NSString *sessionGroupingKey;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATSessionTask;
  v6 = -[ATSessionTask init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataClass, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = objc_claimAutoreleasedReturnValue();
    sessionTaskIdentifier = v7->_sessionTaskIdentifier;
    v7->_sessionTaskIdentifier = (NSString *)v9;

    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    sessionGroupingKey = v7->_sessionGroupingKey;
    v7->_sessionGroupingKey = (NSString *)v12;

  }
  return v7;
}

- (void)start
{
  -[ATSessionTask setFinished:](self, "setFinished:", 0);
}

- (void)cancel
{
  -[ATSessionTask setCancelled:](self, "setCancelled:", 1);
  -[ATSessionTask setFinished:](self, "setFinished:", 1);
}

- (double)duration
{
  double Current;
  double v4;
  double v5;

  if (-[ATSessionTask isFinished](self, "isFinished"))
    -[ATSessionTask finishTime](self, "finishTime");
  else
    Current = CFAbsoluteTimeGetCurrent();
  v4 = Current;
  -[ATSessionTask startTime](self, "startTime");
  return v4 - v5;
}

- (id)baseClassRepresentation
{
  ATSessionTask *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(ATSessionTask);
  -[ATSessionTask sessionTaskIdentifier](self, "sessionTaskIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setSessionTaskIdentifier:](v3, "setSessionTaskIdentifier:", v4);

  -[ATSessionTask sessionGroupingKey](self, "sessionGroupingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setSessionGroupingKey:](v3, "setSessionGroupingKey:", v5);

  -[ATSessionTask localizedDescription](self, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setLocalizedDescription:](v3, "setLocalizedDescription:", v6);

  -[ATSessionTask dataClass](self, "dataClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setDataClass:](v3, "setDataClass:", v7);

  -[ATSessionTask progress](self, "progress");
  -[ATSessionTask setProgress:](v3, "setProgress:");
  -[ATSessionTask setTotalItemCount:](v3, "setTotalItemCount:", -[ATSessionTask totalItemCount](self, "totalItemCount"));
  -[ATSessionTask setCompletedItemCount:](v3, "setCompletedItemCount:", -[ATSessionTask completedItemCount](self, "completedItemCount"));
  -[ATSessionTask currentItemDescriptions](self, "currentItemDescriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setCurrentItemDescriptions:](v3, "setCurrentItemDescriptions:", v8);

  -[ATSessionTask currentItems](self, "currentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setCurrentItems:](v3, "setCurrentItems:", v9);

  -[ATSessionTask recentlyFailedAssets](self, "recentlyFailedAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setRecentlyFailedAssets:](v3, "setRecentlyFailedAssets:", v10);

  -[ATSessionTask properties](self, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setProperties:](v3, "setProperties:", v11);

  -[ATSessionTask setRunning:](v3, "setRunning:", -[ATSessionTask isRunning](self, "isRunning"));
  -[ATSessionTask setFinished:](v3, "setFinished:", -[ATSessionTask isFinished](self, "isFinished"));
  -[ATSessionTask setCancelled:](v3, "setCancelled:", -[ATSessionTask isCancelled](self, "isCancelled"));
  -[ATSessionTask setSuspended:](v3, "setSuspended:", -[ATSessionTask isSuspended](self, "isSuspended"));
  -[ATSessionTask error](self, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setError:](v3, "setError:", v12);

  -[ATSessionTask totalBytesTransferred](self, "totalBytesTransferred");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setTotalBytesTransferred:](v3, "setTotalBytesTransferred:", v13);

  -[ATSessionTask totalBytesToTransfer](self, "totalBytesToTransfer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask setTotalBytesToTransfer:](v3, "setTotalBytesToTransfer:", v14);

  -[ATSessionTask startTime](self, "startTime");
  -[ATSessionTask setStartTime:](v3, "setStartTime:");
  -[ATSessionTask finishTime](self, "finishTime");
  -[ATSessionTask setFinishTime:](v3, "setFinishTime:");
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x24BDD17C8];
  v15 = objc_opt_class();
  -[ATSessionTask sessionTaskIdentifier](self, "sessionTaskIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATSessionTask sessionGroupingKey](self, "sessionGroupingKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATSessionTask isRunning](self, "isRunning");
  v6 = -[ATSessionTask isFinished](self, "isFinished");
  v7 = -[ATSessionTask isCancelled](self, "isCancelled");
  v8 = -[ATSessionTask isSuspended](self, "isSuspended");
  -[ATSessionTask dataClass](self, "dataClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ATSessionTask completedItemCount](self, "completedItemCount");
  v11 = -[ATSessionTask totalItemCount](self, "totalItemCount");
  -[ATSessionTask progress](self, "progress");
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %@ %@: running=%d finished=%d cancelled=%d suspended=%d dataClass=%@ %d/%d %d%%>"), v15, v3, v4, v5, v6, v7, v8, v9, v10, v11, (int)(v12 * 100.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (ATSessionTask)initWithCoder:(id)a3
{
  id v4;
  ATSessionTask *v5;
  uint64_t v6;
  NSString *sessionTaskIdentifier;
  uint64_t v8;
  NSString *localizedDescription;
  uint64_t v10;
  NSString *sessionGroupingKey;
  uint64_t v12;
  NSString *dataClass;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *currentItemDescriptions;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *currentItems;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSArray *recentlyFailedAssets;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSDictionary *properties;
  uint64_t v44;
  NSError *error;
  uint64_t v46;
  NSNumber *totalBytesToTransfer;
  uint64_t v48;
  NSNumber *totalBytesTransferred;
  double v50;
  double v51;

  v4 = a3;
  v5 = -[ATSessionTask init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionTaskIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionTaskIdentifier = v5->_sessionTaskIdentifier;
    v5->_sessionTaskIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionGroupingKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    sessionGroupingKey = v5->_sessionGroupingKey;
    v5->_sessionGroupingKey = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataClass"));
    v12 = objc_claimAutoreleasedReturnValue();
    dataClass = v5->_dataClass;
    v5->_dataClass = (NSString *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("progress"));
    v5->_progress = v14;
    v5->_totalItemCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalItemCount"));
    v5->_completedItemCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("completedItemCount"));
    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("currentItemDescriptions"));
    v18 = objc_claimAutoreleasedReturnValue();
    currentItemDescriptions = v5->_currentItemDescriptions;
    v5->_currentItemDescriptions = (NSArray *)v18;

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("currentItems"));
    v26 = objc_claimAutoreleasedReturnValue();
    currentItems = v5->_currentItems;
    v5->_currentItems = (NSArray *)v26;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, v30, v31, v32, v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("recentlyFailedAssets"));
    v35 = objc_claimAutoreleasedReturnValue();
    recentlyFailedAssets = v5->_recentlyFailedAssets;
    v5->_recentlyFailedAssets = (NSArray *)v35;

    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    v40 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, v39, v40, objc_opt_class(), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("properties"));
    v42 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (NSDictionary *)v42;

    v5->_running = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("running"));
    v5->_finished = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("finished"));
    v5->_cancelled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancelled"));
    v5->_suspended = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suspended"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v44 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalBytesToTransfer"));
    v46 = objc_claimAutoreleasedReturnValue();
    totalBytesToTransfer = v5->_totalBytesToTransfer;
    v5->_totalBytesToTransfer = (NSNumber *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalBytesTransferred"));
    v48 = objc_claimAutoreleasedReturnValue();
    totalBytesTransferred = v5->_totalBytesTransferred;
    v5->_totalBytesTransferred = (NSNumber *)v48;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTime"));
    v5->_startTime = v50;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("finishTime"));
    v5->_finishTime = v51;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[ATSessionTask sessionTaskIdentifier](self, "sessionTaskIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("sessionTaskIdentifier"));

  -[ATSessionTask localizedDescription](self, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("localizedDescription"));

  -[ATSessionTask sessionGroupingKey](self, "sessionGroupingKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v6, CFSTR("sessionGroupingKey"));

  -[ATSessionTask dataClass](self, "dataClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("dataClass"));

  -[ATSessionTask progress](self, "progress");
  objc_msgSend(v16, "encodeDouble:forKey:", CFSTR("progress"));
  objc_msgSend(v16, "encodeInteger:forKey:", -[ATSessionTask totalItemCount](self, "totalItemCount"), CFSTR("totalItemCount"));
  objc_msgSend(v16, "encodeInteger:forKey:", -[ATSessionTask completedItemCount](self, "completedItemCount"), CFSTR("completedItemCount"));
  -[ATSessionTask currentItemDescriptions](self, "currentItemDescriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v8, CFSTR("currentItemDescriptions"));

  -[ATSessionTask currentItems](self, "currentItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("currentItems"));

  -[ATSessionTask recentlyFailedAssets](self, "recentlyFailedAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v10, CFSTR("recentlyFailedAssets"));

  -[ATSessionTask properties](self, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("properties"));

  objc_msgSend(v16, "encodeBool:forKey:", -[ATSessionTask isRunning](self, "isRunning"), CFSTR("running"));
  objc_msgSend(v16, "encodeBool:forKey:", -[ATSessionTask isFinished](self, "isFinished"), CFSTR("finished"));
  objc_msgSend(v16, "encodeBool:forKey:", -[ATSessionTask isCancelled](self, "isCancelled"), CFSTR("cancelled"));
  objc_msgSend(v16, "encodeBool:forKey:", -[ATSessionTask isSuspended](self, "isSuspended"), CFSTR("suspended"));
  -[ATSessionTask error](self, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "msv_errorByRemovingUnsafeUserInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("error"));

  -[ATSessionTask totalBytesToTransfer](self, "totalBytesToTransfer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeInt64:forKey:", objc_msgSend(v14, "longLongValue"), CFSTR("totalBytesToTransfer"));

  -[ATSessionTask totalBytesTransferred](self, "totalBytesTransferred");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeInt64:forKey:", objc_msgSend(v15, "longLongValue"), CFSTR("totalBytesTransferred"));

  -[ATSessionTask startTime](self, "startTime");
  objc_msgSend(v16, "encodeDouble:forKey:", CFSTR("startTime"));
  -[ATSessionTask finishTime](self, "finishTime");
  objc_msgSend(v16, "encodeDouble:forKey:", CFSTR("finishTime"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[ATSessionTask sessionTaskIdentifier](self, "sessionTaskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionTaskIdentifier:", v5);

  -[ATSessionTask localizedDescription](self, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedDescription:", v6);

  -[ATSessionTask sessionGroupingKey](self, "sessionGroupingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionGroupingKey:", v7);

  -[ATSessionTask dataClass](self, "dataClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataClass:", v8);

  -[ATSessionTask progress](self, "progress");
  objc_msgSend(v4, "setProgress:");
  objc_msgSend(v4, "setTotalItemCount:", -[ATSessionTask totalItemCount](self, "totalItemCount"));
  objc_msgSend(v4, "setCompletedItemCount:", -[ATSessionTask completedItemCount](self, "completedItemCount"));
  -[ATSessionTask currentItemDescriptions](self, "currentItemDescriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentItemDescriptions:", v9);

  -[ATSessionTask currentItems](self, "currentItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentItems:", v10);

  -[ATSessionTask recentlyFailedAssets](self, "recentlyFailedAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecentlyFailedAssets:", v11);

  -[ATSessionTask properties](self, "properties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperties:", v12);

  objc_msgSend(v4, "setRunning:", -[ATSessionTask isRunning](self, "isRunning"));
  objc_msgSend(v4, "setFinished:", -[ATSessionTask isFinished](self, "isFinished"));
  objc_msgSend(v4, "setCancelled:", -[ATSessionTask isCancelled](self, "isCancelled"));
  objc_msgSend(v4, "setSuspended:", -[ATSessionTask isSuspended](self, "isSuspended"));
  -[ATSessionTask error](self, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError:", v13);

  -[ATSessionTask totalBytesTransferred](self, "totalBytesTransferred");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTotalBytesTransferred:", v14);

  -[ATSessionTask totalBytesToTransfer](self, "totalBytesToTransfer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTotalBytesToTransfer:", v15);

  -[ATSessionTask startTime](self, "startTime");
  objc_msgSend(v4, "setStartTime:");
  -[ATSessionTask finishTime](self, "finishTime");
  objc_msgSend(v4, "setFinishTime:");
  return v4;
}

- (void)_start
{
  if (!self->_running)
  {
    self->_running = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    -[ATSessionTask setStartTime:](self, "setStartTime:");
    -[ATSessionTask start](self, "start");
  }
}

- (NSString)sessionTaskIdentifier
{
  return self->_sessionTaskIdentifier;
}

- (void)setSessionTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sessionGroupingKey
{
  return self->_sessionGroupingKey;
}

- (void)setSessionGroupingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setDataClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (unint64_t)totalItemCount
{
  return self->_totalItemCount;
}

- (void)setTotalItemCount:(unint64_t)a3
{
  self->_totalItemCount = a3;
}

- (unint64_t)completedItemCount
{
  return self->_completedItemCount;
}

- (void)setCompletedItemCount:(unint64_t)a3
{
  self->_completedItemCount = a3;
}

- (NSNumber)totalBytesToTransfer
{
  return self->_totalBytesToTransfer;
}

- (void)setTotalBytesToTransfer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)totalBytesTransferred
{
  return self->_totalBytesTransferred;
}

- (void)setTotalBytesTransferred:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)currentItemDescriptions
{
  return self->_currentItemDescriptions;
}

- (void)setCurrentItemDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)currentItems
{
  return self->_currentItems;
}

- (void)setCurrentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)recentlyFailedAssets
{
  return self->_recentlyFailedAssets;
}

- (void)setRecentlyFailedAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (ATSession)session
{
  return (ATSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)finishTime
{
  return self->_finishTime;
}

- (void)setFinishTime:(double)a3
{
  self->_finishTime = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_recentlyFailedAssets, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
  objc_storeStrong((id *)&self->_currentItemDescriptions, 0);
  objc_storeStrong((id *)&self->_totalBytesTransferred, 0);
  objc_storeStrong((id *)&self->_totalBytesToTransfer, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_sessionGroupingKey, 0);
  objc_storeStrong((id *)&self->_sessionTaskIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
