@implementation NETransparentProxyProvider

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = CFSTR("Only NETransparentProxyNetworkSettings can be used with NETransparentProxyProvider");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("NETunnelProviderErrorDomain"), 1, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v10);
      goto LABEL_6;
    }
    objc_msgSend(v6, "setIsFullyTransparent:", 1);
  }
  v11.receiver = self;
  v11.super_class = (Class)NETransparentProxyProvider;
  -[NETunnelProvider setTunnelNetworkSettings:completionHandler:](&v11, sel_setTunnelNetworkSettings_completionHandler_, v6, v7);
LABEL_6:

}

@end
