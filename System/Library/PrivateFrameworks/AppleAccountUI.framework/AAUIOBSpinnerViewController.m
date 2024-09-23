@implementation AAUIOBSpinnerViewController

- (AAUIOBSpinnerViewController)init
{
  void *v3;
  __CFString *v4;
  int v5;
  void *v6;
  AAUIOBSpinnerViewController *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("UPDATING_APPLE_ID_LABEL");
  if ((objc_msgSend(CFSTR("UPDATING_APPLE_ID_LABEL"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("UPDATING_APPLE_ID_LABEL"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = 1;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_1EA2E2A18, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)AAUIOBSpinnerViewController;
  v7 = -[OBSetupAssistantSpinnerController initWithSpinnerText:](&v9, sel_initWithSpinnerText_, v6);

  if (v5)
  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AAUIOBSpinnerViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  if (self->_actionBlock)
  {
    dispatch_get_global_queue(33, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__AAUIOBSpinnerViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1EA2DB208;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

uint64_t __45__AAUIOBSpinnerViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024) + 16))();
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionBlock, 0);
}

@end
