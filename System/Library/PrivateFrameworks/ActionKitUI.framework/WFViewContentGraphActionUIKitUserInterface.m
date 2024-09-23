@implementation WFViewContentGraphActionUIKitUserInterface

- (void)showWithContentItems:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  WFViewContentGraphActionUIKitUserInterface *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFViewContentGraphActionUIKitUserInterface.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFViewContentGraphActionUIKitUserInterface.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[WFViewContentGraphActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__WFViewContentGraphActionUIKitUserInterface_showWithContentItems_completionHandler___block_invoke;
  block[3] = &unk_24E3439C0;
  v14 = v7;
  v15 = self;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFViewContentGraphActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __86__WFViewContentGraphActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFViewContentGraphActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)done
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  -[WFViewContentGraphActionUIKitUserInterface completionHandler](self, "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFViewContentGraphActionUIKitUserInterface completionHandler](self, "completionHandler");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);

  }
  -[WFViewContentGraphActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  -[WFViewContentGraphActionUIKitUserInterface completionHandler](self, "completionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFViewContentGraphActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);

  }
  -[WFViewContentGraphActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __86__WFViewContentGraphActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __85__WFViewContentGraphActionUIKitUserInterface_showWithContentItems_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  WFContentItemsViewController *v8;

  v8 = -[WFContentItemsViewController initWithStyle:]([WFContentItemsViewController alloc], "initWithStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItemsViewController setContentItems:](v8, "setContentItems:", v2);

  -[WFContentItemsViewController setAllowsCoercion:](v8, "setAllowsCoercion:", 1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, *(_QWORD *)(a1 + 40), sel_done);
  -[WFContentItemsViewController navigationItem](v8, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v6);

  objc_msgSend(*(id *)(a1 + 40), "presentContent:", v5);
}

@end
