@implementation HMDHAPAccessoryTaskContext

- (HMDHAPAccessoryTaskContext)initWithIdentifier:(id)a3 operationType:(int64_t)a4 home:(id)a5 sourceType:(unint64_t)a6 requestMessage:(id)a7 name:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMDHAPAccessoryTaskContext *v19;
  HMDHAPAccessoryTaskContext *v20;
  uint64_t v21;
  HMFActivity *activity;
  objc_super v24;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDHAPAccessoryTaskContext;
  v19 = -[HMDHAPAccessoryTaskContext init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_home, v16);
    objc_storeStrong((id *)&v20->_identifier, a3);
    v20->_operationType = a4;
    v20->_sourceType = a6;
    objc_storeStrong((id *)&v20->_requestMessage, a7);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", v18);
    activity = v20->_activity;
    v20->_activity = (HMFActivity *)v21;

    -[HMFActivity begin](v20->_activity, "begin");
  }

  return v20;
}

- (id)operationName
{
  if (-[HMDHAPAccessoryTaskContext operationType](self, "operationType"))
    return CFSTR("write");
  else
    return CFSTR("read");
}

- (id)workQueue
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTaskContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)homeUniqueIdentifier
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTaskContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)homeMessageDestination
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTaskContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)requestMessageIdentifier
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)clientBundleIdentifier
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)qualityOfService
{
  void *v2;
  int64_t v3;

  -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "qualityOfService");

  return v3;
}

- (BOOL)isShortActionOperation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuidForKey:", CFSTR("kActionSetUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("kShortActionKey"));
  if (v4)
    v7 = 1;
  else
    v7 = v6;

  return v7;
}

- (BOOL)isRemoteAccessDeviceReachable
{
  void *v2;
  char v3;

  -[HMDHAPAccessoryTaskContext home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRemoteAccessDeviceReachable");

  return v3;
}

- (BOOL)supportsMultiPartResponse
{
  void *v2;
  char v3;
  BOOL v4;
  char v6;

  v6 = 0;
  -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:keyPresent:", CFSTR("kMultiPartResponseKey"), &v6);
  if (v6)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)requestMessageName
{
  void *v2;
  void *v3;

  -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isComplete
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)dispatchMessage:(id)a3 delegateDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HMDHAPAccessoryTaskContext home](self, "home");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTaskContext homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTaskContext workQueue](self, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "redispatchToResidentMessage:target:responseQueue:viaDevice:", v7, v8, v9, v6);

}

- (HMDUser)user
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDHAPAccessoryTaskContext home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v3)
    {
      -[HMDHAPAccessoryTaskContext requestMessage](self, "requestMessage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userForHome:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(v3, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (HMDUser *)v6;
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMFMessage)requestMessage
{
  return (HMFMessage *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_requestMessage, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
