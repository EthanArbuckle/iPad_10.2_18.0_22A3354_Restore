@implementation HMDSoftwareUpdate

- (HMDSoftwareUpdate)initWithModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDSoftwareUpdate *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSUUID *identifier;
  HMDSoftwareUpdate *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "softwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "displayableSoftwareVersion");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "softwareVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortVersionString");
      v6 = objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "softwareVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "downloadSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unsignedLongLongValue");
    objc_msgSend(v4, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "integerValue");
    objc_msgSend(v4, "installDuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (double)objc_msgSend(v11, "integerValue");
    objc_msgSend(v4, "documentationMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "releaseDate");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v6;
    v16 = (void *)v14;
    v29 = v15;
    v17 = -[HMDSoftwareUpdate initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", v8, v12);

    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x24BDD1880]);
      objc_msgSend(v4, "parentUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFSoftwareVersion versionString](v17->_version, "versionString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dataUsingEncoding:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v18, "initWithNamespace:data:", v19, v21);
      identifier = v17->_identifier;
      v17->_identifier = (NSUUID *)v22;

    }
    self = v17;

    v24 = self;
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Software version is required", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    v24 = 0;
  }

  return v24;
}

- (HMDSoftwareUpdate)initWithVersion:(id)a3 downloadSize:(unint64_t)a4 state:(int64_t)a5 installDuration:(double)a6 documentationMetadata:(id)a7 releaseDate:(id)a8
{
  return -[HMDSoftwareUpdate initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", a3, 0, a4, a5, a7, a8, a6);
}

- (HMDSoftwareUpdate)initWithVersion:(id)a3 displayableVersion:(id)a4 downloadSize:(unint64_t)a5 state:(int64_t)a6 installDuration:(double)a7 documentationMetadata:(id)a8 releaseDate:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  HMDSoftwareUpdate *v21;
  void *v22;
  unint64_t v23;
  id v24;
  const char *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *queue;
  uint64_t v29;
  NSString *displayableVersion;
  uint64_t v31;
  int64_t v33;
  id v34;
  id v35;
  objc_super v36;

  v17 = a3;
  v18 = a4;
  v19 = a8;
  v20 = a9;
  v36.receiver = self;
  v36.super_class = (Class)HMDSoftwareUpdate;
  v21 = -[HMDSoftwareUpdate init](&v36, sel_init);
  if (v21)
  {
    v33 = a6;
    v34 = v20;
    v22 = v17;
    v23 = a5;
    v35 = v19;
    HMDispatchQueueNameString();
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = (const char *)objc_msgSend(v24, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = dispatch_queue_create(v25, v26);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v27;

    objc_storeStrong((id *)&v21->_version, a3);
    if (v18)
    {
      objc_msgSend(v18, "hm_truncatedDisplayableVersionString");
      v29 = objc_claimAutoreleasedReturnValue();
      displayableVersion = v21->_displayableVersion;
      v21->_displayableVersion = (NSString *)v29;
      v17 = v22;
    }
    else
    {
      v17 = v22;
      objc_msgSend(v22, "shortVersionString");
      v31 = objc_claimAutoreleasedReturnValue();
      displayableVersion = v21->_displayableVersion;
      v21->_displayableVersion = (NSString *)v31;
    }

    v21->_state = v33;
    v21->_downloadSize = v23;
    v21->_installDuration = a7;
    objc_storeStrong((id *)&v21->_documentationMetadata, a8);
    v21->_updateType = 0;
    objc_storeStrong((id *)&v21->_releaseDate, a9);
    v20 = v34;
    v19 = v35;
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HMDSoftwareUpdate documentationMetadata](self, "documentationMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[HMDSoftwareUpdate hasRegisteredDocumentationMetadata](self, "hasRegisteredDocumentationMetadata"))
  {
    +[HMDSoftwareUpdateDocumentationManager sharedManager](HMDSoftwareUpdateDocumentationManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterDocumentationMetadata:", v3);

  }
  v5.receiver = self;
  v5.super_class = (Class)HMDSoftwareUpdate;
  -[HMDSoftwareUpdate dealloc](&v5, sel_dealloc);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDSoftwareUpdate version](self, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDSoftwareUpdate *v4;
  HMDSoftwareUpdate *v5;
  HMDSoftwareUpdate *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDSoftwareUpdate *)a3;
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
      -[HMDSoftwareUpdate version](self, "version");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdate version](v6, "version");
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

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HMDSoftwareUpdate releaseDate](self, "releaseDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[HMDSoftwareUpdate version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "versionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdate displayableVersion](self, "displayableVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdate state](self, "state");
  HMSoftwareUpdateStateToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdate downloadSize](self, "downloadSize");
  NSLocalizedFileSizeDescription();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdate updateType](self, "updateType");
  HMSoftwareUpdateUpdateTypeToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(", Version = %@, Displayable Version = %@, State = %@, Download Size = %@, Release Date = %@, Update Type = %@"), v6, v7, v8, v9, v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)configureWithAccessory:(id)a3 dataSource:(id)a4 messageDispatcher:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  HMDSoftwareUpdate *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v21;
      v22 = "%{public}@Missing data source";
LABEL_15:
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v32, 0xCu);

    }
LABEL_16:

    objc_autoreleasePoolPop(v18);
    goto LABEL_28;
  }
  if (!v8)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v21;
      v22 = "%{public}@Missing accessory for update";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  -[HMDSoftwareUpdate setDataSource:](self, "setDataSource:", v9);
  -[HMDSoftwareUpdate setAccessory:](self, "setAccessory:", v8);
  v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;
  v14 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v13)
  {
    v17 = 1;
  }
  else if (v16)
  {
    if (objc_msgSend(v16, "isAppleAccessory"))
      v17 = 2;
    else
      v17 = 3;
  }
  else
  {
    v17 = 0;
  }

  -[HMDSoftwareUpdate setUpdateType:](self, "setUpdateType:", v17);
  -[HMDSoftwareUpdate identifier](self, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v24 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v14, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSoftwareUpdate version](self, "version");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "versionString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dataUsingEncoding:", 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v24, "initWithNamespace:data:", v25, v28);
    -[HMDSoftwareUpdate setIdentifier:](self, "setIdentifier:", v29);

  }
  if (v10)
  {
    -[HMDSoftwareUpdate setMessageDispatcher:](self, "setMessageDispatcher:", v10);
    -[HMDSoftwareUpdate identifier](self, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      -[HMDSoftwareUpdate registerForMessages](self, "registerForMessages");
  }
  -[HMDSoftwareUpdate setHasRegisteredDocumentationMetadata:](self, "setHasRegisteredDocumentationMetadata:", 1);
  -[HMDSoftwareUpdate documentationMetadata](self, "documentationMetadata");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  __registerDocumentationMetadata(self, v31);

LABEL_28:
}

- (void)invalidate
{
  id v3;

  -[HMDSoftwareUpdate documentationMetadata](self, "documentationMetadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  __unregisterDocumentationMetadata(self, v3);

}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  -[HMDSoftwareUpdate accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdate messageDispatcher](self, "messageDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isCurrentAccessory") & 1) != 0 || objc_msgSend(v3, "supportsFirmwareUpdate"))
  {
    v13[0] = v6;
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6EE0], self, v9, sel__handleUpdateState_);
    objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6ED8], self, v9, sel__handleUpdateDocumentationMetadata_);

  }
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6EB0], self, v11, sel__handleDocumentationRequest_);
  objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD6EB8], self, v11, sel__handleNeedsAttentionReasonsRequest_);

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
  id v7;

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
    -[HMDSoftwareUpdate accessory](self, "accessory");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reevaluateAccessoryInfo");

  }
}

- (void)updateLocalState:(int64_t)a3
{
  id v5;

  +[HMDBackingStoreTransactionOptions defaultLocalOptions](HMDBackingStoreTransactionOptions, "defaultLocalOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdate _updateState:message:options:](self, "_updateState:message:options:", a3, 0, v5);

}

- (void)_updateState:(int64_t)a3 message:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDSoftwareUpdate *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __CFString **v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMSoftwareUpdateStateToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSoftwareUpdate state](v11, "state");
    HMSoftwareUpdateStateToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543874;
    v29 = v13;
    v30 = 2112;
    v31 = v14;
    v32 = 2112;
    v33 = v15;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updating state: %@ from current state: %@", (uint8_t *)&v28, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  if (a3 == 3 && !-[HMDSoftwareUpdate allowExtraUpdate](v11, "allowExtraUpdate"))
    -[HMDSoftwareUpdate setAllowExtraUpdate:](v11, "setAllowExtraUpdate:", 1);
  if (-[HMDSoftwareUpdate state](v11, "state") == a3 && !-[HMDSoftwareUpdate allowExtraUpdate](v11, "allowExtraUpdate"))
  {
    objc_msgSend(v8, "responseHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      goto LABEL_20;
    objc_msgSend(v8, "responseHandler");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, 0);
  }
  else
  {
    -[HMDSoftwareUpdate transactionWithObjectChangeType:](v11, "transactionWithObjectChangeType:", 2);
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setState:", v17);

    -[HMDSoftwareUpdate accessory](v11, "accessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;
    if (v20 && (objc_msgSend(v18, "isCurrentAccessory") & 1) != 0)
      v21 = &HMDAppleMediaAccessorySoftwareUpdateLabel;
    else
      v21 = &HMDAccessorySoftwareUpdateLabel;
    v22 = *v21;

    objc_msgSend(v18, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "backingStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transaction:options:", v22, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "add:withMessage:", v16, v8);
    objc_msgSend(v25, "run");
    v26 = -[HMDSoftwareUpdate allowExtraUpdate](v11, "allowExtraUpdate");
    if (a3 != 3 && v26)
      -[HMDSoftwareUpdate setAllowExtraUpdate:](v11, "setAllowExtraUpdate:", 0);

  }
LABEL_20:

}

- (void)_handleUpdateState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  HMDSoftwareUpdate *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMDSoftwareUpdate *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  int v23;
  void *v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__shouldAcceptMessage(self, v4))
  {
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD6EC8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = objc_msgSend(v5, "integerValue");
      if (v7 < 6)
      {
        +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSoftwareUpdate _updateState:message:options:](self, "_updateState:message:options:", v7, v4, v8);
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v20;
        v25 = 2048;
        v26 = v7;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid state: %ld", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(v4, "responseHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_15;
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = 43;
    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v12;
        v25 = 2112;
        v26 = (unint64_t)v13;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Missing state from message payload: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v4, "responseHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_15;
      v15 = (void *)MEMORY[0x24BDD1540];
      v16 = 3;
    }
    objc_msgSend(v15, "hmErrorWithCode:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v8, 0);

    goto LABEL_14;
  }
LABEL_16:

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
  id v5;
  HMSoftwareUpdateDocumentationMetadata *v6;
  NSObject *queue;
  _QWORD block[5];
  id v9;
  HMSoftwareUpdateDocumentationMetadata *v10;

  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = self->_documentationMetadata;
  if ((HMFEqualObjects() & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_documentationMetadata, a3);
    os_unfair_lock_unlock(&self->_lock);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__HMDSoftwareUpdate_setDocumentationMetadata___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = self;
    v9 = v5;
    v10 = v6;
    dispatch_async(queue, block);

  }
}

- (BOOL)hasRegisteredDocumentationMetadata
{
  HMDSoftwareUpdate *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasRegisteredDocumentationMetadata;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasRegisteredDocumentationMetadata:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasRegisteredDocumentationMetadata = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_handleUpdateDocumentationMetadata:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  HMDSoftwareUpdate *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  HMDSoftwareUpdate *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  void *v32;
  HMDSoftwareUpdate *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(_QWORD, _QWORD, _QWORD);
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__shouldAcceptMessage(self, v4))
  {
    v5 = *MEMORY[0x24BDD6E38];
    objc_msgSend(v4, "nullForKey:", *MEMORY[0x24BDD6E38]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = 0;
      goto LABEL_4;
    }
    objc_msgSend(v4, "dataForKey:", v5);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))v22;
      v39 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v22, &v39);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v39;
      v24 = v23;
      if (v7)
      {

LABEL_4:
        v8 = (void *)MEMORY[0x227676638]();
        v9 = self;
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v11;
          v42 = 2112;
          v43 = v7;
          _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Updating with documentation metadata: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v8);
        -[HMDSoftwareUpdate documentationMetadata](v9, "documentationMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = HMFEqualObjects();

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v4, "responseHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
LABEL_24:

            goto LABEL_25;
          }
          objc_msgSend(v4, "responseHandler");
          v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v15[2](v15, 0, 0);
        }
        else
        {
          -[HMDSoftwareUpdate transactionWithObjectChangeType:](v9, "transactionWithObjectChangeType:", 2);
          v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDocumentationMetadata:", v7);
          -[HMDSoftwareUpdate accessory](v9, "accessory");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "home");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "backingStore");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDBackingStoreTransactionOptions defaultPreferencesOptions](HMDBackingStoreTransactionOptions, "defaultPreferencesOptions");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "transaction:options:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "add:withMessage:", v15, v4);
          objc_msgSend(v21, "run");

        }
LABEL_23:

        goto LABEL_24;
      }
      v32 = (void *)MEMORY[0x227676638]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v35;
        v42 = 2112;
        v43 = v24;
        _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update documentation metadata from metadata data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      objc_msgSend(v4, "responseHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v38 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v38)[2](v38, v37, 0);

      }
    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v28;
        v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Missing documentation metadata from message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(v4, "responseHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        v7 = 0;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "responseHandler");
      v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v31[2](v31, v15, 0);

    }
    v7 = 0;
    goto LABEL_23;
  }
LABEL_25:

}

- (void)_handleDocumentationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void (*v10)(void);
  void *v11;
  HMDSoftwareUpdate *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDSoftwareUpdate *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDSoftwareUpdate documentationMetadata](self, "documentationMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[HMDSoftwareUpdateDocumentationManager sharedManager](HMDSoftwareUpdateDocumentationManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetForDocumentationMetadata:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Missing asset", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v4, "responseHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v21)[2](v21, v20, 0);

        v7 = 0;
      }
      goto LABEL_17;
    }
    if (objc_msgSend(v7, "state") <= 1 && (objc_msgSend(v7, "isDownloadPermitted") & 1) == 0)
    {
      objc_msgSend(v7, "nextPermittedDownloadDate", *MEMORY[0x24BDD6EA0]);
      v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v25 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3201);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:error:", v22, v23);

      goto LABEL_12;
    }
    objc_msgSend(v7, "startCaching");
    objc_msgSend(v4, "responseHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(v4, "responseHandler");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v10 = (void (*)(void))v9[2];
LABEL_11:
    v10();
LABEL_12:

    goto LABEL_17;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot get documentation without documentation metadata", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v4, "responseHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v10 = (void (*)(void))v9[2];
    goto LABEL_11;
  }
LABEL_18:

}

- (void)_handleDocumentationStateNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDSoftwareUpdate *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMDSoftwareUpdate__handleDocumentationStateNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

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
  if (self->_updateType != a3)
    self->_updateType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)needsAttentionReasons
{
  os_unfair_lock_s *p_lock;
  unint64_t needsAttentionReasons;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  needsAttentionReasons = self->_needsAttentionReasons;
  os_unfair_lock_unlock(p_lock);
  return needsAttentionReasons;
}

- (void)setNeedsAttentionReasons:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  HMDSoftwareUpdate *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDSoftwareUpdate *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_needsAttentionReasons == a3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_needsAttentionReasons = a3;
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMSoftwareUpdateNeedsAttentionReasonsToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@NeedsAttentionReasons updated to %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v29 = *MEMORY[0x24BDD6E90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x24BE3F1B8]);
    -[HMDSoftwareUpdate identifier](v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithTarget:", v14);

    v16 = (void *)*MEMORY[0x24BDD6E88];
    objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", *MEMORY[0x24BDD6E88], v15, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v7;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v21;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Sending message %@ to %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDSoftwareUpdate messageDispatcher](v19, "messageDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendMessage:completionHandler:", v17, 0);

  }
}

- (void)_handleNeedsAttentionReasonsRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDSoftwareUpdate *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "responseHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v21 = *MEMORY[0x24BDD6E90];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDSoftwareUpdate needsAttentionReasons](self, "needsAttentionReasons"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x24BDD6EB8];
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending %@ reply with payload %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v4, "responseHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v7, "copy");
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v14);

  }
}

- (NSDate)releaseDate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSDate copy](self->_releaseDate, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDate *)v4;
}

- (void)setReleaseDate:(id)a3
{
  NSDate *v4;
  NSDate *releaseDate;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  if (!-[NSDate isEqualToDate:](self->_releaseDate, "isEqualToDate:", v6))
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    releaseDate = self->_releaseDate;
    self->_releaseDate = v4;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (HMDSoftwareUpdateModel)model
{
  void *v3;
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

  -[HMDSoftwareUpdate transactionWithObjectChangeType:](self, "transactionWithObjectChangeType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdate version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSoftwareVersion:", v4);

  -[HMDSoftwareUpdate displayableVersion](self, "displayableVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayableSoftwareVersion:", v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDSoftwareUpdate state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setState:", v6);

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[HMDSoftwareUpdate installDuration](self, "installDuration");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInstallDuration:", v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[HMDSoftwareUpdate downloadSize](self, "downloadSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDownloadSize:", v9);

  -[HMDSoftwareUpdate releaseDate](self, "releaseDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReleaseDate:", v10);

  -[HMDSoftwareUpdate documentationMetadata](self, "documentationMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDSoftwareUpdate documentationMetadata](self, "documentationMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setDocumentationMetadata:", v13);

  }
  return (HMDSoftwareUpdateModel *)v3;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HMDSoftwareUpdate accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdate transactionWithObjectChangeType:forAccessoryUUID:](self, "transactionWithObjectChangeType:forAccessoryUUID:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3 forAccessoryUUID:(id)a4
{
  HMDSoftwareUpdateModel *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDSoftwareUpdateModel *v10;

  v6 = [HMDSoftwareUpdateModel alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSoftwareUpdate accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", a3, v7, v9);

  return v10;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  HMDSoftwareUpdate *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDSoftwareUpdate *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  HMDSoftwareUpdate *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  uint64_t v38;
  HMDSoftwareUpdate *v39;
  void *v40;
  HMDSoftwareUpdate *v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  HMDSoftwareUpdate *v47;
  void *v48;
  void (**v49)(_QWORD, _QWORD, _QWORD);
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  HMDSoftwareUpdate *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void (**v67)(_QWORD, _QWORD, _QWORD);
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  HMDSoftwareUpdate *v77;
  HMDSoftwareUpdate *v78;
  HMDSoftwareUpdate *v79;
  void *v80;
  _BYTE buf[12];
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  _QWORD v86[2];

  v86[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v14 = self;
    v15 = v13;
    v16 = v10;
    objc_msgSend(v16, "transactionResult");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v15, "state");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "unsignedIntegerValue");

      if (v19 != -[HMDSoftwareUpdate state](v14, "state"))
      {
        v71 = v10;
        v74 = v8;
        v20 = (void *)MEMORY[0x227676638]();
        v77 = v14;
        v21 = v14;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          HMSoftwareUpdateStateToString();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v23;
          v82 = 2112;
          v83 = v24;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating state: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        -[HMDSoftwareUpdate setState:](v21, "setState:", v19);
        v25 = (void *)MEMORY[0x24BE3F1D0];
        v26 = *MEMORY[0x24BDD6EE0];
        v27 = v21;
        objc_msgSend(v16, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v86[0] = *MEMORY[0x24BDD6EC8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDSoftwareUpdate state](v27, "state"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v29;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v86, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "entitledMessageWithName:identifier:messagePayload:", v26, v28, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDSoftwareUpdate messageDestination](v27, "messageDestination");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "setDestination:", v32);
        v33 = (void *)objc_msgSend(v31, "copy");

        -[HMDSoftwareUpdate messageDispatcher](v27, "messageDispatcher");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "sendMessage:completionHandler:", v33, 0);

        objc_msgSend(v80, "markChanged");
        v10 = v71;
        v8 = v74;
        v14 = v77;
      }
    }
    if (objc_msgSend(v15, "propertyWasSet:", CFSTR("documentationMetadata")))
    {
      objc_msgSend(v15, "documentationMetadata");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdate documentationMetadata](v14, "documentationMetadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = HMFEqualObjects();

      if ((v37 & 1) == 0)
      {
        v75 = v8;
        v38 = MEMORY[0x227676638]();
        v39 = v14;
        v40 = (void *)v38;
        v78 = v39;
        v41 = v39;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = v10;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v44;
          v82 = 2112;
          v83 = v35;
          _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Updating documentation metadata: %@", buf, 0x16u);

          v10 = v43;
        }

        objc_autoreleasePoolPop(v40);
        -[HMDSoftwareUpdate setDocumentationMetadata:](v41, "setDocumentationMetadata:", v35);
        v45 = v35;
        v46 = (void *)MEMORY[0x24BE3F1D0];
        v68 = *MEMORY[0x24BDD6ED8];
        v47 = v41;
        objc_msgSend(v16, "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v86[0] = *MEMORY[0x24BDD6E38];
        v70 = v45;
        v72 = v10;
        if (v45)
          encodeRootObjectForIncomingXPCMessage(v45, 0);
        else
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v51;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v86, 1, v68);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "entitledMessageWithName:identifier:messagePayload:", v69, v48, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDSoftwareUpdate messageDestination](v47, "messageDestination");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v53, "setDestination:", v54);
        v55 = (void *)objc_msgSend(v53, "copy");

        -[HMDSoftwareUpdate messageDispatcher](v47, "messageDispatcher");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "sendMessage:completionHandler:", v55, 0);

        objc_msgSend(v80, "markChanged");
        v10 = v72;
        v8 = v75;
        v14 = v78;
      }

    }
    objc_msgSend(v15, "releaseDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v15, "releaseDate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSoftwareUpdate releaseDate](v14, "releaseDate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqualToDate:", v59);

      if ((v60 & 1) == 0)
      {
        v61 = (void *)MEMORY[0x227676638]();
        v79 = v14;
        v62 = v14;
        HMFGetOSLogHandle();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v73 = v10;
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDSoftwareUpdate releaseDate](v62, "releaseDate");
          v76 = v8;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v64;
          v82 = 2112;
          v83 = v65;
          v84 = 2112;
          v85 = v58;
          _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_INFO, "%{public}@Updating releaseDate from %@ to %@", buf, 0x20u);

          v8 = v76;
          v10 = v73;
        }

        objc_autoreleasePoolPop(v61);
        -[HMDSoftwareUpdate setReleaseDate:](v62, "setReleaseDate:", v58);
        objc_msgSend(v80, "markChanged");
        v14 = v79;
      }

    }
    objc_msgSend(v16, "responseHandler");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_msgSend(v16, "responseHandler");
      v67 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v67[2](v67, 0, 0);

    }
  }
  else
  {
    objc_msgSend(v10, "responseHandler");
    v49 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v49)[2](v49, v50, 0);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDSoftwareUpdate identifier](self, "identifier");
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

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDSoftwareUpdate messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  return self->_queue;
}

- (HMDSoftwareUpdate)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  HMDSoftwareUpdate *v12;
  uint64_t v13;
  NSUUID *identifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6EF8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6E18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "shortVersionString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", *MEMORY[0x24BDD6E48]);
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", *MEMORY[0x24BDD6EC0]);
  v9 = (double)objc_msgSend(v4, "decodeIntegerForKey:", *MEMORY[0x24BDD6E58]);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6E30]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6EA8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDSoftwareUpdate initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](self, "initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", v5, v6, v7, v8, v10, v11, v9);
  if (v12)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD6E50]);
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  unint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[HMDSoftwareUpdate identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v4, *MEMORY[0x24BDD6E50]);

  -[HMDSoftwareUpdate version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, *MEMORY[0x24BDD6EF8]);

  -[HMDSoftwareUpdate displayableVersion](self, "displayableVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, *MEMORY[0x24BDD6E18]);

  v7 = -[HMDSoftwareUpdate state](self, "state");
  objc_msgSend(v17, "encodeInteger:forKey:", v7, *MEMORY[0x24BDD6EC0]);
  v8 = -[HMDSoftwareUpdate downloadSize](self, "downloadSize");
  objc_msgSend(v17, "encodeInt64:forKey:", v8, *MEMORY[0x24BDD6E48]);
  -[HMDSoftwareUpdate installDuration](self, "installDuration");
  objc_msgSend(v17, "encodeInteger:forKey:", (uint64_t)v9, *MEMORY[0x24BDD6E58]);
  -[HMDSoftwareUpdate documentationMetadata](self, "documentationMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v10, *MEMORY[0x24BDD6E30]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDSoftwareUpdate updateType](self, "updateType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v11, *MEMORY[0x24BDD6EE8]);

  -[HMDSoftwareUpdate releaseDate](self, "releaseDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v12, *MEMORY[0x24BDD6EA8]);

  if (objc_msgSend(v17, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    +[HMDSoftwareUpdateDocumentationManager sharedManager](HMDSoftwareUpdateDocumentationManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSoftwareUpdate documentationMetadata](self, "documentationMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetForDocumentationMetadata:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "documentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v16, *MEMORY[0x24BDD6E20]);

  }
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (HMFSoftwareVersion)version
{
  return (HMFSoftwareVersion *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)displayableVersion
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (double)installDuration
{
  return self->_installDuration;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setMessageDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_messageDispatcher, a3);
}

- (BOOL)allowExtraUpdate
{
  return self->_allowExtraUpdate;
}

- (void)setAllowExtraUpdate:(BOOL)a3
{
  self->_allowExtraUpdate = a3;
}

- (HMDSoftwareUpdateDataSource)dataSource
{
  return (HMDSoftwareUpdateDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_displayableVersion, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_documentationMetadata, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __59__HMDSoftwareUpdate__handleDocumentationStateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "documentationMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_numberForKey:", CFSTR("state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v9, "integerValue") == 4)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v13;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification documentation is available, notifying clients", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("SUDocumentation"));
      objc_msgSend(v4, "documentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v24 = *MEMORY[0x24BDD6E28];
        encodeRootObjectForIncomingXPCMessage(v15, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE3F1D0], "entitledMessageWithName:messagePayload:", *MEMORY[0x24BDD6E40], v18, v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "messageDestination");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setDestination:", v20);

        objc_msgSend(*(id *)(a1 + 40), "messageDispatcher");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sendMessage:completionHandler:", v19, 0);

        objc_msgSend(*(id *)(a1 + 40), "dataSource");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("SoftwareUpdateDocumentationCached"), v23, 0);

      }
    }

  }
}

void __46__HMDSoftwareUpdate_setDocumentationMetadata___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[5];
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Updated documentation metadata: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = a1[4];
  if (a1[5])
  {
    objc_msgSend(v7, "setHasRegisteredDocumentationMetadata:", 1);
    __registerDocumentationMetadata(a1[4], a1[5]);
  }
  else
  {
    __unregisterDocumentationMetadata(v7, a1[6]);
    objc_msgSend(a1[4], "setHasRegisteredDocumentationMetadata:", 0);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t40 != -1)
    dispatch_once(&logCategory__hmf_once_t40, &__block_literal_global_117709);
  return (id)logCategory__hmf_once_v41;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __32__HMDSoftwareUpdate_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v41;
  logCategory__hmf_once_v41 = v0;

}

@end
