@implementation MUActivityViewController

- (MUActivityViewController)initWithShareItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MUActivityViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "activityProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationActivities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)MUActivityViewController;
  v7 = -[MUActivityViewController initWithActivityItems:applicationActivities:](&v13, sel_initWithActivityItems_applicationActivities_, v5, v6);

  if (v7)
  {
    objc_msgSend(v4, "excludedActivityTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUActivityViewController setExcludedActivityTypes:](v7, "setExcludedActivityTypes:", v8);

    objc_msgSend(v4, "includedActivityTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUActivityViewController setIncludedActivityTypes:](v7, "setIncludedActivityTypes:", v9);

    -[MUActivityViewController _activityHandler](v7, "_activityHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUActivityViewController setPreCompletionHandler:](v7, "setPreCompletionHandler:", v10);

    -[MUActivityViewController _completionHandler](v7, "_completionHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUActivityViewController setCompletionWithItemsHandler:](v7, "setCompletionWithItemsHandler:", v11);

    -[MUActivityViewController setShowKeyboardAutomatically:](v7, "setShowKeyboardAutomatically:", 1);
    -[MUActivityViewController setAirDropDelegate:](v7, "setAirDropDelegate:", v7);
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_completionHandler
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__MUActivityViewController__completionHandler__block_invoke;
  v3[3] = &unk_1E2E03E40;
  v3[4] = self;
  return (id)objc_msgSend(v3, "copy");
}

void __46__MUActivityViewController__completionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "activityControllerDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapkitActivityViewController:postCompletedActivityOfType:completed:", *(_QWORD *)(a1 + 32), v6, a3);

}

- (id)_activityHandler
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__MUActivityViewController__activityHandler__block_invoke;
  v3[3] = &unk_1E2E03E68;
  v3[4] = self;
  return (id)objc_msgSend(v3, "copy");
}

void __44__MUActivityViewController__activityHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "activityControllerDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapkitActivityViewController:preCompletedActivityOfType:completed:", *(_QWORD *)(a1 + 32), v6, a3);

}

- (MUActivityViewControllerDelegate)activityControllerDelegate
{
  return (MUActivityViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_activityControllerDelegate);
}

- (void)setActivityControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_activityControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityControllerDelegate);
}

@end
