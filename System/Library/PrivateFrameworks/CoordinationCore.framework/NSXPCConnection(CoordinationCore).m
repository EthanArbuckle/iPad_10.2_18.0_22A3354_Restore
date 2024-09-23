@implementation NSXPCConnection(CoordinationCore)

- (id)co_ClientBundleIdentifier
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_getAssociatedObject(a1, sel_co_ClientBundleIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "auditToken");
    CPCopyBundleIdentifierAndTeamFromAuditToken();
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", 0, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "co_SetClientBundleIdentifier:", v2, v5, v6, v7, v8);
  }
  return v2;
}

- (void)co_SetClientBundleIdentifier:()CoordinationCore
{
  objc_setAssociatedObject(a1, sel_co_ClientBundleIdentifier, a3, (void *)3);
}

- (id)co_PeerInstance
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, sel_co_PeerInstance);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v5[0] = 0;
    v5[1] = 0;
    objc_msgSend(a1, "_xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && xpc_connection_get_peer_instance())
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v5);
    else
      v2 = 0;

  }
  return v2;
}

- (void)co_SetPeerInstance:()CoordinationCore
{
  objc_setAssociatedObject(a1, sel_co_PeerInstance, a3, (void *)1);
}

@end
