@implementation HUContainedServicesGridViewController_legacy

- (HUContainedServicesGridViewController_legacy)initWithServiceContainerItem:(id)a3
{
  return -[HUContainedServicesGridViewController_legacy initWithServiceContainerItem:isPresentedModally:valueSource:](self, "initWithServiceContainerItem:isPresentedModally:valueSource:", a3, 0, 0);
}

+ (id)itemManagerWithServiceContainerItem:(id)a3 shouldGroupByRoom:(BOOL)a4 mediaItem:(id)a5 valueSource:(id)a6
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  HUServiceGridItemManager *v14;
  id v15;
  id v16;
  id v17;
  HUServiceGridItemManager *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  SEL v25;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = [HUServiceGridItemManager alloc];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke;
  v20[3] = &unk_1E6F4D938;
  v21 = v11;
  v22 = v13;
  v24 = a1;
  v25 = a2;
  v23 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v11;
  v18 = -[HUServiceGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:](v14, "initWithDelegate:shouldGroupByRoom:itemProvidersCreator:", 0, v8, v20);

  return v18;
}

- (HUContainedServicesGridViewController_legacy)initWithServiceContainerItem:(id)a3 isPresentedModally:(BOOL)a4 valueSource:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  HUContainedServicesGridViewController_legacy *v11;
  HUContainedServicesGridViewController_legacy *v12;
  void *v13;
  objc_super v15;

  v8 = a5;
  v9 = (void *)objc_msgSend(a3, "copy");
  objc_msgSend((id)objc_opt_class(), "itemManagerWithServiceContainerItem:shouldGroupByRoom:mediaItem:valueSource:", v9, 1, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDelegate:", self);
  v15.receiver = self;
  v15.super_class = (Class)HUContainedServicesGridViewController_legacy;
  v11 = -[HUServiceGridViewController initWithItemManager:](&v15, sel_initWithItemManager_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceContainerItem, v9);
    v12->_presentedModally = a4;
    -[HUItemCollectionViewController itemManager](v12, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceItem:", v12->_serviceContainerItem);

  }
  return v12;
}

- (HUContainedServicesGridViewController_legacy)initWithItemManager:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithActionSetBuilder_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUContainedServicesGridViewController_legacy.m"), 243, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUContainedServicesGridViewController_legacy initWithItemManager:]",
    v6);

  return 0;
}

- (void)_done:(id)a3
{
  id v4;
  id v5;

  -[HUContainedServicesGridViewController_legacy presentationDelegate](self, "presentationDelegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "finishPresentation:animated:", self, 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUContainedServicesGridViewController_legacy;
  -[HUServiceGridViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContainedServicesGridViewController_legacy collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)_edit:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HUServiceGroupEditorViewController *v16;
  void *v17;
  id v18;
  id v19;

  v4 = objc_opt_class();
  -[HUContainedServicesGridViewController_legacy serviceContainerItem](self, "serviceContainerItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  v8 = v5;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v4, objc_opt_class());

LABEL_7:
    v8 = 0;
  }
  v19 = v8;

  v11 = objc_alloc(MEMORY[0x1E0D317B0]);
  objc_msgSend(v19, "serviceGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithExistingObject:inHome:", v12, v14);

  v16 = -[HUServiceGroupEditorViewController initWithServiceGroupBuilder:]([HUServiceGroupEditorViewController alloc], "initWithServiceGroupBuilder:", v15);
  -[HUServiceGroupEditorViewController setPresentationDelegate:](v16, "setPresentationDelegate:", self);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v16);
  objc_msgSend(v17, "setModalPresentationStyle:", 2);
  v18 = -[UIViewController hu_presentPreloadableViewController:animated:](self, "hu_presentPreloadableViewController:animated:", v17, 1);

}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUContainedServicesGridViewController_legacy;
  -[HUServiceGridViewController configureCell:forItem:](&v12, sel_configureCell_forItem_, v6, a4);
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "layoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundDisplayOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisplayStyle:", 4);

  objc_msgSend(v9, "layoutOptionsDidChange");
}

- (id)layoutOptionsForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUContainedServicesGridViewController_legacy;
  -[HUServiceGridViewController layoutOptionsForSection:](&v7, sel_layoutOptionsForSection_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (!a3)
  {
    objc_msgSend(v5, "sectionTitleMargin");
    objc_msgSend(v5, "setSectionTitleMargin:", 40.0);
  }
  return v5;
}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;

  v5 = a4;
  -[HUContainedServicesGridViewController_legacy serviceGridDelegate](self, "serviceGridDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HUContainedServicesGridViewController_legacy serviceGridDelegate](self, "serviceGridDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasDetailsActionForContainedServiceGridViewController:item:", self, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[HUContainedServicesGridViewController_legacy serviceGridDelegate](self, "serviceGridDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsViewControllerForContainedServiceGridViewController:item:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (-[HUContainedServicesGridViewController_legacy serviceGridDelegate](self, "serviceGridDelegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "detailsViewControllerForContainedServiceGridViewController:item:", self, v5),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    NSLog(CFSTR("No details view controller for item: %@"), v5);
    v9 = 0;
  }

  return v9;
}

- (void)itemManagerDidUpdate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUContainedServicesGridViewController_legacy;
  -[HUItemCollectionViewController itemManagerDidUpdate:](&v4, sel_itemManagerDidUpdate_, a3);
  -[HUContainedServicesGridViewController_legacy _updateRightBarButtons](self, "_updateRightBarButtons");
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  return -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", 1, a4);
}

- (void)_updateRightBarButtons
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  objc_opt_class();
  -[HUContainedServicesGridViewController_legacy serviceContainerItem](self, "serviceContainerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = 0;
  if (-[HUContainedServicesGridViewController_legacy isPresentedModally](self, "isPresentedModally"))
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  objc_msgSend(v5, "serviceGroup");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_11;
  v8 = (void *)v7;
  -[HUItemCollectionViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator");

  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__edit_);
    if (!v6)
    {
      v6 = (void *)v12;
      v12 = 0;
    }
    v15 = (id)v12;
  }
  else
  {
LABEL_11:
    v15 = 0;
  }
  -[HUContainedServicesGridViewController_legacy navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftBarButtonItem:", v15);

  -[HUContainedServicesGridViewController_legacy navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v6);

}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HUServiceContainerItem)serviceContainerItem
{
  return self->_serviceContainerItem;
}

- (HUContainedServiceGridViewControllerDelegate_legacy)serviceGridDelegate
{
  return (HUContainedServiceGridViewControllerDelegate_legacy *)objc_loadWeakRetained((id *)&self->_serviceGridDelegate);
}

- (void)setServiceGridDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_serviceGridDelegate, a3);
}

- (BOOL)isPresentedModally
{
  return self->_presentedModally;
}

- (void)setPresentedModally:(BOOL)a3
{
  self->_presentedModally = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceGridDelegate);
  objc_storeStrong((id *)&self->_serviceContainerItem, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
