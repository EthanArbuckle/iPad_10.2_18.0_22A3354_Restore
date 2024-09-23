@implementation _CPLForcedSyncHistory

- (_CPLForcedSyncHistory)initWithForcedSyncTask:(id)a3 discarded:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  _CPLForcedSyncHistory *v10;
  uint64_t v11;
  CPLScopeFilter *filter;
  uint64_t v13;
  NSDate *creationDate;
  uint64_t v15;
  Class taskClass;
  uint64_t v17;
  NSString *errorDescription;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_CPLForcedSyncHistory;
  v10 = -[_CPLForcedSyncHistory init](&v20, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "filter");
    v11 = objc_claimAutoreleasedReturnValue();
    filter = v10->_filter;
    v10->_filter = (CPLScopeFilter *)v11;

    objc_msgSend(v8, "creationDate");
    v13 = objc_claimAutoreleasedReturnValue();
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v13;

    objc_opt_class();
    v15 = objc_claimAutoreleasedReturnValue();
    taskClass = v10->_taskClass;
    v10->_taskClass = (Class)v15;

    v10->_discarded = a4;
    objc_msgSend(v9, "localizedDescription");
    v17 = objc_claimAutoreleasedReturnValue();
    errorDescription = v10->_errorDescription;
    v10->_errorDescription = (NSString *)v17;

  }
  return v10;
}

- (id)descriptionWithNow:(id)a3
{
  CPLScopeFilter *filter;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  Class taskClass;
  uint64_t v10;
  void *v11;
  const char *v12;
  const __CFString *errorDescription;
  void *v14;
  const char *v15;
  const __CFString *v16;

  filter = self->_filter;
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = [v5 alloc];
  +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", self->_creationDate, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  taskClass = self->_taskClass;
  if (filter)
  {
    -[CPLScopeFilter simpleDescription](self->_filter, "simpleDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (self->_discarded)
      v12 = " (discarded)";
    else
      v12 = "";
    errorDescription = (const __CFString *)self->_errorDescription;
    if (!errorDescription)
      errorDescription = CFSTR("no errors");
    v14 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@: %@ %@%s - %@"), v8, taskClass, v10, v12, errorDescription);

  }
  else
  {
    if (self->_discarded)
      v15 = " (discarded)";
    else
      v15 = "";
    v16 = (const __CFString *)self->_errorDescription;
    if (!v16)
      v16 = CFSTR("no errors");
    v14 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@: %@%s - %@"), v8, taskClass, v15, v16);
  }

  return v14;
}

- (BOOL)discarded
{
  return self->_discarded;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (CPLScopeFilter)filter
{
  return self->_filter;
}

- (Class)taskClass
{
  return self->_taskClass;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_taskClass, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
