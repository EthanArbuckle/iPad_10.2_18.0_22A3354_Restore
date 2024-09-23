@implementation SFStartPageSingleSectionDataSource

- (SFStartPageSingleSectionDataSource)initWithReloadHandler:(id)a3 navigationItemHandler:(id)a4
{
  id v6;
  id v7;
  SFStartPageSingleSectionDataSource *v8;
  void *v9;
  id reloadHandler;
  void *v11;
  id navigationItemHandler;
  SFStartPageSingleSectionDataSource *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFStartPageSingleSectionDataSource;
  v8 = -[SFStartPageSingleSectionDataSource init](&v15, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v6);
    reloadHandler = v8->_reloadHandler;
    v8->_reloadHandler = v9;

    v11 = _Block_copy(v7);
    navigationItemHandler = v8->_navigationItemHandler;
    v8->_navigationItemHandler = v11;

    v13 = v8;
  }

  return v8;
}

- (void)connectToViewController:(id)a3
{
  id v4;
  id obj;

  v4 = a3;
  obj = v4;
  if (!self->_section)
  {
    -[SFStartPageSingleSectionDataSource _reloadSection](self, "_reloadSection");
    v4 = obj;
  }
  objc_msgSend(v4, "setDisplaysSectionHeaders:", 0);
  objc_msgSend(obj, "setStrongDataSource:", self);
  objc_storeWeak((id *)&self->_collectionViewController, obj);

}

- (void)_reloadSection
{
  WBSStartPageSection *v3;
  WBSStartPageSection *section;

  (*((void (**)(void))self->_reloadHandler + 2))();
  v3 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
  section = self->_section;
  self->_section = v3;

}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  -[SFStartPageSingleSectionDataSource _reloadSection](self, "_reloadSection");
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewController);
  objc_msgSend(WeakRetained, "reloadDataAnimatingDifferences:", v3);

}

- (void)reloadNavigationItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewController);
  objc_msgSend(WeakRetained, "reloadNavigationItemAnimated:", v3);

}

- (id)sectionsForStartPageCollectionViewController:(id)a3
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_section)
  {
    v5[0] = self->_section;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (BOOL)startPageCollectionViewController:(id)a3 isSectionExpanded:(id)a4
{
  return 1;
}

- (void)startPageCollectionViewControllerWillUpdateNavigationBar:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_navigationItemHandler + 2))();
  -[WBSStartPageSection title](self->_section, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (int64_t)customizationControlPolicyForStartPageCollectionViewController:(id)a3
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_navigationItemHandler, 0);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_destroyWeak((id *)&self->_collectionViewController);
}

@end
