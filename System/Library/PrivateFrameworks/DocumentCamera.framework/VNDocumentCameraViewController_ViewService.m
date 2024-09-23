@implementation VNDocumentCameraViewController_ViewService

- (VNDocumentCameraViewController_ViewService)init
{
  VNDocumentCameraViewController_ViewService *v2;
  VNDocumentCameraViewController_ViewService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNDocumentCameraViewController_ViewService;
  v2 = -[VNDocumentCameraViewController initWithChildViewController:](&v5, sel_initWithChildViewController_, 0);
  v3 = v2;
  if (v2)
    -[VNDocumentCameraViewController_ViewService setModalPresentationStyle:](v2, "setModalPresentationStyle:", 0);
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[VNDocumentCameraViewController_ViewService accelerometer](self, "accelerometer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOrientationEventsEnabled:", 0);

  -[VNDocumentCameraViewController_ViewService accelerometer](self, "accelerometer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPassiveOrientationEvents:", 1);

  -[VNDocumentCameraViewController_ViewService accelerometer](self, "accelerometer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  v6.receiver = self;
  v6.super_class = (Class)VNDocumentCameraViewController_ViewService;
  -[VNDocumentCameraViewController_ViewService dealloc](&v6, sel_dealloc);
}

- (int64_t)preferredContainerBackgroundStyle
{
  return 2;
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v5;

  -[VNDocumentCameraViewController_ViewService viewServiceViewController](self, "viewServiceViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrientation:animated:", a4, 1);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VNDocumentCameraViewController_ViewService;
  -[VNDocumentCameraViewController_ViewService viewDidLoad](&v15, sel_viewDidLoad);
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.DocumentCamera.ViewService"), &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__2;
    v12 = __Block_byref_object_dispose__2;
    v13 = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke;
    v7[3] = &unk_24C5B8570;
    v7[4] = self;
    v7[5] = &v8;
    objc_msgSend(MEMORY[0x24BDF7140], "instantiateWithExtension:completion:", v3, v7);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v9[5];
    v9[5] = v5;

    objc_msgSend((id)v9[5], "delayDisplayOfRemoteController");
    -[VNDocumentCameraViewController setChildViewController:](self, "setChildViewController:", v9[5]);
    _Block_object_dispose(&v8, 8);

  }
}

- (id)castedChildViewController
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  -[VNDocumentCameraViewController childViewController](self, "childViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  DCClassAndProtocolCast(v2, v3, 1, v4, v5, v6, v7, v8, (uint64_t)&unk_2549D37E0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (DCDocumentCameraViewServiceViewController)viewServiceViewController
{
  void *v2;
  void *v3;

  -[VNDocumentCameraViewController_ViewService remoteViewController](self, "remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewServiceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DCDocumentCameraViewServiceViewController *)v3;
}

- (DCDocumentCameraRemoteViewController)remoteViewController
{
  void *v2;
  void *v3;

  -[VNDocumentCameraViewController_ViewService castedChildViewController](self, "castedChildViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DCDocumentCameraRemoteViewController *)v3;
}

- (void)dismiss
{
  void *v3;
  id v4;

  -[VNDocumentCameraViewController_ViewService presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[VNDocumentCameraViewController_ViewService remoteViewController](self, "remoteViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerWasDismissed");

}

- (void)didCancel
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[VNDocumentCameraViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[VNDocumentCameraViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "documentCameraViewControllerDidCancel:", self);
  }
  else
  {
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0)
      return;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB1C58], -11800, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[VNDocumentCameraViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentCameraViewController:didFailWithError:", self, v8);

  }
}

- (void)didFinishWithDocumentInfoCollection:(id)a3
{
  void *v4;
  char v5;
  VNDocumentCameraScan *v6;
  void *v7;
  void *v8;
  VNDocumentCameraScan *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[VNDocumentCameraViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = [VNDocumentCameraScan alloc];
    -[VNDocumentCameraViewController_ViewService viewServiceSession](self, "viewServiceSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "docCamImageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VNDocumentCameraScan initWithDocInfoCollection:imageCache:](v6, "initWithDocInfoCollection:imageCache:", v11, v8);

    -[VNDocumentCameraViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "documentCameraViewController:didFinishWithScan:", self, v9);

  }
}

- (void)didFailWithError:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VNDocumentCameraViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VNDocumentCameraViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentCameraViewController:didFailWithError:", self, v7);

  }
}

- (void)removeSaveActionBlockerForFiles
{
  id v2;

  -[VNDocumentCameraViewController_ViewService viewServiceViewController](self, "viewServiceViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeSaveActionBlockerForFiles");

}

- (DCDocumentCameraViewServiceSession)viewServiceSession
{
  return self->_viewServiceSession;
}

- (void)setViewServiceSession:(id)a3
{
  objc_storeStrong((id *)&self->_viewServiceSession, a3);
}

- (BKSAccelerometer)accelerometer
{
  return self->_accelerometer;
}

- (void)setAccelerometer:(id)a3
{
  objc_storeStrong((id *)&self->_accelerometer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelerometer, 0);
  objc_storeStrong((id *)&self->_viewServiceSession, 0);
}

@end
