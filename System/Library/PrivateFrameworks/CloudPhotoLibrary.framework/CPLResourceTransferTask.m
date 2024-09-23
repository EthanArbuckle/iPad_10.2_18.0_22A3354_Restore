@implementation CPLResourceTransferTask

- (CPLResourceTransferTask)initWithResource:(id)a3 taskIdentifier:(id)a4
{
  id v7;
  id v8;
  CPLResourceTransferTask *v9;
  CPLResourceTransferTask *v10;
  uint64_t v11;
  NSString *taskIdentifier;
  uint64_t v13;
  CPLResourceTransferTaskOptions *options;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CPLResourceTransferTask;
  v9 = -[CPLResourceTransferTask init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resource, a3);
    v11 = objc_msgSend(v8, "copy");
    taskIdentifier = v10->_taskIdentifier;
    v10->_taskIdentifier = (NSString *)v11;

    +[CPLResourceTransferTaskOptions defaultOptions](CPLResourceTransferTaskOptions, "defaultOptions");
    v13 = objc_claimAutoreleasedReturnValue();
    options = v10->_options;
    v10->_options = (CPLResourceTransferTaskOptions *)v13;

  }
  return v10;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  CPLResource *resource;
  id v5;

  resource = self->_resource;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", resource, CFSTR("keyResource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_taskIdentifier, CFSTR("keyTaskID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("options"));

}

- (CPLResourceTransferTask)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CPLResourceTransferTask *v7;
  void *v8;
  uint64_t v9;
  NSString *taskIdentifier;
  void *v11;
  void *v12;
  CPLResourceTransferTaskOptions *v13;
  CPLResourceTransferTaskOptions *options;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("keyResource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("keyTaskID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CPLResourceTransferTask initWithResource:taskIdentifier:](self, "initWithResource:taskIdentifier:", v5, v6);

  if (v7)
  {
    if (!-[NSString length](v7->_taskIdentifier, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = objc_claimAutoreleasedReturnValue();
      taskIdentifier = v7->_taskIdentifier;
      v7->_taskIdentifier = (NSString *)v9;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      +[CPLResourceTransferTaskOptions defaultOptions](CPLResourceTransferTaskOptions, "defaultOptions");
      v13 = (CPLResourceTransferTaskOptions *)objc_claimAutoreleasedReturnValue();
    }
    options = v7->_options;
    v7->_options = v13;

  }
  return v7;
}

- (void)setTaskIdentifier:(id)a3
{
  NSString *v4;
  void *taskIdentifier;
  NSString *v6;
  NSString *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    v4 = (NSString *)objc_msgSend(v8, "copy");
    taskIdentifier = self->_taskIdentifier;
    self->_taskIdentifier = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    taskIdentifier = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(taskIdentifier, "UUIDString");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_taskIdentifier;
    self->_taskIdentifier = v6;

  }
}

- (void)setHighPriority:(BOOL)a3
{
  _BOOL4 v3;
  CPLResourceTransferTaskOptions *v5;
  CPLResourceTransferTaskOptions *options;
  uint64_t v7;
  CPLResourceTransferTaskOptions *v8;
  CPLResourceTransferTaskOptions *v9;
  _OWORD v10[3];

  v3 = a3;
  v5 = [CPLResourceTransferTaskOptions alloc];
  options = self->_options;
  if (options)
    -[CPLResourceTransferTaskOptions timeRange](options, "timeRange");
  else
    memset(v10, 0, sizeof(v10));
  if (v3)
    v7 = 0;
  else
    v7 = 2;
  v8 = -[CPLResourceTransferTaskOptions initWithIntent:priority:timeRange:](v5, "initWithIntent:priority:timeRange:", 0, v7, v10);
  v9 = self->_options;
  self->_options = v8;

}

- (BOOL)isHighPriority
{
  return -[CPLResourceTransferTaskOptions isHighPriority](self->_options, "isHighPriority");
}

- (void)launch
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceTransferTask.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 85, CFSTR("%@ should be overriden by subclasses"), v6);

  abort();
}

- (void)cancelTask
{
  self->_cancelled = 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CPLResourceTransferTask taskIdentifier](self, "taskIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CPLResourceTransferTask taskIdentifier](self, "taskIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CPLResourceTransferTask taskIdentifier](self, "taskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLResourceTransferTask resource](self, "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPLResourceTransferTask isHighPriority](self, "isHighPriority"))
    v7 = "YES";
  else
    v7 = "NO";
  if (-[CPLResourceTransferTask isCancelled](self, "isCancelled"))
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p task identifier %@ resource %@ highPriority %s cancelled %s options %@>"), v4, self, v5, v6, v7, v8, self->_options);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CPLResourceTransferTaskOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  CPLResourceTransferTaskOptions *v4;
  CPLResourceTransferTaskOptions *options;

  if (a3)
  {
    v4 = (CPLResourceTransferTaskOptions *)objc_msgSend(a3, "copy");
  }
  else
  {
    +[CPLResourceTransferTaskOptions defaultOptions](CPLResourceTransferTaskOptions, "defaultOptions");
    v4 = (CPLResourceTransferTaskOptions *)objc_claimAutoreleasedReturnValue();
  }
  options = self->_options;
  self->_options = v4;

}

- (unint64_t)intent
{
  return -[CPLResourceTransferTaskOptions legacyIntent](self->_options, "legacyIntent");
}

- (void)setIntent:(unint64_t)a3
{
  CPLResourceTransferTaskOptions *v4;
  CPLResourceTransferTaskOptions *options;

  +[CPLResourceTransferTaskOptions optionsForLegacyIntent:](CPLResourceTransferTaskOptions, "optionsForLegacyIntent:", a3);
  v4 = (CPLResourceTransferTaskOptions *)objc_claimAutoreleasedReturnValue();
  options = self->_options;
  self->_options = v4;

}

- (CPLResource)resource
{
  return self->_resource;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForIntent:(unint64_t)a3
{
  void *v3;
  void *v4;

  +[CPLResourceTransferTaskOptions optionsForLegacyIntent:](CPLResourceTransferTaskOptions, "optionsForLegacyIntent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isHighPriorityForIntent:(unint64_t)a3
{
  void *v3;
  char v4;

  +[CPLResourceTransferTaskOptions optionsForLegacyIntent:](CPLResourceTransferTaskOptions, "optionsForLegacyIntent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHighPriority");

  return v4;
}

+ (BOOL)isForegroundOperationForIntent:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  +[CPLResourceTransferTaskOptions optionsForLegacyIntent:](CPLResourceTransferTaskOptions, "optionsForLegacyIntent:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CPLResourceTransferTaskOptions isForegroundOperationForIntent:priority:](CPLResourceTransferTaskOptions, "isForegroundOperationForIntent:priority:", objc_msgSend(v3, "intent"), objc_msgSend(v3, "priority"));

  return v4;
}

@end
