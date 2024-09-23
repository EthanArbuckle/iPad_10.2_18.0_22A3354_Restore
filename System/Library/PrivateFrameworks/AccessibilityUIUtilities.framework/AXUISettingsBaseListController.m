@implementation AXUISettingsBaseListController

- (void)setDetailItemsHidden:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  if (self->_detailItemsHidden != a3)
  {
    v3 = a3;
    self->_detailItemsHidden = a3;
    -[AXUISettingsBaseListController detailItems](self, "detailItems");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v3)
      -[AXUISettingsBaseListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v5, 1);
    else
      -[AXUISettingsBaseListController addSpecifiersFromArray:animated:](self, "addSpecifiersFromArray:animated:", v5, 1);

  }
}

- (id)specifiersByRemovingDetailItemsFromOriginalSpecifiers:(id)a3 ifHidden:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  self->_detailItemsHidden = v4;
  if (v4)
  {
    v8 = (id)objc_msgSend(v6, "mutableCopy");
    -[AXUISettingsBaseListController detailItems](self, "detailItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsInArray:", v9);

  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (id)specifierForKey:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXUISettingsBaseListController specifiers](self, "specifiers");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = *MEMORY[0x1E0D808B0];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "propertyForKey:", v9, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
        {
          v14 = v11;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXUISettingsBaseListController;
  -[AXUISettingsBaseListController setEditing:animated:](&v7, sel_setEditing_animated_);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "setEditing:animated:", v5, v4);
}

- (void)updateTableCheckedSelection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (int)*MEMORY[0x1E0D80598];
  v11 = v4;
  v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "numberOfRowsInSection:", objc_msgSend(v4, "section"));
  if (v6 >= 1)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, objc_msgSend(v11, "section"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "cellForRowAtIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setChecked:", objc_msgSend(v9, "isEqual:", v11));

    }
  }

}

- (void)updateVisibleCellsWithCheckedSelection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (int)*MEMORY[0x1E0D80598];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "indexPathsForVisibleRows", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "cellForRowAtIndexPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setChecked:", objc_msgSend(v4, "isEqual:", v11));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (id)cellForSpecifierID:(id)a3
{
  void *v4;
  void *v5;

  -[AXUISettingsBaseListController specifierForID:](self, "specifierForID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsBaseListController cellForSpecifier:](self, "cellForSpecifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)specifierForIndexPath:(id)a3
{
  return (id)-[AXUISettingsBaseListController specifierAtIndex:](self, "specifierAtIndex:", -[AXUISettingsBaseListController indexForIndexPath:](self, "indexForIndexPath:", a3));
}

- (id)cellForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]);
  -[AXUISettingsBaseListController indexPathForSpecifier:](self, "indexPathForSpecifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForRowAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)showController:(id)a3 withSpecifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "setParentController:", self);
  -[AXUISettingsBaseListController rootController](self, "rootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRootController:", v7);

  objc_msgSend(v8, "setSpecifier:", v6);
  -[AXUISettingsSetupCapableListController showController:animate:](self, "showController:animate:", v8, 1);

}

- (NSArray)detailItems
{
  return self->_detailItems;
}

- (void)setDetailItems:(id)a3
{
  objc_storeStrong((id *)&self->_detailItems, a3);
}

- (BOOL)detailItemsHidden
{
  return self->_detailItemsHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailItems, 0);
}

@end
