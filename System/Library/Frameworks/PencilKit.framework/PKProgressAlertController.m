@implementation PKProgressAlertController

+ (id)newProgressAlertControllerWithTitle:(id)a3 cancel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  PKProgressContentViewController *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", a3, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PKProgressAlertController_newProgressAlertControllerWithTitle_cancel___block_invoke;
  v14[3] = &unk_1E7778EC8;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v6, 1, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v10);
  v11 = objc_alloc_init(PKProgressContentViewController);
  objc_msgSend(v9, "setContentViewController:", v11);
  v12 = v9;

  return v12;
}

void __72__PKProgressAlertController_newProgressAlertControllerWithTitle_cancel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (void)setProgress:(double)a3
{
  id v4;

  -[PKProgressAlertController contentViewController](self, "contentViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgress:", a3);

}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PKProgressAlertControllerDelegate)delegate
{
  return (PKProgressAlertControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
