@implementation SafariSandboxBrokerServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _OWORD v11[2];

  v4 = a4;
  v5 = WBSUISafariSandboxBrokerInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "setExportedInterface:", v6);

  v7 = objc_alloc((Class)WBSUISafariSandboxBroker);
  v8 = objc_msgSend(v4, "processIdentifier");
  if (v4)
    objc_msgSend(v4, "auditToken");
  else
    memset(v11, 0, sizeof(v11));
  v9 = objc_msgSend(v7, "initWithPID:auditToken:", v8, v11);
  objc_msgSend(v4, "setExportedObject:", v9);

  objc_msgSend(v4, "resume");
  return 1;
}

@end
