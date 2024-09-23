@implementation NSObject(GKSetupAssistantSupport)

- (id)_gkAuthenticatedPlayerID
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "internal");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "playerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_gkSetupAccountWithParamaters:()GKSetupAssistantSupport completionHandler:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0D25298];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "proxyForLocalPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountServicePrivate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setupAccountForParameters:handler:", v7, v6);

}

@end
