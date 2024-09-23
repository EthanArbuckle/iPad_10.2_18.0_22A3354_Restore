@implementation SKRemoteProductActivityViewController

- (void)didFinishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SKRemoteProductActivityViewController productActivityViewController](self, "productActivityViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v9, "_didFinishWithResult:error:", v8, v6);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECA4FE0);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECAA9A8);
}

- (SKStoreProductActivityViewController)productActivityViewController
{
  return (SKStoreProductActivityViewController *)objc_loadWeakRetained((id *)&self->_productActivityViewController);
}

- (void)setProductActivityViewController:(id)a3
{
  objc_storeWeak((id *)&self->_productActivityViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_productActivityViewController);
}

@end
