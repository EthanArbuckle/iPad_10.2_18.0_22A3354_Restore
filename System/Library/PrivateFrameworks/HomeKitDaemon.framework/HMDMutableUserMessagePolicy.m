@implementation HMDMutableUserMessagePolicy

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  -[HMDUserMessagePolicy home](self, "home", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:", v4, -[HMDUserMessagePolicy userPrivilege](self, "userPrivilege"), -[HMDUserMessagePolicy requiresRemoteAccess](self, "requiresRemoteAccess"), -[HMDUserMessagePolicy requiresCameraStreamingAccess](self, "requiresCameraStreamingAccess"), -[HMDUserMessagePolicy useProofOfLocality](self, "useProofOfLocality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5 requiresCameraStreamingAccess:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "__initWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:", v10, a4, v7, v6, 0);

  return v11;
}

+ (id)userMessagePolicyWithHome:(id)a3 userPrivilege:(unint64_t)a4 remoteAccessRequired:(BOOL)a5
{
  return (id)objc_msgSend(a1, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:useProofOfLocality:", a3, a4, a5, 0, 0);
}

@end
