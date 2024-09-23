@implementation CELiftUIPresenter

- (CELiftUIPresenter)initWithURL:(id)a3 account:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  CELiftUIPresenter *v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  ICQLiftUIPresenter *liftUIPresenter;
  objc_super v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CELiftUIPresenter;
  v11 = -[CELiftUIPresenter init](&v17, sel_init);
  if (v11)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v12 = (void *)getICQLiftUIPresenterClass_softClass;
    v22 = getICQLiftUIPresenterClass_softClass;
    if (!getICQLiftUIPresenterClass_softClass)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __getICQLiftUIPresenterClass_block_invoke;
      v18[3] = &unk_2509E7FC8;
      v18[4] = &v19;
      __getICQLiftUIPresenterClass_block_invoke((uint64_t)v18);
      v12 = (void *)v20[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v19, 8);
    v14 = objc_msgSend([v13 alloc], "initWithURL:account:data:", v8, v9, v10);
    liftUIPresenter = v11->_liftUIPresenter;
    v11->_liftUIPresenter = (ICQLiftUIPresenter *)v14;

    -[ICQLiftUIPresenter setDelegate:](v11->_liftUIPresenter, "setDelegate:", v11);
  }

  return v11;
}

- (BOOL)presentInViewController:(id)a3 animated:(BOOL)a4
{
  return -[ICQLiftUIPresenter presentInViewController:animated:](self->_liftUIPresenter, "presentInViewController:animated:", a3, a4);
}

- (void)liftUIPresenter:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a4;
  v7 = a5;
  -[CELiftUIPresenter delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "liftUIPresenterDidLoadWithSuccess:error:", v5, v7);

}

- (void)liftUIPresenterDidComplete:(id)a3 userInfo:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CELiftUIPresenter delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "liftUIPresenterDidCompleteWithUserInfo:", v5);

}

- (void)liftUIPresenterDidCancel:(id)a3 userInfo:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CELiftUIPresenter delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "liftUIPresenterDidCancelWithUserInfo:", v5);

}

- (CELiftUIPresenterDelegate)delegate
{
  return (CELiftUIPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICQLiftUIPresenter)liftUIPresenter
{
  return self->_liftUIPresenter;
}

- (void)setLiftUIPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_liftUIPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
