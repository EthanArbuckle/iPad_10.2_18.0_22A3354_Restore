@implementation EKUIEventViewDelegateAlertDisplayer

- (EKUIEventViewDelegateAlertDisplayer)initWithDelegate:(id)a3 eventViewController:(id)a4
{
  id v6;
  id v7;
  EKUIEventViewDelegateAlertDisplayer *v8;
  EKUIEventViewDelegateAlertDisplayer *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EKUIEventViewDelegateAlertDisplayer;
  v8 = -[EKUIEventViewDelegateAlertDisplayer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_eventViewController, v7);
  }

  return v9;
}

- (void)displayIntegrationAlert:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  +[EKUIIntegrationAlertDisplayer alertControllerForAlert:viewController:options:](EKUIIntegrationAlertDisplayer, "alertControllerForAlert:viewController:options:", a3, 0, 2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_loadWeakRetained((id *)&self->_eventViewController);
  objc_msgSend(v5, "_ekEventViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "eventViewController:requestsDisplayOfDeleteAlert:", v6, v7);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
