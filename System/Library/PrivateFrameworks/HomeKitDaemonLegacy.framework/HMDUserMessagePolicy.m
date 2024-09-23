@implementation HMDUserMessagePolicy

- (unint64_t)userPrivilege
{
  return self->_userPrivilege;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (BOOL)requiresRemoteAccess
{
  return self->_requiresRemoteAccess;
}

- (HMDUserMessagePolicy)init
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

- (id)__initWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6
{
  id v10;
  HMDUserMessagePolicy *v11;
  HMDUserMessagePolicy *v12;
  uint64_t v13;
  NSUUID *homeUUID;
  objc_super v16;

  v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDUserMessagePolicy;
  v11 = -[HMDUserMessagePolicy init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_home, v10);
    objc_msgSend(v10, "uuid");
    v13 = objc_claimAutoreleasedReturnValue();
    homeUUID = v12->_homeUUID;
    v12->_homeUUID = (NSUUID *)v13;

    v12->_userPrivilege = a4;
    v12->_requiresRemoteAccess = a5;
    v12->_requiresCameraStreamingAccess = a6;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  uint64_t v7;

  v3 = -[NSUUID hash](self->_homeUUID, "hash");
  v4 = v3 ^ -[HMDUserMessagePolicy requiresRemoteAccess](self, "requiresRemoteAccess");
  v5 = v4 ^ (2 * -[HMDUserMessagePolicy userPrivilege](self, "userPrivilege"));
  v6 = -[HMDUserMessagePolicy requiresCameraStreamingAccess](self, "requiresCameraStreamingAccess");
  v7 = 4;
  if (!v6)
    v7 = 0;
  return v5 ^ v7;
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
  BOOL v14;

  v4 = (HMDUserMessagePolicy *)a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  if (self == v4)
  {
    v14 = 1;
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

    if (v8
      && (WeakRetained = objc_loadWeakRetained((id *)&self->_home),
          -[HMDUserMessagePolicy home](v8, "home"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = HMFEqualObjects(),
          v10,
          WeakRetained,
          v11)
      && (userPrivilege = self->_userPrivilege,
          userPrivilege == -[HMDUserMessagePolicy userPrivilege](v8, "userPrivilege")))
    {
      requiresRemoteAccess = self->_requiresRemoteAccess;
      v14 = requiresRemoteAccess == -[HMDUserMessagePolicy requiresRemoteAccess](v8, "requiresRemoteAccess");
    }
    else
    {
      v14 = 0;
    }

  }
  objc_autoreleasePoolPop(v5);

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[HMDUserMessagePolicy home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMutableUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:](HMDMutableUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", v4, -[HMDUserMessagePolicy userPrivilege](self, "userPrivilege"), -[HMDUserMessagePolicy requiresRemoteAccess](self, "requiresRemoteAccess"), -[HMDUserMessagePolicy requiresCameraStreamingAccess](self, "requiresCameraStreamingAccess"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setUserPrivilege:(unint64_t)a3
{
  self->_userPrivilege = a3;
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

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "__initWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", v10, a4, v7, v6);

  return (HMDUserMessagePolicy *)v11;
}

+ (HMDUserMessagePolicy)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5
{
  return (HMDUserMessagePolicy *)objc_msgSend(a1, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", a3, a4, a5, 0);
}

@end
