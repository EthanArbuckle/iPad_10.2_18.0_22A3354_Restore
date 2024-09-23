@implementation FASharedSubscriptionsViewController

- (FASharedSubscriptionsViewController)initWithAppleAccount:(id)a3 sharedSubscriptionSpecifierProvider:(id)a4
{
  id v7;
  id v8;
  FASharedSubscriptionsViewController *v9;
  FASharedSubscriptionsViewController *v10;
  NSOperationQueue *v11;
  NSOperationQueue *networkingQueue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FASharedSubscriptionsViewController;
  v9 = -[ACUIViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleAccount, a3);
    objc_storeStrong((id *)&v10->_sharedSubscriptionSpecifierProvider, a4);
    -[FASharedSubscriptionSpecifierProvider addSubscriber:](v10->_sharedSubscriptionSpecifierProvider, "addSubscriber:", v10);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    networkingQueue = v10->_networkingQueue;
    v10->_networkingQueue = v11;

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FASharedSubscriptionsViewController;
  -[ACUIViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[FASharedSubscriptionsViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);
  objc_msgSend(v3, "setRightBarButtonItem:", 0);
  objc_msgSend(v3, "setTitle:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FASharedSubscriptionsViewController;
  -[FASharedSubscriptionsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[FASharedSubscriptionSpecifierProvider setSelectionHandler:](self->_sharedSubscriptionSpecifierProvider, "setSelectionHandler:", self);
  -[FASharedSubscriptionsViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[FASharedSubscriptionsViewController _sharedSubscriptionSpecifiers](self, "_sharedSubscriptionSpecifiers");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_sharedSubscriptionSpecifiers
{
  return -[FASharedSubscriptionSpecifierProvider subscriptionSpecifiers](self->_sharedSubscriptionSpecifierProvider, "subscriptionSpecifiers");
}

- (void)_performEventWithContext:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  FACircleStateController *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  FASharedSubscriptionsViewController *v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  FACircleStateController *v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FASharedSubscriptionsViewController _startSpinnerInCellLoadingRemoteUI:](self, "_startSpinnerInCellLoadingRemoteUI:", v11);

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v12 = [FACircleStateController alloc];
  -[FASharedSubscriptionsViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[FACircleStateController initWithPresenter:](v12, "initWithPresenter:", v13);

  v14 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __85__FASharedSubscriptionsViewController__performEventWithContext_specifier_completion___block_invoke;
  v23[3] = &unk_24C88B7F0;
  v23[4] = self;
  objc_msgSend((id)v25[5], "setPresentationHandler:", v23);
  v15 = (void *)v25[5];
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __85__FASharedSubscriptionsViewController__performEventWithContext_specifier_completion___block_invoke_2;
  v18[3] = &unk_24C88D6A8;
  v16 = v8;
  v22 = &v24;
  v19 = v16;
  v20 = self;
  v17 = v10;
  v21 = v17;
  objc_msgSend(v15, "performOperationWithContext:completion:", v16, v18);

  _Block_object_dispose(&v24, 8);
}

uint64_t __85__FASharedSubscriptionsViewController__performEventWithContext_specifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSpinnerInCellLoadingRemoteUI");
}

void __85__FASharedSubscriptionsViewController__performEventWithContext_specifier_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("NO");
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    if ((_DWORD)a2)
      v8 = CFSTR("YES");
    v15 = v8;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Event type %@ - completed with success: %@, error: %@", (uint8_t *)&v12, 0x20u);

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 40), "_stopSpinnerInCellLoadingRemoteUI");
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

- (void)_startSpinnerInCellLoadingRemoteUI:(id)a3
{
  id v5;
  UITableViewCell **p_activeCell;
  void *v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    p_activeCell = &self->_activeCell;
    v8 = v5;
    objc_storeStrong((id *)p_activeCell, a3);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v7, "startAnimating");
    -[UITableViewCell setAccessoryView:](*p_activeCell, "setAccessoryView:", v7);

    v5 = v8;
  }

}

- (void)_stopSpinnerInCellLoadingRemoteUI
{
  UITableViewCell *activeCell;
  UITableViewCell *v4;

  activeCell = self->_activeCell;
  if (activeCell)
  {
    -[UITableViewCell setAccessoryView:](activeCell, "setAccessoryView:", 0);
    v4 = self->_activeCell;
    self->_activeCell = 0;

  }
}

- (BOOL)_hasActiveCell
{
  return self->_activeCell != 0;
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "subscriptionSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FASharedSubscriptionsViewController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v8, v9, v5);

  }
}

- (void)didSelectSpecifier:(id)a3
{
  id v4;
  void *v5;
  FACircleContext *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  if (!-[FASharedSubscriptionsViewController _hasActiveCell](self, "_hasActiveCell"))
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("FASharedServicesSpecifierActionURLKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", CFSTR("FACircleEventTypeSharedService"));
      -[FACircleContext setUrlForContext:](v6, "setUrlForContext:", v5);
      objc_msgSend(v4, "propertyForKey:", CFSTR("FASharedServicesAdditionalParameters"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        -[FACircleContext setAdditionalParameters:](v6, "setAdditionalParameters:", v7);
      -[FASharedSubscriptionsViewController _performEventWithContext:specifier:completion:](self, "_performEventWithContext:specifier:completion:", v6, v4, 0);

    }
    else
    {
      _FALogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Shared services specifier selected, no url present. We are bailing.", v9, 2u);
      }

    }
  }

}

- (id)preferredContentSizeCategory
{
  void *v2;
  void *v3;

  -[FASharedSubscriptionsViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_sharedSubscriptionSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_activeCell, 0);
  objc_storeStrong((id *)&self->_networkingQueue, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
}

@end
