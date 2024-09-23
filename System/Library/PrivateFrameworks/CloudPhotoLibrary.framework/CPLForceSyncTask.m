@implementation CPLForceSyncTask

- (CPLForceSyncTask)initWithScopeIdentifiers:(id)a3
{
  id v4;
  CPLForceSyncTask *v5;
  uint64_t v6;
  NSArray *scopeIdentifiers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLForceSyncTask;
  v5 = -[CPLForceSyncTask init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    scopeIdentifiers = v5->_scopeIdentifiers;
    v5->_scopeIdentifiers = (NSArray *)v6;

  }
  return v5;
}

- (void)launchTask
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLForceSyncTask.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 23, CFSTR("%@ should be overriden by subclasses"), v6);

  abort();
}

- (void)cancelTask
{
  self->_cancelled = 1;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[CPLForceSyncTask taskIdentifier](self, "taskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLForceSyncTask scopeIdentifiers](self, "scopeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %@ (%@)>"), v4, v5, v7);

  return v8;
}

- (NSArray)scopeIdentifiers
{
  return self->_scopeIdentifiers;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_scopeIdentifiers, 0);
}

@end
