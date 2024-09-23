@implementation HMDSecureRemoteSessionDefaultDataSource

- (id)createSecureStreamWithPeerDevice:(id)a3 clientMode:(BOOL)a4 sessionID:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  HMDSecureRemoteStream *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDSecureRemoteStream *v13;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = [HMDSecureRemoteStream alloc];
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDSecureRemoteStream initWithCurrentDevice:peerDevice:clientMode:sessionID:accountRegistry:](v9, "initWithCurrentDevice:peerDevice:clientMode:sessionID:accountRegistry:", v11, v8, v5, v7, v12);

  return v13;
}

@end
