@implementation SKCloudServiceSetupRemoteViewController

+ (id)exportedInterface
{
  return +[SKCloudServiceSetupExtension clientInterface](SKCloudServiceSetupExtension, "clientInterface");
}

+ (id)serviceViewControllerInterface
{
  return +[SKCloudServiceSetupExtension serviceInterface](SKCloudServiceSetupExtension, "serviceInterface");
}

- (void)didFinishLoadingWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SKCloudServiceSetupRemoteViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudServiceSetupRemoteViewController:didFinishLoadingWithSuccess:error:", self, v4, v6);

}

- (void)dismissCloudServiceSetupViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SKCloudServiceSetupRemoteViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudServiceSetupRemoteViewController:requestsDismissalWithAnimation:completion:", self, v4, v6);

}

- (void)dismissSafariViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SKCloudServiceSetupRemoteViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudServiceSetupRemoteViewController:requestsDismissingSafariViewControllerAnimated:completion:", self, v4, v6);

}

- (void)overrideCreditCardPresentationWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SKCloudServiceSetupRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideCreditCardPresentationWithCompletion:", v4);

}

- (void)overrideRedeemCameraPerformAction:(int64_t)a3 withObject:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SKCloudServiceSetupRemoteViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideRedeemCameraPerformAction:withObject:", a3, v6);

}

- (void)presentSafariViewControllerWithURL:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SKCloudServiceSetupRemoteViewController delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudServiceSetupRemoteViewController:requestsPresentingSafariViewControllerWithURL:animated:completion:", self, v9, v5, v8);

}

- (SKCloudServiceSetupRemoteViewControllerDelegate)delegate
{
  return (SKCloudServiceSetupRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
