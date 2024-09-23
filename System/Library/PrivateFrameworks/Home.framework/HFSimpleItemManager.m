@implementation HFSimpleItemManager

- (HFSimpleItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 itemProvidersCreator:(id)a5
{
  id v8;
  HFSimpleItemManager *v9;
  void *v10;
  id itemProviderCreator;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HFSimpleItemManager;
  v9 = -[HFItemManager initWithDelegate:sourceItem:](&v13, sel_initWithDelegate_sourceItem_, a3, a4);
  if (v9)
  {
    v10 = _Block_copy(v8);
    itemProviderCreator = v9->_itemProviderCreator;
    v9->_itemProviderCreator = v10;

    -[HFSimpleItemManager setShouldDisableOptionalDataDuringFastInitialUpdate:](v9, "setShouldDisableOptionalDataDuringFastInitialUpdate:", 1);
  }

  return v9;
}

- (HFSimpleItemManager)initWithDelegate:(id)a3 itemProvidersCreator:(id)a4
{
  return -[HFSimpleItemManager initWithDelegate:sourceItem:itemProvidersCreator:](self, "initWithDelegate:sourceItem:itemProvidersCreator:", a3, 0, a4);
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[HFSimpleItemManager shouldDisableOptionalDataDuringFastInitialUpdate](self, "shouldDisableOptionalDataDuringFastInitialUpdate");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)HFSimpleItemManager;
    LOBYTE(v3) = -[HFItemManager _shouldDisableOptionalDataDuringFastInitialUpdate](&v5, sel__shouldDisableOptionalDataDuringFastInitialUpdate);
  }
  return v3;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;

  v4 = a3;
  -[HFSimpleItemManager itemModuleCreator](self, "itemModuleCreator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HFSimpleItemManager itemModuleCreator](self, "itemModuleCreator");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, HFSimpleItemManager *))v6)[2](v6, v4, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;

  v4 = a3;
  -[HFSimpleItemManager itemProviderCreator](self, "itemProviderCreator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HFSimpleItemManager itemProviderCreator](self, "itemProviderCreator");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[HFSimpleItemManager itemComparator](self, "itemComparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = _Block_copy(v5);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HFSimpleItemManager;
    -[HFItemManager _comparatorForSectionIdentifier:](&v10, sel__comparatorForSectionIdentifier_, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _Block_copy(v8);

  }
  return v7;
}

- (id)_homeFuture
{
  void *v3;
  void (**v4)(void);
  void *v5;
  objc_super v7;

  -[HFSimpleItemManager homeCreator](self, "homeCreator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HFSimpleItemManager homeCreator](self, "homeCreator");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HFSimpleItemManager;
    -[HFItemManager _homeFuture](&v7, sel__homeFuture);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)homeCreator
{
  return self->_homeCreator;
}

- (void)setHomeCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)itemModuleCreator
{
  return self->_itemModuleCreator;
}

- (void)setItemModuleCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (id)itemProviderCreator
{
  return self->_itemProviderCreator;
}

- (void)setItemProviderCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (id)itemComparator
{
  return self->_itemComparator;
}

- (void)setItemComparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)shouldDisableOptionalDataDuringFastInitialUpdate
{
  return self->_shouldDisableOptionalDataDuringFastInitialUpdate;
}

- (void)setShouldDisableOptionalDataDuringFastInitialUpdate:(BOOL)a3
{
  self->_shouldDisableOptionalDataDuringFastInitialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemComparator, 0);
  objc_storeStrong(&self->_itemProviderCreator, 0);
  objc_storeStrong(&self->_itemModuleCreator, 0);
  objc_storeStrong(&self->_homeCreator, 0);
}

@end
