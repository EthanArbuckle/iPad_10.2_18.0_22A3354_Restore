@implementation NUURLHandler

- (NUURLHandler)initWithURLHandling:(id)a3 universalLinksEnabled:(BOOL)a4
{
  id v7;
  NUURLHandler *v8;
  NUURLHandler *v9;
  NSMutableArray *v10;
  NSMutableArray *modifiers;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NUURLHandler;
  v8 = -[NUURLHandler init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_URLHandling, a3);
    v9->_universalLinksEnabled = a4;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    modifiers = v9->_modifiers;
    v9->_modifiers = v10;

  }
  return v9;
}

- (void)addModifier:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[NUURLHandler modifiers](self, "modifiers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (void)removeModifier:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[NUURLHandler modifiers](self, "modifiers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (id)viewControllerForURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NUURLHandler modifyURL:](self, "modifyURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NUURLHandler previewViewControllerFactory](self, "previewViewControllerFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createViewControllerForURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = v6;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)commitViewController:(id)a3 URL:(id)a4
{
  -[NUURLHandler presentViewController:animated:](self, "presentViewController:animated:", a3, 0);
}

- (void)openURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, char);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NUURLHandler modifyURL:](self, "modifyURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NUSharedLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_216817000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to open modified URL %{public}@", buf, 0xCu);

  }
  -[NUURLHandler delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[NUURLHandler delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLHandler:willOpenURL:", self, v5);

  }
  objc_initWeak((id *)buf, self);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __24__NUURLHandler_openURL___block_invoke;
  v22 = &unk_24D5A1E28;
  objc_copyWeak(&v24, (id *)buf);
  v11 = v5;
  v23 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199FC190](&v19);
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v11, 0, v19, v20, v21, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("http"));

  if (((-[NUURLHandler universalLinksEnabled](self, "universalLinksEnabled") | v15 ^ 1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
      objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDF7570]);
    -[NUURLHandler URLHandling](self, "URLHandling");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "openURL:options:completion:", v11, v17, v12);

  }
  else
  {
    v12[2](v12, 0);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

void __24__NUURLHandler_openURL___block_invoke(uint64_t a1, char a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  if ((a2 & 1) == 0)
  {
    v3 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "webViewControllerFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createViewControllerForURL:", *(_QWORD *)(a1 + 32));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "setModalPresentationStyle:", 6);
      v6 = objc_loadWeakRetained(v3);
      objc_msgSend(v6, "presentViewController:animated:", v7, 1);

    }
  }
}

- (id)modifyURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NUURLHandler modifiers](self, "modifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      v11 = v4;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "modifyURL:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)objc_msgSend(v12, "copy");

        ++v10;
        v11 = v4;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[NUURLHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[NUURLHandler delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLHandler:wantsToPresentViewController:animated:", self, v9, v4);

  }
}

- (NUURLHandlerDelegate)delegate
{
  return (NUURLHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NUWebViewControllerFactoryType)webViewControllerFactory
{
  return self->_webViewControllerFactory;
}

- (void)setWebViewControllerFactory:(id)a3
{
  objc_storeStrong((id *)&self->_webViewControllerFactory, a3);
}

- (NUPreviewViewControllerFactory)previewViewControllerFactory
{
  return self->_previewViewControllerFactory;
}

- (void)setPreviewViewControllerFactory:(id)a3
{
  objc_storeStrong((id *)&self->_previewViewControllerFactory, a3);
}

- (NUURLHandling)URLHandling
{
  return self->_URLHandling;
}

- (BOOL)universalLinksEnabled
{
  return self->_universalLinksEnabled;
}

- (NSMutableArray)modifiers
{
  return self->_modifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_URLHandling, 0);
  objc_storeStrong((id *)&self->_previewViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_webViewControllerFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
