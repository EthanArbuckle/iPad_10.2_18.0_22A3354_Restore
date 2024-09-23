@implementation WFAddNewContactActionUIKitUserInterface

- (void)showWithContactParameters:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAddNewContactActionUIKitUserInterface.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactParameters"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAddNewContactActionUIKitUserInterface.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[WFAddNewContactActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v9);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __87__WFAddNewContactActionUIKitUserInterface_showWithContactParameters_completionHandler___block_invoke;
  v12[3] = &unk_24E3432C8;
  v12[4] = self;
  objc_msgSend(MEMORY[0x24BE00F88], "contactFromParameters:completionHandler:", v7, v12);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFAddNewContactActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __83__WFAddNewContactActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFAddNewContactActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithContactIdentifier:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFAddNewContactActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFAddNewContactActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFAddNewContactActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  WFAddNewContactActionUIKitUserInterface *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__WFAddNewContactActionUIKitUserInterface_contactViewController_didCompleteWithContact___block_invoke;
  block[3] = &unk_24E3433F8;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAddNewContactActionUIKitUserInterface finishWithContactIdentifier:error:](self, "finishWithContactIdentifier:error:", 0, v4);

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

void __88__WFAddNewContactActionUIKitUserInterface_contactViewController_didCompleteWithContact___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __88__WFAddNewContactActionUIKitUserInterface_contactViewController_didCompleteWithContact___block_invoke_2;
  v5[3] = &unk_24E3433F8;
  v6 = v2;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __88__WFAddNewContactActionUIKitUserInterface_contactViewController_didCompleteWithContact___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  if (v2)
  {
    objc_msgSend(v2, "identifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v7 = (id)v4;
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v6 = objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v4 = 0;
    v7 = (id)v6;
  }
  objc_msgSend(v5, "finishWithContactIdentifier:error:", v4, v6);

}

uint64_t __83__WFAddNewContactActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithContactIdentifier:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __87__WFAddNewContactActionUIKitUserInterface_showWithContactParameters_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __87__WFAddNewContactActionUIKitUserInterface_showWithContactParameters_completionHandler___block_invoke_2;
  v6[3] = &unk_24E3439C0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __87__WFAddNewContactActionUIKitUserInterface_showWithContactParameters_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBAE90], "viewControllerForNewContact:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v5);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

  objc_msgSend(*(id *)(a1 + 40), "presentContent:", v2);
}

@end
