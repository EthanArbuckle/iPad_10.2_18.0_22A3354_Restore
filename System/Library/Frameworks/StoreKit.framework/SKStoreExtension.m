@implementation SKStoreExtension

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v6 = a4;
  -[SKStoreExtension _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SKStoreExtension_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_1E5B26758;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v4, v9);

}

uint64_t __61__SKStoreExtension_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)shouldOpenURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5
{
  return 0;
}

- (void)openURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5
{
  void *v6;
  id v7;

  if (-[SKStoreExtension shouldOpenURL:sourceApplication:annotation:](self, "shouldOpenURL:sourceApplication:annotation:", a3, a4, a5))
  {
    -[SKStoreExtension _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "setNeedsTabSelection");
      v6 = v7;
    }

  }
}

- (void)presentRequestedViewControllerWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SKStoreExtension _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "presentRequestedViewControllerWithIdentifier:", v6);

}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC9CAA0);
}

+ (id)serviceInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC81258);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_setTabIdentifier_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_openURL_sourceApplication_annotation_, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_openURL_sourceApplication_annotation_, 1, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_openURL_sourceApplication_annotation_, 2, 0);

  return v2;
}

@end
