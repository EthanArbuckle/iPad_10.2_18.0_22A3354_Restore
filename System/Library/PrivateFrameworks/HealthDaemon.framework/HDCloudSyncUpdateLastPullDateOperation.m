@implementation HDCloudSyncUpdateLastPullDateOperation

- (HDCloudSyncUpdateLastPullDateOperation)initWithPullCompleteDate:(id)a3 lastSuccessfulPullKey:(id)a4
{
  id v7;
  id v8;
  HDCloudSyncUpdateLastPullDateOperation *v9;
  HDCloudSyncUpdateLastPullDateOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncUpdateLastPullDateOperation;
  v9 = -[HDCloudSyncUpdateLastPullDateOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pullCompleteDate, a3);
    objc_storeStrong((id *)&v10->_lastSuccessfulPullKey, a4);
  }

  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  NSDate *pullCompleteDate;
  NSString *lastSuccessfulPullKey;
  int v13;
  HDCloudSyncUpdateLastPullDateOperation *v14;
  HDCloudSyncUpdateLastPullDateOperation *v15;
  NSObject *v16;
  HDCloudSyncUpdateLastPullDateOperation *v17;
  id v19;
  uint8_t buf[4];
  HDCloudSyncUpdateLastPullDateOperation *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HDCloudSyncKeyValueDomainWithProfile(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E0CB5370];
  v10 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Recording successful cloud sync pull", buf, 0xCu);
  }
  pullCompleteDate = self->_pullCompleteDate;
  lastSuccessfulPullKey = self->_lastSuccessfulPullKey;
  v19 = 0;
  v13 = objc_msgSend(v8, "setDate:forKey:error:", pullCompleteDate, lastSuccessfulPullKey, &v19);
  v14 = (HDCloudSyncUpdateLastPullDateOperation *)v19;
  if (v13)
  {
    objc_msgSend(v7, "cloudSyncManager");
    v15 = (HDCloudSyncUpdateLastPullDateOperation *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncUpdateLastPullDateOperation didCompleteSuccessfulPullWithDate:](v15, "didCompleteSuccessfulPullWithDate:", self->_pullCompleteDate);
  }
  else
  {
    _HKInitializeLogging();
    v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v14;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Failed to record successful pull: %{public}@.", buf, 0xCu);
    }
    v17 = v14;
    v15 = v17;
    if (v17)
    {
      if (a5)
      {
        v15 = objc_retainAutorelease(v17);
        *a5 = v15;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDCloudSyncUpdateLastPullDateOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDCloudSyncUpdateLastPullDateOperation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pullCompleteDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSuccessfulPullKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HDCloudSyncUpdateLastPullDateOperation initWithPullCompleteDate:lastSuccessfulPullKey:](self, "initWithPullCompleteDate:lastSuccessfulPullKey:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *pullCompleteDate;
  id v5;

  pullCompleteDate = self->_pullCompleteDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pullCompleteDate, CFSTR("pullCompleteDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastSuccessfulPullKey, CFSTR("lastSuccessfulPullKey"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> { pullCompleteDate: %@, lastSuccessfulPullKey: %@ }"), v5, self, self->_pullCompleteDate, self->_lastSuccessfulPullKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)pullCompleteDate
{
  return self->_pullCompleteDate;
}

- (void)setPullCompleteDate:(id)a3
{
  objc_storeStrong((id *)&self->_pullCompleteDate, a3);
}

- (NSString)lastSuccessfulPullKey
{
  return self->_lastSuccessfulPullKey;
}

- (void)setLastSuccessfulPullKey:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessfulPullKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSuccessfulPullKey, 0);
  objc_storeStrong((id *)&self->_pullCompleteDate, 0);
}

@end
