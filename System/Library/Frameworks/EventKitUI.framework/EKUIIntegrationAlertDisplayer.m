@implementation EKUIIntegrationAlertDisplayer

- (EKUIIntegrationAlertDisplayer)initWithViewController:(id)a3 options:(unint64_t)a4
{
  id v6;
  EKUIIntegrationAlertDisplayer *v7;
  EKUIIntegrationAlertDisplayer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKUIIntegrationAlertDisplayer;
  v7 = -[EKUIIntegrationAlertDisplayer init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_viewControllerForPresentingAlerts, v6);
    v8->_options = a4;
  }

  return v8;
}

- (void)displayIntegrationAlert:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[EKUIIntegrationAlertDisplayer _effectiveViewControllerForPresentation](self, "_effectiveViewControllerForPresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "alertControllerForAlert:viewController:options:", v4, v6, self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);
}

+ (id)alertControllerForAlert:(id)a3 viewController:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = +[EKUIRecurrenceAlertController _useSheetForViewController:options:](EKUIRecurrenceAlertController, "_useSheetForViewController:options:", a4, 2 * (v5 & 3)) ^ 1;
  v9 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v7, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = v7;
  objc_msgSend(v7, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "style");
        if (v18 == 2)
          v19 = 2;
        else
          v19 = v18 == 1;
        v20 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend(v17, "title");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __80__EKUIIntegrationAlertDisplayer_alertControllerForAlert_viewController_options___block_invoke;
        v26[3] = &unk_1E60185C0;
        v26[4] = v17;
        objc_msgSend(v20, "actionWithTitle:style:handler:", v21, v19, v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "addAction:", v22);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  return v12;
}

uint64_t __80__EKUIIntegrationAlertDisplayer_alertControllerForAlert_viewController_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "actionChosen");
}

- (id)_effectiveViewControllerForPresentation
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerForPresentingAlerts);
  objc_msgSend(WeakRetained, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    do
    {
      objc_msgSend(WeakRetained, "presentedViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = v4;
    }
    while (v5);
  }
  else
  {
    v4 = WeakRetained;
  }
  return v4;
}

- (UIViewController)viewControllerForPresentingAlerts
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewControllerForPresentingAlerts);
}

- (void)setViewControllerForPresentingAlerts:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerForPresentingAlerts, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerForPresentingAlerts);
}

@end
