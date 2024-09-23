@implementation VNDocumentCameraViewController_InProcess

- (VNDocumentCameraViewController_InProcess)init
{
  ICDocCamImageCache *v3;
  ICRemoteDocCamViewController *v4;
  uint64_t v5;
  void *v6;
  ICRemoteDocCamViewController *v7;
  ICDocCamViewController *v8;
  uint64_t v9;
  void *v10;
  ICRemoteDocCamViewController *v11;
  VNDocumentCameraViewController_InProcess *v12;
  VNDocumentCameraViewController_InProcess *v13;
  objc_super v15;

  v3 = -[ICDocCamImageCache initWithDataCryptorDelegate:]([ICDocCamImageCache alloc], "initWithDataCryptorDelegate:", 0);
  if (DCDebugInterfaceEnabled())
  {
    v4 = -[ICRemoteDocCamViewController initWithImageCache:]([ICRemoteDocCamViewController alloc], "initWithImageCache:", v3);
    v5 = objc_opt_class();
    DCDynamicCast(v5, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    v7 = v4;
    v8 = (ICDocCamViewController *)v7;
  }
  else
  {
    v8 = -[ICDocCamViewController initWithImageCache:]([ICDocCamViewController alloc], "initWithImageCache:", v3);
    v9 = objc_opt_class();
    DCDynamicCast(v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    v7 = (ICRemoteDocCamViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v8);
  }
  v11 = v7;
  v15.receiver = self;
  v15.super_class = (Class)VNDocumentCameraViewController_InProcess;
  v12 = -[VNDocumentCameraViewController initWithChildViewController:](&v15, sel_initWithChildViewController_, v7);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewController, v8);
    -[VNDocumentCameraViewController_InProcess setModalPresentationStyle:](v13, "setModalPresentationStyle:", 0);
  }

  return v13;
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VNDocumentCameraViewController_InProcess;
  -[VNDocumentCameraViewController_InProcess didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (int64_t)preferredContainerBackgroundStyle
{
  return 2;
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
  VNDocumentCameraScan *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  -[VNDocumentCameraViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = -[VNDocumentCameraScan initWithDocInfoCollection:imageCache:]([VNDocumentCameraScan alloc], "initWithDocInfoCollection:imageCache:", v13, v8);
    -[VNDocumentCameraViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "documentCameraViewController:didFinishWithScan:", self, v11);

  }
  else
  {
    -[VNDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }

}

- (void)documentCameraController:(id)a3 didFinishWithImage:(id)a4
{
  void *v5;
  char v6;
  id v7;

  -[VNDocumentCameraViewController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[VNDocumentCameraViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentCameraViewControllerDidCancel:", self);

  }
  else
  {
    -[VNDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }
}

- (void)documentCameraControllerDidCancel:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "setupResult")
    || (-[VNDocumentCameraViewController delegate](self, "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) == 0))
  {
    if (!objc_msgSend(v11, "setupResult")
      || (-[VNDocumentCameraViewController delegate](self, "delegate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_opt_respondsToSelector(),
          v7,
          (v8 & 1) == 0))
    {
      -[VNDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
      goto LABEL_12;
    }
    if (objc_msgSend(v11, "setupResult") == 1)
      v9 = -11852;
    else
      v9 = -11800;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB1C58], v9, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNDocumentCameraViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "documentCameraViewController:didFailWithError:", self, v6);

  }
  else
  {
    -[VNDocumentCameraViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentCameraViewControllerDidCancel:", self);
  }

LABEL_12:
}

- (id)scanDataDelegateWithIdentifier:(id)a3
{
  return 0;
}

- (void)remoteDocumentCameraControllerDidCancel:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[VNDocumentCameraViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  -[VNDocumentCameraViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v6, "documentCameraViewControllerDidCancel:", self);
LABEL_5:

    return;
  }
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB1C58], -11800, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[VNDocumentCameraViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentCameraViewController:didFailWithError:", self, v9);

    goto LABEL_5;
  }
  -[VNDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
}

- (void)remoteDocumentCameraController:(id)a3 didFinishWithInfoCollection:(id)a4
{
  id v6;
  void *v7;
  char v8;
  VNDocumentCameraScan *v9;
  void *v10;
  VNDocumentCameraScan *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[VNDocumentCameraViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = [VNDocumentCameraScan alloc];
    objc_msgSend(v13, "imageCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[VNDocumentCameraScan initWithDocInfoCollection:imageCache:](v9, "initWithDocInfoCollection:imageCache:", v6, v10);

    -[VNDocumentCameraViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "documentCameraViewController:didFinishWithScan:", self, v11);

  }
  else
  {
    -[VNDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }

}

- (void)remoteDocumentCameraController:(id)a3 didFailWithError:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[VNDocumentCameraViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[VNDocumentCameraViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentCameraViewController:didFailWithError:", self, v8);

  }
  else
  {
    -[VNDocumentCameraViewController_InProcess _autoDismiss](self, "_autoDismiss");
  }

}

- (void)_autoDismiss
{
  id v2;

  -[VNDocumentCameraViewController_InProcess presentingViewController](self, "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)removeSaveActionBlockerForFiles
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20CE8E000, log, OS_LOG_TYPE_DEBUG, "Calling removeSaveActionBlockerForFiles...", v1, 2u);
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
