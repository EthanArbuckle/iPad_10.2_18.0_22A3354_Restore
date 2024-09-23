@implementation SUUINetworkErrorViewController

- (SUUINetworkErrorViewController)init
{
  return -[SUUINetworkErrorViewController initWithError:](self, "initWithError:", 0);
}

- (SUUINetworkErrorViewController)initWithError:(id)a3
{
  id v5;
  SUUINetworkErrorViewController *v6;
  SUUINetworkErrorViewController *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUINetworkErrorViewController;
  v6 = -[SUUINetworkErrorViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BEC8B00];
    objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__networkTypeChanged_, v9, v10);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B00], 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUINetworkErrorViewController;
  -[SUUINetworkErrorViewController dealloc](&v4, sel_dealloc);
}

+ (BOOL)canDisplayError:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  char v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == -1009)
  {
    v6 = (_QWORD *)MEMORY[0x24BDD1308];
  }
  else
  {
    if (v4 != 110)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = (_QWORD *)MEMORY[0x24BEB24A0];
  }
  v7 = objc_msgSend(v5, "isEqualToString:", *v6);
LABEL_7:

  return v7;
}

- (void)loadView
{
  int v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  SUUIClientContext *clientContext;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  SUUIClientContext *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v3 = MGGetBoolAnswer();
  v4 = MGGetBoolAnswer();
  v5 = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  clientContext = self->_clientContext;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (clientContext)
    {
      v9 = CFSTR("NETWORK_ERROR_TITLE_IPAD");
LABEL_6:
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v11 = CFSTR("NETWORK_ERROR_TITLE_IPAD");
  }
  else
  {
    if (clientContext)
    {
      v9 = CFSTR("NETWORK_ERROR_TITLE_IPHONE");
      goto LABEL_6;
    }
    v11 = CFSTR("NETWORK_ERROR_TITLE_IPHONE");
  }
  +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", v11, 0);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v12 = (void *)v10;
  v13 = self->_clientContext;
  v20 = v12;
  if (((v5 | v4) & 1) != 0)
  {
    if (v4)
    {
      if (v3)
      {
        if (v13)
        {
          v14 = CFSTR("NETWORK_ERROR_MESSAGE_WLAN_OR_CELL");
LABEL_26:
          -[SUUIClientContext localizedStringForKey:](v13, "localizedStringForKey:", v14);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        v15 = CFSTR("NETWORK_ERROR_MESSAGE_WLAN_OR_CELL");
      }
      else
      {
        if (v13)
        {
          v14 = CFSTR("NETWORK_ERROR_MESSAGE_WLAN_ONLY");
          goto LABEL_26;
        }
        v15 = CFSTR("NETWORK_ERROR_MESSAGE_WLAN_ONLY");
      }
    }
    else if (v3)
    {
      if (v13)
      {
        v14 = CFSTR("NETWORK_ERROR_MESSAGE_WIFI_OR_CELL");
        goto LABEL_26;
      }
      v15 = CFSTR("NETWORK_ERROR_MESSAGE_WIFI_OR_CELL");
    }
    else
    {
      if (v13)
      {
        v14 = CFSTR("NETWORK_ERROR_MESSAGE_WIFI_ONLY");
        goto LABEL_26;
      }
      v15 = CFSTR("NETWORK_ERROR_MESSAGE_WIFI_ONLY");
    }
  }
  else
  {
    if (v13)
    {
      v14 = CFSTR("NETWORK_ERROR_MESSAGE_CELL_ONLY");
      goto LABEL_26;
    }
    v15 = CFSTR("NETWORK_ERROR_MESSAGE_CELL_ONLY");
  }
  +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", v15, 0);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_27:
  v17 = (void *)v16;
  v18 = objc_alloc(MEMORY[0x24BEBDBB0]);
  v19 = (void *)objc_msgSend(v18, "initWithFrame:title:style:", v20, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v19, "setMessage:", v17);
  -[SUUINetworkErrorViewController setView:](self, "setView:", v19);

}

- (UIScrollView)scrollView
{
  return 0;
}

- (SUUIProductPageHeaderViewController)headerViewController
{
  return 0;
}

- (void)_networkTypeChanged:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SUUINetworkErrorViewController__networkTypeChanged___block_invoke;
  block[3] = &unk_2511F47C0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

void __54__SUUINetworkErrorViewController__networkTypeChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  char v5;
  id v6;

  objc_msgSend(MEMORY[0x24BEC8BC8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkType");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
      objc_msgSend(v6, "networkErrorViewControllerInvalidated:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
