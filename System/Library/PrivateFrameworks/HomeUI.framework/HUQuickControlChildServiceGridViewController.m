@implementation HUQuickControlChildServiceGridViewController

+ (id)controlItemPredicate
{
  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:](HUQuickControlSingleItemPredicate, "predicateWithControlItemClass:", objc_opt_class());
}

- (HUQuickControlChildServiceGridViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HUQuickControlChildServiceGridViewController *v21;

  v12 = a3;
  v13 = a5;
  v14 = a4;
  if (objc_msgSend(v12, "count") != 1)
    NSLog(CFSTR("%@ should be initialized with exactly one control item, but instead found: %@"), self, v12);
  v15 = objc_opt_class();
  objc_msgSend(v12, "anyObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v16;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v15, objc_opt_class());

LABEL_9:
    v18 = 0;
  }

  v21 = -[HUQuickControlChildServiceGridViewController initWithChildServiceControlItem:home:itemUpdater:controlOrientation:preferredControl:](self, "initWithChildServiceControlItem:home:itemUpdater:controlOrientation:preferredControl:", v18, v14, v13, a6, a7);
  return v21;
}

- (HUQuickControlChildServiceGridViewController)initWithChildServiceControlItem:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  HUQuickControlChildServiceGridViewController *v17;
  void *v18;
  HUQuickControlCollectionItemManager *v19;
  id v20;
  HUQuickControlCollectionItemManager *v21;
  HUQuickControlCollectionViewController *v22;
  HUQuickControlCollectionViewController *collectionViewController;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUQuickControlChildServiceGridViewController.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalControlItem"));

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29.receiver = self;
  v29.super_class = (Class)HUQuickControlChildServiceGridViewController;
  v17 = -[HUQuickControlViewController initWithControlItems:home:itemUpdater:controlOrientation:preferredControl:](&v29, sel_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl_, v16, v14, v15, a6, a7);

  if (v17)
  {
    v18 = (void *)objc_msgSend(v13, "copy");
    v19 = [HUQuickControlCollectionItemManager alloc];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __133__HUQuickControlChildServiceGridViewController_initWithChildServiceControlItem_home_itemUpdater_controlOrientation_preferredControl___block_invoke;
    v27[3] = &unk_1E6F4F0B0;
    v28 = v18;
    v20 = v18;
    v21 = -[HUQuickControlCollectionItemManager initWithDelegate:gridItemProviderCreator:supplementaryItemProviderCreator:](v19, "initWithDelegate:gridItemProviderCreator:supplementaryItemProviderCreator:", 0, v27, 0);
    v22 = -[HUQuickControlCollectionViewController initWithItemManager:]([HUQuickControlCollectionViewController alloc], "initWithItemManager:", v21);
    collectionViewController = v17->_collectionViewController;
    v17->_collectionViewController = v22;

    -[HUQuickControlCollectionViewController setDisableItemUpdatesForOverrideCharacteristicValueChanges:](v17->_collectionViewController, "setDisableItemUpdatesForOverrideCharacteristicValueChanges:", 1);
    -[HUQuickControlChildServiceGridViewController collectionViewController](v17, "collectionViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlChildServiceGridViewController _subclass_configureQuickControlViewController:](v17, "_subclass_configureQuickControlViewController:", v24);

  }
  return v17;
}

id __133__HUQuickControlChildServiceGridViewController_initWithChildServiceControlItem_home_itemUpdater_controlOrientation_preferredControl___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0D317D8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithHome:", v4);

  objc_msgSend(*(id *)(a1 + 32), "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValueSource:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __133__HUQuickControlChildServiceGridViewController_initWithChildServiceControlItem_home_itemUpdater_controlOrientation_preferredControl___block_invoke_2;
  v9[3] = &unk_1E6F4F118;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v5, "setSourceServiceGenerator:", v9);

  return v5;
}

id __133__HUQuickControlChildServiceGridViewController_initWithChildServiceControlItem_home_itemUpdater_controlOrientation_preferredControl___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flatMap:", &__block_literal_global_281);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __133__HUQuickControlChildServiceGridViewController_initWithChildServiceControlItem_home_itemUpdater_controlOrientation_preferredControl___block_invoke_3(uint64_t a1, void *a2)
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

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlChildServiceGridViewController;
  -[HUQuickControlViewController hu_preloadContent](&v7, sel_hu_preloadContent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HUQuickControlChildServiceGridViewController_hu_preloadContent__block_invoke;
  v6[3] = &unk_1E6F595A8;
  v6[4] = self;
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __65__HUQuickControlChildServiceGridViewController_hu_preloadContent__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hu_preloadContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
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
  v38.super_class = (Class)HUQuickControlChildServiceGridViewController;
  -[HUQuickControlChildServiceGridViewController viewDidLoad](&v38, sel_viewDidLoad);
  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlChildServiceGridViewController addChildViewController:](self, "addChildViewController:", v3);

  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreservesSuperviewLayoutMargins:", 1);

  -[HUQuickControlChildServiceGridViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v10);

  v26 = (void *)MEMORY[0x1E0CB3718];
  -[HUQuickControlChildServiceGridViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v32;
  -[HUQuickControlChildServiceGridViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v25;
  -[HUQuickControlChildServiceGridViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v12;
  -[HUQuickControlChildServiceGridViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
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

  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didMoveToParentViewController:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (HFChildServiceControlItem)controlItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HUQuickControlViewController controlItems](self, "controlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
  {
    -[HUQuickControlViewController controlItems](self, "controlItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ should have exactly one control item, but instead found: %@"), self, v5);

  }
  v6 = objc_opt_class();
  -[HUQuickControlViewController controlItems](self, "controlItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

LABEL_9:
    v10 = 0;
  }

  return (HFChildServiceControlItem *)v10;
}

- (id)childQuickControlContentViewControllers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HUQuickControlChildServiceGridViewController collectionViewController](self, "collectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
