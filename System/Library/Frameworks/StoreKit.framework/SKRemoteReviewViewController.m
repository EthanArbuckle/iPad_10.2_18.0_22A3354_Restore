@implementation SKRemoteReviewViewController

- (void)didFinishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SKRemoteReviewViewController reviewViewController](self, "reviewViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v9, "_didFinishWithResult:error:", v8, v6);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECA0F70);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECAA828);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SKRemoteReviewViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SKRemoteReviewViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteReviewViewControllerTerminatedWithError:", v6);

  }
}

- (SKRemoteReviewViewControllerDelegate)delegate
{
  return (SKRemoteReviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKStoreReviewViewController)reviewViewController
{
  return (SKStoreReviewViewController *)objc_loadWeakRetained((id *)&self->_reviewViewController);
}

- (void)setReviewViewController:(id)a3
{
  objc_storeWeak((id *)&self->_reviewViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reviewViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
