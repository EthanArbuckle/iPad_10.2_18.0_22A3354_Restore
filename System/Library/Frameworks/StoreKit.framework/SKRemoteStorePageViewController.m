@implementation SKRemoteStorePageViewController

- (void)didFinishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SKRemoteStorePageViewController storePageViewController](self, "storePageViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_didFinishWithResult:error:", v7, v6);

}

- (void)showProductPageWithItemIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKRemoteStorePageViewController storePageViewController](self, "storePageViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_showProductPageWithItemIdentifier:", v4);

}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECA4E50);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECAAA08);
}

- (SKStorePageViewController)storePageViewController
{
  return (SKStorePageViewController *)objc_loadWeakRetained((id *)&self->_storePageViewController);
}

- (void)setStorePageViewController:(id)a3
{
  objc_storeWeak((id *)&self->_storePageViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storePageViewController);
}

@end
