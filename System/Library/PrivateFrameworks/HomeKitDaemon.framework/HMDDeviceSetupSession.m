@implementation HMDDeviceSetupSession

- (HMDDeviceSetupSession)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDDeviceSetupSession)initWithIdentifier:(id)a3 role:(int64_t)a4 homeManager:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  HMDDeviceSetupSession *v12;

  v8 = (void *)MEMORY[0x24BDBCF50];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDDeviceSetupSession initWithIdentifier:role:homeManager:upSecondsFactory:userDefaults:](self, "initWithIdentifier:role:homeManager:upSecondsFactory:userDefaults:", v10, a4, v9, &__block_literal_global_35213, v11);

  return v12;
}

- (HMDDeviceSetupSession)initWithIdentifier:(id)a3 role:(int64_t)a4 homeManager:(id)a5 upSecondsFactory:(id)a6 userDefaults:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMDDeviceSetupSession *v16;
  HMDDeviceSetupSession *v17;
  uint64_t v18;
  NSUUID *identifier;
  id v20;
  const char *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *clientQueue;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  HMFActivity *activity;
  void *v32;
  id upSecondsFactory;
  HMDDeviceSetupServerSession *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  HMDDeviceSetupSession *v39;
  HMDDeviceSetupSessionInternal *internal;
  uint64_t (**v41)(void);
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!v12)
  {
    v35 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v37;
      v38 = "%{public}@Identifier is a required parameter";
LABEL_10:
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, v38, buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v35);
    v39 = 0;
    goto LABEL_15;
  }
  if (!v13)
  {
    v35 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v37;
      v38 = "%{public}@Home manager is a required parameter";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v43.receiver = self;
  v43.super_class = (Class)HMDDeviceSetupSession;
  v16 = -[HMDDeviceSetupSession init](&v43, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_lock._os_unfair_lock_opaque = 0;
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSUUID *)v18;

    objc_storeWeak((id *)&v17->_homeManager, v13);
    HMDispatchQueueNameString();
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend(v20, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create(v21, v22);
    clientQueue = v17->_clientQueue;
    v17->_clientQueue = (OS_dispatch_queue *)v23;

    v25 = objc_alloc(MEMORY[0x24BE3F138]);
    v26 = (void *)MEMORY[0x24BDD17C8];
    -[NSUUID UUIDString](v17->_identifier, "UUIDString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Device Setup Session (%@)"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setupActivity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v25, "initWithName:parent:", v28, v29);
    activity = v17->_activity;
    v17->_activity = (HMFActivity *)v30;

    v32 = _Block_copy(v14);
    upSecondsFactory = v17->_upSecondsFactory;
    v17->_upSecondsFactory = v32;

    if (a4)
      v34 = -[HMDDeviceSetupServerSession initWithHomeManager:userDefaults:]([HMDDeviceSetupServerSession alloc], "initWithHomeManager:userDefaults:", v13, v15);
    else
      v34 = -[HMDDeviceSetupClientSession initWithHomeManager:userDefaults:sessionIdentifier:]([HMDDeviceSetupClientSession alloc], "initWithHomeManager:userDefaults:sessionIdentifier:", v13, v15, v12);
    internal = v17->_internal;
    v17->_internal = &v34->super;

    -[HMDDeviceSetupSession upSecondsFactory](v17, "upSecondsFactory");
    v41 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v17->_startTime = v41[2]();

    -[HMDDeviceSetupSession __registerForMessages](v17, "__registerForMessages");
    -[HMDDeviceSetupSession open](v17, "open");
  }
  self = v17;
  v39 = self;
LABEL_15:

  return v39;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDDeviceSetupSession identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDDeviceSetupSession *v4;
  HMDDeviceSetupSession *v5;
  HMDDeviceSetupSession *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDDeviceSetupSession *)a3;
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
      -[HMDDeviceSetupSession identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDeviceSetupSession identifier](v6, "identifier");
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

- (int64_t)role
{
  void *v2;
  int64_t v3;

  -[HMDDeviceSetupSession internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "role");

  return v3;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDDeviceSetupSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (id)messageDispatcher
{
  void *v2;
  void *v3;

  -[HMDDeviceSetupSession homeManager](self, "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)__registerForMessages
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[HMDDeviceSetupSession messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDD5B60];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v5, self, v6, sel__handleClose_);

  v7 = *MEMORY[0x24BDD5B88];
  v9 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v7, self, v8, sel__handleReceiveData_);

}

- (void)open
{
  HMFActivity *v3;
  NSObject *v4;
  HMFActivity *v5;
  _QWORD v6[5];
  HMFActivity *v7;

  v3 = self->_activity;
  -[HMFActivity begin](v3, "begin");
  -[HMDDeviceSetupSession clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__HMDDeviceSetupSession_open__block_invoke;
  v6[3] = &unk_24E79C268;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)updateAccessoryUUIDAndNotifyDelegate:(id)a3 accessoryIDSIdentifier:(id)a4 accessoryCategory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock_with_options();
  if (v17)
  {
    -[HMDDeviceSetupSession accessoryUUID](self, "accessoryUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v17, "hmf_isEqualToUUID:", v10);

    v12 = (void *)objc_msgSend(v17, "copy");
    -[HMDDeviceSetupSession setAccessoryUUID:](self, "setAccessoryUUID:", v12);
    v13 = v11 ^ 1;

    if (!v8)
      goto LABEL_3;
LABEL_6:
    v14 = (void *)objc_msgSend(v8, "copy");
    -[HMDDeviceSetupSession setAccessoryIDSIdentifier:](self, "setAccessoryIDSIdentifier:", v14);

    if (!v9)
      goto LABEL_8;
    goto LABEL_7;
  }
  v13 = 0;
  if (v8)
    goto LABEL_6;
LABEL_3:
  if (v9)
  {
LABEL_7:
    v15 = (void *)objc_msgSend(v9, "copy");
    -[HMDDeviceSetupSession setAccessoryCategory:](self, "setAccessoryCategory:", v15);

  }
LABEL_8:
  os_unfair_lock_unlock(&self->_lock);
  if ((v13 & 1) != 0)
  {
    -[HMDDeviceSetupSession delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setupSession:didReceiveAccessoryWithUUID:", self, v17);

  }
}

- (void)_closeWithError:(id)a3
{
  id v4;
  void *v5;
  HMDDeviceSetupSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDDeviceSetupSession *v11;
  NSObject *v12;
  void *v13;
  HMFActivity *activity;
  void *v15;
  HMFActivity *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t (**v24)(void);
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDDeviceSetupSession *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceSetupSession isOpen](v6, "isOpen");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v8;
    v42 = 2112;
    v43 = v9;
    v44 = 2112;
    v45 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@CloseWithError: [isOpen: %@] [error: %@]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDDeviceSetupSession isOpen](v6, "isOpen"))
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v13;
      v42 = 2112;
      v43 = v4;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Closing the session with error:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMFActivity markWithReason:](v11->_activity, "markWithReason:", CFSTR("Closing"));
    activity = v11->_activity;
    v38 = CFSTR("errorCode");
    v15 = (void *)MEMORY[0x24BDD16E0];
    v16 = activity;
    objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v4, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v17;
    v18 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);

    -[HMFActivity markWithReason:](v11->_activity, "markWithReason:", CFSTR("HMDDeviceSetupSession.close"));
    -[HMDDeviceSetupSession setOpen:](v11, "setOpen:", 0);
    if (v4)
    {
      encodeRootObjectForIncomingXPCMessage(v4, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *MEMORY[0x24BDD5B70];
      v37 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HMDDeviceSetupSession internal](v11, "internal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        v20 = 0;
        goto LABEL_11;
      }
      -[HMDDeviceSetupSession internal](v11, "internal", *MEMORY[0x24BDD5B98]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_11:
    os_unfair_lock_lock_with_options();
    -[HMDDeviceSetupSession setSessionError:](v11, "setSessionError:", v4);
    -[HMDDeviceSetupSession upSecondsFactory](v11, "upSecondsFactory");
    v24 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    -[HMDDeviceSetupSession setEndTime:](v11, "setEndTime:", v24[2]());

    os_unfair_lock_unlock(&v11->_lock);
    objc_msgSend(MEMORY[0x24BE3F1B0], "entitledMessageWithName:messagePayload:", *MEMORY[0x24BDD5B60], v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceSetupSession messageDispatcher](v11, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceSetupSession messageDestination](v11, "messageDestination");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "target");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendMessage:target:", v25, v28);

    v29 = (void *)MEMORY[0x227676638]();
    v30 = v11;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v32;
      v42 = 2112;
      v43 = v4;
      v44 = 2112;
      v45 = v25;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Going to call the delegate with error:%@, Also sending the close message to client: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v29);
    -[HMDDeviceSetupSession delegate](v30, "delegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setupSession:didCloseWithError:", v30, v4);

  }
}

- (void)_handleClose:(id)a3
{
  id v4;
  void *v5;
  HMDDeviceSetupSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638](-[HMFActivity begin](self->_activity, "begin"));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceSetupSession isOpen](v6, "isOpen");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received close request : %@, [isOpen = %@]", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "errorForKey:", *MEMORY[0x24BDD5B70]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceSetupSession _closeWithError:](v6, "_closeWithError:", v10);
  objc_msgSend(v4, "respondWithPayload:", 0);
  -[HMFActivity end](self->_activity, "end");

}

- (void)close:(id)a3
{
  id v4;
  void *v5;
  HMDDeviceSetupSession *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Called to close session", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDDeviceSetupSession clientQueue](v6, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __31__HMDDeviceSetupSession_close___block_invoke;
  v11[3] = &unk_24E79C268;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)_handleReceiveData:(id)a3
{
  id v4;
  HMFActivity *activity;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  activity = self->_activity;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__HMDDeviceSetupSession__handleReceiveData___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HMFActivity performBlock:](activity, "performBlock:", v7);

}

- (void)_sendRequestData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDDeviceSetupSession *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMFActivity markWithReason:](self->_activity, "markWithReason:", CFSTR("Sending data"));
  -[HMFActivity markWithReason:](self->_activity, "markWithReason:", CFSTR("HMDDeviceSetupSession.sendRequestData"));
  v18 = *MEMORY[0x24BDD5B68];
  v19[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F1B0], "entitledMessageWithName:messagePayload:", *MEMORY[0x24BDD5B88], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceSetupSession messageDispatcher](self, "messageDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceSetupSession messageDestination](self, "messageDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendMessage:target:", v6, v9);

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v13;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Sending data : %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v10);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDDeviceSetupSession identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)setupTrackingInfo
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDDeviceSetupTrackingInfo *v12;
  HMDDeviceSetupTrackingInfo *v14;
  os_unfair_lock_t lock;
  void *v16;

  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v14 = [HMDDeviceSetupTrackingInfo alloc];
  -[HMDDeviceSetupSession identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v16, "copy");
  v4 = -[HMDDeviceSetupSession startTime](self, "startTime");
  v5 = -[HMDDeviceSetupSession endTime](self, "endTime");
  v6 = -[HMDDeviceSetupSession role](self, "role");
  -[HMDDeviceSetupSession accessoryUUID](self, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[HMDDeviceSetupSession accessoryCategory](self, "accessoryCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceSetupSession accessoryIDSIdentifier](self, "accessoryIDSIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDeviceSetupSession setupClientBundleID](self, "setupClientBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDDeviceSetupTrackingInfo initWithIdentifier:startTime:endTime:role:accessoryUUID:accessoryCategory:accessoryIDSIdentifier:setupClientBundleID:](v14, "initWithIdentifier:startTime:endTime:role:accessoryUUID:accessoryCategory:accessoryIDSIdentifier:setupClientBundleID:", v3, v4, v5, v6, v8, v9, v10, v11);

  os_unfair_lock_unlock(lock);
  return v12;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessoryUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (HMAccessoryCategory)accessoryCategory
{
  return (HMAccessoryCategory *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAccessoryCategory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)accessoryIDSIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccessoryIDSIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)setupClientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSetupClientBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (NSError)sessionError
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_endTime = a3;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (HMDDeviceSetupSessionDelegate)delegate
{
  return (HMDDeviceSetupSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMDDeviceSetupSessionInternal)internal
{
  return self->_internal;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (id)upSecondsFactory
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_upSecondsFactory, 0);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_sessionError, 0);
  objc_storeStrong((id *)&self->_setupClientBundleID, 0);
  objc_storeStrong((id *)&self->_accessoryIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

void __44__HMDDeviceSetupSession__handleReceiveData___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  os_unfair_lock_s *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *context;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "markWithReason:", CFSTR("Received data")));
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v44 = v5;
    v45 = 2112;
    v46 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received receive data request : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *MEMORY[0x24BDD5B68];
  objc_msgSend(*(id *)(a1 + 40), "dataForKey:", *MEMORY[0x24BDD5B68]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
    os_unfair_lock_lock_with_options();
    objc_msgSend(*(id *)(a1 + 40), "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSetupClientBundleID:", v10);

    os_unfair_lock_unlock(v9);
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v40 = 0;
    v37 = 0;
    v38 = 0;
    v12 = objc_msgSend(v11, "processSessionData:outAccessoryUUID:outAccessoryCategory:outAccessoryIDSIdentifier:error:", v8, &v40, &v39, &v38, &v37);
    v36 = v40;
    v13 = v39;
    v14 = v38;
    v15 = v37;

    if ((v12 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "updateAccessoryUUIDAndNotifyDelegate:accessoryIDSIdentifier:accessoryCategory:", v36, v14, v13);
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "sessionData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v41 = v7;
        v42 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(*(id *)(a1 + 40), "respondWithPayload:", v18);
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "state") == 3;

      if (v30)
      {
        context = (void *)MEMORY[0x227676638]();
        v31 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "isOpen");
          HMFBooleanToString();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v44 = v34;
          v45 = 2112;
          v46 = v33;
          _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Going to close the session as the state is now complete: [isOpen : %@]", buf, 0x16u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
      }

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v27;
        v45 = 2112;
        v46 = v15;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to process session data with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(*(id *)(a1 + 40), "responseHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
        goto LABEL_21;
      objc_msgSend(*(id *)(a1 + 40), "responseHandler");
      v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v18)[2](v18, v15, 0);
    }

LABEL_21:
    goto LABEL_22;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v22;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Missing session data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
  v23 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "respondWithError:", v15);
LABEL_22:

}

uint64_t __31__HMDDeviceSetupSession_close___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleClose:", *(_QWORD *)(a1 + 40));
}

void __29__HMDDeviceSetupSession_open__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("Opening")));
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Opening", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = *(void **)(a1 + 40);
  v46 = CFSTR("HomeManagerUUID");
  v8 = v7;
  objc_msgSend(v2, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HMDailyRotatedUUID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("no uuid");
  if (v11)
    v13 = (const __CFString *)v11;
  v47[0] = v13;
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);

  objc_msgSend(*(id *)(a1 + 40), "markWithReason:", CFSTR("HMDDeviceSetupSession.open"));
  objc_msgSend(*(id *)(a1 + 32), "setOpen:", 1);
  if (!objc_msgSend(*(id *)(a1 + 32), "role"))
  {
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = 0;
    v38 = 0;
    v39 = 0;
    v16 = objc_msgSend(v15, "processSessionData:outAccessoryUUID:outAccessoryCategory:outAccessoryIDSIdentifier:error:", 0, &v41, &v40, &v39, &v38);
    v17 = v41;
    v18 = v40;
    v19 = v39;
    v20 = v38;

    if ((v16 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "updateAccessoryUUIDAndNotifyDelegate:accessoryIDSIdentifier:accessoryCategory:", v17, v19, v18);
      objc_msgSend(*(id *)(a1 + 32), "internal");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "state");

      v23 = *(void **)(a1 + 32);
      if (v22 != 3)
      {
        objc_msgSend(v23, "internal");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "sessionData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(*(id *)(a1 + 32), "_sendRequestData:", v30);
          v28 = 0;
        }
        else
        {
          v31 = (void *)MEMORY[0x227676638]();
          v32 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v37 = v31;
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v43 = v34;
            _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Missing session data", buf, 0xCu);

            v31 = v37;
          }

          objc_autoreleasePoolPop(v31);
          v35 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 56);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_closeWithError:", v36);

          v28 = 1;
        }

LABEL_20:
        if (v28)
          goto LABEL_21;
        goto LABEL_6;
      }
      objc_msgSend(v23, "_closeWithError:", 0);
    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v27;
        v44 = 2112;
        v45 = v20;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send initial session data with error: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", v20);
      objc_msgSend(*(id *)(a1 + 32), "updateAccessoryUUIDAndNotifyDelegate:accessoryIDSIdentifier:accessoryCategory:", v17, v19, v18);
    }
    v28 = 1;
    goto LABEL_20;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 40), "end");
LABEL_21:

}

__uint64_t __61__HMDDeviceSetupSession_initWithIdentifier_role_homeManager___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
}

+ (BOOL)isRoleSupported:(int64_t)a3
{
  __objc2_class **v3;

  if (!a3)
  {
    v3 = off_24E762600;
    return -[__objc2_class isSupported](*v3, "isSupported");
  }
  if (a3 == 1)
  {
    v3 = off_24E762608;
    return -[__objc2_class isSupported](*v3, "isSupported");
  }
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_35218 != -1)
    dispatch_once(&logCategory__hmf_once_t19_35218, &__block_literal_global_60_35219);
  return (id)logCategory__hmf_once_v20_35220;
}

void __36__HMDDeviceSetupSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_35220;
  logCategory__hmf_once_v20_35220 = v0;

}

@end
