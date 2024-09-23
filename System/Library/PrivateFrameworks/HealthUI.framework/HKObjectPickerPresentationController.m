@implementation HKObjectPickerPresentationController

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = (id)-[_UIAsyncInvocation invoke](self->_requestCancellationInvocation, "invoke");
  -[HKHealthPrivacyHostObjectPickerViewController setDelegate:](self->_hostViewController, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)HKObjectPickerPresentationController;
  -[HKObjectPickerPresentationController dealloc](&v4, sel_dealloc);
}

- (void)presentWithSession:(id)a3 authorizationViewControllerPresenter:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD block[5];
  id v16;
  id v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKObjectPickerPresentationController.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[authorizationViewControllerPresenter isKindOfClass:[UIViewController class]]"));

    }
    objc_storeWeak((id *)&self->_viewControllerPresenter, v10);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__HKObjectPickerPresentationController_presentWithSession_authorizationViewControllerPresenter_completion___block_invoke;
  block[3] = &unk_1E9C3FBE0;
  block[4] = self;
  v16 = v9;
  v17 = v11;
  v12 = v11;
  v13 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __107__HKObjectPickerPresentationController_presentWithSession_authorizationViewControllerPresenter_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __107__HKObjectPickerPresentationController_presentWithSession_authorizationViewControllerPresenter_completion___block_invoke_2;
  v3[3] = &unk_1E9C40978;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_presentWithPromptSession:completion:", v2, v3);

}

uint64_t __107__HKObjectPickerPresentationController_presentWithSession_authorizationViewControllerPresenter_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cancelPresentation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HKObjectPickerPresentationController_cancelPresentation__block_invoke;
  block[3] = &unk_1E9C3F0D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __58__HKObjectPickerPresentationController_cancelPresentation__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invoke");
  return objc_msgSend(*(id *)(a1 + 32), "_dismissViewControllerAnimated:", 1);
}

- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  _UIAsyncInvocation *v12;
  _UIAsyncInvocation *requestCancellationInvocation;
  void *v14;
  void *v15;
  _QWORD aBlock[5];
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKObjectPickerPresentationController.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configurationHandler != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKObjectPickerPresentationController.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != nil"));

LABEL_3:
  if (self->_didPresent)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Already presenting remote view controller"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v10);

  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke;
    aBlock[3] = &unk_1E9C409A0;
    aBlock[4] = self;
    v17 = v7;
    v18 = v9;
    v11 = _Block_copy(aBlock);
    self->_didPresent = 1;
    +[HKHealthPrivacyHostObjectPickerViewController requestRemoteViewControllerWithConnectionHandler:](HKHealthPrivacyHostObjectPickerViewController, "requestRemoteViewControllerWithConnectionHandler:", v11);
    v12 = (_UIAsyncInvocation *)objc_claimAutoreleasedReturnValue();
    requestCancellationInvocation = self->_requestCancellationInvocation;
    self->_requestCancellationInvocation = v12;

  }
}

void __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void (*v10)(void);
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = 0;

  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_makeRemoteViewControllerVisible:", v6);
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v10();

}

- (void)_presentWithPromptSession:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKObjectPickerPresentationController.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session != nil"));

  }
  objc_msgSend(v7, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKObjectPickerPresentationController.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session.sessionIdentifier != nil"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__HKObjectPickerPresentationController__presentWithPromptSession_completion___block_invoke;
  v13[3] = &unk_1E9C409C8;
  v14 = v7;
  v10 = v7;
  -[HKObjectPickerPresentationController _requestAndConfigureHostViewController:completion:](self, "_requestAndConfigureHostViewController:completion:", v13, v8);

}

uint64_t __77__HKObjectPickerPresentationController__presentWithPromptSession_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPromptSession:", *(_QWORD *)(a1 + 32));
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
    {
      objc_msgSend(v4, "setModalPresentationStyle:", 2);
      objc_msgSend(v4, "setPreferredContentSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    }
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
  HKHealthPrivacyHostObjectPickerViewController *v5;
  HKHealthPrivacyHostObjectPickerViewController *hostViewController;
  void *v7;
  _QWORD v8[5];

  if (self->_didPresent)
  {
    v3 = a3;
    v5 = self->_hostViewController;
    -[HKHealthPrivacyHostObjectPickerViewController setDelegate:](v5, "setDelegate:", 0);
    hostViewController = self->_hostViewController;
    self->_hostViewController = 0;

    -[HKHealthPrivacyHostObjectPickerViewController presentingViewController](v5, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__HKObjectPickerPresentationController__dismissViewControllerAnimated___block_invoke;
    v8[3] = &unk_1E9C3F0D0;
    v8[4] = self;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", v3, v8);

  }
}

uint64_t __71__HKObjectPickerPresentationController__dismissViewControllerAnimated___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (void)healthPrivacyHostObjectPickerViewController:(id)a3 didFinishWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      -[HKObjectPickerPresentationController healthPrivacyHostObjectPickerViewController:didFinishWithError:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }
  -[HKObjectPickerPresentationController _dismissViewControllerAnimated:](self, "_dismissViewControllerAnimated:", 1);

}

- (_UIAsyncInvocation)requestCancellationInvocation
{
  return self->_requestCancellationInvocation;
}

- (void)setRequestCancellationInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_requestCancellationInvocation, a3);
}

- (HKHealthPrivacyHostObjectPickerViewController)hostViewController
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

void __90__HKObjectPickerPresentationController__requestAndConfigureHostViewController_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Failed to get remote view controller: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_makeRemoteViewControllerVisible:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D7813000, log, OS_LOG_TYPE_FAULT, "presenting a remote view controller from an extension is not supported", v1, 2u);
}

- (void)healthPrivacyHostObjectPickerViewController:(uint64_t)a3 didFinishWithError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Privacy host view controller finished with error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
