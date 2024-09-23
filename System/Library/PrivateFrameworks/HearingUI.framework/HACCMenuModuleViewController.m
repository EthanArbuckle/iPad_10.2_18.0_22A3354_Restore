@implementation HACCMenuModuleViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  HACCMenuModuleViewController *v8;
  id v9;

  v4 = a3;
  v7[1] = 3221225472;
  v7[2] = __73__HACCMenuModuleViewController_dismissViewControllerAnimated_completion___block_invoke;
  v7[3] = &unk_24DD619E0;
  v8 = self;
  v9 = a4;
  v6.receiver = v8;
  v6.super_class = (Class)HACCMenuModuleViewController;
  v7[0] = MEMORY[0x24BDAC760];
  v5 = v9;
  -[HACCMenuModuleViewController dismissViewControllerAnimated:completion:](&v6, sel_dismissViewControllerAnimated_completion_, v4, v7);

}

uint64_t __73__HACCMenuModuleViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewController:didExpand:", 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateView");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  -[HACCMenuModuleViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  return 1;
}

- (HACCContentModuleDelegate)delegate
{
  return (HACCContentModuleDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
