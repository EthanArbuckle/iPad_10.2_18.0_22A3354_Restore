@implementation ACUISActivityAlertClient

- (ACUISActivityAlertClient)init
{
  ACUISActivityAlertClient *v2;
  uint64_t v3;
  _TtC18ActivityUIServices19ActivityAlertClient *alertClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACUISActivityAlertClient;
  v2 = -[ACUISActivityAlertClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    alertClient = v2->_alertClient;
    v2->_alertClient = (_TtC18ActivityUIServices19ActivityAlertClient *)v3;

    -[ActivityAlertClient setDelegate:](v2->_alertClient, "setDelegate:", v2);
  }
  return v2;
}

- (void)activityWithAlertClient:(id)a3 presentAlertProvider:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  char v9;
  ACUISActivityAlertProvider *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  -[ACUISActivityAlertClient delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = -[ACUISActivityAlertProvider initWithActivityAlertProviding:]([ACUISActivityAlertProvider alloc], "initWithActivityAlertProviding:", v12);
    -[ACUISActivityAlertClient delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activityAlertClient:presentAlertProvider:completion:", self, v10, v7);

  }
}

- (void)activityWithAlertClient:(id)a3 dismissAlertProvider:(id)a4
{
  void *v5;
  char v6;
  ACUISActivityAlertProvider *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[ACUISActivityAlertClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = -[ACUISActivityAlertProvider initWithActivityAlertProviding:]([ACUISActivityAlertProvider alloc], "initWithActivityAlertProviding:", v9);
    -[ACUISActivityAlertClient delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityAlertClient:dismissAlertProvider:", self, v7);

  }
}

- (ACUISActivityAlertClientDelegate)delegate
{
  return (ACUISActivityAlertClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC18ActivityUIServices19ActivityAlertClient)alertClient
{
  return self->_alertClient;
}

- (void)setAlertClient:(id)a3
{
  objc_storeStrong((id *)&self->_alertClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertClient, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
