@implementation SUUIRedeemStepViewController

- (BOOL)shouldShowPassbookLearnMore
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v3 = SUUIPassKitCoreFramework();
  v4 = SUUIWeakLinkedClassForString(CFSTR("PKPassLibrary"), v3);
  -[SUUIRedeemStepViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ITunesPassConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  if (!objc_msgSend(v4, "isPassLibraryAvailable"))
    return 0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
    return 0;
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ITunesPassSerialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init((Class)v4);
    objc_msgSend(v14, "passWithPassTypeIdentifier:serialNumber:", CFSTR("pass.com.apple.itunes.storecredit"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15 == 0;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (SUUIRedeemConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (SUUIRedeemStepDelegate)redeemStepDelegate
{
  return (SUUIRedeemStepDelegate *)objc_loadWeakRetained((id *)&self->_redeemStepDelegate);
}

- (void)setRedeemStepDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_redeemStepDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redeemStepDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
