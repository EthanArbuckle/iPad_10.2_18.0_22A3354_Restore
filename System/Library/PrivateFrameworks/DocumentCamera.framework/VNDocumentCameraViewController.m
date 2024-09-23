@implementation VNDocumentCameraViewController

+ (BOOL)isSupported
{
  int v2;

  if ((DCDebugInterfaceEnabled() & 1) != 0)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = MGGetBoolAnswer();
    if (v2)
      LOBYTE(v2) = MGGetBoolAnswer() ^ 1;
  }
  return v2;
}

- (VNDocumentCameraViewController)init
{
  VNDocumentCameraViewController *v3;
  id v5;

  if ((objc_msgSend((id)objc_opt_class(), "isSupported") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Document camera is not available"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  v3 = +[VNDocumentCameraViewController newDefaultViewController](VNDocumentCameraViewController, "newDefaultViewController");

  return v3;
}

- (VNDocumentCameraViewController)initWithChildViewController:(id)a3
{
  id v4;
  VNDocumentCameraViewController *v5;
  VNDocumentCameraViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VNDocumentCameraViewController;
  v5 = -[VNDocumentCameraViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v4 && v5)
    -[VNDocumentCameraViewController setChildViewController:](v5, "setChildViewController:", v4);

  return v6;
}

- (VNDocumentCameraViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{

  return 0;
}

- (VNDocumentCameraViewController)initWithCoder:(NSCoder *)aDecoder
{

  return 0;
}

+ (id)newDefaultViewController
{
  void *v3;
  int v4;

  +[DCSettings sharedSettings](DCSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableViewService");

  if (v4)
    return (id)objc_msgSend(a1, "newViewServiceViewController");
  else
    return (id)objc_msgSend(a1, "newInProcessViewController");
}

+ (id)newViewServiceViewController
{
  return objc_alloc_init(VNDocumentCameraViewController_ViewService);
}

+ (id)newInProcessViewController
{
  return objc_alloc_init(VNDocumentCameraViewController_InProcess);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
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
  -[VNDocumentCameraViewController addChildViewController:](self, "addChildViewController:", v5);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[VNDocumentCameraViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v21 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNDocumentCameraViewController view](self, "view");
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
  -[VNDocumentCameraViewController view](self, "view");
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
  -[VNDocumentCameraViewController view](self, "view");
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
  -[VNDocumentCameraViewController view](self, "view");
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

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
    v19[2] = __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_10;
    v19[3] = &unk_24C5B8548;
    v17 = *(_QWORD *)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v20 = v15;
    v21 = v17;
    v18 = v15;
    objc_msgSend(v18, "startSessionWithClientContext:completion:", v16, v19);

  }
}

uint64_t __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_10(uint64_t a1, uint64_t a2)
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
  v8[2] = __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_2;
  v8[3] = &unk_24C5B8520;
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v6;
  return objc_msgSend(v5, "prepareForDisplayWithCompletion:", v8);
}

uint64_t __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "endDelayingDisplayOfRemoteController");
}

void __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = 138412546;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a2;
  v5 = v7;
  _os_log_error_impl(&dword_20CE8E000, a3, OS_LOG_TYPE_ERROR, "Remote view controller error while displaying %@: %@", (uint8_t *)&v6, 0x16u);

}

void __57__VNDocumentCameraViewController_ViewService_viewDidLoad__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20CE8E000, a2, OS_LOG_TYPE_DEBUG, "_UIResilientRemoteViewContainerViewController initialized (%@)", (uint8_t *)&v2, 0xCu);
}

@end
