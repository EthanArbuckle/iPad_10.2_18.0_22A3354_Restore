@implementation DCDocumentCameraViewController

- (DCDocumentCameraViewController)initWithDelegate:(id)a3
{
  id v4;
  DCDocumentCameraViewController *v5;
  id v7;

  v4 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isAvailable") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Document camera is not available"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  +[DCDocumentCameraViewController defaultViewControllerWithDelegate:](DCDocumentCameraViewController, "defaultViewControllerWithDelegate:", v4);
  v5 = (DCDocumentCameraViewController *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (DCDocumentCameraViewController)initWithDelegate:(id)a3 childViewController:(id)a4
{
  id v6;
  id v7;
  DCDocumentCameraViewController *v8;
  DCDocumentCameraViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DCDocumentCameraViewController;
  v8 = -[DCDocumentCameraViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    if (v7)
      -[DCDocumentCameraViewController setChildViewController:](v8, "setChildViewController:", v7);
    -[DCDocumentCameraViewController setDocCamDelegate:](v9, "setDocCamDelegate:", v6);
  }

  return v9;
}

- (DCDocumentCameraViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (DCDocumentCameraViewController)initWithCoder:(id)a3
{

  return 0;
}

+ (id)defaultViewControllerWithDelegate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  +[DCSettings sharedSettings](DCSettings, "sharedSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableViewService");

  if (v6)
    objc_msgSend(a1, "viewServiceViewControllerWithDelegate:", v4);
  else
    objc_msgSend(a1, "inProcessViewControllerWithDelegate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)viewServiceViewControllerWithDelegate:(id)a3
{
  id v3;
  DCDocumentCameraViewController_ViewService *v4;

  v3 = a3;
  v4 = -[DCDocumentCameraViewController_ViewService initWithDelegate:]([DCDocumentCameraViewController_ViewService alloc], "initWithDelegate:", v3);

  return v4;
}

+ (id)inProcessViewControllerWithDelegate:(id)a3
{
  id v3;
  DCDocumentCameraViewController_InProcess *v4;

  v3 = a3;
  v4 = -[DCDocumentCameraViewController_InProcess initWithDelegate:]([DCDocumentCameraViewController_InProcess alloc], "initWithDelegate:", v3);

  return v4;
}

+ (BOOL)isAvailable
{
  int v2;

  v2 = MGGetBoolAnswer();
  if (v2)
    LOBYTE(v2) = MGGetBoolAnswer() ^ 1;
  return v2;
}

- (void)setChildViewController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[6];

  v31[4] = *MEMORY[0x24BDAC8D0];
  objc_storeStrong((id *)&self->_childViewController, a3);
  v5 = a3;
  objc_msgSend(v5, "beginAppearanceTransition:animated:", 1, 0);
  -[DCDocumentCameraViewController addChildViewController:](self, "addChildViewController:", v5);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DCDocumentCameraViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v21 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCDocumentCameraViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  objc_msgSend(v5, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCDocumentCameraViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v20;
  objc_msgSend(v5, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCDocumentCameraViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v10;
  objc_msgSend(v5, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCDocumentCameraViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v16);

  objc_msgSend(v5, "didMoveToParentViewController:", self);
  objc_msgSend(v5, "endAppearanceTransition");

}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (DCDocumentCameraViewControllerDelegate)docCamDelegate
{
  return (DCDocumentCameraViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_docCamDelegate);
}

- (void)setDocCamDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_docCamDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_docCamDelegate);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

void __57__DCDocumentCameraViewController_ViewService_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  DCDocumentCameraViewServiceSessionRequest *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_cold_2((uint64_t)v7, v8);

  if (v7)
  {
    v9 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_cold_1(a1, (uint64_t)v7, v9);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "endDelayingDisplayOfRemoteController");
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BE0B650]);
    objc_msgSend(*(id *)(a1 + 32), "setAccelerometer:", v10);

    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "accelerometer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", v11);

    objc_msgSend(*(id *)(a1 + 32), "accelerometer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOrientationEventsEnabled:", 1);

    objc_msgSend(*(id *)(a1 + 32), "accelerometer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPassiveOrientationEvents:", 0);

    objc_msgSend(v6, "setPublicViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "serviceViewControllerProxy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(DCDocumentCameraViewServiceSessionRequest);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __57__DCDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_10;
    v19[3] = &unk_24C5B8548;
    v17 = *(_QWORD *)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v15;
    v21 = v17;
    v18 = v15;
    objc_msgSend(v18, "startSessionWithClientContext:completion:", v16, v19);

  }
}

uint64_t __57__DCDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_10(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[6];

  objc_msgSend(*(id *)(a1 + 32), "setViewServiceSession:", a2);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "accelerometer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOrientation:animated:", objc_msgSend(v4, "currentDeviceOrientation"), 0);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__DCDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_2;
  v8[3] = &unk_24C5B8520;
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v6;
  return objc_msgSend(v5, "prepareForDisplayWithCompletion:", v8);
}

uint64_t __57__DCDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "endDelayingDisplayOfRemoteController");
}

@end
