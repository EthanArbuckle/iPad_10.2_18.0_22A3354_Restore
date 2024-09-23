@implementation CERemoteUIPresenter

- (CERemoteUIPresenter)initWithAccount:(id)a3 presenter:(id)a4
{
  id v6;
  id v7;
  CERemoteUIPresenter *v8;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  ICQUIRemoteUIPresenter *remoteUIPresenter;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CERemoteUIPresenter;
  v8 = -[CERemoteUIPresenter init](&v14, sel_init);
  if (v8)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v9 = (void *)getICQUIRemoteUIPresenterClass_softClass;
    v19 = getICQUIRemoteUIPresenterClass_softClass;
    if (!getICQUIRemoteUIPresenterClass_softClass)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __getICQUIRemoteUIPresenterClass_block_invoke;
      v15[3] = &unk_2509E7FC8;
      v15[4] = &v16;
      __getICQUIRemoteUIPresenterClass_block_invoke((uint64_t)v15);
      v9 = (void *)v17[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v16, 8);
    v11 = objc_msgSend([v10 alloc], "initWithAccount:presenter:", v6, v7);
    remoteUIPresenter = v8->_remoteUIPresenter;
    v8->_remoteUIPresenter = (ICQUIRemoteUIPresenter *)v11;

    -[ICQUIRemoteUIPresenter setDelegate:](v8->_remoteUIPresenter, "setDelegate:", v8);
  }

  return v8;
}

- (void)setDataclasses:(id)a3
{
  -[ICQUIRemoteUIPresenter setDataclasses:](self->_remoteUIPresenter, "setDataclasses:", a3);
}

- (void)beginRUIFlowWithURL:(id)a3
{
  -[ICQUIRemoteUIPresenter beginRUIFlowWithURL:](self->_remoteUIPresenter, "beginRUIFlowWithURL:", a3);
}

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[CERemoteUIPresenter delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteUIFlowManager:didCompleteFlowWithSuccess:error:", v9, v5, v8);

}

- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CERemoteUIPresenter delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteUIFlowManager:didDismissWithError:", v7, v6);

}

- (NSSet)dataclasses
{
  return self->_dataclasses;
}

- (CERemoteUIPresenterDelegate)delegate
{
  return (CERemoteUIPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICQUIRemoteUIPresenter)remoteUIPresenter
{
  return self->_remoteUIPresenter;
}

- (void)setRemoteUIPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIPresenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataclasses, 0);
}

@end
