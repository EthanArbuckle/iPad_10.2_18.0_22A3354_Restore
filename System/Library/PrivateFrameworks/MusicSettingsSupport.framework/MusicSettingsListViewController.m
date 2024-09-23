@implementation MusicSettingsListViewController

- (NSArray)allSpecifiers
{
  return self->_allSpecifiers;
}

- (NSString)stringsTable
{
  return self->_stringsTable;
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  objc_storeStrong((id *)&self->_stringsTable, a3);
  v9 = a3;
  v10 = a5;
  v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MusicSettingsListViewController;
  -[MusicSettingsListViewController loadSpecifiersFromPlistName:target:bundle:](&v14, sel_loadSpecifiersFromPlistName_target_bundle_, v9, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MusicSettingsListViewController;
  -[MusicSettingsListViewController setPreferenceValue:specifier:](&v6, sel_setPreferenceValue_specifier_, a3, a4);
  -[MusicSettingsListViewController updateVisibleSpecifiers](self, "updateVisibleSpecifiers");
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(WeakRetained, "updateVisibleSpecifiers");

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    _MSS_resolvedSpecifiers(self);
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MusicSettingsListViewController setTitle:](self, "setTitle:", v7);

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)MusicSettingsListViewController;
    -[MusicSettingsListViewController tableView:willDisplayCell:forRowAtIndexPath:](&v11, sel_tableView_willDisplayCell_forRowAtIndexPath_, v8, v9, v10);
  }
  -[MusicSettingsListViewController _configureCell:forIndexPath:](self, "_configureCell:forIndexPath:", v9, v10);

}

- (void)updateVisibleSpecifiers
{
  uint64_t v2;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  MusicSettingsListViewController *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v2 = (int)*MEMORY[0x24BE756E0];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v2))
  {
    -[MusicSettingsListViewController _sectionedCollectionRepresentation](self, "_sectionedCollectionRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _MSS_resolvedSpecifiers(self);
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v5;

    -[MusicSettingsListViewController prepareSpecifiersMetadata](self, "prepareSpecifiersMetadata");
    -[MusicSettingsListViewController _sectionedCollectionRepresentation](self, "_sectionedCollectionRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke;
    v27[3] = &unk_24F133A28;
    v28 = v4;
    v29 = v7;
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_2;
    v24[3] = &unk_24F133A28;
    v9 = v28;
    v25 = v9;
    v10 = v29;
    v26 = v10;
    objc_msgSend(v9, "changeDetailsToSectionedCollection:isEqualBlock:isUpdatedBlock:", v10, v27, v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MusicSettingsListViewController table](self, "table");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MusicSettingsListViewController setCachesCells:](self, "setCachesCells:", 0);
    -[MusicSettingsListViewController setCachesCells:](self, "setCachesCells:", 1);
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_3;
    v21[3] = &unk_24F133A50;
    v13 = v12;
    v22 = v13;
    v23 = self;
    v14 = MEMORY[0x22E2B4820](v21);
    v15 = (void *)v14;
    if (v11)
    {
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_4;
      v18[3] = &unk_24F133A50;
      v19 = v13;
      v20 = v11;
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_7;
      v16[3] = &unk_24F133AC8;
      v17 = v15;
      objc_msgSend(v19, "performBatchUpdates:completion:", v18, v16);

    }
    else
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }

  }
}

- (id)valueForMusicCapability:(id)a3
{
  return 0;
}

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MusicSettingsListViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSpecifier:", v7);
    objc_msgSend(v8, "refreshCellContentsWithSpecifier:", v7);

  }
}

- (id)_sectionedCollectionRepresentation
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  v4 = -[MusicSettingsListViewController numberOfGroups](self, "numberOfGroups");
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = 0;
    v7 = (int *)MEMORY[0x24BE756E0];
    do
    {
      -[MusicSettingsListViewController specifierAtIndex:](self, "specifierAtIndex:", -[MusicSettingsListViewController indexOfGroup:](self, "indexOfGroup:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendSection:", v8);
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[MusicSettingsListViewController rangeOfSpecifiersInGroupID:](self, "rangeOfSpecifiersInGroupID:", v9);
      v12 = v11;

      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v7), "subarrayWithRange:", v10 + 1, v12 - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendItems:", v13);

      ++v6;
    }
    while (v5 != v6);
  }
  return v3;
}

- (void)setAllSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (void)setStringsTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1384);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringsTable, 0);
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  v8 = *(void **)(a1 + 32);
  if (v7 == 1)
  {
    v9 = objc_msgSend(v6, "section");

    objc_msgSend(v8, "sectionAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 40);
    v13 = objc_msgSend(v5, "section");

    objc_msgSend(v12, "sectionAtIndex:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "itemAtIndexPath:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v15;
  }
  objc_msgSend(v14, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v11, "isEqualToString:", v17);
  return v18;
}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "length");
  v8 = *(void **)(a1 + 32);
  if (v7 == 1)
  {
    v9 = objc_msgSend(v6, "section");

    objc_msgSend(v8, "sectionAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    v12 = objc_msgSend(v5, "section");

    objc_msgSend(v11, "sectionAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "itemAtIndexPath:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v14 = objc_msgSend(v10, "music_areDisplayValuesEqual:", v13);

  return v14 ^ 1u;
}

void __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "indexPathsForVisibleRows", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_configureCell:forIndexPath:", v9, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "insertedSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertSections:withRowAnimation:", v3, 0);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deletedSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteSections:withRowAnimation:", v5, 0);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "updatedSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadSections:withRowAnimation:", v7, 0);

  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_5;
  v19[3] = &unk_24F133A78;
  v9 = *(void **)(a1 + 40);
  v20 = *(id *)(a1 + 32);
  objc_msgSend(v9, "enumerateSectionMovesUsingBlock:", v19);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "insertedItemIndexPaths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertRowsAtIndexPaths:withRowAnimation:", v11, 0);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deletedItemIndexPaths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 0);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "updatedItemIndexPaths");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadRowsAtIndexPaths:withRowAnimation:", v15, 0);

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_6;
  v17[3] = &unk_24F133AA0;
  v16 = *(void **)(a1 + 40);
  v18 = *(id *)(a1 + 32);
  objc_msgSend(v16, "enumerateItemMovesUsingBlock:", v17);

}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveSection:toSection:", a2, a3);
}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveRowAtIndexPath:toIndexPath:", a2, a3);
}

@end
