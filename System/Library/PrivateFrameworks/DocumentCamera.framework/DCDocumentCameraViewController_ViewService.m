@implementation DCDocumentCameraViewController_ViewService

- (DCDocumentCameraViewController_ViewService)initWithDelegate:(id)a3
{
  DCDocumentCameraViewController_ViewService *v3;
  DCDocumentCameraViewController_ViewService *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DCDocumentCameraViewController_ViewService;
  v3 = -[DCDocumentCameraViewController initWithDelegate:childViewController:](&v6, sel_initWithDelegate_childViewController_, a3, 0);
  v4 = v3;
  if (v3)
    -[DCDocumentCameraViewController_ViewService setModalPresentationStyle:](v3, "setModalPresentationStyle:", 0);
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[DCDocumentCameraViewController_ViewService accelerometer](self, "accelerometer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOrientationEventsEnabled:", 0);

  -[DCDocumentCameraViewController_ViewService accelerometer](self, "accelerometer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPassiveOrientationEvents:", 1);

  -[DCDocumentCameraViewController_ViewService accelerometer](self, "accelerometer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  v6.receiver = self;
  v6.super_class = (Class)DCDocumentCameraViewController_ViewService;
  -[DCDocumentCameraViewController_ViewService dealloc](&v6, sel_dealloc);
}

- (void)accelerometer:(id)a3 didChangeDeviceOrientation:(int64_t)a4
{
  id v5;

  -[DCDocumentCameraViewController_ViewService viewServiceViewController](self, "viewServiceViewController", a3);
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
  v15.super_class = (Class)DCDocumentCameraViewController_ViewService;
  -[DCDocumentCameraViewController_ViewService viewDidLoad](&v15, sel_viewDidLoad);
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.DocumentCamera.ViewService"), &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__7;
    v12 = __Block_byref_object_dispose__7;
    v13 = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__DCDocumentCameraViewController_ViewService_viewDidLoad__block_invoke;
    v7[3] = &unk_24C5B8570;
    v7[4] = self;
    v7[5] = &v8;
    objc_msgSend(MEMORY[0x24BDF7140], "instantiateWithExtension:completion:", v3, v7);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v9[5];
    v9[5] = v5;

    objc_msgSend((id)v9[5], "delayDisplayOfRemoteController");
    -[DCDocumentCameraViewController setChildViewController:](self, "setChildViewController:", v9[5]);
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

  -[DCDocumentCameraViewController childViewController](self, "childViewController");
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

  -[DCDocumentCameraViewController_ViewService remoteViewController](self, "remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewServiceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DCDocumentCameraViewServiceViewController *)v3;
}

- (DCDocumentCameraRemoteViewController)remoteViewController
{
  void *v2;
  void *v3;

  -[DCDocumentCameraViewController_ViewService castedChildViewController](self, "castedChildViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (DCDocumentCameraRemoteViewController *)v3;
}

- (void)dismiss
{
  void *v3;
  id v4;

  -[DCDocumentCameraViewController_ViewService presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[DCDocumentCameraViewController_ViewService remoteViewController](self, "remoteViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerWasDismissed");

}

- (void)didCancel
{
  void *v3;
  char v4;
  id v5;

  -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentCameraViewControllerDidCancel:", self);

  }
}

- (void)didFinishWithDocumentInfoCollection:(id)a3
{
  void *v4;
  char v5;
  DCScannedDocument *v6;
  void *v7;
  void *v8;
  DCScannedDocument *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = [DCScannedDocument alloc];
    -[DCDocumentCameraViewController_ViewService viewServiceSession](self, "viewServiceSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "docCamImageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DCScannedDocument initWithDocInfoCollection:imageCache:](v6, "initWithDocInfoCollection:imageCache:", v11, v8);

    -[DCDocumentCameraViewController docCamDelegate](self, "docCamDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "documentCameraViewController:didFinishWithDocument:", self, v9);

  }
}

- (void)didFailWithError:(id)a3
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
