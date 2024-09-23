@implementation ILClassificationUIExtensionHostViewController

- (ILClassificationUIExtensionHostViewController)initWithClassificationRequest:(id)a3 sender:(id)a4 isoCountryCode:(id)a5
{
  ILClassificationUIExtensionHostViewController *v5;

  v5 = -[ILClassificationUIExtensionHostViewController initUnactivatedVCWithRequest:sender:isoCountryCode:](self, "initUnactivatedVCWithRequest:sender:isoCountryCode:", a3, a4, a5);
  -[ILClassificationUIExtensionHostViewController activateExtensionWithCompletion:](v5, "activateExtensionWithCompletion:", 0);
  return v5;
}

- (id)initUnactivatedVCWithRequest:(id)a3 sender:(id)a4 isoCountryCode:(id)a5
{
  id v9;
  id v10;
  id v11;
  ILClassificationUIExtensionHostViewController *v12;
  ILClassificationUIExtensionHostViewController *v13;
  ILClassificationReportingController *v14;
  ILClassificationReportingController *reportingController;
  ILClassificationExtensionShellViewController *v16;
  ILClassificationExtensionShellViewController *shellViewController;
  uint64_t v18;
  UINavigationController *navigationController;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ILClassificationUIExtensionHostViewController;
  v12 = -[ILClassificationUIExtensionHostViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, MEMORY[0x24BDAC9B8]);
    objc_storeStrong((id *)&v13->_classificationRequest, a3);
    objc_storeStrong((id *)&v13->_sender, a4);
    objc_storeStrong((id *)&v13->_isoCountryCode, a5);
    v14 = -[ILClassificationReportingController initWithHostViewController:]([ILClassificationReportingController alloc], "initWithHostViewController:", v13);
    reportingController = v13->_reportingController;
    v13->_reportingController = v14;

    v16 = objc_alloc_init(ILClassificationExtensionShellViewController);
    shellViewController = v13->_shellViewController;
    v13->_shellViewController = v16;

    -[ILClassificationExtensionShellViewController setDelegate:](v13->_shellViewController, "setDelegate:", v13);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v13->_shellViewController);
    navigationController = v13->_navigationController;
    v13->_navigationController = (UINavigationController *)v18;

  }
  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ILClassificationUIExtensionHostViewController;
  -[ILClassificationUIExtensionHostViewController viewDidLoad](&v10, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationUIExtensionHostViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[ILClassificationUIExtensionHostViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationUIExtensionHostViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v7);

  -[ILClassificationUIExtensionHostViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationUIExtensionHostViewController addChildViewController:](self, "addChildViewController:", v8);

  -[ILClassificationUIExtensionHostViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didMoveToParentViewController:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ILClassificationUIExtensionHostViewController;
  -[ILClassificationUIExtensionHostViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[ILClassificationUIExtensionHostViewController extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationUIExtensionHostViewController extensionRequestIdentifier](self, "extensionRequestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", v5);

}

- (void)activateExtensionWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD8FE8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke;
  v7[3] = &unk_24F1A2680;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "activateWithCompletion:", v7);

}

void __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    ILDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_228FAC000, v7, OS_LOG_TYPE_DEFAULT, "Instantiating remote view controller for extension identifier %@", buf, 0xCu);

    }
    v9 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_11;
    v17[3] = &unk_24F1A2630;
    v11 = *(_QWORD *)(a1 + 32);
    v10 = (id *)(a1 + 32);
    v17[4] = v11;
    v12 = v5;
    v18 = v12;
    v19 = v10[1];
    objc_msgSend(v12, "instantiateViewControllerWithInputItems:connectionHandler:", MEMORY[0x24BDBD1A8], v17);
    objc_initWeak((id *)buf, *v10);
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_19;
    v15[3] = &unk_24F1A2658;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v12, "setRequestInterruptionBlock:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logErrorWithMessage:", CFSTR("Failed to determine ui classification extension"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v13);

  }
}

void __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
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
  uint64_t v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = v9;
  if (v7 && v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setExtension:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setExtensionRequestIdentifier:", v7);
    objc_msgSend(*(id *)(a1 + 40), "_extensionContextForUUID:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      ILDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_impl(&dword_228FAC000, v13, OS_LOG_TYPE_DEFAULT, "Successfully instantiated remote view controller %@", buf, 0xCu);
      }

      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "queue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:queue:", v14, v15);

      objc_msgSend(*(id *)(a1 + 32), "setExtensionHostContext:", v12);
      ILDefaultLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "classificationRequest");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v8;
        v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_228FAC000, v16, OS_LOG_TYPE_DEFAULT, "Preparing view controller %@ for classification request %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "classificationRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "prepareForClassificationRequest:", v18);

      objc_msgSend(*(id *)(a1 + 32), "shellViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "displayExtensionViewController:forExtension:", v8, *(_QWORD *)(a1 + 40));

      v20 = v11;
    }
    else
    {
      v25 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not obtain extension host context of class %@: %@"), objc_opt_class(), v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logErrorWithMessage:", v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    v22 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("Failed to instantiate view controller with extension identifier %@: %@"), v23, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logErrorWithMessage:", v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v27 = *(_QWORD *)(a1 + 48);
  if (v27)
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v20);

}

void __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;

  v3 = a2;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_19_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finish");

}

- (void)userDidFinishForExtensionShellViewController:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[ILClassificationUIExtensionHostViewController extensionHostContext](self, "extensionHostContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationUIExtensionHostViewController classificationRequest](self, "classificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __94__ILClassificationUIExtensionHostViewController_userDidFinishForExtensionShellViewController___block_invoke;
  v6[3] = &unk_24F1A26A8;
  v6[4] = self;
  objc_msgSend(v4, "classificationResponseForRequest:completion:", v5, v6);

}

uint64_t __94__ILClassificationUIExtensionHostViewController_userDidFinishForExtensionShellViewController___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "didCompleteClassificationRequestWithResponse:", a2);
  return result;
}

- (void)context:(id)a3 didBecomeReadyForClassificationResponse:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[ILClassificationUIExtensionHostViewController shellViewController](self, "shellViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnableFinishOption:", v4);

}

- (void)didCompleteClassificationRequestWithResponse:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  ILClassificationUIExtensionHostViewController *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  ILClassificationUIExtensionHostViewController *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ILClassificationUIExtensionHostViewController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ILClassificationUIExtensionHostViewController setClassificationResponse:](self, "setClassificationResponse:", v4);
  ILDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[ILClassificationUIExtensionHostViewController classificationRequest](self, "classificationRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v7;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_228FAC000, v6, OS_LOG_TYPE_DEFAULT, "Host VC didCompleteClassificationRequest: %@ with response: %@", buf, 0x16u);

  }
  v8 = objc_msgSend(v4, "action");
  if ((unint64_t)(v8 - 1) < 2)
  {
    -[ILClassificationUIExtensionHostViewController reportingController](self, "reportingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ILClassificationUIExtensionHostViewController extension](self, "extension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke;
    v22 = &unk_24F1A26F8;
    v23 = self;
    v13 = &v19;
    goto LABEL_8;
  }
  if (!v8)
  {
    -[ILClassificationUIExtensionHostViewController finish](self, "finish");
    goto LABEL_10;
  }
  if (v8 == 3)
  {
    -[ILClassificationUIExtensionHostViewController sender](self, "sender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ILClassificationUIExtensionHostViewController isoCountryCode](self, "isoCountryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ILClassificationUIExtensionHostViewController blockNumber:withCountryCode:](self, "blockNumber:withCountryCode:", v9, v10);

    -[ILClassificationUIExtensionHostViewController reportingController](self, "reportingController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ILClassificationUIExtensionHostViewController extension](self, "extension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_3;
    v17 = &unk_24F1A26F8;
    v18 = self;
    v13 = &v14;
LABEL_8:
    objc_msgSend(v11, "reportResponse:forExtension:withCompletion:", v4, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);

  }
LABEL_10:

}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (!v2)
    return objc_msgSend(v3, "finish");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_2;
  v5[3] = &unk_24F1A26D0;
  v5[4] = v3;
  return objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, v5);
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[5];
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_4;
    v6[3] = &unk_24F1A26D0;
    v6[4] = v3;
    return objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, v6);
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_6;
    v5[3] = &unk_24F1A26D0;
    v5[4] = v3;
    return objc_msgSend(v3, "presentBlockAlertWithCompletion:", v5);
  }
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_5;
  v3[3] = &unk_24F1A26D0;
  v3[4] = v1;
  return objc_msgSend(v1, "presentBlockAlertWithCompletion:", v3);
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

uint64_t __94__ILClassificationUIExtensionHostViewController_didCompleteClassificationRequestWithResponse___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

- (void)finish
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  ILDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_228FAC000, v3, OS_LOG_TYPE_DEFAULT, "Finished, invoking didCompleteClassificationRequest", v7, 2u);
  }

  -[ILClassificationUIExtensionHostViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationUIExtensionHostViewController classificationRequest](self, "classificationRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationUIExtensionHostViewController classificationResponse](self, "classificationResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controller:didCompleteClassificationRequest:withResponse:", self, v5, v6);

}

- (void)presentBlockAlertWithCompletion:(id)a3
{
  NSObject *v4;
  void *v5;
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
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  _QWORD block[4];
  id v32;
  ILClassificationUIExtensionHostViewController *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[ILClassificationUIExtensionHostViewController sender](self, "sender");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = v5;
    _os_log_impl(&dword_228FAC000, v4, OS_LOG_TYPE_DEFAULT, "Present block alert for: %@", buf, 0xCu);

  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@_HAS_BLOCKED_%@_MESSAGE"), &stru_24F1A2978, CFSTR("IdentityLookupUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationUIExtensionHostViewController extension](self, "extension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_plugIn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedContainingName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationUIExtensionHostViewController sender](self, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v11, v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NUMBER_HAS_BEEN_BLOCKED"), &stru_24F1A2978, CFSTR("IdentityLookupUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alertControllerWithTitle:message:preferredStyle:", v15, v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OKAY"), &stru_24F1A2978, CFSTR("IdentityLookupUI"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke;
  v36[3] = &unk_24F1A2720;
  v21 = v30;
  v37 = v21;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v36);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v22);

  v23 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), &stru_24F1A2978, CFSTR("IdentityLookupUI"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v20;
  v34[1] = 3221225472;
  v34[2] = __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke_43;
  v34[3] = &unk_24F1A2748;
  v34[4] = self;
  v35 = v21;
  v26 = v21;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v27);

  block[0] = v20;
  block[1] = 3221225472;
  block[2] = __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke_44;
  block[3] = &unk_24F1A2770;
  v32 = v16;
  v33 = self;
  v28 = v16;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  ILDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_228FAC000, v2, OS_LOG_TYPE_DEFAULT, "User dismissed report and block alert controller", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  ILDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_228FAC000, v2, OS_LOG_TYPE_DEFAULT, "User launched settings", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "launchSettings");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __81__ILClassificationUIExtensionHostViewController_presentBlockAlertWithCompletion___block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ILDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_228FAC000, v2, OS_LOG_TYPE_DEFAULT, "Present reportAndBlockAlert: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
}

- (void)launchSettings
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_228FAC000, log, OS_LOG_TYPE_ERROR, "Error opening url: %@ (%@)", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)blockNumber:(id)a3 withCountryCode:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  ILDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_228FAC000, v7, OS_LOG_TYPE_DEFAULT, "blocking number: %@ with country code: %@", (uint8_t *)&v12, 0x16u);
  }

  v8 = (void *)CUTWeakLinkClass();
  v9 = (void *)CUTWeakLinkClass();
  objc_msgSend(v8, "sharedPrivacyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "phoneNumberWithDigits:countryCode:", v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBlockIncomingCommunication:forPhoneNumber:", 1, v11);

}

- (id)logErrorWithMessage:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  ILDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[ILClassificationUIExtensionHostViewController logErrorWithMessage:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = (void *)MEMORY[0x24BDD1540];
  v15 = CFSTR("ErrorMessage");
  v16[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ILClassificationUIExtensionHostViewController"), 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (ILClassificationUIExtensionHostViewControllerDelegate)delegate
{
  return (ILClassificationUIExtensionHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (ILClassificationRequest)classificationRequest
{
  return self->_classificationRequest;
}

- (ILClassificationResponse)classificationResponse
{
  return self->_classificationResponse;
}

- (void)setClassificationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_classificationResponse, a3);
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSCopying)extensionRequestIdentifier
{
  return self->_extensionRequestIdentifier;
}

- (void)setExtensionRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (ILClassificationExtensionShellViewController)shellViewController
{
  return self->_shellViewController;
}

- (void)setShellViewController:(id)a3
{
  objc_storeStrong((id *)&self->_shellViewController, a3);
}

- (ILClassificationUIExtensionHostContext)extensionHostContext
{
  return self->_extensionHostContext;
}

- (void)setExtensionHostContext:(id)a3
{
  objc_storeStrong((id *)&self->_extensionHostContext, a3);
}

- (ILClassificationReportingController)reportingController
{
  return self->_reportingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingController, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_shellViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_classificationResponse, 0);
  objc_storeStrong((id *)&self->_classificationRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __81__ILClassificationUIExtensionHostViewController_activateExtensionWithCompletion___block_invoke_19_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228FAC000, a2, a3, "handling interruption for extension with identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)logErrorWithMessage:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228FAC000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
