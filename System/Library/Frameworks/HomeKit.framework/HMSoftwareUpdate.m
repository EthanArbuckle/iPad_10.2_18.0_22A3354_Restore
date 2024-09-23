@implementation HMSoftwareUpdate

- (HMSoftwareUpdate)init
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

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4
{
  return -[HMSoftwareUpdate initWithVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", a3, a4, 0, 0, 0, 0.0);
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5
{
  return -[HMSoftwareUpdate initWithVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", a3, a4, a5, 0, 0, 0.0);
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 documentationMetadata:(id)a6
{
  return -[HMSoftwareUpdate initWithVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", a3, a4, a5, a6, 0, 0.0);
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 installDuration:(double)a6 documentationMetadata:(id)a7
{
  return -[HMSoftwareUpdate initWithVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", a3, a4, a5, a7, 0, a6);
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 installDuration:(double)a6 documentationMetadata:(id)a7 releaseDate:(id)a8
{
  return -[HMSoftwareUpdate initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", a3, 0, a4, a5, a7, a8, a6);
}

- (HMSoftwareUpdate)initWithVersion:(id)a3 displayableVersion:(id)a4 downloadSize:(unint64_t)a5 state:(int64_t)a6 installDuration:(double)a7 documentationMetadata:(id)a8 releaseDate:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HMSoftwareUpdate *v21;
  uint64_t v22;
  HMFSoftwareVersion *version;
  NSString *v24;
  NSString *displayableVersion;
  HMSoftwareUpdate *v27;
  SEL v28;
  objc_super v29;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  if (v16)
  {
    v20 = v19;
    v29.receiver = self;
    v29.super_class = (Class)HMSoftwareUpdate;
    v21 = -[HMSoftwareUpdate init](&v29, sel_init);
    if (v21)
    {
      v22 = objc_msgSend(v16, "copy");
      version = v21->_version;
      v21->_version = (HMFSoftwareVersion *)v22;

      if (v17)
      {
        v24 = (NSString *)v17;
      }
      else
      {
        objc_msgSend(v16, "shortVersionString");
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      displayableVersion = v21->_displayableVersion;
      v21->_displayableVersion = v24;

      v21->_downloadSize = a5;
      v21->_state = a6;
      objc_storeStrong((id *)&v21->_documentationMetadata, a8);
      v21->_installDuration = a7;
      v21->_updateType = 0;
      objc_storeStrong((id *)&v21->_releaseDate, a9);
    }

    return v21;
  }
  else
  {
    v27 = (HMSoftwareUpdate *)_HMFPreconditionFailure();
    return (HMSoftwareUpdate *)-[HMSoftwareUpdate hash](v27, v28);
  }
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMSoftwareUpdate version](self, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMSoftwareUpdate *v4;
  HMSoftwareUpdate *v5;
  HMSoftwareUpdate *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMSoftwareUpdate *)a3;
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
      -[HMSoftwareUpdate version](self, "version");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSoftwareUpdate version](v6, "version");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  void *v14;

  -[HMSoftwareUpdate releaseDate](self, "releaseDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMSoftwareUpdate version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "versionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdate displayableVersion](self, "displayableVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMSoftwareUpdate state](self, "state");
  if (v8 > 5)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E3AAF968[v8];
  -[HMSoftwareUpdate downloadSize](self, "downloadSize");
  NSLocalizedFileSizeDescription();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdate documentationMetadata](self, "documentationMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMSoftwareUpdate updateType](self, "updateType");
  if (v12 - 1 > 2)
    v13 = CFSTR("Unknown");
  else
    v13 = off_1E3AAF950[v12 - 1];
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<Software Update, Version = %@, Displayable Version = %@, State = %@, Download Size = %@, Documentation Metadata = %@, Release Date = %@, Update Type = %@>"), v6, v7, v9, v10, v11, v3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v14;
}

- (void)configureWithContext:(id)a3
{
  void *v5;

  -[HMSoftwareUpdate setContext:](self, "setContext:");
  if (a3)
  {
    -[HMSoftwareUpdate identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HMSoftwareUpdate _registerNotificationHandlers](self, "_registerNotificationHandlers");
      -[HMSoftwareUpdate _requestNeedsAttentionReasonsWithCompletionHandler:](self, "_requestNeedsAttentionReasonsWithCompletionHandler:", &__block_literal_global_15896);
    }
  }
}

- (void)_unconfigureContext
{
  void *v3;
  void *v4;
  _HMContext *context;

  -[HMSoftwareUpdate context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  context = self->_context;
  self->_context = 0;

}

- (void)_unconfigure
{
  _HMContext *context;
  void *v4;
  HMSoftwareUpdate *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring softwareUpdate", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMSoftwareUpdate _unconfigureContext](v5, "_unconfigureContext");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)_registerNotificationHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HMSoftwareUpdate context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMSU.us"), self, sel__handleUpdatedState_);

  -[HMSoftwareUpdate context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:selector:", CFSTR("HMSU.dm"), self, sel__handleUpdatedDocumentationMetadata_);

  -[HMSoftwareUpdate context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:selector:", CFSTR("HMSU.du"), self, sel__handleUpdatedDocumentation_);

  -[HMSoftwareUpdate context](self, "context");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:selector:", CFSTR("HMSU.na"), self, sel__handleUpdatedNeedsAttentionReasonsMessage_);

}

- (NSUUID)identifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *identifier;

  v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *uniqueIdentifier;
  NSUUID *v5;
  NSUUID *v6;
  NSUUID *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", self->_identifier);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v7;
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

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_state = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_handleUpdatedState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  HMSoftwareUpdate *v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  HMSoftwareUpdate *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  const __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSoftwareUpdate context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeCompletionBlockForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberForKey:", CFSTR("state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[HMSoftwareUpdate state](self, "state");
    if (v10 == objc_msgSend(v9, "integerValue"))
    {
      if (!v8)
        goto LABEL_16;
    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v9, "integerValue");
        if (v21 > 5)
          v22 = CFSTR("unknown");
        else
          v22 = off_1E3AAF968[v21];
        *(_DWORD *)buf = 138543618;
        v32 = v20;
        v33 = 2112;
        v34 = v22;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updated state to '%@'", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMSoftwareUpdate setState:](v18, "setState:", objc_msgSend(v9, "integerValue"));
      if (!v8)
      {
        -[HMSoftwareUpdate delegate](v18, "delegate");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_initWeak((id *)buf, v18);
          -[HMSoftwareUpdate context](v18, "context");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "delegateCaller");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __40__HMSoftwareUpdate__handleUpdatedState___block_invoke;
          v27[3] = &unk_1E3AB6268;
          objc_copyWeak(&v30, (id *)buf);
          v23 = v23;
          v28 = v23;
          v29 = v9;
          objc_msgSend(v26, "invokeBlock:", v27);

          objc_destroyWeak(&v30);
          objc_destroyWeak((id *)buf);
        }
        goto LABEL_15;
      }
    }
    -[HMSoftwareUpdate context](self, "context");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegateCaller");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "callCompletion:error:", v8, 0);

LABEL_15:
LABEL_16:
    objc_msgSend(v4, "respondWithPayload:", 0);
    goto LABEL_17;
  }
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v14;
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing state from message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v16);

LABEL_17:
}

- (void)updateState:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMSoftwareUpdate *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMSoftwareUpdate *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  int64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMSoftwareUpdate context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSoftwareUpdate updateState:completionHandler:]", CFSTR("completionHandler"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      v27 = 2112;
      v28 = (const char *)v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C30;
    block[4] = self;
    v24 = a3;
    v23 = v6;
    v22 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      v27 = 2080;
      v28 = "-[HMSoftwareUpdate updateState:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v14);

  }
}

- (BOOL)isDocumentationAvailable
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[HMSoftwareUpdate nextPermittedRequestDocumentationDate](self, "nextPermittedRequestDocumentationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSoftwareUpdate documentationMetadata](self, "documentationMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v3, "compare:", v5) != 1;

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HMSoftwareUpdateDocumentationMetadata)documentationMetadata
{
  os_unfair_lock_s *p_lock;
  HMSoftwareUpdateDocumentationMetadata *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_documentationMetadata;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDocumentationMetadata:(id)a3
{
  HMSoftwareUpdateDocumentationMetadata *v4;
  HMSoftwareUpdateDocumentationMetadata *documentationMetadata;

  v4 = (HMSoftwareUpdateDocumentationMetadata *)a3;
  os_unfair_lock_lock_with_options();
  documentationMetadata = self->_documentationMetadata;
  self->_documentationMetadata = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_handleUpdatedDocumentationMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HMSoftwareUpdate *v14;
  NSObject *v15;
  void *v16;
  int v17;
  int v18;
  char v19;
  void *v20;
  HMSoftwareUpdate *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMSoftwareUpdate *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  HMSoftwareUpdate *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMSoftwareUpdate *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  char v51;
  id location;
  id v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSoftwareUpdate context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "retrieveCompletionBlockForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_16:
    objc_msgSend(v4, "respondWithPayload:", 0);
    goto LABEL_17;
  }
  objc_msgSend(v4, "nullForKey:", CFSTR("metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
LABEL_4:
    -[HMSoftwareUpdate documentationMetadata](self, "documentationMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if ((v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1A1AC1AAC]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v16;
        v56 = 2112;
        v57 = v10;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating documentation metadata to: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      v17 = -[HMSoftwareUpdate isDocumentationAvailable](v14, "isDocumentationAvailable");
      -[HMSoftwareUpdate setDocumentationMetadata:](v14, "setDocumentationMetadata:", v10);
      v18 = -[HMSoftwareUpdate isDocumentationAvailable](v14, "isDocumentationAvailable");
      v19 = v18;
      if (v17 != v18)
      {
        v20 = (void *)MEMORY[0x1A1AC1AAC]();
        v21 = v14;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v55 = v23;
          v56 = 2112;
          v57 = v24;
          _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Documentation is available: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        objc_initWeak(&location, v21);
        -[HMSoftwareUpdate delegate](v21, "delegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v26 = (void *)MEMORY[0x1A1AC1AAC]();
          v27 = v21;
          HMFGetOSLogHandle();
          v28 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = (id)objc_claimAutoreleasedReturnValue();
            HMFBooleanToString();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v29;
            v56 = 2112;
            v57 = v30;
            _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@Notifying clients documentation is available: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
          v31 = objc_loadWeakRetained(&location);
          objc_msgSend(v31, "context");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "delegateCaller");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __56__HMSoftwareUpdate__handleUpdatedDocumentationMetadata___block_invoke;
          v48[3] = &unk_1E3AB57F8;
          v49 = v25;
          v50 = v31;
          v51 = v19;
          objc_msgSend(v33, "invokeBlock:", v48);

        }
        objc_destroyWeak(&location);
      }
    }

    goto LABEL_16;
  }
  objc_msgSend(v4, "dataForKey:", CFSTR("metadata"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v53 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v34, &v53);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v53;
    v36 = v35;
    if (v10)
    {

      goto LABEL_4;
    }
    v43 = (void *)MEMORY[0x1A1AC1AAC]();
    v44 = self;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v46;
      v56 = 2112;
      v57 = v36;
      _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation metadata from metadata data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v47);

  }
  else
  {
    v37 = (void *)MEMORY[0x1A1AC1AAC]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v40;
      v56 = 2112;
      v57 = v41;
      _os_log_impl(&dword_19B1B0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Missing documentation metadata from message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v42);

  }
LABEL_17:

}

- (void)updateDocumentationMetadata:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMSoftwareUpdate *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMSoftwareUpdate *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _BYTE location[12];
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMSoftwareUpdate context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSoftwareUpdate updateDocumentationMetadata:completionHandler:]", CFSTR("completionHandler"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v20;
      v28 = 2112;
      v29 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", location, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = (void *)v8;
  if (v8)
  {
    objc_initWeak((id *)location, self);
    objc_msgSend(v9, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke;
    block[3] = &unk_1E3AAF8D0;
    objc_copyWeak(&v26, (id *)location);
    v23 = v6;
    v25 = v7;
    v24 = v9;
    dispatch_async(v10, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v14;
      v28 = 2080;
      v29 = "-[HMSoftwareUpdate updateDocumentationMetadata:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (HMSoftwareUpdateDocumentation)documentation
{
  HMSoftwareUpdateDocumentation *v3;

  if (-[HMSoftwareUpdate isDocumentationAvailable](self, "isDocumentationAvailable"))
  {
    os_unfair_lock_lock_with_options();
    v3 = self->_documentation;
    os_unfair_lock_unlock(&self->_lock);
    if (!v3)
      -[HMSoftwareUpdate requestDocumentation](self, "requestDocumentation");
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setDocumentation:(id)a3
{
  NSDate *nextPermittedRequestDocumentationDate;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_documentation, a3);
  if (v6)
  {
    nextPermittedRequestDocumentationDate = self->_nextPermittedRequestDocumentationDate;
    self->_nextPermittedRequestDocumentationDate = 0;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)requestDocumentation
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  HMSoftwareUpdate *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMSoftwareUpdate context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__HMSoftwareUpdate_requestDocumentation__block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2080;
      v15 = "-[HMSoftwareUpdate requestDocumentation]";
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_handleUpdatedDocumentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  HMSoftwareUpdate *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  HMSoftwareUpdate *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMSoftwareUpdate *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dataForKey:", CFSTR("documentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v8, v5, &v38);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v38;
    if (v9)
    {
      v10 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      -[HMSoftwareUpdate documentation](self, "documentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = HMFEqualObjects();

      if ((v14 & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1A1AC1AAC]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v18;
          v41 = 2112;
          v42 = v10;
          _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating with documentation: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        -[HMSoftwareUpdate setDocumentation:](v16, "setDocumentation:", v10);
        objc_initWeak((id *)buf, v16);
        -[HMSoftwareUpdate delegate](v16, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)buf);
          objc_msgSend(WeakRetained, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "delegateCaller");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __48__HMSoftwareUpdate__handleUpdatedDocumentation___block_invoke;
          v34[3] = &unk_1E3AB5CD0;
          v35 = v19;
          v36 = WeakRetained;
          v37 = v12;
          objc_msgSend(v22, "invokeBlock:", v34);

        }
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = v31;
        v41 = 2112;
        v42 = v32;
        v43 = 2112;
        v44 = v33;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation from serialized documentation data: %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v12);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v26;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Missing documentation data from message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);
  }

}

- (unint64_t)updateType
{
  os_unfair_lock_s *p_lock;
  unint64_t updateType;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  updateType = self->_updateType;
  os_unfair_lock_unlock(p_lock);
  return updateType;
}

- (void)setUpdateType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_updateType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setNextPermittedRequestDocumentationDate:(id)a3
{
  NSDate *v4;
  NSDate *nextPermittedRequestDocumentationDate;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  nextPermittedRequestDocumentationDate = self->_nextPermittedRequestDocumentationDate;
  self->_nextPermittedRequestDocumentationDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)nextPermittedRequestDocumentationDate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSDate copy](self->_nextPermittedRequestDocumentationDate, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDate *)v4;
}

- (void)fetchNeedsAttentionReasonsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  HMSoftwareUpdate *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSoftwareUpdate context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMSoftwareUpdate context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (v4)
      {
        -[HMSoftwareUpdate context](self, "context");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "queue");
        v8 = objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __68__HMSoftwareUpdate_fetchNeedsAttentionReasonsWithCompletionHandler___block_invoke;
        v13[3] = &unk_1E3AB60A0;
        v13[4] = self;
        v14 = v4;
        dispatch_async(v8, v13);

        goto LABEL_8;
      }
    }
    else
    {
      _HMFPreconditionFailure();
    }
    _HMFPreconditionFailure();
  }
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2080;
    v18 = "-[HMSoftwareUpdate fetchNeedsAttentionReasonsWithCompletionHandler:]";
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
LABEL_8:

}

- (void)_handleUpdatedNeedsAttentionReasonsMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  HMSoftwareUpdate *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMSoftwareUpdate *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSoftwareUpdate context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeCompletionBlockForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberForKey:", CFSTR("needsAttention"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[HMSoftwareUpdate needsAttentionReasons](self, "needsAttentionReasons");
    if (v10 == objc_msgSend(v9, "integerValue"))
    {
      if (!v8)
        goto LABEL_13;
    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HMSoftwareUpdateNeedsAttentionReasonsToString(objc_msgSend(v9, "integerValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "integerValue"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v20;
        v33 = 2112;
        v34 = v21;
        v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updated needsAttentionReasons to %@ (%@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMSoftwareUpdate setNeedsAttentionReasons:](v18, "setNeedsAttentionReasons:", objc_msgSend(v9, "integerValue"));
      if (!v8)
      {
        -[HMSoftwareUpdate delegate](v18, "delegate");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_initWeak((id *)buf, v18);
          -[HMSoftwareUpdate context](v18, "context");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "delegateCaller");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __63__HMSoftwareUpdate__handleUpdatedNeedsAttentionReasonsMessage___block_invoke;
          v27[3] = &unk_1E3AB6268;
          objc_copyWeak(&v30, (id *)buf);
          v23 = v23;
          v28 = v23;
          v29 = v9;
          objc_msgSend(v26, "invokeBlock:", v27);

          objc_destroyWeak(&v30);
          objc_destroyWeak((id *)buf);
        }
        goto LABEL_12;
      }
    }
    -[HMSoftwareUpdate context](self, "context");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegateCaller");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "callCompletion:error:", v8, 0);

LABEL_12:
LABEL_13:
    objc_msgSend(v4, "respondWithPayload:", 0);
    goto LABEL_14;
  }
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v14;
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Missing needsAttentionReasons from message payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v16);

LABEL_14:
}

- (void)_requestNeedsAttentionReasonsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMSoftwareUpdate *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  HMSoftwareUpdate *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMSoftwareUpdate context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMSoftwareUpdate identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMSU.rn"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __71__HMSoftwareUpdate__requestNeedsAttentionReasonsWithCompletionHandler___block_invoke;
    v18 = &unk_1E3AB59B8;
    v19 = self;
    v20 = v4;
    objc_msgSend(v9, "setResponseHandler:", &v15);
    objc_msgSend(v5, "messageDispatcher", v15, v16, v17, v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendMessage:", v9);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v14;
      v23 = 2080;
      v24 = "-[HMSoftwareUpdate _requestNeedsAttentionReasonsWithCompletionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  HMSoftwareUpdate *v17;
  NSObject *v18;
  void *v19;
  int v20;
  int v21;
  char v22;
  void *v23;
  HMSoftwareUpdate *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  char v43;
  _QWORD block[5];
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMSoftwareUpdate delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "state");
    v9 = -[HMSoftwareUpdate state](self, "state");
    v10 = v9 != v8;
    if (v9 != v8)
    {
      -[HMSoftwareUpdate setState:](self, "setState:", v8);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMSoftwareUpdate context](self, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "queue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E3AB5C80;
        block[4] = self;
        v46 = v8;
        v45 = v7;
        dispatch_async(v12, block);

      }
    }
    objc_msgSend(v6, "documentationMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdate documentationMetadata](self, "documentationMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HMFEqualObjects();

    if ((v15 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v19;
        v49 = 2112;
        v50 = v13;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Updating documentation metadata: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v20 = -[HMSoftwareUpdate isDocumentationAvailable](v17, "isDocumentationAvailable");
      -[HMSoftwareUpdate setDocumentationMetadata:](v17, "setDocumentationMetadata:", v13);
      v21 = -[HMSoftwareUpdate isDocumentationAvailable](v17, "isDocumentationAvailable");
      if (v20 != v21)
      {
        v22 = v21;
        v23 = (void *)MEMORY[0x1A1AC1AAC]();
        v24 = v17;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v37 = v23;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v26;
          v49 = 2112;
          v50 = v27;
          _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_INFO, "%{public}@Documentation is available: %@", buf, 0x16u);

          v23 = v37;
        }

        objc_autoreleasePoolPop(v23);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HMSoftwareUpdate context](v24, "context");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "queue");
          v29 = objc_claimAutoreleasedReturnValue();
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_129;
          v41[3] = &unk_1E3AB57F8;
          v41[4] = v24;
          v43 = v22;
          v42 = v7;
          dispatch_async(v29, v41);

        }
      }
      v10 = 1;
    }

    objc_msgSend(v6, "documentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSoftwareUpdate documentation](self, "documentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = HMFEqualObjects();

    if ((v32 & 1) == 0)
    {
      -[HMSoftwareUpdate setDocumentation:](self, "setDocumentation:", v30);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[HMSoftwareUpdate context](self, "context");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "queue");
        v34 = objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_131;
        v38[3] = &unk_1E3AB5CD0;
        v38[4] = self;
        v39 = v30;
        v40 = v7;
        dispatch_async(v34, v38);

      }
      v10 = 1;
    }

    v35 = objc_msgSend(v6, "updateType");
    if (-[HMSoftwareUpdate updateType](self, "updateType") != v35)
    {
      -[HMSoftwareUpdate setUpdateType:](self, "setUpdateType:", v35);
      v10 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMSoftwareUpdate identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMSoftwareUpdate messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMSoftwareUpdate context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMSoftwareUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMSoftwareUpdate *v12;
  uint64_t v13;
  NSUUID *identifier;
  uint64_t v15;
  HMSoftwareUpdateDocumentation *documentation;
  void *v17;
  HMSoftwareUpdate *v18;
  HMSoftwareUpdate *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  HMSoftwareUpdate *result;
  HMSoftwareUpdate *v24;
  SEL v25;
  id v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.displayableVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v5, "shortVersionString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("HM.downloadSize"));
    v8 = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.installDuration"));
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HM.state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.docMetadata"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.releaseDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMSoftwareUpdate initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", v5, v6, v7, v9, v10, v11, v8);
    if (v12)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
      v13 = objc_claimAutoreleasedReturnValue();
      identifier = v12->_identifier;
      v12->_identifier = (NSUUID *)v13;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.documentation"));
      v15 = objc_claimAutoreleasedReturnValue();
      documentation = v12->_documentation;
      v12->_documentation = (HMSoftwareUpdateDocumentation *)v15;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.updateType"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_updateType = objc_msgSend(v17, "unsignedIntegerValue");

    }
    v18 = v12;

    v19 = v18;
LABEL_11:

    return v19;
  }
  if (!isInternalBuild())
  {
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = 0;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded version: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v19 = 0;
    goto LABEL_11;
  }
  v24 = (HMSoftwareUpdate *)_HMFPreconditionFailure();
  -[HMSoftwareUpdate encodeWithCoder:](v24, v25, v26);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HMSoftwareUpdate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

  -[HMSoftwareUpdate version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.version"));

  -[HMSoftwareUpdate displayableVersion](self, "displayableVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.displayableVersion"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMSoftwareUpdate state](self, "state"), CFSTR("HM.state"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[HMSoftwareUpdate downloadSize](self, "downloadSize"), CFSTR("HM.downloadSize"));
  -[HMSoftwareUpdate installDuration](self, "installDuration");
  objc_msgSend(v4, "encodeInteger:forKey:", (uint64_t)v8, CFSTR("HM.installDuration"));
  -[HMSoftwareUpdate documentationMetadata](self, "documentationMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HM.docMetadata"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMSoftwareUpdate updateType](self, "updateType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HM.updateType"));

  -[HMSoftwareUpdate releaseDate](self, "releaseDate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("HM.releaseDate"));

}

- (unint64_t)needsAttentionReasons
{
  return self->_needsAttentionReasons;
}

- (void)setNeedsAttentionReasons:(unint64_t)a3
{
  self->_needsAttentionReasons = a3;
}

- (HMSoftwareUpdateDelegate)delegate
{
  return (HMSoftwareUpdateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMFSoftwareVersion)version
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)displayableVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (double)installDuration
{
  return self->_installDuration;
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_displayableVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextPermittedRequestDocumentationDate, 0);
  objc_storeStrong((id *)&self->_documentation, 0);
  objc_storeStrong((id *)&self->_documentationMetadata, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E3AB5C80;
  v5 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v7 = v5;
  objc_msgSend(v3, "invokeBlock:", v6);

}

void __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_129(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2_130;
  v5[3] = &unk_1E3AB57F8;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[1] = 3221225472;
  v7 = *(_BYTE *)(a1 + 48);
  v6 = v4;
  objc_msgSend(v3, "invokeBlock:", v5);

}

void __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_131(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateCaller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2_132;
  v5[3] = &unk_1E3AB5CD0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "invokeBlock:", v5);

}

uint64_t __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2_132(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateDocumentation with : %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "softwareUpdate:didUpdateDocumentation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2_130(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying clients documentation is available: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "softwareUpdate:didUpdateDocumentationAvailable:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __39__HMSoftwareUpdate_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateState : %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "softwareUpdate:didUpdateState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __71__HMSoftwareUpdate__requestNeedsAttentionReasonsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v11;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@needsAttentionReasonsRequest failed: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("needsAttention"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        HMSoftwareUpdateNeedsAttentionReasonsToString(objc_msgSend(v12, "integerValue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "integerValue"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@needsAttentionReasons set to %@ (%@)", (uint8_t *)&v23, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(*(id *)(a1 + 32), "setNeedsAttentionReasons:", objc_msgSend(v12, "integerValue"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Missing needsAttentionReasons from message response payload: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      v21 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v22, 0);

    }
  }

}

void __63__HMSoftwareUpdate__handleUpdatedNeedsAttentionReasonsMessage___block_invoke(id *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
    objc_msgSend(a1[4], "softwareUpdate:didUpdateNeedsAttentionReasons:", WeakRetained, objc_msgSend(a1[5], "integerValue"));

}

uint64_t __68__HMSoftwareUpdate_fetchNeedsAttentionReasonsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestNeedsAttentionReasonsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__HMSoftwareUpdate__handleUpdatedDocumentation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "softwareUpdate:didUpdateDocumentation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __40__HMSoftwareUpdate_requestDocumentation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Requesting documentation", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(*(id *)(a1 + 32), "messageDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageWithName:destination:payload:", CFSTR("HMSU.rd"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__HMSoftwareUpdate_requestDocumentation__block_invoke_118;
  v10[3] = &unk_1E3AB47E0;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v8, "setResponseHandler:", v10);
  objc_msgSend(*(id *)(a1 + 40), "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendMessage:completionHandler:", v8, 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

void __40__HMSoftwareUpdate_requestDocumentation__block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    if (objc_msgSend(v5, "isHMError") && objc_msgSend(v5, "code") == 3201)
    {
      objc_msgSend(v6, "hmf_dateForKey:", CFSTR("nextPermittedRequestDocumentationDate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setNextPermittedRequestDocumentationDate:", v8);

    }
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v12;
      v20 = 2112;
      v21 = v5;
      v13 = "%{public}@Failed to request documentation with error: %@";
      v14 = v11;
      v15 = OS_LOG_TYPE_DEFAULT;
      v16 = 22;
LABEL_9:
      _os_log_impl(&dword_19B1B0000, v14, v15, v13, (uint8_t *)&v18, v16);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = WeakRetained;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v12;
      v13 = "%{public}@Successfully requested documentation";
      v14 = v11;
      v15 = OS_LOG_TYPE_INFO;
      v16 = 12;
      goto LABEL_9;
    }
  }

  objc_autoreleasePoolPop(v9);
}

void __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;
  const __CFString *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = WeakRetained;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[4];
    *(_DWORD *)buf = 138543618;
    v39 = v7;
    v40 = 2112;
    v41 = v8;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating documentation metadata: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(v5, "messageDestination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = CFSTR("metadata");
  v11 = a1[4];
  if (v11)
    encodeRootObject(v11);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageWithName:destination:payload:", CFSTR("HMSU.dm"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke_117;
  aBlock[3] = &unk_1E3AB5538;
  objc_copyWeak(&v35, v2);
  v33 = a1[4];
  v34 = a1[6];
  v16 = _Block_copy(aBlock);
  objc_msgSend(v5, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pendingRequests");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = _Block_copy(v16);
  objc_msgSend(v18, "addCompletionBlock:forIdentifier:", v20, v19);

  v25 = v15;
  v26 = 3221225472;
  v27 = __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke_2;
  v28 = &unk_1E3AB60C8;
  v21 = v18;
  v29 = v21;
  v22 = v19;
  v30 = v22;
  v23 = v16;
  v31 = v23;
  objc_msgSend(v14, "setResponseHandler:", &v25);
  objc_msgSend(a1[5], "messageDispatcher", v25, v26, v27, v28);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendMessage:completionHandler:", v14, 0);

  objc_destroyWeak(&v35);
}

void __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke_117(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v8 = WeakRetained;
  if (!v4)
  {
    objc_msgSend(WeakRetained, "setDocumentationMetadata:", *(_QWORD *)(a1 + 32));
    WeakRetained = v8;
  }
  objc_msgSend(WeakRetained, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __66__HMSoftwareUpdate_updateDocumentationMetadata_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __56__HMSoftwareUpdate__handleUpdatedDocumentationMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "softwareUpdate:didUpdateDocumentationAvailable:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33[2];
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = *(_QWORD *)(a1 + 56);
    if (v7 > 5)
      v8 = CFSTR("unknown");
    else
      v8 = off_1E3AAF968[v7];
    *(_DWORD *)buf = 138543618;
    v37 = v5;
    v38 = 2112;
    v39 = v8;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating state to '%@'", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v34 = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D285F8];
  objc_msgSend(*(id *)(a1 + 32), "messageDestination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageWithName:destination:payload:", CFSTR("HMSU.us"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke_107;
  aBlock[3] = &unk_1E3AAF8A8;
  objc_copyWeak(v33, (id *)buf);
  v33[1] = *(id *)(a1 + 56);
  v32 = *(id *)(a1 + 48);
  v15 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pendingRequests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _Block_copy(v15);
  objc_msgSend(v17, "addCompletionBlock:forIdentifier:", v19, v18);

  v24 = v14;
  v25 = 3221225472;
  v26 = __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke_109;
  v27 = &unk_1E3AB60C8;
  v20 = v17;
  v28 = v20;
  v21 = v18;
  v29 = v21;
  v22 = v15;
  v30 = v22;
  objc_msgSend(v13, "setResponseHandler:", &v24);
  objc_msgSend(*(id *)(a1 + 40), "messageDispatcher", v24, v25, v26, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:completionHandler:", v13, 0);

  objc_destroyWeak(v33);
  objc_destroyWeak((id *)buf);

}

void __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke_107(uint64_t a1, void *a2)
{
  __CFString *v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = (uint64_t)v9;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to updated state with error: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = *(_QWORD *)(a1 + 48);
      if (v12 > 5)
        v13 = CFSTR("unknown");
      else
        v13 = off_1E3AAF968[v12];
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated state to '%@'", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v6, "setState:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(v6, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegateCaller");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "callCompletion:error:", *(_QWORD *)(a1 + 32), v3);

}

void __50__HMSoftwareUpdate_updateState_completionHandler___block_invoke_109(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "removeCompletionBlockForIdentifier:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __40__HMSoftwareUpdate__handleUpdatedState___block_invoke(id *a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
    objc_msgSend(a1[4], "softwareUpdate:didUpdateState:", WeakRetained, objc_msgSend(a1[5], "integerValue"));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t52 != -1)
    dispatch_once(&logCategory__hmf_once_t52, &__block_literal_global_133);
  return (id)logCategory__hmf_once_v53;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __31__HMSoftwareUpdate_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v53;
  logCategory__hmf_once_v53 = v0;

}

@end
