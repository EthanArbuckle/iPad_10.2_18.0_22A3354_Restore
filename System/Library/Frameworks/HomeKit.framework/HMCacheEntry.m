@implementation HMCacheEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMCacheEntry lastModificationDate](self, "lastModificationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

- (NSDate)lastModificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (HMCacheEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMCacheEntry *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCacheEntryLastModificationDateKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[HMCacheEntry initWithData:lastModificationDate:](self, "initWithData:lastModificationDate:", v5, v6);
      v7 = self;
    }
    else
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive lastModificationDate for HMCacheEntry", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      v7 = 0;
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive data for HMCacheEntry", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (HMCacheEntry)initWithData:(id)a3 lastModificationDate:(id)a4
{
  id v6;
  id v7;
  HMCacheEntry *v8;
  uint64_t v9;
  NSData *data;
  uint64_t v11;
  NSDate *lastModificationDate;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMCacheEntry;
  v8 = -[HMCacheEntry init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    data = v8->_data;
    v8->_data = (NSData *)v9;

    v11 = objc_msgSend(v7, "copy");
    lastModificationDate = v8->_lastModificationDate;
    v8->_lastModificationDate = (NSDate *)v11;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMCacheEntry data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Data"));

  -[HMCacheEntry lastModificationDate](self, "lastModificationDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMCacheEntryLastModificationDateKey"));

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
