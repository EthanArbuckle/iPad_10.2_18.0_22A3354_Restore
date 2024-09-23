@implementation WFAddNewEventActionUIKitUserInterface

- (void)showWithEventParameters:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  WFAddNewEventActionUIKitUserInterface *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAddNewEventActionUIKitUserInterface.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventParameters"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAddNewEventActionUIKitUserInterface.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  -[WFAddNewEventActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v9);
  v17 = 0;
  objc_msgSend(MEMORY[0x24BE00F90], "eventFromParameters:requiringFullySpecifiedEvent:error:", v7, 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v11)
  {
    -[WFAddNewEventActionUIKitUserInterface finishWithEventIdentifier:error:](self, "finishWithEventIdentifier:error:", 0, v11);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__WFAddNewEventActionUIKitUserInterface_showWithEventParameters_completionHandler___block_invoke;
    block[3] = &unk_24E3439C0;
    v15 = v10;
    v16 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFAddNewEventActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __81__WFAddNewEventActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFAddNewEventActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithEventIdentifier:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFAddNewEventActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFAddNewEventActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFAddNewEventActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFAddNewEventActionUIKitUserInterface *v10;
  int64_t v11;

  v6 = a3;
  objc_msgSend(v6, "setEditViewDelegate:", 0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __87__WFAddNewEventActionUIKitUserInterface_eventEditViewController_didCompleteWithAction___block_invoke;
  v8[3] = &unk_24E343898;
  v10 = self;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

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

void __87__WFAddNewEventActionUIKitUserInterface_eventEditViewController_didCompleteWithAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  if (*(_QWORD *)(a1 + 48))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v6;
  }
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v2, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithEventIdentifier:error:", v5, v3);

}

uint64_t __81__WFAddNewEventActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithEventIdentifier:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83__WFAddNewEventActionUIKitUserInterface_showWithEventParameters_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDC7620]);
  WFGetWorkflowEventStore();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventStore:", v2);

  objc_msgSend(v3, "setEvent:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setEditViewDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "presentContent:", v3);

}

@end
