@implementation DCDocumentCameraViewController_InProcess

- (DCDocumentCameraViewController_InProcess)initWithDelegate:(id)a3
{
  id v4;
  ICDocCamImageCache *v5;
  ICRemoteDocCamViewController *v6;
  uint64_t v7;
  void *v8;
  ICRemoteDocCamViewController *v9;
  ICDocCamViewController *v10;
  uint64_t v11;
  void *v12;
  ICRemoteDocCamViewController *v13;
  DCDocumentCameraViewController_InProcess *v14;
  objc_super v16;

  v4 = a3;
  v5 = -[ICDocCamImageCache initWithDataCryptorDelegate:]([ICDocCamImageCache alloc], "initWithDataCryptorDelegate:", 0);
  if (DCDebugInterfaceEnabled())
  {
    v6 = -[ICRemoteDocCamViewController initWithImageCache:]([ICRemoteDocCamViewController alloc], "initWithImageCache:", v5);
    v7 = objc_opt_class();
    DCDynamicCast(v7, (uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    v9 = v6;
    v10 = (ICDocCamViewController *)v9;
  }
  else
  {
    v10 = -[ICDocCamViewController initWithImageCache:]([ICDocCamViewController alloc], "initWithImageCache:", v5);
    v11 = objc_opt_class();
    DCDynamicCast(v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    v9 = (ICRemoteDocCamViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v10);
  }
  v13 = v9;
  v16.receiver = self;
  v16.super_class = (Class)DCDocumentCameraViewController_InProcess;
  v14 = -[DCDocumentCameraViewController initWithDelegate:childViewController:](&v16, sel_initWithDelegate_childViewController_, v4, v9);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_viewController, v10);
    -[DCDocumentCameraViewController_InProcess setModalPresentationStyle:](v14, "setModalPresentationStyle:", 0);
  }

  return v14;
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DCDocumentCameraViewController_InProcess;
  -[DCDocumentCameraViewController_InProcess didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (BOOL)documentCameraController:(id)a3 canAddImages:(unint64_t)a4
{
  return a4 <= 0x18;
}

- (id)documentCameraControllerCreateDataCryptorIfNecessary
{
  return 0;
}

- (void)documentCameraController:(id)a3 didFinishWithDocInfoCollection:(id)a4 imageCache:(id)a5 warnUser:(BOOL)a6
{
  id v8;
  void *v9;
  char v10;
  DCScannedDocument *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = -[DCScannedDocument initWithDocInfoCollection:imageCache:]([DCScannedDocument alloc], "initWithDocInfoCollection:imageCache:", v13, v8);
    -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "documentCameraViewController:didFinishWithDocument:", self, v11);

  }
  else
  {
    -[DCDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }

}

- (void)documentCameraController:(id)a3 didFinishWithImage:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentCameraViewControllerDidCancel:", self);

  }
  else
  {
    -[DCDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }
}

- (void)documentCameraControllerDidCancel:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentCameraViewControllerDidCancel:", self);

  }
  else
  {
    -[DCDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  return 0;
}

- (void)remoteDocumentCameraControllerDidCancel:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentCameraViewControllerDidCancel:", self);

  }
  else
  {
    -[DCDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }
}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  id v6;
  void *v7;
  char v8;
  DCScannedDocument *v9;
  void *v10;
  DCScannedDocument *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = [DCScannedDocument alloc];
    objc_msgSend(v13, "imageCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[DCScannedDocument initWithDocInfoCollection:imageCache:](v9, "initWithDocInfoCollection:imageCache:", v6, v10);

    -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "documentCameraViewController:didFinishWithDocument:", self, v11);

  }
  else
  {
    -[DCDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }

}

- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentCameraViewControllerDidCancel:", self);

  }
  else
  {
    -[DCDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }
}

- (void)_autoDismiss
{
  id v2;

  -[DCDocumentCameraViewController_InProcess presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
  objc_storeStrong((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
