@implementation HKRecalibrateEstimatesPresentationController

- (void)dealloc
{
  void *v3;
  id v4;
  objc_super v5;

  -[HKRecalibrateEstimatesPresentationController requestCancellationInvocation](self, "requestCancellationInvocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "invoke");

  v5.receiver = self;
  v5.super_class = (Class)HKRecalibrateEstimatesPresentationController;
  -[HKRecalibrateEstimatesPresentationController dealloc](&v5, sel_dealloc);
}

- (void)presentWithRequestRecord:(id)a3 authorizationViewControllerPresenter:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKRecalibrateEstimatesPresentationController.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestRecord != nil"));

    if (v12)
    {
LABEL_3:
      if (!v10)
        goto LABEL_7;
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKRecalibrateEstimatesPresentationController.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  if (!v10)
    goto LABEL_7;
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKRecalibrateEstimatesPresentationController.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationViewControllerPresenter isKindOfClass:[UIViewController class]]"));

  }
  objc_storeWeak((id *)&self->_viewControllerPresenter, v10);
LABEL_7:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__HKRecalibrateEstimatesPresentationController_presentWithRequestRecord_authorizationViewControllerPresenter_completion___block_invoke;
  block[3] = &unk_1E9C3FBE0;
  block[4] = self;
  v19 = v9;
  v20 = v12;
  v13 = v12;
  v14 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __121__HKRecalibrateEstimatesPresentationController_presentWithRequestRecord_authorizationViewControllerPresenter_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __121__HKRecalibrateEstimatesPresentationController_presentWithRequestRecord_authorizationViewControllerPresenter_completion___block_invoke_2;
  v3[3] = &unk_1E9C43AC0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_requestAndConfigureHostViewController:completion:", v3, *(_QWORD *)(a1 + 48));

}

uint64_t __121__HKRecalibrateEstimatesPresentationController_presentWithRequestRecord_authorizationViewControllerPresenter_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRequestRecord:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  uint64_t v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD, void *);
  id v16;
  id location;
  _QWORD aBlock[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (-[HKRecalibrateEstimatesPresentationController didPresent](self, "didPresent"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Already presenting recalibrate estimates remote view controller."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);

  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke;
    aBlock[3] = &unk_1E9C409A0;
    aBlock[4] = self;
    v19 = v6;
    v10 = v7;
    v20 = v10;
    v11 = _Block_copy(aBlock);
    -[HKRecalibrateEstimatesPresentationController setDidPresent:](self, "setDidPresent:", 1);
    +[HKHealthPrivacyHostRecalibrateEstimatesViewController requestRemoteViewControllerWithConnectionHandler:](HKHealthPrivacyHostRecalibrateEstimatesViewController, "requestRemoteViewControllerWithConnectionHandler:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKRecalibrateEstimatesPresentationController setRequestCancellationInvocation:](self, "setRequestCancellationInvocation:", v12);

    objc_initWeak(&location, self);
    v13 = dispatch_time(0, 10000000000);
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke_201;
    v14[3] = &unk_1E9C43AE8;
    objc_copyWeak(&v16, &location);
    v15 = v10;
    dispatch_after(v13, MEMORY[0x1E0C80D38], v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void (*v10)(void);
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "requestCancellationInvocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRequestCancellationInvocation:", 0);
    if (v5)
    {
      v8 = *(void **)(a1 + 32);
      v9 = v5;
      objc_msgSend(v8, "setHostViewController:", v9);
      objc_msgSend(v9, "setDelegate:", *(_QWORD *)(a1 + 32));
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "_makeRemoteViewControllerVisible:", v9);

      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v10();
  }

}

void __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke_201(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "requestCancellationInvocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "requestCancellationInvocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "invoke");

    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "setRequestCancellationInvocation:", 0);

    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Timed out connecting to recalibrate estimates remote view service."));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v10);

  }
}

- (void)_makeRemoteViewControllerVisible:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  HKAuthorizationViewPresenterProvider *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (_UIApplicationIsExtension())
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_FAULT))
      -[HKObjectPickerPresentationController _makeRemoteViewControllerVisible:].cold.1(v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isiPad");

    if (v7)
      objc_msgSend(v4, "setModalPresentationStyle:", 5);
    objc_msgSend(v4, "setModalInPresentation:", 1);
    v8 = objc_alloc_init(HKAuthorizationViewPresenterProvider);
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerPresenter);
    -[HKAuthorizationViewPresenterProvider hkAuthorizationViewControllerPresenter:](v8, "hkAuthorizationViewControllerPresenter:", WeakRetained);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      do
      {
        objc_msgSend(v10, "presentedViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "presentedViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = v12;
      }
      while (v13);
    }
    else
    {
      v12 = v10;
    }
    objc_msgSend(v12, "presentViewController:animated:completion:", v4, 1, 0);

  }
}

- (void)_dismissViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  HKHealthPrivacyHostRecalibrateEstimatesViewController *v5;
  HKHealthPrivacyHostRecalibrateEstimatesViewController *hostViewController;
  void *v7;
  _QWORD v8[5];

  if (self->_didPresent)
  {
    v3 = a3;
    v5 = self->_hostViewController;
    -[HKHealthPrivacyHostRecalibrateEstimatesViewController setDelegate:](v5, "setDelegate:", 0);
    hostViewController = self->_hostViewController;
    self->_hostViewController = 0;

    -[HKHealthPrivacyHostRecalibrateEstimatesViewController presentingViewController](v5, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__HKRecalibrateEstimatesPresentationController__dismissViewControllerAnimated___block_invoke;
    v8[3] = &unk_1E9C3F0D0;
    v8[4] = self;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v3, v8);

  }
}

uint64_t __79__HKRecalibrateEstimatesPresentationController__dismissViewControllerAnimated___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (void)healthPrivacyHostRecalibrateEstimatesControllerDidFinishWithError:(id)a3
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
      -[HKRecalibrateEstimatesPresentationController healthPrivacyHostRecalibrateEstimatesControllerDidFinishWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  -[HKRecalibrateEstimatesPresentationController _dismissViewControllerAnimated:](self, "_dismissViewControllerAnimated:", 1);

}

- (_UIAsyncInvocation)requestCancellationInvocation
{
  return self->_requestCancellationInvocation;
}

- (void)setRequestCancellationInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_requestCancellationInvocation, a3);
}

- (HKHealthPrivacyHostRecalibrateEstimatesViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hostViewController, a3);
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
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_requestCancellationInvocation, 0);
}

void __98__HKRecalibrateEstimatesPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Failed to get recalibrate estimates remote view controller: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)healthPrivacyHostRecalibrateEstimatesControllerDidFinishWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Privacy host recalibrate estimates controller finished with error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
