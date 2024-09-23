@implementation ASDJobSchedulerJobMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  ASDJobSchedulerJobMetadata *v5;
  uint64_t v6;
  NSNumber *accountIdentifier;
  uint64_t v8;
  NSNumber *externalPriority;
  uint64_t v10;
  NSNumber *itemID;
  uint64_t v12;
  NSString *jobState;
  uint64_t v14;
  NSString *jobType;
  uint64_t v16;
  NSNumber *lastSoftFailureTimestamp;
  uint64_t v18;
  NSError *lastError;
  uint64_t v20;
  NSNumber *priority;
  uint64_t v22;
  NSNumber *priorityBucket;
  uint64_t v24;
  NSString *skippedReason;
  uint64_t v26;
  NSNumber *softFailureTimeout;
  uint64_t v28;
  NSNumber *timestamp;

  v5 = -[ASDJobSchedulerJobMetadata init](+[ASDJobSchedulerJobMetadata allocWithZone:](ASDJobSchedulerJobMetadata, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSNumber *)v6;

  v8 = -[NSNumber copyWithZone:](self->_externalPriority, "copyWithZone:", a3);
  externalPriority = v5->_externalPriority;
  v5->_externalPriority = (NSNumber *)v8;

  v10 = -[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  itemID = v5->_itemID;
  v5->_itemID = (NSNumber *)v10;

  v12 = -[NSString copyWithZone:](self->_jobState, "copyWithZone:", a3);
  jobState = v5->_jobState;
  v5->_jobState = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_jobType, "copyWithZone:", a3);
  jobType = v5->_jobType;
  v5->_jobType = (NSString *)v14;

  v16 = -[NSNumber copyWithZone:](self->_lastSoftFailureTimestamp, "copyWithZone:", a3);
  lastSoftFailureTimestamp = v5->_lastSoftFailureTimestamp;
  v5->_lastSoftFailureTimestamp = (NSNumber *)v16;

  v18 = -[NSError copyWithZone:](self->_lastError, "copyWithZone:", a3);
  lastError = v5->_lastError;
  v5->_lastError = (NSError *)v18;

  v20 = -[NSNumber copyWithZone:](self->_priority, "copyWithZone:", a3);
  priority = v5->_priority;
  v5->_priority = (NSNumber *)v20;

  v22 = -[NSNumber copyWithZone:](self->_priorityBucket, "copyWithZone:", a3);
  priorityBucket = v5->_priorityBucket;
  v5->_priorityBucket = (NSNumber *)v22;

  v24 = -[NSString copyWithZone:](self->_skippedReason, "copyWithZone:", a3);
  skippedReason = v5->_skippedReason;
  v5->_skippedReason = (NSString *)v24;

  v26 = -[NSNumber copyWithZone:](self->_softFailureTimeout, "copyWithZone:", a3);
  softFailureTimeout = v5->_softFailureTimeout;
  v5->_softFailureTimeout = (NSNumber *)v26;

  v5->_softFailureCount = self->_softFailureCount;
  v28 = -[NSNumber copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSNumber *)v28;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobSchedulerJobMetadata)initWithCoder:(id)a3
{
  id v4;
  ASDJobSchedulerJobMetadata *v5;
  uint64_t v6;
  NSNumber *accountIdentifier;
  uint64_t v8;
  NSString *bundleID;
  uint64_t v10;
  NSNumber *externalPriority;
  uint64_t v12;
  NSNumber *itemID;
  uint64_t v14;
  NSString *jobState;
  uint64_t v16;
  NSString *jobType;
  uint64_t v18;
  NSError *lastError;
  uint64_t v20;
  NSNumber *lastSoftFailureTimestamp;
  uint64_t v22;
  NSNumber *priority;
  uint64_t v24;
  NSNumber *priorityBucket;
  uint64_t v26;
  NSString *skippedReason;
  uint64_t v28;
  NSNumber *softFailureTimeout;
  uint64_t v30;
  NSNumber *timestamp;

  v4 = a3;
  v5 = -[ASDJobSchedulerJobMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalPriority"));
    v10 = objc_claimAutoreleasedReturnValue();
    externalPriority = v5->_externalPriority;
    v5->_externalPriority = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemID"));
    v12 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jobState"));
    v14 = objc_claimAutoreleasedReturnValue();
    jobState = v5->_jobState;
    v5->_jobState = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jobType"));
    v16 = objc_claimAutoreleasedReturnValue();
    jobType = v5->_jobType;
    v5->_jobType = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastError"));
    v18 = objc_claimAutoreleasedReturnValue();
    lastError = v5->_lastError;
    v5->_lastError = (NSError *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSoftFailureTimestamp"));
    v20 = objc_claimAutoreleasedReturnValue();
    lastSoftFailureTimestamp = v5->_lastSoftFailureTimestamp;
    v5->_lastSoftFailureTimestamp = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priority"));
    v22 = objc_claimAutoreleasedReturnValue();
    priority = v5->_priority;
    v5->_priority = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priorityBucket"));
    v24 = objc_claimAutoreleasedReturnValue();
    priorityBucket = v5->_priorityBucket;
    v5->_priorityBucket = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("skippedReason"));
    v26 = objc_claimAutoreleasedReturnValue();
    skippedReason = v5->_skippedReason;
    v5->_skippedReason = (NSString *)v26;

    v5->_softFailureCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("softFailureCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("softFailTimeout"));
    v28 = objc_claimAutoreleasedReturnValue();
    softFailureTimeout = v5->_softFailureTimeout;
    v5->_softFailureTimeout = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v30 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v30;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *lastError;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_externalPriority, CFSTR("externalPriority"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_itemID, CFSTR("itemID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_jobState, CFSTR("jobState"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_jobType, CFSTR("jobType"));
  lastError = self->_lastError;
  if (lastError)
  {
    ASDErrorWithSafeUserInfo(lastError);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("lastError"));

  }
  objc_msgSend(v6, "encodeObject:forKey:", self->_lastSoftFailureTimestamp, CFSTR("lastSoftFailureTimestamp"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_priorityBucket, CFSTR("priorityBucket"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_skippedReason, CFSTR("skippedReason"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_softFailureTimeout, CFSTR("softFailTimeout"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_softFailureCount, CFSTR("softFailureCount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ bundleID: %@ accountIdentifier: %@ e-order: %@ itemID: %@ jobState: %@ jobType: %@ lastError: %@ lastSoftFailureTimestamp: %@ priority: %@ priorityBucket: %@ skippedReason: %@ softFailureTimeout: %@ softFailureCount: %ld timestamp: %@ }"), self->_bundleID, self->_accountIdentifier, self->_externalPriority, self->_itemID, self->_jobState, self->_jobType, self->_lastError, self->_lastSoftFailureTimestamp, self->_priority, self->_priorityBucket, self->_skippedReason, self->_softFailureTimeout, self->_softFailureCount, self->_timestamp);
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSNumber)externalPriority
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExternalPriority:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)itemID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setItemID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)jobState
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setJobState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)jobType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setJobType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSError)lastError
{
  return (NSError *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSNumber)lastSoftFailureTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastSoftFailureTimestamp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSNumber)priority
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPriority:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSNumber)priorityBucket
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPriorityBucket:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)skippedReason
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSkippedReason:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (int64_t)softFailureCount
{
  return self->_softFailureCount;
}

- (void)setSoftFailureCount:(int64_t)a3
{
  self->_softFailureCount = a3;
}

- (NSNumber)softFailureTimeout
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSoftFailureTimeout:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSNumber)timestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_softFailureTimeout, 0);
  objc_storeStrong((id *)&self->_skippedReason, 0);
  objc_storeStrong((id *)&self->_priorityBucket, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_lastSoftFailureTimestamp, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_jobType, 0);
  objc_storeStrong((id *)&self->_jobState, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_externalPriority, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
