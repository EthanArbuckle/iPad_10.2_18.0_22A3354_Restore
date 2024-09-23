@implementation AVOutputDeviceAuthorizedPeer(HAPPairingIdentity)

- (id)hmd_pairingIdentity
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v2 = objc_msgSend(a1, "hasAdministratorPrivileges");
  v3 = objc_alloc(MEMORY[0x24BE3F230]);
  objc_msgSend(a1, "publicKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithPairingKeyData:", v4);

  v6 = objc_alloc(MEMORY[0x24BE1BBB0]);
  objc_msgSend(a1, "peerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithIdentifier:publicKey:privateKey:permissions:", v7, v5, 0, v2);

  return v8;
}

@end
