@implementation SUUIDeferredActivityItemProvider

+ (id)placeholderItem
{
  return &stru_2511FF0C8;
}

- (SUUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4 placeholderItem:(id)a5
{
  id v8;
  id v9;
  SUUIDeferredActivityItemProvider *v10;
  void *v11;
  id itemProvider;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUUIDeferredActivityItemProvider;
  v10 = -[UIActivityItemProvider initWithPlaceholderItem:](&v14, sel_initWithPlaceholderItem_, a5);
  if (v10)
  {
    v11 = _Block_copy(v8);
    itemProvider = v10->_itemProvider;
    v10->_itemProvider = v11;

    objc_storeStrong((id *)&v10->_clientContext, a4);
  }

  return v10;
}

- (SUUIDeferredActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  SUUIDeferredActivityItemProvider *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__SUUIDeferredActivityItemProvider_initWithProductPageItem_clientContext___block_invoke;
  v12[3] = &unk_2511F72B0;
  v13 = v6;
  v7 = v6;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "placeholderItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:placeholderItem:](self, "initWithProductPageItemProvider:clientContext:placeholderItem:", v12, v8, v9);

  return v10;
}

id __74__SUUIDeferredActivityItemProvider_initWithProductPageItem_clientContext___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (SUUIDeferredActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SUUIDeferredActivityItemProvider *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "placeholderItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SUUIDeferredActivityItemProvider initWithProductPageItemProvider:clientContext:placeholderItem:](self, "initWithProductPageItemProvider:clientContext:placeholderItem:", v7, v6, v8);

  return v9;
}

- (SUUIProductPageItem)productPageItem
{
  void (**productPageItem)(void *, SEL);
  SUUIProductPageItem *v4;
  SUUIProductPageItem *v5;

  productPageItem = (void (**)(void *, SEL))self->_productPageItem;
  if (!productPageItem)
  {
    productPageItem = (void (**)(void *, SEL))self->_itemProvider;
    if (productPageItem)
    {
      productPageItem[2](productPageItem, a2);
      v4 = (SUUIProductPageItem *)objc_claimAutoreleasedReturnValue();
      v5 = self->_productPageItem;
      self->_productPageItem = v4;

      productPageItem = (void (**)(void *, SEL))self->_productPageItem;
    }
  }
  return (SUUIProductPageItem *)productPageItem;
}

- (SUUIClientContext)clientContext
{
  return (SUUIClientContext *)objc_getProperty(self, a2, 280, 1);
}

- (void)setClientContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (id)itemProvider
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setItemProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_productPageItem, 0);
}

@end
