@implementation QLPasswordItemViewController

- (BOOL)canEnterFullScreen
{
  return 0;
}

- (BOOL)canSwipeToDismiss
{
  return 0;
}

- (BOOL)canPinchToDismiss
{
  return 0;
}

- (void)loadView
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x24BEBD558]);
  -[QLPreviewContext previewTitle](self->_context, "previewTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "initWithDocumentName:", v4);

  objc_msgSend(v5, "setPasswordDelegate:", self);
  -[QLPasswordItemViewController setView:](self, "setView:", v5);

}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id completionBlock;
  id v11;

  objc_storeStrong((id *)&self->_context, a4);
  v11 = a4;
  v8 = a5;
  v9 = _Block_copy(v8);

  completionBlock = self->_completionBlock;
  self->_completionBlock = v9;

}

- (void)previewDidAppear:(BOOL)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 10000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__QLPasswordItemViewController_previewDidAppear___block_invoke;
  block[3] = &unk_24C724B00;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

void __49__QLPasswordItemViewController_previewDidAppear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "passwordView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passwordField");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "becomeFirstResponder");

}

- (void)previewWillDisappear:(BOOL)a3
{
  void *v3;
  id v4;

  -[QLPasswordItemViewController passwordView](self, "passwordView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passwordField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)invalidate
{
  id completionBlock;

  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

}

- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4
{
  void (**completionBlock)(id, _QWORD);
  id v6;

  -[QLPreviewContext setPassword:](self->_context, "setPassword:", a3, a4);
  completionBlock = (void (**)(id, _QWORD))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2](completionBlock, 0);
    v6 = self->_completionBlock;
    self->_completionBlock = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
