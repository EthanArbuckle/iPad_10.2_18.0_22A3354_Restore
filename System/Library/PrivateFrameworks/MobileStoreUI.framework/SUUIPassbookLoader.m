@implementation SUUIPassbookLoader

- (SUUIPassbookLoader)initWithClientContext:(id)a3
{
  id v5;
  SUUIPassbookLoader *v6;
  SUUIPassbookLoader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIPassbookLoader;
  v6 = -[SUUIPassbookLoader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientContext, a3);

  return v7;
}

- (void)loadPassWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  SUUIClientContext *clientContext;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  ++self->_loadCount;
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUUIPassbookLoader _loadPassWithURL:](self, "_loadPassWithURL:", v4);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BEB1F28]);
    objc_msgSend(v7, "setCanCreateNewAccount:", 0);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("PASSBOOK_AUTH_REASON"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PASSBOOK_AUTH_REASON"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReasonDescription:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DB8]), "initWithAuthenticationContext:", v7);
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__SUUIPassbookLoader_loadPassWithURL___block_invoke;
    v11[3] = &unk_2511F50D8;
    objc_copyWeak(&v13, &location);
    v12 = v4;
    objc_msgSend(v10, "startWithAuthenticateResponseBlock:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);

  }
}

void __38__SUUIPassbookLoader_loadPassWithURL___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __38__SUUIPassbookLoader_loadPassWithURL___block_invoke_2;
  v2[3] = &unk_2511F6220;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v4);
}

void __38__SUUIPassbookLoader_loadPassWithURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  id v5;

  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
    objc_msgSend(WeakRetained, "_loadPassWithURL:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "_sendDidFinishIfFinished");

}

- (NSOperationQueue)operationQueue
{
  NSOperationQueue *operationQueue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;

  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    v5 = self->_operationQueue;
    self->_operationQueue = v4;

    -[NSOperationQueue setName:](self->_operationQueue, "setName:", CFSTR("com.apple.iTunesStoreUI.SUUIPassbookLoader"));
    operationQueue = self->_operationQueue;
  }
  return operationQueue;
}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  objc_getAssociatedObject(v4, "com.apple.iTunesStoreUI.SUUIPassbookLoader.pass");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v5 = SUUIPassKitCoreFramework();
    v6 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("PKPassLibrary"), v5));
    if (objc_msgSend(v6, "containsPass:", v11))
    {
      objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activeAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "serialNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setITunesPassSerialNumber:", v9);

      v10 = (id)objc_msgSend(v7, "addAccount:", v8);
    }

  }
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[SUUIPassbookLoader _sendDidFinishIfFinished](self, "_sendDidFinishIfFinished");
}

- (void)_didLoadWithPass:(id)a3 error:(id)a4
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  id value;

  value = a3;
  if (value)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "presentationViewControllerForPassbookLoader:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = SUUIPassKitUIFramework();
      v8 = (objc_class *)SUUIWeakLinkedClassForString(CFSTR("PKAddPassesViewController"), v7);
      if (-[objc_class canAddPasses](v8, "canAddPasses"))
      {
        v9 = (void *)objc_msgSend([v8 alloc], "initWithPass:", value);
        objc_msgSend(v9, "setDelegate:", self);
        objc_setAssociatedObject(v9, "com.apple.iTunesStoreUI.SUUIPassbookLoader.pass", value, (void *)1);
        objc_msgSend(v6, "presentViewController:animated:completion:", v9, 1, 0);

      }
    }

  }
  else
  {
    -[SUUIPassbookLoader _sendDidFinishIfFinished](self, "_sendDidFinishIfFinished");
  }

}

- (void)_loadPassWithURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  v5 = -[SUUIClientContext newLoadStoreURLOperationWithURL:](self->_clientContext, "newLoadStoreURLOperationWithURL:", v4);
  +[SSVURLDataConsumer consumer](SUUIPassbookPassDataConsumer, "consumer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataConsumer:", v6);

  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __39__SUUIPassbookLoader__loadPassWithURL___block_invoke;
  v11 = &unk_2511FC0D8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "setOutputBlock:", &v8);
  -[SUUIPassbookLoader operationQueue](self, "operationQueue", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v5);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __39__SUUIPassbookLoader__loadPassWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SUUIPassbookLoader__loadPassWithURL___block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __39__SUUIPassbookLoader__loadPassWithURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didLoadWithPass:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_sendDidFinishIfFinished
{
  int64_t loadCount;
  id WeakRetained;
  char v5;
  id v6;

  loadCount = self->_loadCount;
  if (loadCount < 2)
  {
    if (loadCount == 1)
    {
      self->_loadCount = 0;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        v6 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v6, "passbookLoaderDidFinish:", self);

      }
    }
  }
  else
  {
    self->_loadCount = loadCount - 1;
  }
}

- (SUUIPassbookLoaderDelegate)delegate
{
  return (SUUIPassbookLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
