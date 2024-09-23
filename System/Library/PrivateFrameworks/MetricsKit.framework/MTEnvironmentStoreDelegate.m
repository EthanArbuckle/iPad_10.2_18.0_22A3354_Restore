@implementation MTEnvironmentStoreDelegate

- (id)connectionType
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__MTEnvironmentStoreDelegate_connectionType__block_invoke;
  v3[3] = &unk_24C7A1750;
  v3[4] = self;
  +[MTEventHandler cachableWithKey:onBackgroundThread:block:](MTEventHandler, "cachableWithKey:onBackgroundThread:block:", CFSTR("connectionType"), 1, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __44__MTEnvironmentStoreDelegate_connectionType__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionType");
}

- (id)_connectionType
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x24BEC8BC0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionTypeHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = CFSTR("unknown");

  return v4;
}

- (id)cookies
{
  return +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", MEMORY[0x24BDBD1B8]);
}

- (id)dsId
{
  void *v2;
  void *v3;

  -[MTEnvironmentStoreDelegate _activeItunesAccount](self, "_activeItunesAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenWithBlock:", &__block_literal_global_15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __34__MTEnvironmentStoreDelegate_dsId__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ams_DSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)storeFrontHeader
{
  void *v2;
  void *v3;

  -[MTEnvironmentStoreDelegate _activeItunesAccount](self, "_activeItunesAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thenWithBlock:", &__block_literal_global_4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __46__MTEnvironmentStoreDelegate_storeFrontHeader__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "ams_storefront");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)userAgent
{
  return +[MTEventHandler cachableWithKey:onBackgroundThread:block:](MTEventHandler, "cachableWithKey:onBackgroundThread:block:", CFSTR("userAgent"), 1, &__block_literal_global_7);
}

id __39__MTEnvironmentStoreDelegate_userAgent__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BE08420];
  objc_msgSend(MEMORY[0x24BE08330], "currentProcess");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "userAgentForProcessInfo:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_activeItunesAccount
{
  return +[MTEventHandler cachableWithKey:onBackgroundThread:block:](MTEventHandler, "cachableWithKey:onBackgroundThread:block:", CFSTR("activeItunesAccount"), 1, &__block_literal_global_17);
}

id __50__MTEnvironmentStoreDelegate__activeItunesAccount__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDB43A0], "ams_sharedAccountStore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ams_activeiTunesAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
