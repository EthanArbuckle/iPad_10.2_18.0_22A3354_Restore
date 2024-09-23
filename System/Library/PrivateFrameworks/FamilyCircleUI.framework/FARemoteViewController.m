@implementation FARemoteViewController

+ (id)requestViewControllerWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = *MEMORY[0x24BE30970];
  v6 = *MEMORY[0x24BE30968];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__FARemoteViewController_requestViewControllerWithCompletion___block_invoke;
  v10[3] = &unk_24C88CED0;
  v11 = v4;
  v7 = v4;
  objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v5, v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __62__FARemoteViewController_requestViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startFlowWithContext:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id completion;
  void *v12;
  id presentationCompletion;
  void *v14;
  _QWORD aBlock[5];

  v8 = a3;
  v9 = a4;
  v10 = _Block_copy(a5);
  completion = self->_completion;
  self->_completion = v10;

  objc_storeWeak((id *)&self->_hostViewController, v9);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__FARemoteViewController_startFlowWithContext_viewController_completion___block_invoke;
  aBlock[3] = &unk_24C88B7F0;
  aBlock[4] = self;
  v12 = _Block_copy(aBlock);
  presentationCompletion = self->_presentationCompletion;
  self->_presentationCompletion = v12;

  if (objc_msgSend(v8, "activityIndicatorStyle") == 1)
    -[FARemoteViewController presentWithRUIModalPresentationStyle:completion:](self, "presentWithRUIModalPresentationStyle:completion:", 0, &__block_literal_global_13);
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startFlowWithContext:", v8);

}

void __73__FARemoteViewController_startFlowWithContext_viewController_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewControllerDidStartFlow:", *(_QWORD *)(a1 + 32));

}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x24BE7EDD0];
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithPresentedViewController:presentingViewController:modalPresentationStyle:", v9, v8, self->_ruiPresentationStyle);

  return v10;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id presentationCompletion;

  v4 = a3;
  if ((-[FARemoteViewController isBeingDismissed](self, "isBeingDismissed") & 1) == 0)
  {
    -[FARemoteViewController presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A38]), "initWithLoadSuccess:error:userInfo:", v4 == 0, v4, 0);

  -[FARemoteViewController operationFinishedWithResponse:](self, "operationFinishedWithResponse:", v6);
  presentationCompletion = self->_presentationCompletion;
  self->_presentationCompletion = 0;

}

- (void)_notifyPresentationCompletion
{
  void (**presentationCompletion)(id, SEL);
  id v4;

  presentationCompletion = (void (**)(id, SEL))self->_presentationCompletion;
  if (presentationCompletion)
  {
    presentationCompletion[2](presentationCompletion, a2);
    v4 = self->_presentationCompletion;
    self->_presentationCompletion = 0;

  }
}

- (void)presentWithRUIModalPresentationStyle:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  -[FARemoteViewController presentingViewController](self, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    self->_ruiPresentationStyle = a3;
    -[FARemoteViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__FARemoteViewController_presentWithRUIModalPresentationStyle_completion___block_invoke;
    v9[3] = &unk_24C88C008;
    v9[4] = self;
    v10 = v6;
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", self, 1, v9);

  }
}

uint64_t __74__FARemoteViewController_presentWithRUIModalPresentationStyle_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_notifyPresentationCompletion");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)replaceModalRUIControllerWithStyle:(unint64_t)a3 byController:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __85__FARemoteViewController_replaceModalRUIControllerWithStyle_byController_completion___block_invoke;
  v9[3] = &unk_24C88CF38;
  v9[4] = self;
  v10 = v7;
  v11 = a4;
  v8 = v7;
  -[FARemoteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);

}

uint64_t __85__FARemoteViewController_replaceModalRUIControllerWithStyle_byController_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "presentWithRUIModalPresentationStyle:completion:", *(_QWORD *)(a1 + 48), &__block_literal_global_3);
}

- (void)operationFinishedWithResponse:(id)a3
{
  void (**completion)(id, id);
  id v5;

  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    v5 = self->_completion;
    self->_completion = 0;

  }
}

- (void)presentAlertProxyWithCompletion:(id)a3
{
  id WeakRetained;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  -[FARemoteViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", self, 0, 0);

  v5[2]();
}

- (void)dismissAlertProxyWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__FARemoteViewController_dismissAlertProxyWithCompletion___block_invoke;
  v6[3] = &unk_24C88C008;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FARemoteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

}

uint64_t __58__FARemoteViewController_dismissAlertProxyWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30A38]), "initWithLoadSuccess:error:userInfo:", 1, 0, 0);
  objc_msgSend(v2, "operationFinishedWithResponse:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)dismissWithCompletion:(id)a3
{
  -[FARemoteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, a3);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A45188);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A455C0);
}

- (FARemoteViewControllerDelegate)delegate
{
  return (FARemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
