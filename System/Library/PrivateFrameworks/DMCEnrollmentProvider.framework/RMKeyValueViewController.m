@implementation RMKeyValueViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  -[RMKeyValueViewController _processUserInfoDictionary](self, "_processUserInfoDictionary");
  v5.receiver = self;
  v5.super_class = (Class)RMKeyValueViewController;
  -[RMKeyValueViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[RMKeyValueViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", 0);

  -[RMKeyValueViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", 0);

}

- (void)_processUserInfoDictionary
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RMConfigurationViewModelKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMKeyValueViewController setViewModel:](self, "setViewModel:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RMKeyValueViewController;
  -[RMKeyValueViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((-[RMKeyValueViewController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
    -[RMKeyValueViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[RMKeyValueViewController _specifiersForKeyValues](self, "_specifiersForKeyValues");
    v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_specifiersForKeyValues
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[RMKeyValueViewController viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detailViewModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[RMKeyValueViewController viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailViewModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(v13, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, sel__keyValueDetailValue_, 0, 4, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setUserInfo:", v13);
        objc_msgSend(v6, "addObject:", v16);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)_keyValueDetailValue:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (RMUIKeyValueViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
