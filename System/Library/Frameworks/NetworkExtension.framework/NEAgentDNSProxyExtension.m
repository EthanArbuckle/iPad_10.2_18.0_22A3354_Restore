@implementation NEAgentDNSProxyExtension

- (id)driverInterface
{
  if (driverInterface_onceToken != -1)
    dispatch_once(&driverInterface_onceToken, &__block_literal_global_2084);
  return (id)driverInterface_driverInterface;
}

- (void)setSystemDNSSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemDNSSettings:", v4);

}

void __43__NEAgentDNSProxyExtension_driverInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE419720);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)driverInterface_driverInterface;
  driverInterface_driverInterface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)driverInterface_driverInterface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_setSystemDNSSettings_, 0, 0);

}

@end
