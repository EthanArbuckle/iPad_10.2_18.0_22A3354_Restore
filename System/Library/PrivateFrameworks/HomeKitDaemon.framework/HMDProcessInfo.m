@implementation HMDProcessInfo

- (id)attributeDescriptions
{
  id v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)HMDProcessInfo;
  -[HMFProcessInfo attributeDescriptions](&v21, sel_attributeDescriptions);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  v4 = -[HMDProcessInfo state](self, "state");
  if (v4 > 4)
    v5 = CFSTR("unknown");
  else
    v5 = off_24E78EF98[v4];
  v19 = v5;
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("State"), v19);
  v22[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDProcessInfo shouldMonitor](self, "shouldMonitor");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Monitored"), v8);
  v22[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDProcessInfo applicationInfo](self, "applicationInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:options:formatter:", CFSTR("Application"), v11, 1, 0);
  v22[2] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDProcessInfo connections](self, "connections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:options:formatter:", CFSTR("Connections"), v14, 1, 0);
  v22[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)_updateProcessState:(id)a3
{
  id v4;
  HMDProcessInfo *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  RBSProcessState *processState;
  id v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  id v17;
  void *v18;
  HMDProcessInfo *v19;
  NSObject *v20;
  void *v21;
  HMDProcessInfo *v22;
  void *v23;
  int v24;
  void *v25;
  char v26;
  void *v27;
  HMDProcessInfo *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  v6 = v4;
  if (v6 && -[HMDProcessInfo shouldMonitor](v5, "shouldMonitor"))
  {
    v7 = v6;
    switch(objc_msgSend(v7, "taskState"))
    {
      case 1u:

        v10 = 4;
        break;
      case 2u:
      case 4u:
        objc_msgSend(v7, "endowmentNamespaces");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", *MEMORY[0x24BE38348]);

        if ((v9 & 1) != 0)
        {
          v10 = 0;
          goto LABEL_11;
        }

        v12 = v7;
        v32 = 0;
        v33 = &v32;
        v34 = 0x2020000000;
        v35 = 0;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v37 = __Block_byref_object_copy__220030;
        v38 = __Block_byref_object_dispose__220031;
        v39 = 0;
        objc_msgSend(v12, "assertions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = ____RBSProcessStateHasForegroundAssertion_block_invoke;
        v31[3] = &unk_24E794518;
        v31[4] = &v32;
        v31[5] = buf;
        objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);

        if (*((_BYTE *)v33 + 24))
          v14 = *(void **)(*(_QWORD *)&buf[8] + 40);
        else
          v14 = 0;
        v15 = objc_retainAutorelease(v14);
        v16 = *((_BYTE *)v33 + 24) == 0;
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(&v32, 8);
        v17 = v15;
        if (v16)
        {
          v10 = 1;
        }
        else
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = v5;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v21;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v17;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Upgrading app state to foreground with reason: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v18);
          v10 = 0;
        }

        goto LABEL_21;
      case 3u:
        v10 = 3;
        goto LABEL_11;
      default:
        v10 = -1;
LABEL_11:

LABEL_21:
        if (!-[HMDProcessInfo isEntitledForSPIAccess](v5, "isEntitledForSPIAccess"))
          break;
        if (v10 != 1)
          goto LABEL_26;
        v22 = v5;
        objc_msgSend(v7, "assertions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "na_any:", &__block_literal_global_193_220033);

        if (v24)
        {

          goto LABEL_26;
        }
        -[HMFProcessInfo applicationIdentifier](v22, "applicationIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BDD6778]);

        if ((v26 & 1) != 0)
        {
LABEL_26:
          if (v10 == -1)
            v10 = 0;
          break;
        }
        v27 = (void *)MEMORY[0x227676638]();
        v28 = v22;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v7;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Upgrading app state to foreground as the client (%@) has SPI access and is background running", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v27);
        v10 = 2;
        break;
    }
  }
  else
  {
    v10 = -1;
  }

  os_unfair_lock_lock_with_options();
  processState = v5->_processState;
  v5->_processState = (RBSProcessState *)v6;

  os_unfair_lock_unlock(&v5->_lock.lock);
  -[HMDProcessInfo setState:](v5, "setState:", v10);
}

- (BOOL)isTerminated
{
  return -[HMDProcessInfo state](self, "state") == 4;
}

- (void)setState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  HMDProcessInfo *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_state);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDProcessInfo willChangeValueForKey:](self, "willChangeValueForKey:", v5);

  os_unfair_lock_lock_with_options();
  if (self->_state == a3)
  {
    os_unfair_lock_unlock(&self->_lock.lock);
    NSStringFromSelector(sel_state);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDProcessInfo didChangeValueForKey:](self, "didChangeValueForKey:");

  }
  else
  {
    self->_state = a3;
    os_unfair_lock_unlock(&self->_lock.lock);
    NSStringFromSelector(sel_state);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDProcessInfo didChangeValueForKey:](self, "didChangeValueForKey:", v6);

    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 > 4)
        v11 = CFSTR("unknown");
      else
        v11 = off_24E78EF98[a3];
      v12 = v11;
      *(_DWORD *)buf = 138543618;
      v20 = v10;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updated state to: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("state");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("HMDProcessInfoStateDidChangeNotification"), v8, v15);

  }
}

- (HMDApplicationInfo)applicationInfo
{
  return (HMDApplicationInfo *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)isSuspended
{
  return -[HMDProcessInfo state](self, "state") == 3;
}

- (BOOL)isBackgrounded
{
  unint64_t v3;

  v3 = -[HMDProcessInfo state](self, "state");
  if (v3 != 1)
    LOBYTE(v3) = !-[HMDProcessInfo isEntitledForSPIAccess](self, "isEntitledForSPIAccess")
              && -[HMDProcessInfo state](self, "state") == -1;
  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)isForegrounded
{
  return !-[HMDProcessInfo state](self, "state") || -[HMDProcessInfo state](self, "state") == 2;
}

- (unint64_t)state
{
  hmf_unfair_data_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  state = self->_state;
  os_unfair_lock_unlock(&p_lock->lock);
  return state;
}

- (void)removeConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    -[NSHashTable removeObject:](self->_connections, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock.lock);
    v4 = v5;
  }

}

+ (HMDProcessInfo)processInfoWithConnection:(id)a3
{
  id v4;
  HMDProcessInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _OWORD v13[2];

  v4 = a3;
  v5 = [HMDProcessInfo alloc];
  objc_msgSend(v4, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "auditToken");
  else
    memset(v13, 0, sizeof(v13));
  v8 = -[HMDProcessInfo initWithAuditToken:](v5, "initWithAuditToken:", v13);

  objc_msgSend(*(id *)(v8 + 72), "addObject:", v4);
  objc_msgSend(v4, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationAuthorizationFromEffectiveBundleIdentifier:processInfo:", v9, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(v8 + 120);
  *(_QWORD *)(v8 + 120) = v10;

  return (HMDProcessInfo *)(id)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_locationAuthorization, 0);
  objc_storeStrong((id *)&self->_applicationInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_processState, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (id)clientIdentifierSalt:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[HMDProcessInfo isEntitledForSPIAccess](self, "isEntitledForSPIAccess"))
  {
    +[HMDProcessInfo privateClientIdentifierSalt](HMDProcessInfo, "privateClientIdentifierSalt");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDProcessInfo applicationInfo](self, "applicationInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "clientIdentifierSalt:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 48, 0, CFSTR("Cannot generate client identifier for non-application process."), 0);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (HMDProcessInfo)initWithIdentifier:(int)a3
{
  uint64_t v3;
  HMDProcessInfo *v4;
  HMDProcessInfo *v5;
  uint64_t v6;
  NSHashTable *connections;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  RBSProcessHandle *processHandle;
  void *v13;
  HMDProcessInfo *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)HMDProcessInfo;
  v4 = -[HMFProcessInfo initWithIdentifier:](&v20, sel_initWithIdentifier_);
  v5 = v4;
  if (v4)
  {
    v4->_lock.lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    connections = v5->_connections;
    v5->_connections = (NSHashTable *)v6;

    v5->_state = -1;
    v8 = (void *)MEMORY[0x24BE80C78];
    objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v8, "handleForIdentifier:error:", v9, &v19);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v19;
    processHandle = v5->_processHandle;
    v5->_processHandle = (RBSProcessHandle *)v10;

    if (!v5->_processHandle)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v5;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine process handle from pid %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
    }

  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_220077 != -1)
    dispatch_once(&logCategory__hmf_once_t15_220077, &__block_literal_global_48_220078);
  return (id)logCategory__hmf_once_v16_220079;
}

- (BOOL)isEqual:(id)a3
{
  HMDProcessInfo *v4;
  HMDProcessInfo *v5;
  HMDProcessInfo *v6;
  HMDProcessInfo *v7;
  void *v8;
  void *v9;
  int v10;
  BOOL v11;
  objc_super v13;

  v4 = (HMDProcessInfo *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDProcessInfo;
    if (-[HMFProcessInfo isEqual:](&v13, sel_isEqual_, v4))
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      v11 = 1;
      if (v7)
      {
        -[HMDProcessInfo applicationInfo](self, "applicationInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDProcessInfo applicationInfo](v7, "applicationInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = HMFEqualObjects();

        if (!v10)
          v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)shouldMonitor
{
  void *v2;

  -[HMDProcessInfo applicationInfo](self, "applicationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (BOOL)isEntitledForSPIAccess
{
  return self->_entitledForSPIAccess;
}

- (NSArray)connections
{
  hmf_unfair_data_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSHashTable allObjects](self->_connections, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&p_lock->lock);
  return (NSArray *)v4;
}

- (BOOL)isActive
{
  HMDProcessInfo *v2;
  hmf_unfair_data_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = -[NSHashTable count](v2->_connections, "count") != 0;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (HMDProcessInfo)init
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

- (HMDProcessInfo)initWithAuditToken:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v7;
  HMDProcessInfo *v8;
  HMDProcessInfo *v9;
  char v10;
  __int128 v11;
  void *bundleIdentifier;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HMDApplicationInfo *applicationInfo;
  void *v24;
  uint64_t v25;
  HMDApplicationInfo *v26;
  NSString *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  HMFLocationAuthorization *locationAuthorization;
  __int128 v33;
  __int128 v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)HMDProcessInfo;
  v7 = *(_OWORD *)&a3->var0[4];
  v33 = *(_OWORD *)a3->var0;
  v34 = v7;
  v8 = -[HMFProcessInfo initWithAuditToken:](&v35, sel_initWithAuditToken_, &v33);
  v9 = v8;
  if (!v8)
    return v9;
  v8->_entitledForAPIAccess = __HMDProcessInfoBoolForEntitlement(v8, (uint64_t)CFSTR("com.apple.developer.homekit"));
  v10 = __HMDProcessInfoBoolForEntitlement(v9, (uint64_t)CFSTR("com.apple.private.homekit"));
  v9->_entitledForSPIAccess = v10;
  if ((v10 & 1) == 0)
    v9->_entitledForSPIAccess = __HMDProcessInfoBoolForEntitlement(v9, (uint64_t)CFSTR("com.apple.homekit.private-spi-access"));
  v11 = *(_OWORD *)&a3->var0[4];
  v33 = *(_OWORD *)a3->var0;
  v34 = v11;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = 0;
LABEL_17:

    goto LABEL_18;
  }
  -[HMFProcessInfo isPlatformBinary](v9, "isPlatformBinary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDProcessInfo processHandle](v9, "processHandle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identity");
    bundleIdentifier = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(bundleIdentifier, "embeddedApplicationIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      v17 = 0;
      v18 = (void *)v15;
    }
    else
    {
      objc_msgSend(bundleIdentifier, "xpcServiceIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v19;
      if (v19)
      {
        v17 = 0;
        v18 = (void *)v19;
      }
      else
      {
        -[HMDProcessInfo processHandle](v9, "processHandle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bundle");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 1;
      }
    }
    objc_storeStrong((id *)&v9->_bundleIdentifier, v18);
    if (v17)
    {

    }
    if (!v16)

    goto LABEL_17;
  }
LABEL_18:
  -[HMFProcessInfo mainBundleURL](v9, "mainBundleURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    +[HMDApplicationRegistry sharedRegistry](HMDApplicationRegistry, "sharedRegistry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "applicationInfoForBundleURL:", v20);
    v22 = objc_claimAutoreleasedReturnValue();
    applicationInfo = v9->_applicationInfo;
    v9->_applicationInfo = (HMDApplicationInfo *)v22;

    -[HMDApplicationInfo addProcess:](v9->_applicationInfo, "addProcess:", v9);
  }
  else if (v9->_bundleIdentifier)
  {
    +[HMDApplicationRegistry sharedRegistry](HMDApplicationRegistry, "sharedRegistry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "applicationInfoForBundleIdentifier:", v9->_bundleIdentifier);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v9->_applicationInfo;
    v9->_applicationInfo = (HMDApplicationInfo *)v25;

    -[HMDApplicationInfo addProcess:](v9->_applicationInfo, "addProcess:", v9);
  }
  v27 = v9->_bundleIdentifier;
  -[HMDApplicationInfo bundleIdentifier](v9->_applicationInfo, "bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[HMDApplicationInfo bundleIdentifier](v9->_applicationInfo, "bundleIdentifier");
    v29 = objc_claimAutoreleasedReturnValue();

    v27 = (NSString *)v29;
  }
  objc_msgSend((id)objc_opt_class(), "locationAuthorizationFromEffectiveBundleIdentifier:processInfo:", v27, v9);
  v30 = objc_claimAutoreleasedReturnValue();
  locationAuthorization = v9->_locationAuthorization;
  v9->_locationAuthorization = (HMFLocationAuthorization *)v30;

  return v9;
}

- (RBSProcessState)processState
{
  hmf_unfair_data_lock_s *p_lock;
  RBSProcessState *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_processState;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (BOOL)isBackgroundUpgradedToForeground
{
  return -[HMDProcessInfo state](self, "state") == 2;
}

- (void)addConnection:(id)a3
{
  id v4;
  NSUInteger v5;
  void *v6;
  HMDProcessInfo *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDAssertionLogEvent *v11;
  void *v12;
  HMDAssertionLogEvent *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    -[NSHashTable addObject:](self->_connections, "addObject:", v4);
    v5 = -[NSHashTable count](self->_connections, "count");
    os_unfair_lock_unlock(&self->_lock.lock);
    if (v5 > 0xA)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMFProcessInfo name](v7, "name");
        *(_DWORD *)buf = 138543618;
        v16 = v9;
        v17 = 2112;
        v18 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v18;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Process '%@' has > 10 active connections to homed which may indicate an issue", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      v11 = [HMDAssertionLogEvent alloc];
      -[HMFProcessInfo name](v7, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDAssertionLogEvent initWithReason:](v11, "initWithReason:", CFSTR("Process '%@' has > 10 active connections to homed which may indicate an issue"), v12);

      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "submitLogEvent:", v13);

    }
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDProcessInfo bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEntitledForAPIAccess
{
  return self->_entitledForAPIAccess;
}

- (HMFLocationAuthorization)locationAuthorization
{
  return (HMFLocationAuthorization *)objc_getProperty(self, a2, 120, 1);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  NSStringFromSelector(sel_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5 ^ 1;
}

+ (NSData)privateClientIdentifierSalt
{
  if (privateClientIdentifierSalt_onceToken != -1)
    dispatch_once(&privateClientIdentifierSalt_onceToken, &__block_literal_global_220084);
  return (NSData *)(id)privateClientIdentifierSalt_privateClientIdentifierSalt;
}

+ (id)locationAuthorizationFromEffectiveBundleIdentifier:(id)a3 processInfo:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (((__HMDProcessInfoBoolForEntitlement(v6, (uint64_t)CFSTR("com.apple.private.homekit.location")) & 1) != 0
     || __HMDProcessInfoBoolForEntitlement(v6, (uint64_t)CFSTR("com.apple.private.homekit.home-location")))
    && (objc_msgSend((id)objc_opt_class(), "bundleForLocationManager"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F198]), "initWithBundle:", v7);

  }
  else if (v5)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F198]), "initWithBundleIdentifier:", v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __29__HMDProcessInfo_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16_220079;
  logCategory__hmf_once_v16_220079 = v0;

}

void __45__HMDProcessInfo_privateClientIdentifierSalt__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("FDAF31D2-4895-48A8-BE45-04B4E974F0CD"));
  objc_msgSend(v5, "hm_convertToData");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDApplicationInfo privateVendorIdentifier](HMDApplicationInfo, "privateVendorIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "appendData:", v0);
  objc_msgSend(v2, "hm_generateSHA1");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)privateClientIdentifierSalt_privateClientIdentifierSalt;
  privateClientIdentifierSalt_privateClientIdentifierSalt = v3;

}

@end
