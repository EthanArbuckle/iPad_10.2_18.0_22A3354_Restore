@implementation DSSharingAdditionalConsiderationsController

- (DSSharingAdditionalConsiderationsController)init
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  DSSharingAdditionalConsiderationsController *v23;
  void *v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithHierarchicalColor:", v3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc_init(MEMORY[0x24BE2CC88]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v4, "sources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)MEMORY[0x24BE2CC80];
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v10), "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sourceDescriptorForSource:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedAppName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v14);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  v15 = (void *)MEMORY[0x24BDD1640];
  objc_msgSend(v5, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringByJoiningStrings:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDD17C8];
  DSUILocStringForKey(CFSTR("ADDITIONAL_CONSIDERATIONS_DETAIL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringWithFormat:", v19, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  DSUILocStringForKey(CFSTR("ADDITIONAL_CONSIDERATIONS"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("checklist"), v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)DSSharingAdditionalConsiderationsController;
  v23 = -[DSSharingAdditionalConsiderationsController initWithTitle:detailText:icon:](&v27, sel_initWithTitle_detailText_icon_, v21, v20, v22);

  return v23;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DSSharingAdditionalConsiderationsController;
  -[DSOBWelcomeController viewDidLoad](&v8, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("CONTINUE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSSharingAdditionalConsiderationsController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v3, v4, sel_pushNextPane);

  DSUILocStringForKey(CFSTR("REVIEW_MORE_PEOPLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", self, v6, self, sel_back);

}

- (void)back
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[DSSharingAdditionalConsiderationsController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x24BDBCE30];
        v10 = objc_opt_class();
        v11 = objc_opt_class();
        objc_msgSend(v9, "arrayWithObjects:", v10, v11, objc_opt_class(), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "containsObject:", objc_opt_class()) & 1) == 0)
          objc_msgSend(v17, "addObject:", v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  -[DSSharingAdditionalConsiderationsController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setViewControllers:", v17);

  -[DSSharingAdditionalConsiderationsController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "popViewControllerAnimated:", 1);

}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
