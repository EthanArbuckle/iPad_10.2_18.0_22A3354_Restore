@implementation HMDPresenceNotificationConditionDefaultPresenceProvider

- (id)presenceForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  HMDHomePresenceRemote *v6;

  objc_msgSend(a3, "presenceMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentHomePresence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serializedIdentifierDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMDHomePresenceRemote initWithPresenceByPairingIdentity:]([HMDHomePresenceRemote alloc], "initWithPresenceByPairingIdentity:", v5);
  return v6;
}

@end
