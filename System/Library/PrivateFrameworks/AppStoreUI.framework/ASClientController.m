@implementation ASClientController

- (ASClientController)initWithClientIdentifier:(id)a3
{
  id v5;
  ASViewControllerFactory *v6;
  ASClientController *v7;

  v5 = objc_alloc_init(MEMORY[0x24BEC8CF0]);
  objc_msgSend(v5, "setClientIdentifier:", a3);
  v6 = objc_alloc_init(ASViewControllerFactory);
  objc_msgSend(v5, "setViewControllerFactory:", v6);

  v7 = -[ASClientController initWithClientInterface:](self, "initWithClientInterface:", v5);
  return v7;
}

- (ASClientController)initWithClientInterface:(id)a3
{
  ASClientController *v3;
  CFArrayRef v4;
  objc_super v6;
  void *values[2];

  values[1] = *(void **)MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)ASClientController;
  v3 = -[SUClientController initWithClientInterface:](&v6, sel_initWithClientInterface_, a3);
  if (v3)
  {
    values[0] = (void *)9;
    v4 = CFArrayCreate(0, (const void **)values, 1, 0);
    -[SUClientController setOfferedAssetTypes:](v3, "setOfferedAssetTypes:", v4);
    CFRelease(v4);
  }
  return v3;
}

- (BOOL)libraryContainsItemIdentifier:(unint64_t)a3
{
  void *v5;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x24BEC8C20], "loadedMap");
  if (objc_msgSend(v5, "applicationForItemIdentifier:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithItemIdentifier:", a3)))
  {
    return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)ASClientController;
  return -[SUClientController libraryContainsItemIdentifier:](&v7, sel_libraryContainsItemIdentifier_, a3);
}

- (id)purchaseManager:(id)a3 purchaseBatchForItems:(id)a4
{
  return -[SUPurchaseBatch initWithItems:]([ASPurchaseBatch alloc], "initWithItems:", a4);
}

- (id)purchaseManager:(id)a3 purchaseBatchForPurchases:(id)a4
{
  ASPurchaseBatch *v5;

  v5 = objc_alloc_init(ASPurchaseBatch);
  -[SUPurchaseBatch setPurchasesAndContinuationsFromPurchases:](v5, "setPurchasesAndContinuationsFromPurchases:", a4);
  return v5;
}

- (BOOL)shouldExitAfterPurchases
{
  return self->_shouldExitAfterPurchases;
}

- (void)setShouldExitAfterPurchases:(BOOL)a3
{
  self->_shouldExitAfterPurchases = a3;
}

@end
