@implementation CPSClipURL

+ (BOOL)usesDemoMetadata
{
  return BOOLForPreferenceKey(CFSTR("_CPSClipUsesDemoMetadata"));
}

+ (BOOL)shouldStallProgress
{
  return BOOLForPreferenceKey(CFSTR("CPSClipShouldStallProgress"));
}

+ (void)stopStallingCurrentInstallationWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopStallingCurrentInstallationWithCompletionHandler:", v3);

}

- (CPSClipURL)initWithURL:(id)a3
{
  id v5;
  CPSClipURL *v6;
  CPSClipURL *v7;
  CPSClipURL *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSClipURL;
  v6 = -[CPSClipURL init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v8 = v7;
  }

  return v7;
}

- (void)checkAvailabilityWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSURL *URL;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  URL = self->_URL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__CPSClipURL_checkAvailabilityWithCompletionHandler___block_invoke;
  v8[3] = &unk_24C3B9AD8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "isClipURL:completionHandler:", URL, v8);

}

uint64_t __53__CPSClipURL_checkAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSURL *URL;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  URL = self->_URL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__CPSClipURL_openWithCompletionHandler___block_invoke;
  v8[3] = &unk_24C3B9B00;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "openClipWithURL:completionHandler:", URL, v8);

}

uint64_t __40__CPSClipURL_openWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)prewarmClipWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSURL *URL;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  URL = self->_URL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__CPSClipURL_prewarmClipWithCompletionHandler___block_invoke;
  v8[3] = &unk_24C3B9B00;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "prewarmClipWithURL:completionHandler:", URL, v8);

}

uint64_t __47__CPSClipURL_prewarmClipWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cancelPrewarmingClipWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSURL *URL;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  URL = self->_URL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__CPSClipURL_cancelPrewarmingClipWithCompletionHandler___block_invoke;
  v8[3] = &unk_24C3B9B00;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "cancelPrewarmingClipWithURL:completionHandler:", URL, v8);

}

uint64_t __56__CPSClipURL_cancelPrewarmingClipWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)installClipWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSURL *URL;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  URL = self->_URL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__CPSClipURL_installClipWithCompletionHandler___block_invoke;
  v8[3] = &unk_24C3B9B00;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "installClipWithURL:completionHandler:", URL, v8);

}

uint64_t __47__CPSClipURL_installClipWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchClipMetadataWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSURL *URL;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  URL = self->_URL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__CPSClipURL_fetchClipMetadataWithCompletionHandler___block_invoke;
  v8[3] = &unk_24C3B9B28;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "fetchClipMetadataWithURL:completionHandler:", URL, v8);

}

uint64_t __53__CPSClipURL_fetchClipMetadataWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)test_uninstallClipWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSURL *URL;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  URL = self->_URL;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__CPSClipURL_test_uninstallClipWithCompletionHandler___block_invoke;
  v8[3] = &unk_24C3B9B00;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "uninstallClipWithURL:completionHandler:", URL, v8);

}

uint64_t __54__CPSClipURL_test_uninstallClipWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
