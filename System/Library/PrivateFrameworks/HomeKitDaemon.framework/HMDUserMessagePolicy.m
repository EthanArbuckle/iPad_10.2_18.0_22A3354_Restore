@implementation HMDUserMessagePolicy

- (HMDUserMessagePolicy)init
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

- (id)__initWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6 useProofOfLocality:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  HMDUserMessagePolicy *v13;
  HMDUserMessagePolicy *v14;
  uint64_t v15;
  NSUUID *homeUUID;
  HMDUserMessagePolicy *v18;
  SEL v19;
  objc_super v20;

  v7 = a7;
  v12 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMDUserMessagePolicy;
  v13 = -[HMDUserMessagePolicy init](&v20, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_4;
  objc_storeWeak((id *)&v13->_home, v12);
  objc_msgSend(v12, "uuid");
  v15 = objc_claimAutoreleasedReturnValue();
  homeUUID = v14->_homeUUID;
  v14->_homeUUID = (NSUUID *)v15;

  v14->_userPrivilege = a4;
  v14->_requiresRemoteAccess = a5;
  v14->_requiresCameraStreamingAccess = a6;
  v14->_useProofOfLocality = v7;
  if (!v7)
    goto LABEL_4;
  if (!a5)
  {
    v18 = (HMDUserMessagePolicy *)_HMFPreconditionFailure();
    return (id)-[HMDUserMessagePolicy hash](v18, v19);
  }
  else
  {
LABEL_4:

    return v14;
  }
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;

  v3 = -[NSUUID hash](self->_homeUUID, "hash");
  v4 = v3 ^ -[HMDUserMessagePolicy requiresRemoteAccess](self, "requiresRemoteAccess");
  v5 = v4 ^ (2 * -[HMDUserMessagePolicy userPrivilege](self, "userPrivilege"));
  if (-[HMDUserMessagePolicy requiresCameraStreamingAccess](self, "requiresCameraStreamingAccess"))
    v6 = 4;
  else
    v6 = 0;
  v7 = -[HMDUserMessagePolicy useProofOfLocality](self, "useProofOfLocality");
  v8 = 8;
  if (!v7)
    v8 = 0;
  return v5 ^ v6 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  HMDUserMessagePolicy *v4;
  void *v5;
  HMDUserMessagePolicy *v6;
  HMDUserMessagePolicy *v7;
  HMDUserMessagePolicy *v8;
  id WeakRetained;
  void *v10;
  int v11;
  unint64_t userPrivilege;
  _BOOL4 requiresRemoteAccess;
  _BOOL4 useProofOfLocality;
  BOOL v15;

  v4 = (HMDUserMessagePolicy *)a3;
  v5 = (void *)MEMORY[0x227676638]();
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (!v8)
      goto LABEL_10;
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    -[HMDUserMessagePolicy home](v8, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if (!v11)
      goto LABEL_10;
    userPrivilege = self->_userPrivilege;
    if (userPrivilege == -[HMDUserMessagePolicy userPrivilege](v8, "userPrivilege")
      && (requiresRemoteAccess = self->_requiresRemoteAccess,
          requiresRemoteAccess == -[HMDUserMessagePolicy requiresRemoteAccess](v8, "requiresRemoteAccess")))
    {
      useProofOfLocality = self->_useProofOfLocality;
      v15 = useProofOfLocality == -[HMDUserMessagePolicy useProofOfLocality](v8, "useProofOfLocality");
    }
    else
    {
LABEL_10:
      v15 = 0;
    }

  }
  objc_autoreleasePoolPop(v5);

  return v15;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[HMDUserMessagePolicy home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:](HMDMutableUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:", v4, -[HMDUserMessagePolicy userPrivilege](self, "userPrivilege"), -[HMDUserMessagePolicy requiresRemoteAccess](self, "requiresRemoteAccess"), -[HMDUserMessagePolicy requiresCameraStreamingAccess](self, "requiresCameraStreamingAccess"), -[HMDUserMessagePolicy useProofOfLocality](self, "useProofOfLocality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (unint64_t)userPrivilege
{
  return self->_userPrivilege;
}

- (void)setUserPrivilege:(unint64_t)a3
{
  self->_userPrivilege = a3;
}

- (BOOL)requiresRemoteAccess
{
  return self->_requiresRemoteAccess;
}

- (void)setRequiresRemoteAccess:(BOOL)a3
{
  self->_requiresRemoteAccess = a3;
}

- (BOOL)requiresCameraStreamingAccess
{
  return self->_requiresCameraStreamingAccess;
}

- (void)setRequiresCameraStreamingAccess:(BOOL)a3
{
  self->_requiresCameraStreamingAccess = a3;
}

- (BOOL)useProofOfLocality
{
  return self->_useProofOfLocality;
}

- (void)setUseProofOfLocality:(BOOL)a3
{
  self->_useProofOfLocality = a3;
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6 useProofOfLocality:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "__initWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:", v12, a4, v9, v8, v7);

  return (HMDUserMessagePolicy *)v13;
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6
{
  return (HMDUserMessagePolicy *)objc_msgSend(a1, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:", a3, a4, a5, a6, 0);
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5
{
  return (HMDUserMessagePolicy *)objc_msgSend(a1, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", a3, a4, a5, 0);
}

+ (id)userMessagePolicyUsingProofOfLocalityForHome:(id)a3 userPrivilege:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:", a3, a4, 1, 0, 1);
}

@end
