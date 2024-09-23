@implementation HUQuickControlFaucetPanelViewController

+ (id)_temperaturePredicate
{
  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:](HUQuickControlSingleItemPredicate, "predicateWithControlItemClass:", objc_opt_class());
}

+ (id)_childValvesPredicate
{
  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:](HUQuickControlSingleItemPredicate, "predicateWithControlItemClass:", objc_opt_class());
}

+ (id)_primaryStatePredicate
{
  return -[HUQuickControlSingleItemPredicate initWithBlock:]([HUQuickControlSingleItemPredicate alloc], "initWithBlock:", &__block_literal_global_36);
}

uint64_t __65__HUQuickControlFaucetPanelViewController__primaryStatePredicate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF347E50);
}

+ (id)controlItemPredicate
{
  HUQuickControlCompoundItemPredicate *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUQuickControlCompoundItemPredicate *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = [HUQuickControlCompoundItemPredicate alloc];
  objc_msgSend(a1, "_primaryStatePredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_temperaturePredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_childValvesPredicate", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HUQuickControlCompoundItemPredicate initWithRequiredSubpredicates:optionalSubpredicates:minimumNumberOfMatchedPredicates:](v3, "initWithRequiredSubpredicates:optionalSubpredicates:minimumNumberOfMatchedPredicates:", v5, v8, 2);

  return v9;
}

- (HUQuickControlFaucetPanelViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v13;
  HUQuickControlFaucetPanelViewController *v14;
  HUQuickControlFaucetPanelViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HUQuickControlCollectionItemManager *v22;
  HUQuickControlFaucetPanelViewController *v23;
  id v24;
  HUQuickControlCollectionItemManager *v25;
  HUQuickControlCollectionViewController *v26;
  HUQuickControlCollectionViewController *collectionViewController;
  void *v29;
  _QWORD v30[4];
  HUQuickControlFaucetPanelViewController *v31;
  _QWORD v32[4];
  id v33;
  objc_super v34;

  v13 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HUQuickControlFaucetPanelViewController;
  v14 = -[HUQuickControlViewController initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:](&v34, sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_, v13, a4, a5, a6, a7);
  v15 = v14;
  if (v14)
  {
    -[HUQuickControlFaucetPanelViewController primaryStateControlItem](v14, "primaryStateControlItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("HUQuickControlFaucetPanelViewController.m"), 56, CFSTR("%@ was initialized with missing control items! Items: %@"), v15, v13);

    }
    v17 = (void *)MEMORY[0x1E0C99E20];
    -[HUQuickControlFaucetPanelViewController primaryStateControlItem](v15, "primaryStateControlItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUQuickControlFaucetPanelViewController temperatureControlItem](v15, "temperatureControlItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "na_safeAddObject:", v20);

    objc_msgSend(v19, "na_map:", &__block_literal_global_58_1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = [HUQuickControlCollectionItemManager alloc];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_2;
    v32[3] = &unk_1E6F4F0B0;
    v33 = v21;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_3;
    v30[3] = &unk_1E6F4F0B0;
    v23 = v15;
    v31 = v23;
    v24 = v21;
    v25 = -[HUQuickControlCollectionItemManager initWithDelegate:gridItemProviderCreator:supplementaryItemProviderCreator:](v22, "initWithDelegate:gridItemProviderCreator:supplementaryItemProviderCreator:", 0, v32, v30);
    v26 = -[HUQuickControlCollectionViewController initWithItemManager:]([HUQuickControlCollectionViewController alloc], "initWithItemManager:", v25);
    collectionViewController = v23->_collectionViewController;
    v23->_collectionViewController = v26;

  }
  return v15;
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", *(_QWORD *)(a1 + 32));
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0D317D8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithHome:", v4);

  objc_msgSend(*(id *)(a1 + 32), "childValvesControlItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValueSource:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_4;
  v10[3] = &unk_1E6F4F118;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v5, "setSourceServiceGenerator:", v10);

  return v5;
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "childValvesControlItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_64);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __117__HUQuickControlFaucetPanelViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "futureWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "futureWithResult:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  _QWORD v39[6];

  v39[4] = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)HUQuickControlFaucetPanelViewController;
  -[HUQuickControlFaucetPanelViewController viewDidLoad](&v38, sel_viewDidLoad);
  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlFaucetPanelViewController addChildViewController:](self, "addChildViewController:", v3);

  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreservesSuperviewLayoutMargins:", 1);

  -[HUQuickControlFaucetPanelViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v10);

  v26 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlFaucetPanelViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v32;
  -[HUQuickControlFaucetPanelViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v25;
  -[HUQuickControlFaucetPanelViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v12;
  -[HUQuickControlFaucetPanelViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v19);

  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didMoveToParentViewController:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)childQuickControlContentViewControllers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HUQuickControlFaucetPanelViewController collectionViewController](self, "collectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)overrideStatusText
{
  return &stru_1E6F60E80;
}

- (id)_controlItemMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HUQuickControlViewController controlItems](self, "controlItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__HUQuickControlFaucetPanelViewController__controlItemMatchingPredicate___block_invoke;
  v9[3] = &unk_1E6F4C330;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __73__HUQuickControlFaucetPanelViewController__controlItemMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesControlItem:", a2);
}

- (HFPrimaryStateWriter)primaryStateControlItem
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_primaryStatePredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlFaucetPanelViewController _controlItemMatchingPredicate:](self, "_controlItemMatchingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFPrimaryStateWriter *)v4;
}

- (HFTemperatureThresholdControlItem)temperatureControlItem
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_temperaturePredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlFaucetPanelViewController _controlItemMatchingPredicate:](self, "_controlItemMatchingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFTemperatureThresholdControlItem *)v4;
}

- (HFChildServiceControlItem)childValvesControlItem
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_childValvesPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlFaucetPanelViewController _controlItemMatchingPredicate:](self, "_controlItemMatchingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFChildServiceControlItem *)v4;
}

- (HUQuickControlCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewController, 0);
}

@end
