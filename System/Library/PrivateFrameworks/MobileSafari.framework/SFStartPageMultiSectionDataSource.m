@implementation SFStartPageMultiSectionDataSource

- (SFStartPageMultiSectionDataSource)initWithSectionTitle:(id)a3 reloadHandler:(id)a4 navigationItemHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  SFStartPageMultiSectionDataSource *v12;
  SFStartPageMultiSectionDataSource *v13;
  void *v14;
  id reloadHandler;
  void *v16;
  id navigationItemHandler;
  SFStartPageMultiSectionDataSource *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFStartPageMultiSectionDataSource;
  v12 = -[SFStartPageMultiSectionDataSource init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    v14 = _Block_copy(v10);
    reloadHandler = v13->_reloadHandler;
    v13->_reloadHandler = v14;

    v16 = _Block_copy(v11);
    navigationItemHandler = v13->_navigationItemHandler;
    v13->_navigationItemHandler = v16;

    v18 = v13;
  }

  return v13;
}

- (void)connectToViewController:(id)a3
{
  NSArray *sections;
  id obj;

  sections = self->_sections;
  obj = a3;
  if (!-[NSArray count](sections, "count"))
    -[SFStartPageMultiSectionDataSource _reloadSections](self, "_reloadSections");
  objc_msgSend(obj, "setDisplaysSectionHeaders:", 1);
  objc_msgSend(obj, "setStrongDataSource:", self);
  objc_storeWeak((id *)&self->_collectionViewController, obj);

}

- (void)_reloadSections
{
  NSArray *v3;
  NSArray *sections;

  (*((void (**)(void))self->_reloadHandler + 2))();
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sections = self->_sections;
  self->_sections = v3;

}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  -[SFStartPageMultiSectionDataSource _reloadSections](self, "_reloadSections");
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
  return self->_sections;
}

- (BOOL)startPageCollectionViewController:(id)a3 isSectionExpanded:(id)a4
{
  return 1;
}

- (void)startPageCollectionViewControllerWillUpdateNavigationBar:(id)a3
{
  const __CFString *title;
  id v5;

  objc_msgSend(a3, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_navigationItemHandler + 2))();
  if (self->_title)
    title = (const __CFString *)self->_title;
  else
    title = &stru_1E21FE780;
  objc_msgSend(v5, "setTitle:", title);

}

- (int64_t)customizationControlPolicyForStartPageCollectionViewController:(id)a3
{
  return 2;
}

- (NSString)title
{
  return self->_title;
}

- (id)reloadHandler
{
  return self->_reloadHandler;
}

- (id)navigationItemHandler
{
  return self->_navigationItemHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_navigationItemHandler, 0);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_collectionViewController);
}

@end
