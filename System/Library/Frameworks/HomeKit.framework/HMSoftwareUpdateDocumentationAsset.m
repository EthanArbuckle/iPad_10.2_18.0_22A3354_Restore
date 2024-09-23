@implementation HMSoftwareUpdateDocumentationAsset

- (HMSoftwareUpdateDocumentationAsset)init
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

- (HMSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3 urlSession:(id)a4 extractor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMSoftwareUpdateDocumentationAsset *v13;
  uint64_t v14;
  NSUUID *identifier;
  id v16;
  const char *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  HMSoftwareUpdateUrlSession *URLSession;
  HMSoftwareUpdateDocumentationAsset *v23;
  SEL v24;
  id v25;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    v12 = v11;
    v26.receiver = self;
    v26.super_class = (Class)HMSoftwareUpdateDocumentationAsset;
    v13 = -[HMSoftwareUpdateDocumentationAsset init](&v26, sel_init);
    if (v13)
    {
      objc_msgSend(v9, "metadataDigestUUID");
      v14 = objc_claimAutoreleasedReturnValue();
      identifier = v13->_identifier;
      v13->_identifier = (NSUUID *)v14;

      objc_storeStrong((id *)&v13->_metadata, a3);
      HMDispatchQueueNameString(v13, 0);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (const char *)objc_msgSend(v16, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = dispatch_queue_create(v17, v18);
      queue = v13->_queue;
      v13->_queue = (OS_dispatch_queue *)v19;

      objc_storeStrong((id *)&v13->_extractor, a5);
      objc_storeStrong((id *)&v13->_URLSession, a4);
      URLSession = v13->_URLSession;
      if (URLSession)
        -[HMSoftwareUpdateUrlSession setUrlSessionDelegate:](URLSession, "setUrlSessionDelegate:", v13);
    }

    return v13;
  }
  else
  {
    v23 = (HMSoftwareUpdateDocumentationAsset *)_HMFPreconditionFailure();
    return -[HMSoftwareUpdateDocumentationAsset initWithDocumentationMetadata:](v23, v24, v25);
  }
}

- (HMSoftwareUpdateDocumentationAsset)initWithDocumentationMetadata:(id)a3
{
  return -[HMSoftwareUpdateDocumentationAsset initWithDocumentationMetadata:urlSession:extractor:](self, "initWithDocumentationMetadata:urlSession:extractor:", a3, 0, 0);
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
  -[HMSoftwareUpdateDocumentationAsset identifier](self, "identifier");
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
  -[HMSoftwareUpdateDocumentationAsset identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMSoftwareUpdateDocumentationAsset state](self, "state");
  if (v6 > 5)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E3AB5F58[v6];
  -[HMSoftwareUpdateDocumentationAsset metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Identifier = %@, State = %@, Metadata = %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMSoftwareUpdateDocumentationAsset metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMSoftwareUpdateDocumentationAsset *v4;
  HMSoftwareUpdateDocumentationAsset *v5;
  HMSoftwareUpdateDocumentationAsset *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMSoftwareUpdateDocumentationAsset *)a3;
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
      -[HMSoftwareUpdateDocumentationAsset metadata](self, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSoftwareUpdateDocumentationAsset metadata](v6, "metadata");
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
  NSObject *queue;
  _QWORD block[5];

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
    -[HMSoftwareUpdateDocumentationAsset delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didUpdateDocumentationAssetState:", self);
    if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x15) != 0)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__HMSoftwareUpdateDocumentationAsset_setState___block_invoke;
      block[3] = &unk_1E3AB5E18;
      block[4] = self;
      dispatch_async(queue, block);
    }

  }
}

- (NSError)error
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_error;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setError:(id)a3
{
  NSError *v4;
  NSError *error;

  v4 = (NSError *)a3;
  os_unfair_lock_lock_with_options();
  error = self->_error;
  self->_error = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSURL)URL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[HMSoftwareUpdateDocumentationAsset assetDirectoryURL](HMSoftwareUpdateDocumentationAsset, "assetDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdateDocumentationAsset identifier](self, "identifier");
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

  -[HMSoftwareUpdateDocumentationAsset URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("metadata.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)archiveURL
{
  void *v2;
  void *v3;

  -[HMSoftwareUpdateDocumentationAsset URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Asset.zip"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bundleURL
{
  void *v2;
  void *v3;

  -[HMSoftwareUpdateDocumentationAsset URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Asset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMSoftwareUpdateDocumentation)documentation
{
  void *v3;
  HMSoftwareUpdateDocumentationAsset *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMSoftwareUpdateDocumentation *v12;
  HMSoftwareUpdateDocumentationAsset *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMSoftwareUpdateDocumentationAsset *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Parsing documentation", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = -[HMSoftwareUpdateDocumentationAsset state](v4, "state");
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  if (v7 != 4)
  {
    v13 = v4;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v15;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Documentation not cached", (uint8_t *)&v21, 0xCu);

    }
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1E0CB34D0];
  -[HMSoftwareUpdateDocumentationAsset bundleURL](v4, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = v4;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v19;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to find documentation bundle", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v12 = -[HMSoftwareUpdateDocumentation initWithBundle:]([HMSoftwareUpdateDocumentation alloc], "initWithBundle:", v11);

LABEL_13:
  objc_autoreleasePoolPop(v8);
  return v12;
}

- (BOOL)saveWithError:(id *)a3
{
  void *v5;
  HMSoftwareUpdateDocumentationAsset *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  char v17;
  void *v18;
  HMSoftwareUpdateDocumentationAsset *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMSoftwareUpdateDocumentationAsset *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMSoftwareUpdateDocumentationAsset *v27;
  NSObject *v28;
  void *v29;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentationAsset URL](v6, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@creating directory at: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdateDocumentationAsset URL](v6, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v12 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v31);
  v13 = v31;

  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[HMSoftwareUpdateDocumentationAsset metadataURL](v6, "metadataURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 1;
      v17 = objc_msgSend(v14, "writeToURL:atomically:", v15, 1);

      if ((v17 & 1) != 0)
      {
LABEL_18:

        goto LABEL_19;
      }
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v19 = v6;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v21;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive asset metadata (write)", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      if (a3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = v6;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v29;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive asset metadata (encode)", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
    }
    v16 = 0;
    goto LABEL_18;
  }
  v22 = (void *)MEMORY[0x1A1AC1AAC]();
  v23 = v6;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v25;
    v34 = 2112;
    v35 = v13;
    _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create asset directory with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  v16 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v13);
LABEL_19:

  return v16;
}

- (BOOL)documentationIsCached
{
  return -[HMSoftwareUpdateDocumentationAsset state](self, "state") == 4;
}

- (BOOL)stateNeedsNotification
{
  return -[HMSoftwareUpdateDocumentationAsset state](self, "state") == 4
      || -[HMSoftwareUpdateDocumentationAsset state](self, "state") == 5;
}

- (void)startCaching
{
  int64_t v3;

  v3 = -[HMSoftwareUpdateDocumentationAsset state](self, "state");
  if (v3 == 5)
  {
LABEL_4:
    -[HMSoftwareUpdateDocumentationAsset setError:](self, "setError:", 0);
    -[HMSoftwareUpdateDocumentationAsset startDownload](self, "startDownload");
    return;
  }
  if (v3 != 2)
  {
    if (v3)
      return;
    goto LABEL_4;
  }
  -[HMSoftwareUpdateDocumentationAsset startUnarchive](self, "startUnarchive");
}

- (void)startDownload
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HMSoftwareUpdateDocumentationAsset_startDownload__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelDownload
{
  void *v3;
  HMSoftwareUpdateDocumentationAsset *v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling download", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  queue = v4->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMSoftwareUpdateDocumentationAsset_cancelDownload__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = v4;
  dispatch_async(queue, block);
}

- (void)finishDownload
{
  void *v3;
  HMSoftwareUpdateDocumentationAsset *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finished download", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMSoftwareUpdateDocumentationAsset URLSession](v4, "URLSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateAndCancel");

  -[HMSoftwareUpdateDocumentationAsset setURLSession:](v4, "setURLSession:", 0);
  -[HMSoftwareUpdateDocumentationAsset setState:](v4, "setState:", 2);
}

- (HMSoftwareUpdateDocumentationAssetExtractor)extractor
{
  HMSoftwareUpdateDocumentationAssetExtractor *extractor;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMSoftwareUpdateDocumentationAsset *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  HMSoftwareUpdateDocumentationAssetExtractor *v20;
  HMSoftwareUpdateDocumentationAssetExtractor *v21;
  HMSoftwareUpdateDocumentationAssetExtractor *v22;
  void *v23;
  HMSoftwareUpdateDocumentationAsset *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMSoftwareUpdateDocumentationAsset *v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  extractor = self->_extractor;
  if (extractor)
    return extractor;
  v5 = (void *)MEMORY[0x1E0DAFE60];
  -[HMSoftwareUpdateDocumentationAsset archiveURL](self, "archiveURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdateDocumentationAsset metadata](self, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "digest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optionsForArchiveURL:digest:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99DB0];
    -[HMSoftwareUpdateDocumentationAsset archiveURL](self, "archiveURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputStreamWithURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1A1AC1AAC](-[HMSoftwareUpdateDocumentationAsset setArchivedFileStream:](self, "setArchivedFileStream:", v12));
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v16;
        v35 = 2112;
        v36 = v9;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Starting extraction using options: %@", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      v17 = objc_alloc(MEMORY[0x1E0DAFE60]);
      -[HMSoftwareUpdateDocumentationAsset bundleURL](v14, "bundleURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (HMSoftwareUpdateDocumentationAssetExtractor *)objc_msgSend(v17, "initWithPath:options:", v19, v9);
      v21 = self->_extractor;
      self->_extractor = v20;

      v22 = self->_extractor;
    }
    else
    {
      v29 = (void *)MEMORY[0x1A1AC1AAC]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v32;
        _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input stream", (uint8_t *)&v33, 0xCu);

      }
      objc_autoreleasePoolPop(v29);
      v22 = 0;
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSoftwareUpdateDocumentationAsset metadata](v24, "metadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "digest");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v26;
      v35 = 2112;
      v36 = v28;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to create validation options for unarchiving with digest: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    v22 = 0;
  }

  return v22;
}

- (void)setExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_extractor, a3);
}

- (void)startUnarchive
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelUnarchiveWithError:(id)a3
{
  id v4;
  void *v5;
  HMSoftwareUpdateDocumentationAsset *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  HMSoftwareUpdateDocumentationAsset *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling unarchive", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMSoftwareUpdateDocumentationAsset setExtractor:](v6, "setExtractor:", 0);
  -[HMSoftwareUpdateDocumentationAsset archivedFileStream](v6, "archivedFileStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "close");

  -[HMSoftwareUpdateDocumentationAsset setArchivedFileStream:](v6, "setArchivedFileStream:", 0);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdateDocumentationAsset bundleURL](v6, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = objc_msgSend(v10, "removeItemAtURL:error:", v11, &v19);
  v13 = v19;

  if (v12)
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to remove bundle with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  if (v4)
  {
    -[HMSoftwareUpdateDocumentationAsset setError:](v6, "setError:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentationAsset setError:](v6, "setError:", v18);

  }
  -[HMSoftwareUpdateDocumentationAsset setState:](v6, "setState:", 5);

}

- (void)finishUnarchive
{
  BOOL v3;
  void *v4;
  HMSoftwareUpdateDocumentationAsset *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[HMSoftwareUpdateDocumentationAsset state](self, "state") == 3;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finishing unarchive", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_initWeak((id *)buf, v5);
    -[HMSoftwareUpdateDocumentationAsset extractor](v5, "extractor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__HMSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke;
    v12[3] = &unk_1E3AB5E68;
    objc_copyWeak(&v13, (id *)buf);
    objc_msgSend(v9, "finishStreamWithCompletionBlock:", v12);

    -[HMSoftwareUpdateDocumentationAsset archivedFileStream](v5, "archivedFileStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "close");

    -[HMSoftwareUpdateDocumentationAsset setArchivedFileStream:](v5, "setArchivedFileStream:", 0);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to finish unarchive, not currently unarchiving", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMSoftwareUpdateDocumentationAsset identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMSoftwareUpdateDocumentationAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMSoftwareUpdateDocumentationAsset *v6;
  uint64_t v7;
  NSUUID *identifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.metadata"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMSoftwareUpdateDocumentationAsset initWithDocumentationMetadata:](self, "initWithDocumentationMetadata:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    v6->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.state"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMSoftwareUpdateDocumentationAsset *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentationAsset identifier](v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentationAsset metadata](v6, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2048;
    v20 = -[HMSoftwareUpdateDocumentationAsset state](v6, "state");
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Encoding software update documentation asset with identifier: %@, metadata: %@, state: %ld", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  -[HMSoftwareUpdateDocumentationAsset identifier](v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HM.identifier"));

  -[HMSoftwareUpdateDocumentationAsset metadata](v6, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("HM.metadata"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMSoftwareUpdateDocumentationAsset state](v6, "state"), CFSTR("HM.state"));
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMSoftwareUpdateDocumentationAsset *v12;
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
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
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
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to download asset with error: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMSoftwareUpdateDocumentationAsset setError:](v12, "setError:", v10);
    -[HMSoftwareUpdateDocumentationAsset setState:](v12, "setState:", 5);
  }

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v11;
  id v12;
  void *v13;
  HMSoftwareUpdateDocumentationAsset *v14;
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
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
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
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Download progress: %.1f%%", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v13);

}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMSoftwareUpdateDocumentationAsset *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMSoftwareUpdateDocumentationAsset *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *queue;
  void *v31;
  HMSoftwareUpdateDocumentationAsset *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  HMSoftwareUpdateDocumentationAsset *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD block[5];
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
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
    v52 = v14;
    v53 = 2112;
    v54 = v15;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Finished downloading archived asset to: %@", buf, 0x16u);

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
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = v12;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSoftwareUpdateDocumentationAsset archiveURL](v20, "archiveURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v22;
      v53 = 2112;
      v54 = v24;
      v55 = 2112;
      v56 = v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to download asset to '%@' due to bad response status: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    -[HMSoftwareUpdateDocumentationAsset cancelDownload](v20, "cancelDownload");
    v25 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdateDocumentationAsset archiveURL](v12, "archiveURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v28 = objc_msgSend(v26, "moveItemAtURL:toURL:error:", v10, v27, &v50);
    v29 = v50;

    if ((v28 & 1) != 0)
    {
      queue = v12->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__HMSoftwareUpdateDocumentationAsset_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
      block[3] = &unk_1E3AB5E18;
      block[4] = v12;
      dispatch_async(queue, block);
      v25 = v29;
    }
    else
    {
      v47 = v8;
      v31 = (void *)MEMORY[0x1A1AC1AAC]();
      v32 = v12;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMSoftwareUpdateDocumentationAsset archiveURL](v32, "archiveURL");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "path");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v34;
        v53 = 2112;
        v54 = v36;
        v55 = 2112;
        v56 = v29;
        _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to move downloaded asset to '%@' with error: %@. Removing existing assets at that path.", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v31);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSoftwareUpdateDocumentationAsset archiveURL](v32, "archiveURL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v29;
      v39 = objc_msgSend(v37, "removeItemAtURL:error:", v38, &v49);
      v25 = v49;

      v8 = v47;
      if ((v39 & 1) == 0)
      {
        v40 = (void *)MEMORY[0x1A1AC1AAC]();
        v41 = v32;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMSoftwareUpdateDocumentationAsset archiveURL](v41, "archiveURL");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "path");
          v46 = v40;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v52 = v43;
          v53 = 2112;
          v54 = v45;
          v55 = 2112;
          v56 = v25;
          _os_log_impl(&dword_19B1B0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove existing asset at url '%@' with error: %@.", buf, 0x20u);

          v40 = v46;
          v8 = v47;
        }

        objc_autoreleasePoolPop(v40);
      }
      -[HMSoftwareUpdateDocumentationAsset cancelDownload](v32, "cancelDownload");
    }
  }

}

- (void)setExtractionProgress:(double)a3
{
  void *v5;
  HMSoftwareUpdateDocumentationAsset *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
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
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Unarchive progress: %.1f%%", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (HMSoftwareUpdateDocumentationMetadata)metadata
{
  return (HMSoftwareUpdateDocumentationMetadata *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)shouldAutomaticallyCache
{
  return self->_shouldAutomaticallyCache;
}

- (HMSoftwareUpdateDocumentationAssetDelegate)delegate
{
  return (HMSoftwareUpdateDocumentationAssetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMSoftwareUpdateUrlSession)URLSession
{
  return self->_URLSession;
}

- (void)setURLSession:(id)a3
{
  objc_storeStrong((id *)&self->_URLSession, a3);
}

- (NSInputStream)archivedFileStream
{
  return self->_archivedFileStream;
}

- (void)setArchivedFileStream:(id)a3
{
  objc_storeStrong((id *)&self->_archivedFileStream, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedFileStream, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __88__HMSoftwareUpdateDocumentationAsset_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "finishDownload");
  return objc_msgSend(*(id *)(a1 + 32), "startUnarchive");
}

void __53__HMSoftwareUpdateDocumentationAsset_finishUnarchive__block_invoke(uint64_t a1, void *a2)
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
    v7[3] = &unk_1E3AB5ED8;
    v8 = v4;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void __52__HMSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke(uint64_t a1)
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
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state") == 2;
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
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
      v20 = v7;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting unarchive", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    objc_msgSend(*(id *)(a1 + 32), "extractor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "bundleURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52__HMSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke_113;
      v17[3] = &unk_1E3AB5E40;
      objc_copyWeak(&v18, (id *)buf);
      objc_msgSend(v8, "prepareForExtractionToPath:completionBlock:", v10, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v15;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create extractor", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setError:", v16);

      objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
    }

  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to unarchive, asset is not downloaded", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
}

void __52__HMSoftwareUpdateDocumentationAsset_startUnarchive__block_invoke_113(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = v4;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = v5;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v11;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to start unarchive with error: %@", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v8, "cancelUnarchiveWithError:", v6);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v12;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Started unarchive", (uint8_t *)&v15, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v8, "extractor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setExtractorDelegate:", v8);

      objc_msgSend(v8, "archivedFileStream");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "open");

      __processNextArchivedData(v8);
    }
  }

}

uint64_t __52__HMSoftwareUpdateDocumentationAsset_cancelDownload__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "URLSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAndCancel");

  objc_msgSend(*(id *)(a1 + 32), "setURLSession:", 0);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setError:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
}

void __51__HMSoftwareUpdateDocumentationAsset_startDownload__block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v2)
    v3 = v2 == 5;
  else
    v3 = 1;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v42 = 0;
    v5 = objc_msgSend(v4, "saveWithError:", &v42);
    v6 = (__CFString *)v42;
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((v5 & 1) != 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = (uint64_t)v11;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Starting download", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(*(id *)(a1 + 32), "setState:", 1);
      objc_msgSend(*(id *)(a1 + 32), "URLSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB39F0];
        v15 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sessionWithConfiguration:delegate:delegateQueue:", v13, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setURLSession:", v17);
      }
      objc_msgSend(*(id *)(a1 + 32), "metadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(*(id *)(a1 + 32), "URLSession");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "metadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "URL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "downloadTaskWithURL:", v22);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1A1AC1AAC]();
        v25 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = (uint64_t)v27;
          v45 = 2112;
          v46 = v23;
          _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_INFO, "%{public}@Resuming task: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        -[__CFString resume](v23, "resume");

      }
      else
      {
        v37 = (void *)MEMORY[0x1A1AC1AAC]();
        v38 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = (uint64_t)v40;
          _os_log_impl(&dword_19B1B0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Cannot download software update from nil url", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v37);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setError:", v41);

        objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
      }

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = (uint64_t)v36;
        v45 = 2112;
        v46 = v6;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to save asset with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
      objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
    }

  }
  else
  {
    v28 = v2;
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v33;
      if ((unint64_t)(v28 - 1) > 4)
        v35 = CFSTR("unknown");
      else
        v35 = off_1E3AB5F88[v28 - 1];
      *(_DWORD *)buf = 138543618;
      v44 = v33;
      v45 = 2112;
      v46 = v35;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_INFO, "%{public}@Not starting new download in state: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
  }
}

uint64_t __47__HMSoftwareUpdateDocumentationAsset_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveWithError:", 0);
}

+ (NSURL)assetDirectoryURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = HMCreateSoftwareUpdateCacheDirectory();
  HMSoftwareUpdateCacheDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("SoftwareUpdateDocumentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

+ (HMSoftwareUpdateDocumentationAsset)assetWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  void *v21;
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
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("metadata.plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithContentsOfURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v36 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v36);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (__CFString *)v36;
      if (v9)
      {
        if (objc_msgSend(v9, "state") != 4)
          goto LABEL_12;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bundleURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "fileExistsAtPath:", v13);

        if ((v14 & 1) != 0)
        {
          v15 = 4;
        }
        else
        {
LABEL_12:
          if (objc_msgSend(v9, "state") == 2 || objc_msgSend(v9, "state") == 4)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "archiveURL");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "path");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v21, "fileExistsAtPath:", v23);

            if (v24)
              v15 = 2;
            else
              v15 = 0;
          }
          else
          {
            v15 = 0;
          }
        }
        if (v15 != objc_msgSend(v9, "state"))
        {
          v29 = (void *)MEMORY[0x1A1AC1AAC]();
          v30 = a1;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = off_1E3AB5F30[v15];
            *(_DWORD *)buf = 138543618;
            v38 = v32;
            v39 = 2112;
            v40 = v33;
            _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Setting state to: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v29);
          objc_msgSend(v9, "setState:", v15);
        }
        v34 = v9;
      }
      else
      {
        v25 = (void *)MEMORY[0x1A1AC1AAC]();
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
          v40 = v10;
          _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation asset from serialized object data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
      }

    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = a1;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "path");
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v19;
        v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to find metadata at path: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return (HMSoftwareUpdateDocumentationAsset *)v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t57 != -1)
    dispatch_once(&logCategory__hmf_once_t57, &__block_literal_global_55967);
  return (id)logCategory__hmf_once_v58;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __49__HMSoftwareUpdateDocumentationAsset_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v58;
  logCategory__hmf_once_v58 = v0;

}

@end
