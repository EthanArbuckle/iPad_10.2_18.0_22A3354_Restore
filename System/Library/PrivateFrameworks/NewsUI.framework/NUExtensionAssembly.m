@implementation NUExtensionAssembly

- (NUExtensionAssembly)initWithExtensionContextProvider:(id)a3
{
  id v4;
  NUExtensionAssembly *v5;
  NUExtensionAssembly *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUExtensionAssembly;
  v5 = -[NUExtensionAssembly init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_extensionContextProvider, v4);

  return v6;
}

- (void)loadInRegistry:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];

  v4 = a3;
  objc_msgSend(v4, "publicContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "registerProtocol:factory:", &unk_254E6C380, &__block_literal_global_3);

  objc_msgSend(v4, "publicContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "registerProtocol:factory:", &unk_254E64830, &__block_literal_global_52);

  objc_msgSend(v4, "publicContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __38__NUExtensionAssembly_loadInRegistry___block_invoke_3;
  v31[3] = &unk_24D5A1F10;
  v31[4] = self;
  v11 = (id)objc_msgSend(v9, "registerProtocol:factory:", &unk_254E83258, v31);

  objc_msgSend(v4, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  v30[1] = 3221225472;
  v30[2] = __38__NUExtensionAssembly_loadInRegistry___block_invoke_4;
  v30[3] = &unk_24D5A1F38;
  v30[4] = self;
  v13 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_254E4AAE0, v30);

  objc_msgSend(v4, "publicContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "registerProtocol:factory:", &unk_254E5C988, &__block_literal_global_76);

  objc_msgSend(v4, "publicContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "registerProtocol:factory:", &unk_254E5CB88, &__block_literal_global_87);

  objc_msgSend(v4, "publicContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "registerProtocol:factory:", &unk_254E67BA8, &__block_literal_global_93);

  objc_msgSend(v4, "publicContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "registerProtocol:factory:", &unk_254E6DC60, &__block_literal_global_100);

  objc_msgSend(v4, "publicContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "registerProtocol:factory:", &unk_254E5D230, &__block_literal_global_107);

  objc_msgSend(v4, "privateContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerClass:factory:", objc_opt_class(), &__block_literal_global_110);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v25, "inScope:", 2);

  objc_msgSend(v4, "privateContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v10;
  v29[1] = 3221225472;
  v29[2] = __38__NUExtensionAssembly_loadInRegistry___block_invoke_11;
  v29[3] = &unk_24D5A20E0;
  v29[4] = self;
  v28 = (id)objc_msgSend(v27, "registerClass:factory:", objc_opt_class(), v29);

}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BE906E0]);
  objc_msgSend(*(id *)(a1 + 32), "extensionContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithExtensionContext:", v4);

  return v5;
}

NUExtensionDevice *__38__NUExtensionAssembly_loadInRegistry___block_invoke_4(uint64_t a1)
{
  NUExtensionDevice *v2;
  void *v3;
  void *v4;
  void *v5;
  NUExtensionDevice *v6;

  v2 = [NUExtensionDevice alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "extensionContextProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUExtensionDevice initWithScreen:hostViewController:](v2, "initWithScreen:hostViewController:", v3, v5);

  return v6;
}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __38__NUExtensionAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

NUMailPresenter *__38__NUExtensionAssembly_loadInRegistry___block_invoke_7()
{
  return objc_alloc_init(NUMailPresenter);
}

NUMessagePresenter *__38__NUExtensionAssembly_loadInRegistry___block_invoke_8()
{
  return objc_alloc_init(NUMessagePresenter);
}

NUIdleWebViewControllerFactory *__38__NUExtensionAssembly_loadInRegistry___block_invoke_9()
{
  return objc_alloc_init(NUIdleWebViewControllerFactory);
}

NUExtensionAppActivityMonitor *__38__NUExtensionAssembly_loadInRegistry___block_invoke_10()
{
  NUExtensionAppActivityMonitor *v0;
  void *v1;
  NUExtensionAppActivityMonitor *v2;

  v0 = [NUExtensionAppActivityMonitor alloc];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[NUExtensionAppActivityMonitor initWithNotificationCenter:](v0, "initWithNotificationCenter:", v1);

  return v2;
}

NUExtensionURLHandler *__38__NUExtensionAssembly_loadInRegistry___block_invoke_11(uint64_t a1)
{
  NUExtensionURLHandler *v2;
  void *v3;
  void *v4;
  NUExtensionURLHandler *v5;

  v2 = [NUExtensionURLHandler alloc];
  objc_msgSend(*(id *)(a1 + 32), "extensionContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NUExtensionURLHandler initWithExtensionContext:](v2, "initWithExtensionContext:", v4);

  return v5;
}

- (NUExtensionContextProvider)extensionContextProvider
{
  return (NUExtensionContextProvider *)objc_loadWeakRetained((id *)&self->_extensionContextProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionContextProvider);
}

@end
