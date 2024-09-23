@implementation ENUIPresentationController

- (void)dealloc
{
  void *v3;
  id v4;
  objc_super v5;

  -[ENUIPresentationController requestCancellationInvocation](self, "requestCancellationInvocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "invoke");

  v5.receiver = self;
  v5.super_class = (Class)ENUIPresentationController;
  -[ENUIPresentationController dealloc](&v5, sel_dealloc);
}

- (void)presentWithPresentationRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENUIPresentationController.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationRequest != nil"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENUIPresentationController.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ENUIPresentationController_presentWithPresentationRequest_completion___block_invoke;
  block[3] = &unk_24E0C7330;
  block[4] = self;
  v15 = v7;
  v16 = v9;
  v10 = v9;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __72__ENUIPresentationController_presentWithPresentationRequest_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_presentWithPresentationRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)cancelPresentation
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ENUIPresentationController_cancelPresentation__block_invoke;
  block[3] = &unk_24E0C7358;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __48__ENUIPresentationController_cancelPresentation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "requestCancellationInvocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "invoke");

  return objc_msgSend(*(id *)(a1 + 32), "_dismissRemoteViewController");
}

- (void)_requestAndConfigureHostViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (-[ENUIPresentationController didPresent](self, "didPresent"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__ENUIPresentationController__requestAndConfigureHostViewController_completion___block_invoke;
    aBlock[3] = &unk_24E0C7380;
    aBlock[4] = self;
    v11 = v6;
    v12 = v7;
    v8 = _Block_copy(aBlock);
    -[ENUIPresentationController setDidPresent:](self, "setDidPresent:", 1);
    +[ENUIHostViewController requestRemoteViewControllerWithConnectionHandler:](ENUIHostViewController, "requestRemoteViewControllerWithConnectionHandler:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENUIPresentationController setRequestCancellationInvocation:](self, "setRequestCancellationInvocation:", v9);

  }
}

void __80__ENUIPresentationController__requestAndConfigureHostViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRequestCancellationInvocation:", 0);
  if (v8)
  {
    v6 = *(void **)(a1 + 32);
    v7 = v8;
    objc_msgSend(v6, "setHostViewController:", v7);
    objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_makeRemoteViewControllerKeyAndVisible:", v7);
    objc_msgSend(v7, "show");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_mainQueue_presentWithPresentationRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__ENUIPresentationController__mainQueue_presentWithPresentationRequest_completion___block_invoke;
  v9[3] = &unk_24E0C73A8;
  v10 = v6;
  v8 = v6;
  -[ENUIPresentationController _requestAndConfigureHostViewController:completion:](self, "_requestAndConfigureHostViewController:completion:", v9, v7);

}

uint64_t __83__ENUIPresentationController__mainQueue_presentWithPresentationRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPresentationRequest:", *(_QWORD *)(a1 + 32));
}

- (void)_makeRemoteViewControllerKeyAndVisible:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x24BEBD3C8];
  v5 = a3;
  objc_msgSend(v4, "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENUIPresentationController setSavedKeyWindow:](self, "setSavedKeyWindow:", v7);

  v8 = objc_alloc(MEMORY[0x24BEBDB58]);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v12 = (id)objc_msgSend(v8, "initWithFrame:");

  objc_msgSend(v12, "setWindowLevel:", *MEMORY[0x24BEBE9F8] + -1.0);
  -[ENUIPresentationController savedKeyWindow](self, "savedKeyWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWindowScene:", v11);

  objc_msgSend(v12, "setRootViewController:", v5);
  objc_msgSend(v12, "makeKeyAndVisible");
  -[ENUIPresentationController setWindow:](self, "setWindow:", v12);

}

- (void)_dismissRemoteViewController
{
  void *v3;
  void *v4;
  void *v5;

  if (-[ENUIPresentationController didPresent](self, "didPresent"))
  {
    -[ENUIPresentationController window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWindowScene:", 0);

    -[ENUIPresentationController setWindow:](self, "setWindow:", 0);
    -[ENUIPresentationController savedKeyWindow](self, "savedKeyWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "makeKeyWindow");

    -[ENUIPresentationController setSavedKeyWindow:](self, "setSavedKeyWindow:", 0);
    -[ENUIPresentationController hostViewController](self, "hostViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    -[ENUIPresentationController setHostViewController:](self, "setHostViewController:", 0);
    self->_didPresent = 0;
  }
}

- (void)hostViewControllerDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    ENUILogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ENUIPresentationController hostViewControllerDidFinishWithError:].cold.1((uint64_t)v4, v5);

  }
  -[ENUIPresentationController _dismissRemoteViewController](self, "_dismissRemoteViewController");

}

- (_UIAsyncInvocation)requestCancellationInvocation
{
  return self->_requestCancellationInvocation;
}

- (void)setRequestCancellationInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_requestCancellationInvocation, a3);
}

- (ENUIHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hostViewController, a3);
}

- (UIWindow)savedKeyWindow
{
  return self->_savedKeyWindow;
}

- (void)setSavedKeyWindow:(id)a3
{
  objc_storeStrong((id *)&self->_savedKeyWindow, a3);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (void)setDidPresent:(BOOL)a3
{
  self->_didPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_savedKeyWindow, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_requestCancellationInvocation, 0);
}

- (void)hostViewControllerDidFinishWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21CCF2000, a2, OS_LOG_TYPE_ERROR, "Privacy host controller finished with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
