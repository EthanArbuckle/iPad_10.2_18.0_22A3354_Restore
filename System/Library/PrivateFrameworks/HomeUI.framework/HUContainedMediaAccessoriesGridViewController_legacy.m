@implementation HUContainedMediaAccessoriesGridViewController_legacy

- (HUContainedMediaAccessoriesGridViewController_legacy)initWithAccessoryContainerItem:(id)a3
{
  return -[HUContainedMediaAccessoriesGridViewController_legacy initWithMediaAccessoryContainerItem:isPresentedModally:valueSource:](self, "initWithMediaAccessoryContainerItem:isPresentedModally:valueSource:", a3, 0, 0);
}

- (HUContainedMediaAccessoriesGridViewController_legacy)initWithMediaAccessoryContainerItem:(id)a3 isPresentedModally:(BOOL)a4 valueSource:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HUContainedMediaAccessoriesGridViewController_legacy *v12;
  HUContainedMediaAccessoriesGridViewController_legacy *v13;
  void *v14;
  objc_super v16;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(v9, "copy");
  +[HUContainedServicesGridViewController_legacy itemManagerWithServiceContainerItem:shouldGroupByRoom:mediaItem:valueSource:](HUContainedServicesGridViewController_legacy, "itemManagerWithServiceContainerItem:shouldGroupByRoom:mediaItem:valueSource:", 0, 1, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)HUContainedMediaAccessoriesGridViewController_legacy;
  v12 = -[HUServiceGridViewController initWithItemManager:](&v16, sel_initWithItemManager_, v11);
  v13 = v12;
  if (v12)
  {
    v12->_presentedModally = a4;
    objc_storeStrong((id *)&v12->_mediaAccessoryItem, v10);
    -[HUItemCollectionViewController itemManager](v13, "itemManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSourceItem:", v13->_mediaAccessoryItem);

  }
  return v13;
}

- (void)_done:(id)a3
{
  id v4;
  id v5;

  -[HUContainedMediaAccessoriesGridViewController_legacy presentationDelegate](self, "presentationDelegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "finishPresentation:animated:", self, 1);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUContainedMediaAccessoriesGridViewController_legacy;
  -[HUServiceGridViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUContainedMediaAccessoriesGridViewController_legacy collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (id)layoutOptionsForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUContainedMediaAccessoriesGridViewController_legacy;
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
  return 1;
}

- (id)detailsViewControllerForPresentationCoordinator:(id)a3 item:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[HUContainedMediaAccessoriesGridViewController_legacy mediaAccessoryGridDelegate](self, "mediaAccessoryGridDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detailsViewControllerForContainedMediaAccessoryGridViewController:item:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (-[HUContainedMediaAccessoriesGridViewController_legacy mediaAccessoryGridDelegate](self, "mediaAccessoryGridDelegate"), v8 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v8, "detailsViewControllerForContainedMediaAccessoryGridViewController:item:", self, v5), v9 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v9))
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
  v4.super_class = (Class)HUContainedMediaAccessoriesGridViewController_legacy;
  -[HUItemCollectionViewController itemManagerDidUpdate:](&v4, sel_itemManagerDidUpdate_, a3);
  -[HUContainedMediaAccessoriesGridViewController_legacy _updateRightBarButtons](self, "_updateRightBarButtons");
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

  if (-[HUContainedMediaAccessoriesGridViewController_legacy isPresentedModally](self, "isPresentedModally"))
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  else
    v5 = 0;
  -[HUContainedMediaAccessoriesGridViewController_legacy navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  -[HUContainedMediaAccessoriesGridViewController_legacy navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v5);

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

- (HFMediaAccessoryItem)mediaAccessoryItem
{
  return self->_mediaAccessoryItem;
}

- (HUContainedMediaAccessoriesGridViewControllerDelegate_legacy)mediaAccessoryGridDelegate
{
  return (HUContainedMediaAccessoriesGridViewControllerDelegate_legacy *)objc_loadWeakRetained((id *)&self->_mediaAccessoryGridDelegate);
}

- (void)setMediaAccessoryGridDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mediaAccessoryGridDelegate, a3);
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
  objc_destroyWeak((id *)&self->_mediaAccessoryGridDelegate);
  objc_storeStrong((id *)&self->_mediaAccessoryItem, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
