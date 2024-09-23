@implementation BCImageManager

- (BCImageManager)init
{
  BCNetworkProvider *v3;
  BCNetworkProvider *v4;
  BCImageManager *v5;
  objc_super v7;

  v3 = objc_alloc_init(BCNetworkProvider);
  v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)BCImageManager;
    v5 = -[BCImageManager init](&v7, sel_init);
    self = v5;
    if (v5)
      objc_storeStrong((id *)&v5->_networkProvider, v3);
  }

  return self;
}

- (void)_fetchBrandIconDataForMapItem:(id)a3 desiredSize:(CGSize)a4 allowSmaller:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  double height;
  double width;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v20 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  LogCategory_Daemon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[BCImageManager _fetchBrandIconDataForMapItem:desiredSize:allowSmaller:completion:]";
    _os_log_impl(&dword_21C655000, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v12)
  {
    objc_msgSend(v11, "_bestBrandIconURLForSize:allowSmaller:", v7, width, height);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1840]), "initWithURL:", v14);
    if (self)
      self = (BCImageManager *)self->_networkProvider;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __84__BCImageManager__fetchBrandIconDataForMapItem_desiredSize_allowSmaller_completion___block_invoke;
    v16[3] = &unk_24E064E50;
    v17 = v12;
    -[BCImageManager performDataTaskWithRequest:completionHandler:](self, "performDataTaskWithRequest:completionHandler:", v15, v16);

  }
}

void __84__BCImageManager__fetchBrandIconDataForMapItem_desiredSize_allowSmaller_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v11 = 138412290;
      v12 = (uint64_t)v7;
      v10 = "Failed to fetch brand icon data: %@";
LABEL_6:
      _os_log_impl(&dword_21C655000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v9)
  {
    v11 = 134217984;
    v12 = objc_msgSend(v6, "length");
    v10 = "Fetched brand icon data with length: %ld";
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6);
}

- (void)_fetchNavBarBrandIconDataForMapItem:(id)a3 desiredSize:(CGSize)a4 allowSmaller:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  double height;
  double width;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v7 = a5;
  height = a4.height;
  width = a4.width;
  v20 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  LogCategory_Daemon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[BCImageManager _fetchNavBarBrandIconDataForMapItem:desiredSize:allowSmaller:completion:]";
    _os_log_impl(&dword_21C655000, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v12)
  {
    objc_msgSend(v11, "_bestNavbarBrandIconURLForSize:allowSmaller:", v7, width, height);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1840]), "initWithURL:", v14);
    if (self)
      self = (BCImageManager *)self->_networkProvider;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __90__BCImageManager__fetchNavBarBrandIconDataForMapItem_desiredSize_allowSmaller_completion___block_invoke;
    v16[3] = &unk_24E064E50;
    v17 = v12;
    -[BCImageManager performDataTaskWithRequest:completionHandler:](self, "performDataTaskWithRequest:completionHandler:", v15, v16);

  }
}

void __90__BCImageManager__fetchNavBarBrandIconDataForMapItem_desiredSize_allowSmaller_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v11 = 138412290;
      v12 = (uint64_t)v7;
      v10 = "Failed to fetch navbar brand icon data: %@";
LABEL_6:
      _os_log_impl(&dword_21C655000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v9)
  {
    v11 = 134217984;
    v12 = objc_msgSend(v6, "length");
    v10 = "Fetched navbar brand icon data with length: %ld";
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

@end
