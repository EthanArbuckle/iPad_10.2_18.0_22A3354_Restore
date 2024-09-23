@implementation NEEthernetTunnelProvider

- (NEEthernetTunnelProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NEEthernetTunnelProvider;
  return -[NEPacketTunnelProvider initWithVirtualInterfaceType:](&v3, sel_initWithVirtualInterfaceType_, 3);
}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  void *v4;
  id v7;
  void (**v8)(id, void *);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *Property;
  const char *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = v7;
    objc_msgSend(v9, "IPv4Settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (objc_msgSend(v9, "IPv4Settings"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "configMethod") == 3))
    {
      objc_msgSend(v9, "IPv6Settings");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        if (v10)
        {

        }
        goto LABEL_17;
      }
      v14 = (void *)v13;
      objc_msgSend(v9, "IPv6Settings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "configMethod");

      if (v10)
      {

      }
      if (v16 == 2)
      {
LABEL_17:
        v24.receiver = self;
        v24.super_class = (Class)NEEthernetTunnelProvider;
        -[NEPacketTunnelProvider setTunnelNetworkSettings:completionHandler:](&v24, sel_setTunnelNetworkSettings_completionHandler_, v9, v8);
        goto LABEL_18;
      }
    }
    else
    {

    }
    -[NEPacketTunnelProvider packetFlow](self, "packetFlow");
    Property = (void *)objc_claimAutoreleasedReturnValue();
    v19 = Property;
    if (Property)
      Property = objc_getProperty(Property, v18, 96, 1);
    v20 = Property;

    if (!v20)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26 = CFSTR("-[NEPacketTunnelFlow readPacketsWithCompletionHandler:] must be called before setting IPv4 settings or IPv6 settings with non-manual address configuration");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("NETunnelProviderErrorDomain"), 1, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v8[2](v8, v23);
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v27 = *MEMORY[0x1E0CB2D50];
  v28[0] = CFSTR("Only NEEthernetTunnelNetworkSettings can be used with NEEthernetTunnelProvider");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NETunnelProviderErrorDomain"), 1, v12);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v9);
LABEL_18:

}

@end
