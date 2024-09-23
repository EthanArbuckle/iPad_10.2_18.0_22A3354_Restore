@implementation MusicSettingsListItemsViewController

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
  v14.super_class = (Class)MusicSettingsListItemsViewController;
  -[MusicSettingsListItemsViewController loadSpecifiersFromPlistName:target:bundle:](&v14, sel_loadSpecifiersFromPlistName_target_bundle_, v9, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  -[MusicSettingsListItemsViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)MusicSettingsListItemsViewController;
  -[PSListItemsController tableView:cellForRowAtIndexPath:](&v16, sel_tableView_cellForRowAtIndexPath_, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "propertyForKey:", CFSTR("musicDetail"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MusicSettingsListItemsViewController stringsTable](self, "stringsTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v10, &stru_24F133EF0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  return v9;
}

- (void)listItemSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  NSString *v10;
  SEL v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  MusicSettingsListItemsViewController *v18;
  id v19;

  v4 = a3;
  -[MusicSettingsListItemsViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("cellObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isChecked") & 1) == 0)
  {
    v7 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __57__MusicSettingsListItemsViewController_listItemSelected___block_invoke;
    v16[3] = &unk_24F133A00;
    v17 = v4;
    v18 = self;
    v8 = v5;
    v19 = v8;
    v9 = (void (**)(_QWORD))MEMORY[0x22E2B4820](v16);
    objc_msgSend(v8, "propertyForKey:", CFSTR("musicShouldSelectAction"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = NSSelectorFromString(v10);

    if (v11)
    {
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __57__MusicSettingsListItemsViewController_listItemSelected___block_invoke_2;
      v14[3] = &unk_24F133AC8;
      v15 = v9;
      v12 = (void *)MEMORY[0x22E2B4820](v14);
      v13 = MusicSettingsPerformSelector2((uint64_t)v11, self, v8, v12);

    }
    else
    {
      v9[2](v9);
    }

  }
}

- (id)itemsFromParent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MusicSettingsListItemsViewController;
  -[PSListItemsController itemsFromParent](&v17, sel_itemsFromParent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("musicValidDetails"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v4), "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("musicShouldSelectAction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v3;
  objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = 0;
    v11 = *MEMORY[0x24BE75948];
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 < objc_msgSend(v6, "count"))
      {
        objc_msgSend(v12, "setProperty:forKey:", objc_opt_class(), v11);
        objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setProperty:forKey:", v13, CFSTR("musicDetail"));

      }
      if (v10 < objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
          objc_msgSend(v12, "setProperty:forKey:", v14, CFSTR("musicShouldSelectAction"));

      }
      ++v10;
    }
    while (v10 < objc_msgSend(v9, "count"));
  }

  return v16;
}

- (id)valueForMusicCapability:(id)a3
{
  return 0;
}

- (NSArray)allSpecifiers
{
  return self->_allSpecifiers;
}

- (void)setAllSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (NSString)stringsTable
{
  return self->_stringsTable;
}

- (void)setStringsTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringsTable, 0);
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
}

void __57__MusicSettingsListItemsViewController_listItemSelected___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSString *v3;
  SEL v4;
  id v5;
  objc_super v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 40);
  v6.super_class = (Class)MusicSettingsListItemsViewController;
  objc_msgSendSuper2(&v6, sel_listItemSelected_, v2);
  objc_msgSend(*(id *)(a1 + 48), "propertyForKey:", CFSTR("musicDidSelectAction"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = NSSelectorFromString(v3);

  if (v4)
    v5 = MusicSettingsPerformSelector2((uint64_t)v4, *(void **)(a1 + 40), *(void **)(a1 + 48), 0);
}

uint64_t __57__MusicSettingsListItemsViewController_listItemSelected___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
