@implementation HKAuthorizationPresentationController

- (void)dealloc
{
  void *v3;
  id v4;
  objc_super v5;

  -[HKAuthorizationPresentationController requestCancellationInvocation](self, "requestCancellationInvocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "invoke");

  v5.receiver = self;
  v5.super_class = (Class)HKAuthorizationPresentationController;
  -[HKAuthorizationPresentationController dealloc](&v5, sel_dealloc);
}

- (void)presentWithPresentationRequests:(id)a3 authorizationRequestRecord:(id)a4 authorizationViewControllerPresenter:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationPresentationController.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationRequests != nil"));

  }
  if (objc_msgSend(v11, "count"))
  {
    if (v14)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationPresentationController.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationRequests.count > 0"));

    if (v14)
    {
LABEL_5:
      if (!v13)
        goto LABEL_9;
      goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationPresentationController.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  if (!v13)
    goto LABEL_9;
LABEL_6:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationPresentationController.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationViewControllerPresenter isKindOfClass:[UIViewController class]]"));

  }
  objc_storeWeak((id *)&self->_viewControllerPresenter, v13);
LABEL_9:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __148__HKAuthorizationPresentationController_presentWithPresentationRequests_authorizationRequestRecord_authorizationViewControllerPresenter_completion___block_invoke;
  block[3] = &unk_1E9C40210;
  block[4] = self;
  v23 = v11;
  v24 = v12;
  v25 = v14;
  v15 = v14;
  v16 = v12;
  v17 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __148__HKAuthorizationPresentationController_presentWithPresentationRequests_authorizationRequestRecord_authorizationViewControllerPresenter_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_presentWithPresentationRequests:authorizationRequestRecord:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)cancelPresentation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HKAuthorizationPresentationController_cancelPresentation__block_invoke;
  block[3] = &unk_1E9C3F0D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __59__HKAuthorizationPresentationController_cancelPresentation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "requestCancellationInvocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "invoke");

  return objc_msgSend(*(id *)(a1 + 32), "_dismissViewControllerAnimated:", 1);
}

- (void)_requestAndConfigureCarouselAlert:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, HKNanoHostAuthorizationController *);
  HKNanoHostAuthorizationController *v7;
  void (**v8)(id, HKNanoHostAuthorizationController *);

  v8 = (void (**)(id, HKNanoHostAuthorizationController *))a3;
  v6 = (void (**)(id, _QWORD, HKNanoHostAuthorizationController *))a4;
  if (-[HKAuthorizationPresentationController didPresent](self, "didPresent"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Already presenting Carousel alert"));
    v7 = (HKNanoHostAuthorizationController *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v7);
  }
  else
  {
    v7 = objc_alloc_init(HKNanoHostAuthorizationController);
    -[HKAuthorizationPresentationController setNanoAuthorizationController:](self, "setNanoAuthorizationController:", v7);
    -[HKNanoHostAuthorizationController setDelegate:](v7, "setDelegate:", self);
    v8[2](v8, v7);
    -[HKNanoHostAuthorizationController show](v7, "show");
    -[HKAuthorizationPresentationController setDidPresent:](self, "setDidPresent:", 1);
    v6[2](v6, 1, 0);
  }

}

- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[5];
  id v12;
  void (**v13)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[HKAuthorizationPresentationController didPresent](self, "didPresent"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Already presenting remote view controller"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);

  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__HKAuthorizationPresentationController__requestAndConfigureHostViewController_completion___block_invoke;
    aBlock[3] = &unk_1E9C409A0;
    aBlock[4] = self;
    v12 = v6;
    v13 = v7;
    v9 = _Block_copy(aBlock);
    -[HKAuthorizationPresentationController setDidPresent:](self, "setDidPresent:", 1);
    +[HKHealthPrivacyHostAuthorizationViewController requestRemoteViewControllerWithConnectionHandler:](HKHealthPrivacyHostAuthorizationViewController, "requestRemoteViewControllerWithConnectionHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationPresentationController setRequestCancellationInvocation:](self, "setRequestCancellationInvocation:", v10);

  }
}

void __91__HKAuthorizationPresentationController__requestAndConfigureHostViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRequestCancellationInvocation:", 0);
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = v5;
    objc_msgSend(v7, "setHostViewController:", v8);
    objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_makeRemoteViewControllerVisible:", v8);
    objc_msgSend(v8, "show");

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v9();

}

- (void)_mainQueue_presentWithPresentationRequests:(id)a3 authorizationRequestRecord:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id *v13;
  id *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAppleWatch");

  if (v12)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __122__HKAuthorizationPresentationController__mainQueue_presentWithPresentationRequests_authorizationRequestRecord_completion___block_invoke;
    v22[3] = &unk_1E9C41928;
    v13 = &v23;
    v14 = &v24;
    v23 = v9;
    v24 = v8;
    v15 = v8;
    v16 = v9;
    -[HKAuthorizationPresentationController _requestAndConfigureCarouselAlert:completion:](self, "_requestAndConfigureCarouselAlert:completion:", v22, v10);
  }
  else
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __122__HKAuthorizationPresentationController__mainQueue_presentWithPresentationRequests_authorizationRequestRecord_completion___block_invoke_2;
    v19[3] = &unk_1E9C41950;
    v13 = &v20;
    v14 = &v21;
    v20 = v9;
    v21 = v8;
    v17 = v8;
    v18 = v9;
    -[HKAuthorizationPresentationController _requestAndConfigureHostViewController:completion:](self, "_requestAndConfigureHostViewController:completion:", v19, v10);
  }

}

uint64_t __122__HKAuthorizationPresentationController__mainQueue_presentWithPresentationRequests_authorizationRequestRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestRecord:presentationRequests:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __122__HKAuthorizationPresentationController__mainQueue_presentWithPresentationRequests_authorizationRequestRecord_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestRecord:presentationRequests:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_makeRemoteViewControllerVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  HKAuthorizationViewPresenterProvider *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v4 = a3;
  if (_UIApplicationIsExtension()
    && (objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isAppleWatch"),
        v5,
        (v6 & 1) == 0))
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_FAULT))
      -[HKObjectPickerPresentationController _makeRemoteViewControllerVisible:].cold.1(v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isiPad");

    if (v8)
    {
      objc_msgSend(v4, "setModalPresentationStyle:", 2);
      objc_msgSend(v4, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    }
    objc_msgSend(v4, "setModalInPresentation:", 1);
    v9 = objc_alloc_init(HKAuthorizationViewPresenterProvider);
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
    -[HKAuthorizationViewPresenterProvider hkAuthorizationViewControllerPresenter:](v9, "hkAuthorizationViewControllerPresenter:", WeakRetained);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      do
      {
        objc_msgSend(v11, "presentedViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "presentedViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v13;
      }
      while (v14);
    }
    else
    {
      v13 = v11;
    }
    objc_msgSend(v13, "presentViewController:animated:completion:", v4, 1, 0);

  }
}

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  HKNanoHostAuthorizationController *nanoAuthorizationController;
  HKHealthPrivacyHostAuthorizationViewController *v8;
  HKHealthPrivacyHostAuthorizationViewController *hostViewController;
  void *v10;
  _QWORD v11[5];

  if (self->_didPresent)
  {
    v3 = a3;
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAppleWatch");

    if (v6)
    {
      -[HKNanoHostAuthorizationController invalidate](self->_nanoAuthorizationController, "invalidate");
      -[HKNanoHostAuthorizationController setDelegate:](self->_nanoAuthorizationController, "setDelegate:", 0);
      nanoAuthorizationController = self->_nanoAuthorizationController;
      self->_nanoAuthorizationController = 0;

      self->_didPresent = 0;
    }
    else
    {
      v8 = self->_hostViewController;
      -[HKHealthPrivacyHostAuthorizationViewController setDelegate:](v8, "setDelegate:", 0);
      hostViewController = self->_hostViewController;
      self->_hostViewController = 0;

      -[HKHealthPrivacyHostAuthorizationViewController presentingViewController](v8, "presentingViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __72__HKAuthorizationPresentationController__dismissViewControllerAnimated___block_invoke;
      v11[3] = &unk_1E9C3F0D0;
      v11[4] = self;
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", v3, v11);

    }
  }
}

uint64_t __72__HKAuthorizationPresentationController__dismissViewControllerAnimated___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (void)healthPrivacyHostAuthorizationControllerDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      -[HKAuthorizationPresentationController healthPrivacyHostAuthorizationControllerDidFinishWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  -[HKAuthorizationPresentationController _dismissViewControllerAnimated:](self, "_dismissViewControllerAnimated:", 1);

}

- (_UIAsyncInvocation)requestCancellationInvocation
{
  return self->_requestCancellationInvocation;
}

- (void)setRequestCancellationInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_requestCancellationInvocation, a3);
}

- (HKHealthPrivacyHostAuthorizationViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hostViewController, a3);
}

- (HKNanoHostAuthorizationController)nanoAuthorizationController
{
  return self->_nanoAuthorizationController;
}

- (void)setNanoAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_nanoAuthorizationController, a3);
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (void)setDidPresent:(BOOL)a3
{
  self->_didPresent = a3;
}

- (UIViewController)viewControllerPresenter
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
}

- (void)setViewControllerPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerPresenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerPresenter);
  objc_storeStrong((id *)&self->_nanoAuthorizationController, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_requestCancellationInvocation, 0);
}

- (void)healthPrivacyHostAuthorizationControllerDidFinishWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Privacy host controller finished with error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
