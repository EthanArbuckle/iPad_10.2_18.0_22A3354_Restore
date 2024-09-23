@implementation HMFPairingIdentity(HAPKeyStore)

- (uint64_t)isControllerKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  +[HAPSystemKeychainStore systemStore](HAPSystemKeychainStore, "systemStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLocalPairingIdentity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

@end
