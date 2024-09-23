@implementation NUApplicationAssembly

NUApplicationAppActivityMonitorIOS *__40__NUApplicationAssembly_loadInRegistry___block_invoke_9()
{
  return objc_alloc_init(NUApplicationAppActivityMonitorIOS);
}

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
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
  id v22;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254E6C380, &__block_literal_global_17);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_254E83258, &__block_literal_global_55);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_254E4AAE0, &__block_literal_global_63);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerProtocol:factory:", &unk_254E5C988, &__block_literal_global_72);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_254E5CB88, &__block_literal_global_83);

  objc_msgSend(v3, "publicContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "registerProtocol:factory:", &unk_254E67BA8, &__block_literal_global_89);

  objc_msgSend(v3, "publicContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "registerProtocol:factory:", &unk_254E6DC60, &__block_literal_global_96);

  objc_msgSend(v3, "publicContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "registerProtocol:factory:", &unk_254E5CE40, &__block_literal_global_110_0);

  objc_msgSend(v3, "privateContainer");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "registerProtocol:factory:", &unk_254E5CBE8, &__block_literal_global_112);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "inScope:", 2);

}

uint64_t __40__NUApplicationAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resolveProtocol:", &unk_254E5CBE8);
}

uint64_t __40__NUApplicationAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resolveProtocol:", &unk_254E5CBE8);
}

NUApplicationURLHandler *__40__NUApplicationAssembly_loadInRegistry___block_invoke()
{
  return objc_alloc_init(NUApplicationURLHandler);
}

id __40__NUApplicationAssembly_loadInRegistry___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BE906D8]);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithApplication:", v1);

  return v2;
}

NUApplicationDevice *__40__NUApplicationAssembly_loadInRegistry___block_invoke_3()
{
  NUApplicationDevice *v0;
  void *v1;
  void *v2;
  NUApplicationDevice *v3;

  v0 = [NUApplicationDevice alloc];
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[NUApplicationDevice initWithApplication:screen:](v0, "initWithApplication:screen:", v1, v2);

  return v3;
}

uint64_t __40__NUApplicationAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resolveProtocol:", &unk_254E5CBE8);
}

NUMailPresenter *__40__NUApplicationAssembly_loadInRegistry___block_invoke_6()
{
  return objc_alloc_init(NUMailPresenter);
}

NUMessagePresenter *__40__NUApplicationAssembly_loadInRegistry___block_invoke_7()
{
  return objc_alloc_init(NUMessagePresenter);
}

@end
