@implementation HMDSoftwareUpdateDocumentationAsset

- (HMDSoftwareUpdateDocumentationAsset)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3 dateWithTimeIntervalSinceNowFactory:(id)a4 URLSessionFactory:(id)a5 extractorFactory:(id)a6 notificationCenter:(id)a7 fileManager:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMDSoftwareUpdateDocumentationAsset *v22;
  uint64_t v23;
  NSUUID *identifier;
  uint64_t v25;
  NSDate *nextPermittedDownloadDate;
  void *v27;
  id dateWithTimeIntervalSinceNowFactory;
  void *v29;
  id URLSessionFactory;
  void *v31;
  id extractorFactory;
  id v33;
  const char *v34;
  NSObject *v35;
  dispatch_queue_t v36;
  OS_dispatch_queue *queue;
  HMDSoftwareUpdateDocumentationAsset *v39;
  SEL v40;
  id v41;
  objc_super v42;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v15)
  {
    v21 = v20;
    v42.receiver = self;
    v42.super_class = (Class)HMDSoftwareUpdateDocumentationAsset;
    v22 = -[HMDSoftwareUpdateDocumentationAsset init](&v42, sel_init);
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v23 = objc_claimAutoreleasedReturnValue();
      identifier = v22->_identifier;
      v22->_identifier = (NSUUID *)v23;

      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v25 = objc_claimAutoreleasedReturnValue();
      nextPermittedDownloadDate = v22->_nextPermittedDownloadDate;
      v22->_nextPermittedDownloadDate = (NSDate *)v25;

      objc_storeStrong((id *)&v22->_fileManager, a8);
      v22->_downloadRetryCount = 0;
      v27 = _Block_copy(v16);
      dateWithTimeIntervalSinceNowFactory = v22->_dateWithTimeIntervalSinceNowFactory;
      v22->_dateWithTimeIntervalSinceNowFactory = v27;

      v29 = _Block_copy(v17);
      URLSessionFactory = v22->_URLSessionFactory;
      v22->_URLSessionFactory = v29;

      v31 = _Block_copy(v18);
      extractorFactory = v22->_extractorFactory;
      v22->_extractorFactory = v31;

      objc_storeStrong((id *)&v22->_notificationCenter, a7);
      objc_storeStrong((id *)&v22->_metadata, a3);
      HMDispatchQueueNameString();
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v34 = (const char *)objc_msgSend(v33, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = dispatch_queue_create(v34, v35);
      queue = v22->_queue;
      v22->_queue = (OS_dispatch_queue *)v36;

    }
    return v22;
  }
  else
  {
    v39 = (HMDSoftwareUpdateDocumentationAsset *)_HMFPreconditionFailure();
    return -[HMDSoftwareUpdateDocumentationAsset initWithDocumentationMetadata:](v39, v40, v41);
  }
}

- (HMDSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMDFileManager *v7;
  HMDSoftwareUpdateDocumentationAsset *v8;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(HMDFileManager);
  v8 = -[HMDSoftwareUpdateDocumentationAsset initWithDocumentationMetadata:dateWithTimeIntervalSinceNowFactory:URLSessionFactory:extractorFactory:notificationCenter:fileManager:](self, "initWithDocumentationMetadata:dateWithTimeIntervalSinceNowFactory:URLSessionFactory:extractorFactory:notificationCenter:fileManager:", v5, &__block_literal_global_135, &__block_literal_global_137_116641, &__block_literal_global_140_116642, v6, v7);

  return v8;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateDocumentationAsset identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDSoftwareUpdateDocumentationAsset identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDSoftwareUpdateDocumentationAsset state](self, "state");
  if (v6 > 4)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E89B46D8[v6];
  -[HMDSoftwareUpdateDocumentationAsset metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Identifier = %@, State = %@, Metadata = %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDSoftwareUpdateDocumentationAsset metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDSoftwareUpdateDocumentationAsset *v4;
  HMDSoftwareUpdateDocumentationAsset *v5;
  HMDSoftwareUpdateDocumentationAsset *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDSoftwareUpdateDocumentationAsset *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDSoftwareUpdateDocumentationAsset metadata](self, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdateDocumentationAsset metadata](v6, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = HMFEqualObjects();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)shouldAutomaticallyCache
{
  HMDSoftwareUpdateDocumentationAsset *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_shouldAutomaticallyCache;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setShouldAutomaticallyCache:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  NSObject *queue;
  _QWORD block[5];

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_shouldAutomaticallyCache == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_shouldAutomaticallyCache = v3;
    os_unfair_lock_unlock(p_lock);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HMDSoftwareUpdateDocumentationAsset_setShouldAutomaticallyCache___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (int64_t)state
{
  os_unfair_lock_s *p_lock;
  int64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  _QWORD block[6];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_state == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_state = a3;
    os_unfair_lock_unlock(p_lock);
    -[HMDSoftwareUpdateDocumentationAsset notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("state");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("HMDSoftwareUpdateDocumentationAssetStateUpdatedNotification"), self, v8);

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__HMDSoftwareUpdateDocumentationAsset_setState___block_invoke;
    block[3] = &unk_1E89C0B98;
    block[4] = self;
    block[5] = a3;
    dispatch_async(queue, block);
  }
}

- (NSURL)URL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[HMDSoftwareUpdateDocumentationAsset assetDirectoryURL](HMDSoftwareUpdateDocumentationAsset, "assetDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateDocumentationAsset identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (id)metadataURL
{
  void *v2;
  void *v3;

  -[HMDSoftwareUpdateDocumentationAsset URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("metadata.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)archiveURL
{
  void *v2;
  void *v3;

  -[HMDSoftwareUpdateDocumentationAsset URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Asset.zip"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)bundleURL
{
  void *v2;
  void *v3;

  -[HMDSoftwareUpdateDocumentationAsset URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (HMSoftwareUpdateDocumentation)documentation
{
  void *v3;
  HMDSoftwareUpdateDocumentationAsset *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HMDSoftwareUpdateDocumentationAsset *v11;
  uint64_t v12;
  void *v13;
  HMDSoftwareUpdateDocumentationAsset *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing documentation", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = -[HMDSoftwareUpdateDocumentationAsset state](v4, "state");
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  if (v7 == 4)
  {
    v9 = (void *)MEMORY[0x1E0CB34D0];
    -[HMDSoftwareUpdateDocumentationAsset bundleURL](v4, "bundleURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleWithURL:", v10);
    v11 = (HMDSoftwareUpdateDocumentationAsset *)objc_claimAutoreleasedReturnValue();

    if (!v11 || (v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8A8]), "initWithBundle:", v11)) == 0)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = v4;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed to find documentation bundle", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8A8]), "initWithAsset:", v14);
    }
    v17 = (void *)v12;
  }
  else
  {
    v11 = v4;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Documentation not cached", (uint8_t *)&v21, 0xCu);

    }
    v17 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return (HMSoftwareUpdateDocumentation *)v17;
}

- (BOOL)isDownloadPermitted
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void (**v5)(double);
  void *v6;
  BOOL v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDSoftwareUpdateDocumentationAsset nextPermittedDownloadDate](self, "nextPermittedDownloadDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateDocumentationAsset dateWithTimeIntervalSinceNowFactory](self, "dateWithTimeIntervalSinceNowFactory");
  v5 = (void (**)(double))objc_claimAutoreleasedReturnValue();
  v5[2](0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "compare:", v6) != 1;

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)increaseDownloadRetryCount
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  HMDSoftwareUpdateDocumentationAsset *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[HMDSoftwareUpdateDocumentationAsset downloadRetryCount](self, "downloadRetryCount");
  if (v4 >= objc_msgSend(&unk_1E8B32160, "count"))
    v5 = objc_msgSend(&unk_1E8B32160, "count") - 1;
  else
    v5 = -[HMDSoftwareUpdateDocumentationAsset downloadRetryCount](self, "downloadRetryCount");
  objc_msgSend(&unk_1E8B32160, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateDocumentationAsset dateWithTimeIntervalSinceNowFactory](self, "dateWithTimeIntervalSinceNowFactory");
  v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v7[2](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateDocumentationAsset setNextPermittedDownloadDate:](self, "setNextPermittedDownloadDate:", v8);

  -[HMDSoftwareUpdateDocumentationAsset nextPermittedDownloadDate](self, "nextPermittedDownloadDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateDocumentationAsset setDownloadRetryCount:](self, "setDownloadRetryCount:", -[HMDSoftwareUpdateDocumentationAsset downloadRetryCount](self, "downloadRetryCount") + 1);
  v10 = -[HMDSoftwareUpdateDocumentationAsset downloadRetryCount](self, "downloadRetryCount");

  os_unfair_lock_unlock(p_lock);
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2048;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Increased download retry count to: %lu next retry is at: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);

}

- (void)resetDownloadRetryCount
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  HMDSoftwareUpdateDocumentationAsset *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateDocumentationAsset setNextPermittedDownloadDate:](self, "setNextPermittedDownloadDate:", v4);

  -[HMDSoftwareUpdateDocumentationAsset setDownloadRetryCount:](self, "setDownloadRetryCount:", 0);
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting download retry count", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
}

- (BOOL)saveWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  char v12;
  void *v13;
  HMDSoftwareUpdateDocumentationAsset *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDSoftwareUpdateDocumentationAsset *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDSoftwareUpdateDocumentationAsset *v22;
  NSObject *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[HMDSoftwareUpdateDocumentationAsset fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateDocumentationAsset URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v7 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v26);
  v8 = v26;

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HMDSoftwareUpdateDocumentationAsset metadataURL](self, "metadataURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 1;
      v12 = objc_msgSend(v9, "writeToURL:atomically:", v10, 1);

      if ((v12 & 1) != 0)
      {
LABEL_16:

        goto LABEL_17;
      }
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive asset metadata (write)", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v24;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive asset metadata (encode)", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
    }
    v11 = 0;
    goto LABEL_16;
  }
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v20;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create asset directory with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v11 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v8);
LABEL_17:

  return v11;
}

- (void)startCaching
{
  int64_t v3;

  v3 = -[HMDSoftwareUpdateDocumentationAsset state](self, "state");
  if (v3 == 2)
  {
    -[HMDSoftwareUpdateDocumentationAsset setShouldAutomaticallyCache:](self, "setShouldAutomaticallyCache:", 1);
    -[HMDSoftwareUpdateDocumentationAsset startUnarchive](self, "startUnarchive");
  }
  else if (!v3)
  {
    -[HMDSoftwareUpdateDocumentationAsset setShouldAutomaticallyCache:](self, "setShouldAutomaticallyCache:", 1);
    -[HMDSoftwareUpdateDocumentationAsset startDownload](self, "startDownload");
  }
}

- (BOOL)purgeWithError:(id *)a3
{
  void *v5;
  HMDSoftwareUpdateDocumentationAsset *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Purging", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSoftwareUpdateDocumentationAsset setShouldAutomaticallyCache:](v6, "setShouldAutomaticallyCache:", 0);
  -[HMDSoftwareUpdateDocumentationAsset cancelDownload](v6, "cancelDownload");
  -[HMDSoftwareUpdateDocumentationAsset fileManager](v6, "fileManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdateDocumentationAsset URL](v6, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "removeItemAtURL:error:", v10, a3);

  return v11;
}

- (void)startDownload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMDSoftwareUpdateDocumentationAsset_startDownload__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelDownload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HMDSoftwareUpdateDocumentationAsset_cancelDownload__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)finishDownload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HMDSoftwareUpdateDocumentationAsset_finishDownload__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)startUnarchive
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HMDSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelUnarchive
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMDSoftwareUpdateDocumentationAsset_cancelUnarchive__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)finishUnarchive
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMDSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDSoftwareUpdateDocumentationAsset identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDSoftwareUpdateDocumentationAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDSoftwareUpdateDocumentationAsset *v6;
  uint64_t v7;
  NSUUID *identifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDSoftwareUpdateDocumentationAsset initWithDocumentationMetadata:](self, "initWithDocumentationMetadata:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v6->_shouldAutomaticallyCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HM.shouldCache"));
    v6->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.state"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMDSoftwareUpdateDocumentationAsset identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("HM.identifier"));

  -[HMDSoftwareUpdateDocumentationAsset metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("HM.metadata"));

  objc_msgSend(v6, "encodeBool:forKey:", -[HMDSoftwareUpdateDocumentationAsset shouldAutomaticallyCache](self, "shouldAutomaticallyCache"), CFSTR("HM.shouldCache"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[HMDSoftwareUpdateDocumentationAsset state](self, "state"), CFSTR("HM.state"));

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDSoftwareUpdateDocumentationAsset *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to download asset with error: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDSoftwareUpdateDocumentationAsset setState:](v12, "setState:", 0);
    -[HMDSoftwareUpdateDocumentationAsset increaseDownloadRetryCount](v12, "increaseDownloadRetryCount");
  }

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v11;
  id v12;
  void *v13;
  HMDSoftwareUpdateDocumentationAsset *v14;
  NSObject *v15;
  float v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (float)a6 / (float)a7;
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v17;
    v20 = 2048;
    v21 = (float)(v16 * 100.0);
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Download progress: %.1f%%", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v13);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDSoftwareUpdateDocumentationAsset *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMDSoftwareUpdateDocumentationAsset *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  HMDSoftwareUpdateDocumentationAsset *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  HMDSoftwareUpdateDocumentationAsset *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v14;
    v51 = 2112;
    v52 = v15;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Finished downloading archived asset to: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v9, "response");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v18 && (objc_msgSend(v18, "statusCode") > 399 || objc_msgSend(v18, "statusCode") <= 199))
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdateDocumentationAsset archiveURL](v20, "archiveURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v22;
      v51 = 2112;
      v52 = v24;
      v53 = 2112;
      v54 = v18;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to download asset to '%@' due to bad response status: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDSoftwareUpdateDocumentationAsset cancelDownload](v20, "cancelDownload");
    -[HMDSoftwareUpdateDocumentationAsset increaseDownloadRetryCount](v20, "increaseDownloadRetryCount");
    v25 = 0;
  }
  else
  {
    -[HMDSoftwareUpdateDocumentationAsset fileManager](v12, "fileManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSoftwareUpdateDocumentationAsset archiveURL](v12, "archiveURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v28 = objc_msgSend(v26, "moveItemAtURL:toURL:error:", v10, v27, &v48);
    v29 = v48;

    if ((v28 & 1) != 0)
    {
      -[HMDSoftwareUpdateDocumentationAsset finishDownload](v12, "finishDownload");
      -[HMDSoftwareUpdateDocumentationAsset startUnarchive](v12, "startUnarchive");
      v25 = v29;
    }
    else
    {
      v46 = v8;
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = v12;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSoftwareUpdateDocumentationAsset archiveURL](v31, "archiveURL");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "path");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v50 = v33;
        v51 = 2112;
        v52 = v35;
        v53 = 2112;
        v54 = v29;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to move downloaded asset to '%@' with error: %@. Removing existing assets at that path.", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      -[HMDSoftwareUpdateDocumentationAsset fileManager](v31, "fileManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdateDocumentationAsset archiveURL](v31, "archiveURL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v29;
      v38 = objc_msgSend(v36, "removeItemAtURL:error:", v37, &v47);
      v25 = v47;

      v8 = v46;
      if ((v38 & 1) == 0)
      {
        v39 = (void *)MEMORY[0x1D17BA0A0]();
        v40 = v31;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDSoftwareUpdateDocumentationAsset archiveURL](v40, "archiveURL");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "path");
          v45 = v39;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v50 = v42;
          v51 = 2112;
          v52 = v44;
          v53 = 2112;
          v54 = v25;
          _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove existing asset at url '%@' with error: %@.", buf, 0x20u);

          v39 = v45;
          v8 = v46;
        }

        objc_autoreleasePoolPop(v39);
      }
      -[HMDSoftwareUpdateDocumentationAsset cancelDownload](v31, "cancelDownload", v45);
      -[HMDSoftwareUpdateDocumentationAsset increaseDownloadRetryCount](v31, "increaseDownloadRetryCount");
    }
  }

}

- (void)setExtractionProgress:(double)a3
{
  void *v5;
  HMDSoftwareUpdateDocumentationAsset *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2048;
    v12 = a3 * 100.0;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Unarchive progress: %.1f%%", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
}

- (void)extractionCompleteAtArchivePath:(id)a3
{
  id v4;
  void *v5;
  HMDSoftwareUpdateDocumentationAsset *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Completed unarchiving to path: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)extractionEnteredPassThroughMode
{
  void *v3;
  HMDSoftwareUpdateDocumentationAsset *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](-[HMDSoftwareUpdateDocumentationAsset setExtractionEnteredPassThrough:](self, "setExtractionEnteredPassThrough:", 1));
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Unarchive in pass through mode", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMSoftwareUpdateDocumentationMetadata)metadata
{
  return (HMSoftwareUpdateDocumentationMetadata *)objc_getProperty(self, a2, 48, 1);
}

- (HMSoftwareUpdateUrlSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_URLSession, a3);
}

- (id)URLSessionFactory
{
  return objc_getProperty(self, a2, 64, 1);
}

- (HMSoftwareUpdateDocumentationAssetExtractor)extractor
{
  return self->_extractor;
}

- (void)setExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_extractor, a3);
}

- (id)extractorFactory
{
  return objc_getProperty(self, a2, 80, 1);
}

- (NSInputStream)archivedFileStream
{
  return self->_archivedFileStream;
}

- (void)setArchivedFileStream:(id)a3
{
  objc_storeStrong((id *)&self->_archivedFileStream, a3);
}

- (unint64_t)downloadRetryCount
{
  return self->_downloadRetryCount;
}

- (void)setDownloadRetryCount:(unint64_t)a3
{
  self->_downloadRetryCount = a3;
}

- (id)dateWithTimeIntervalSinceNowFactory
{
  return objc_getProperty(self, a2, 104, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 112, 1);
}

- (HMDFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (BOOL)extractionEnteredPassThrough
{
  return self->_extractionEnteredPassThrough;
}

- (void)setExtractionEnteredPassThrough:(BOOL)a3
{
  self->_extractionEnteredPassThrough = a3;
}

- (NSDate)nextPermittedDownloadDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextPermittedDownloadDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSData)testDocumentData
{
  return self->_testDocumentData;
}

- (void)setTestDocumentData:(id)a3
{
  objc_storeStrong((id *)&self->_testDocumentData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDocumentData, 0);
  objc_storeStrong((id *)&self->_nextPermittedDownloadDate, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong(&self->_dateWithTimeIntervalSinceNowFactory, 0);
  objc_storeStrong((id *)&self->_archivedFileStream, 0);
  objc_storeStrong(&self->_extractorFactory, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong(&self->_URLSessionFactory, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__HMDSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke(uint64_t a1)
{
  BOOL v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state") == 3;
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finishing unarchive", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "extractor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__HMDSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke_156;
    v11[3] = &unk_1E89C0678;
    objc_copyWeak(&v12, (id *)buf);
    objc_msgSend(v8, "finishStreamWithCompletionBlock:", v11);

    objc_msgSend(*(id *)(a1 + 32), "archivedFileStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "close");

    objc_msgSend(*(id *)(a1 + 32), "setArchivedFileStream:", 0);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to finish unarchive, not currently unarchiving", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

void __54__HMDSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke_156(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = v3;
  if (v4)
  {
    v6 = v4[2];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ____handleFinishedUnarchive_block_invoke;
    v7[3] = &unk_1E89C2328;
    v8 = v4;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __54__HMDSoftwareUpdateDocumentationAsset_cancelUnarchive__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling unarchive", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setExtractor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "archivedFileStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "close");

  objc_msgSend(*(id *)(a1 + 32), "setArchivedFileStream:", 0);
  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v7, "removeItemAtURL:error:", v8, &v15);
  v10 = v15;

  if ((v9 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to remove bundle with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", 2);

}

void __53__HMDSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke(uint64_t a1)
{
  BOOL v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state") == 2;
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v7;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting unarchive", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    v8 = (void *)MEMORY[0x1E0DAFE60];
    objc_msgSend(*(id *)(a1 + 32), "archiveURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "digest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fileManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "optionsForArchiveURL:digest:fileManager:", v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0C99DB0];
      objc_msgSend(*(id *)(a1 + 32), "archiveURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "inputStreamWithURL:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "setArchivedFileStream:", v16));
        v18 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v20;
          v44 = 2112;
          v45 = v13;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting extraction using options: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        v22 = *(void **)(a1 + 32);
        v21 = (id *)(a1 + 32);
        objc_msgSend(v22, "extractorFactory");
        v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v21, "bundleURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v23)[2](v23, v25, v13);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*v21, "setExtractor:", v26);
        objc_initWeak((id *)buf, *v21);
        objc_msgSend(*v21, "bundleURL");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __53__HMDSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke_154;
        v40[3] = &unk_1E89B4610;
        objc_copyWeak(&v41, (id *)buf);
        objc_msgSend(v26, "prepareForExtractionToPath:completionBlock:", v28, v40);

        objc_destroyWeak(&v41);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v39;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input stream", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v36);
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "metadata");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "digest");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        v44 = 2112;
        v45 = v35;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Failed to create validation options for unarchiving with digest: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
    }

  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to unarchive, asset is not downloaded", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

void __53__HMDSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke_154(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;

  v4 = a3;
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = v4;
  v7 = v6;
  if (v5)
  {
    v8 = v5[2];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = ____handleStartedUnarchive_block_invoke;
    v9[3] = &unk_1E89C2328;
    v10 = v6;
    v11 = v5;
    dispatch_async(v8, v9);

  }
}

uint64_t __53__HMDSoftwareUpdateDocumentationAsset_finishDownload__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Finished download", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "URLSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateAndCancel");

  objc_msgSend(*(id *)(a1 + 32), "setURLSession:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
}

uint64_t __53__HMDSoftwareUpdateDocumentationAsset_cancelDownload__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling download", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "URLSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateAndCancel");

  objc_msgSend(*(id *)(a1 + 32), "setURLSession:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
}

void __52__HMDSoftwareUpdateDocumentationAsset_startDownload__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v5;
      v6 = "%{public}@Unable to download, asset is already downloading or downloaded";
      v7 = v4;
      v8 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl(&dword_1CD062000, v7, v8, v6, (uint8_t *)&v33, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "saveWithError:", 0) & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v5;
      v6 = "%{public}@Failed to save asset";
      v7 = v4;
      v8 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    objc_autoreleasePoolPop(v2);
    return;
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "isDownloadPermitted");
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v28;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Not attempting to download documentation now as we are in a backoff", (uint8_t *)&v33, 0xCu);

    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138543362;
    v34 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Starting download", (uint8_t *)&v33, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "URLSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "URLSessionFactory");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t, void *))v16)[2](v16, v15, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setURLSession:", v19);
  }
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "URLSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "downloadTaskWithURL:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v27;
      v35 = 2112;
      v36 = v23;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Resuming task: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(v23, "resume");

  }
  else
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543362;
      v34 = v32;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Cannot download software update from nil url", (uint8_t *)&v33, 0xCu);

    }
    objc_autoreleasePoolPop(v29);
  }

}

uint64_t __48__HMDSoftwareUpdateDocumentationAsset_setState___block_invoke(uint64_t result)
{
  unint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 40);
  v2 = v1 > 4;
  v3 = (1 << v1) & 0x15;
  if (!v2 && v3 != 0)
    return objc_msgSend(*(id *)(result + 32), "saveWithError:", 0);
  return result;
}

uint64_t __67__HMDSoftwareUpdateDocumentationAsset_setShouldAutomaticallyCache___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveWithError:", 0);
}

id __69__HMDSoftwareUpdateDocumentationAsset_initWithDocumentationMetadata___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0DAFE60];
  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_msgSend([v4 alloc], "initWithPath:options:", v6, v5);

  return v7;
}

uint64_t __69__HMDSoftwareUpdateDocumentationAsset_initWithDocumentationMetadata___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", a2, a3, a4);
}

uint64_t __69__HMDSoftwareUpdateDocumentationAsset_initWithDocumentationMetadata___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
}

+ (NSURL)assetDirectoryURL
{
  if (assetDirectoryURL_onceToken != -1)
    dispatch_once(&assetDirectoryURL_onceToken, &__block_literal_global_123_116669);
  return (NSURL *)(id)assetDirectoryURL_assetDirectoryURL;
}

+ (id)assetWithURL:(id)a3 fileManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  __CFString *v33;
  id v34;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("metadata.plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithContentsOfURL:options:error:", v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v36 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v36);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (__CFString *)v36;
      v12 = objc_msgSend(v10, "setFileManager:", v7);
      if (v10)
      {
        if (objc_msgSend(v10, "state") == 4
          && (objc_msgSend(v10, "bundleURL"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v13, "path"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v7, "fileExistsAtPath:", v14),
              v14,
              v13,
              (v15 & 1) != 0))
        {
          v16 = 4;
        }
        else if (objc_msgSend(v10, "state") < 2)
        {
          v16 = 0;
        }
        else
        {
          objc_msgSend(v10, "archiveURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v7, "fileExistsAtPath:", v23);

          if (v24)
            v16 = 2;
          else
            v16 = 0;
        }
        if (v16 != objc_msgSend(v10, "state"))
        {
          v29 = (void *)MEMORY[0x1D17BA0A0]();
          v30 = a1;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = off_1E89B46B0[v16];
            *(_DWORD *)buf = 138543618;
            v38 = v32;
            v39 = 2112;
            v40 = v33;
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Setting state to: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
          objc_msgSend(v10, "setState:", v16);
        }
        v34 = v10;
      }
      else
      {
        v25 = (void *)MEMORY[0x1D17BA0A0](v12);
        v26 = a1;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v28;
          v39 = 2112;
          v40 = v11;
          _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation asset from serialized object data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
      }

    }
    else
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = a1;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "path");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v20;
        v39 = 2112;
        v40 = v21;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to find metadata at path: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t74_116661 != -1)
    dispatch_once(&logCategory__hmf_once_t74_116661, &__block_literal_global_158);
  return (id)logCategory__hmf_once_v75_116662;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __50__HMDSoftwareUpdateDocumentationAsset_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v75_116662;
  logCategory__hmf_once_v75_116662 = v0;

}

void __56__HMDSoftwareUpdateDocumentationAsset_assetDirectoryURL__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D28560], "defaultCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:", CFSTR("SoftwareUpdateDocumentation"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)assetDirectoryURL_assetDirectoryURL;
  assetDirectoryURL_assetDirectoryURL = v1;

}

@end
