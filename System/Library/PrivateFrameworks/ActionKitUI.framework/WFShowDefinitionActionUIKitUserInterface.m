@implementation WFShowDefinitionActionUIKitUserInterface

- (void)showWithString:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  WFShowDefinitionActionUIKitUserInterface *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShowDefinitionActionUIKitUserInterface.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShowDefinitionActionUIKitUserInterface.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[WFShowDefinitionActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__WFShowDefinitionActionUIKitUserInterface_showWithString_completionHandler___block_invoke;
  block[3] = &unk_24E3439C0;
  v14 = v7;
  v15 = self;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFShowDefinitionActionUIKitUserInterface completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFShowDefinitionActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  -[WFShowDefinitionActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFShowDefinitionActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __84__WFShowDefinitionActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFShowDefinitionActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)libraryControllerDidDismiss:(id)a3
{
  -[WFShowDefinitionActionUIKitUserInterface finishWithError:](self, "finishWithError:", 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFShowDefinitionActionUIKitUserInterface finishWithError:](self, "finishWithError:", v4);

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

uint64_t __84__WFShowDefinitionActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __77__WFShowDefinitionActionUIKitUserInterface_showWithString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFReferenceLibraryViewController *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BEBD8A8], "dictionaryHasDefinitionForTerm:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v10 = -[UIReferenceLibraryViewController initWithTerm:]([WFReferenceLibraryViewController alloc], "initWithTerm:", *(_QWORD *)(a1 + 32));
    -[WFReferenceLibraryViewController setDelegate:](v10, "setDelegate:", *(_QWORD *)(a1 + 40));
    -[WFReferenceLibraryViewController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 1);
    v2 = *(_QWORD *)(a1 + 40);
    -[WFReferenceLibraryViewController presentationController](v10, "presentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", v2);

    objc_msgSend(*(id *)(a1 + 40), "presentContent:", v10);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = *MEMORY[0x24BEC4270];
    v11[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("A definition could not be found for that term."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v11[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("This may happen if no dictionaries are installed. To manage your dictionaries, select a word in any app and choose “Look Up”. Then, tap “Manage”."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v9);
  }
}

@end
