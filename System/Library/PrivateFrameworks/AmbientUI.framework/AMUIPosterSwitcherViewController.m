@implementation AMUIPosterSwitcherViewController

- (void)dealloc
{
  objc_super v3;

  -[AMUIPosterSwitcherViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterSwitcherViewController;
  -[AMUIPosterSwitcherViewController dealloc](&v3, sel_dealloc);
}

- (void)setConfigurations:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSArray *v14;
  NSArray *configurations;
  id v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  AMUIPosterSwitcherViewController *v32;
  uint64_t v33;
  void *v34;
  NSArray *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSArray *items;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSArray *v60;
  NSArray *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  id v70;
  id obj;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  void *v99;
  __int16 v100;
  id v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v72 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v91 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        objc_msgSend(v8, "providerBundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", CFSTR("com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"));

        if ((v10 & 1) != 0)
        {
          v89 = 0;
          objc_msgSend(v8, "pr_loadAmbientConfigurationWithError:", &v89);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v89;
          if (v11)
          {
            if ((objc_msgSend(v11, "hidden") & 1) == 0)
              objc_msgSend(v72, "addObject:", v8);
          }
          else
          {
            AMUILogSwitcher();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v99 = v8;
              v100 = 2112;
              v101 = v12;
              _os_log_error_impl(&dword_23600A000, v13, OS_LOG_TYPE_ERROR, "Failed to load ambient configuration from configuration %@ with error %@", buf, 0x16u);
            }

          }
        }
        else
        {
          objc_msgSend(v72, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
    }
    while (v5);
  }

  v14 = (NSArray *)objc_msgSend(v72, "copy");
  configurations = self->_configurations;
  self->_configurations = v14;

  v16 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v17 = self->_configurations;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v86;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v86 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * j), "providerBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    }
    while (v19);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v24 = self->_configurations;
  v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v82;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v82 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
        objc_msgSend(v29, "providerBundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v31)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v31, v30);
        }
        objc_msgSend(v31, "addObject:", v29);

      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
    }
    while (v26);
  }

  v32 = self;
  -[NSArray bs_map:](self->_items, "bs_map:", &__block_literal_global_2);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  v35 = (NSArray *)MEMORY[0x24BDBD1A8];
  if (v33)
    v36 = (void *)v33;
  else
    v36 = (void *)MEMORY[0x24BDBD1A8];
  v37 = v36;

  objc_msgSend(v16, "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "differenceFromArray:", v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = v39;
  if (objc_msgSend(v39, "hasChanges"))
  {
    v66 = v37;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v41 = self->_items;
    v42 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v78;
      do
      {
        v45 = 0;
        do
        {
          if (*(_QWORD *)v78 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v45);
          if (v46)
            v47 = *(_QWORD *)(v46 + 32);
          else
            v47 = 0;
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v46, v47);
          ++v45;
        }
        while (v43 != v45);
        v48 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
        v43 = v48;
      }
      while (v48);
    }
    v67 = v16;

    if (self->_items)
      items = self->_items;
    else
      items = v35;
    v50 = (void *)-[NSArray mutableCopy](items, "mutableCopy");
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v70 = v68;
    v51 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v74;
      do
      {
        for (m = 0; m != v52; ++m)
        {
          if (*(_QWORD *)v74 != v53)
            objc_enumerationMutation(v70);
          v55 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * m);
          v56 = objc_msgSend(v55, "changeType");
          if (v56 == 1)
          {
            objc_msgSend(v50, "removeObjectAtIndex:", objc_msgSend(v55, "index"));
          }
          else if (!v56)
          {
            objc_msgSend(v55, "object");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectForKeyedSubscript:", v57);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v59)
            {
              +[AMUIPosterExtensionSwitcherItem itemWithProviderBundleIdentifier:configurations:posterCategoryViewControllerDelegate:dateProvider:]((uint64_t)AMUIPosterExtensionSwitcherItem, v57, v58, self, self->_dateProvider);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v50, "insertObject:atIndex:", v59, objc_msgSend(v55, "index"));

          }
        }
        v52 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
      }
      while (v52);
    }

    v60 = (NSArray *)objc_msgSend(v50, "copy");
    v32 = self;
    v61 = self->_items;
    self->_items = v60;

    -[AMUISwitcherViewController reload](self->_extensionSwitcherViewController, "reload");
    v16 = v67;
    v37 = v66;
  }
  if (-[NSArray count](v32->_items, "count"))
  {
    v62 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](v32->_items, "objectAtIndexedSubscript:", v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMUIPosterExtensionSwitcherItem setConfigurations:]((uint64_t)v64, v65);

      ++v62;
    }
    while (v62 < -[NSArray count](v32->_items, "count"));
  }

}

id __54__AMUIPosterSwitcherViewController_setConfigurations___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(id *)(a2 + 32);
  else
    return 0;
}

- (UIView)contentView
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;

  -[AMUISwitcherViewController visibleItems](self->_extensionSwitcherViewController, "visibleItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    v5 = v3;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (UIView *)v7;
}

- (UIView)backgroundView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t v11;

  -[AMUIPosterSwitcherViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUISwitcherViewController visibleItems](self->_extensionSwitcherViewController, "visibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    if (v9)
    {
      -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "backgroundView");
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v11;
    }

  }
  return (UIView *)v3;
}

- (PRSPosterConfiguration)mostVisibleConfiguration
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AMUISwitcherViewController visibleItems](self->_extensionSwitcherViewController, "visibleItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[AMUISwitcherViewController presentationProgressForItem:](self->_extensionSwitcherViewController, "presentationProgressForItem:", v10);
        if (v11 > v8)
        {
          v12 = v11;
          v13 = v10;

          v8 = v12;
          v6 = v13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  -[AMUIPosterExtensionSwitcherItem posterCategoryViewController]((id *)v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mostVisibleConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRSPosterConfiguration *)v15;
}

- (BOOL)isSwitchingEnabled
{
  return -[AMUISwitcherViewController isScrollEnabled](self->_extensionSwitcherViewController, "isScrollEnabled");
}

- (void)setSwitchingEnabled:(BOOL)a3
{
  -[AMUISwitcherViewController setScrollEnabled:](self->_extensionSwitcherViewController, "setScrollEnabled:", a3);
}

- (void)setDateProvider:(id)a3
{
  id v5;
  void **p_dateProvider;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_dateProvider = (void **)&self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_items;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[AMUIPosterExtensionSwitcherItem setDateProvider:](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), *p_dateProvider);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)viewDidLoad
{
  AMUIPosterSwitcherSettings *v3;
  AMUIPosterSwitcherSettings *settings;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  AMUISwitcherViewController *v14;
  AMUISwitcherViewController *extensionSwitcherViewController;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AMUIPosterSwitcherViewController;
  -[AMUIPosterSwitcherViewController viewDidLoad](&v17, sel_viewDidLoad);
  +[AMUIPosterSwitcherDomain rootSettings](AMUIPosterSwitcherDomain, "rootSettings");
  v3 = (AMUIPosterSwitcherSettings *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  self->_settings = v3;

  -[AMUIPosterSwitcherViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[AMUISwitcherViewController initWithLayout:]([AMUISwitcherViewController alloc], "initWithLayout:", self);
  extensionSwitcherViewController = self->_extensionSwitcherViewController;
  self->_extensionSwitcherViewController = v14;

  -[AMUISwitcherViewController setDataSource:](self->_extensionSwitcherViewController, "setDataSource:", self);
  -[AMUISwitcherViewController setDelegate:](self->_extensionSwitcherViewController, "setDelegate:", self);
  -[AMUISwitcherViewController view](self->_extensionSwitcherViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v7, v9, v11, v13);
  objc_msgSend(v16, "setAutoresizingMask:", 18);
  -[AMUIPosterSwitcherViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_extensionSwitcherViewController);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  int v17;
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AMUIPosterSwitcherViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (-[AMUISwitcherViewController isScrollingInteractively](self->_extensionSwitcherViewController, "isScrollingInteractively"))
  {
    AMUILogSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_12:
      v15 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v6, "serverUUID");
    v9 = objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_23600A000, v8, OS_LOG_TYPE_INFO, "horizontal switcher ignoring update to %{public}@ due to interactive scroll", (uint8_t *)&v17, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  -[AMUIPosterSwitcherViewController _switcherItemForConfiguration:](self, "_switcherItemForConfiguration:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    AMUILogSwitcher();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AMUIPosterSwitcherViewController updatePosterConfiguration:withAnimationSettings:].cold.1(v6, v9);
    goto LABEL_11;
  }
  -[AMUISwitcherViewController visibleItems](self->_extensionSwitcherViewController, "visibleItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v8);

  -[AMUIPosterExtensionSwitcherItem posterCategoryViewController]((id *)&v8->isa);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    v14 = v7;
  else
    v14 = 0;
  objc_msgSend(v12, "updatePosterConfiguration:withAnimationSettings:", v6, v14);

  -[AMUISwitcherViewController scrollToItem:animated:](self->_extensionSwitcherViewController, "scrollToItem:animated:", v8, v7 != 0);
  v15 = 1;
LABEL_13:

  return v15;
}

- (void)invalidate
{
  -[AMUIPosterSwitcherViewController setConfigurations:](self, "setConfigurations:", MEMORY[0x24BDBD1A8]);
  -[BSInvalidatable invalidate](self->_unsettledAssertion, "invalidate");
}

- (NSDictionary)activeConfigurationMetadata
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;

  -[AMUISwitcherViewController visibleItems](self->_extensionSwitcherViewController, "visibleItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    v5 = v3;
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeConfigurationMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (NSDictionary *)v7;
}

- (void)noteAmbientViewControllingDelegateDidUpdate
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](*(id **)(*((_QWORD *)&v8 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "noteAmbientViewControllingDelegateDidUpdate", (_QWORD)v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)handleDismiss
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
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
  v2 = self->_items;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](*(id **)(*((_QWORD *)&v10 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 |= objc_msgSend(v8, "handleDismiss", (_QWORD)v10);

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (int64_t)switcherNumberOfItems:(id)a3
{
  return -[NSArray count](self->_items, "count", a3);
}

- (id)switcher:(id)a3 itemAtIndex:(int64_t)a4
{
  return -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a4);
}

- (void)switcher:(id)a3 didSettleOnItem:(id)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v7 = a4;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v15 = v7;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v15;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "visibleConfigurations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") == 1)
  {
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterSwitcherViewController:didSettleOnConfiguration:interactive:", self, v14, v5);

  }
}

- (void)switcher:(id)a3 transitionDidBegin:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _BYTE *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = self->_items;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v40;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v9);
        -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](*(id **)(*((_QWORD *)&v39 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cancelTouchesForCurrentEventInHostedContent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "setUserInfoObject:forKey:", v8, CFSTR("cancelTouchesAssertions"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "fromItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  v18 = v16;
  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mostVisibleConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(WeakRetained, "posterSwitcherViewController:willSwitchFromConfiguration:interactive:", self, v22, objc_msgSend(v7, "isInteractive"));
  if (objc_msgSend(v7, "isInteractive"))
  {
    objc_msgSend(v7, "toItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_class();
    v25 = v23;
    if (v24)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;

    if (v27)
    {
      v28 = v27[4];
      objc_msgSend(WeakRetained, "posterSwitcherViewController:requestsLastSelectedConfigurationUUIDForProviderBundleIdentifier:", self, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v44 = __Block_byref_object_copy_;
        v45 = __Block_byref_object_dispose_;
        v46 = 0;
        v30 = v27[2];
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __64__AMUIPosterSwitcherViewController_switcher_transitionDidBegin___block_invoke;
        v36[3] = &unk_2507635C0;
        v37 = v29;
        v38 = buf;
        objc_msgSend(v30, "enumerateObjectsUsingBlock:", v36);

        v31 = *(id *)(*(_QWORD *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);

      }
      else
      {
        v31 = 0;
      }

    }
    else
    {
      v31 = 0;
    }
    AMUILogSwitcher();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if (v27)
        v33 = v27[4];
      else
        v33 = 0;
      v34 = v33;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v31;
      _os_log_impl(&dword_23600A000, v32, OS_LOG_TYPE_DEFAULT, "Interactive transition beginning to provider %@. Pre-selecting configuration %@", buf, 0x16u);

    }
    if (v31)
    {
      -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v27);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "updatePosterConfiguration:withAnimationSettings:", v31, 0);

    }
  }

}

void __64__AMUIPosterSwitcherViewController_switcher_transitionDidBegin___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "serverUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)switcher:(id)a3 transitioningFromItem:(id)a4 toItem:(id)a5 progress:(double)a6
{
  id v8;

  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3, a4, a5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterSwitcherViewController:isTransitioningSettled:", self, a6 == 1.0);

}

- (void)switcher:(id)a3 transitionDidEnd:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "userInfoObjectForKey:", CFSTR("cancelTouchesAssertions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidate");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)posterCategoryViewController:(id)a3 didSettleOnConfiguration:(id)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[2];

  v5 = a5;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[AMUIPosterSwitcherViewController _switcherItemForConfiguration:](self, "_switcherItemForConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUISwitcherViewController visibleItems](self->_extensionSwitcherViewController, "visibleItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = BSEqualArrays();

  if (v11)
  {
    -[AMUIPosterSwitcherViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "posterSwitcherViewController:didSettleOnConfiguration:interactive:", self, v7, v5);

  }
}

- (id)createUnlockRequestForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createUnlockRequestForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestUnlockForViewController:withRequest:completion:", self, v8, v7);

}

- (void)viewControllerWillBeginConfiguration:(id)a3
{
  id v4;

  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerWillBeginConfiguration:", self);

}

- (void)viewControllerWillEndConfiguration:(id)a3
{
  id v4;

  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerWillEndConfiguration:", self);

}

- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didUpdateActiveConfigurationMetadata:", self, v5);

}

- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerWillBeginShowingTemporaryOverlay:", v4);

}

- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerWillEndShowingTemporaryOverlay:", v4);

}

- (id)widgetHostManagerForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetHostManagerForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ambientDefaultsForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientDefaultsForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "viewController:isApplicationVisibleWithBundleIdentifier:", v7, v6);

  return v9;
}

- (id)defaultWidgetDescriptorStacksForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultWidgetDescriptorStacksForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)posterCategoryViewControllerIsAuthenticated:(id)a3
{
  AMUIPosterSwitcherViewController *v3;
  void *v4;

  v3 = self;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "posterSwitcherViewControllerIsAuthenticated:", v3);

  return (char)v3;
}

- (id)posterCategoryViewControllerAuthenticationHandler:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterSwitcherViewControllerAuthenticationHandler:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)posterCategoryViewController:(id)a3 didSetPasscodeVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterSwitcherViewController:didSetPasscodeVisible:", self, v4);

}

- (void)posterCategoryViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterSwitcherViewController:didSetInlineAuthenticationViewVisible:", self, v4);

}

- (void)posterCategoryViewControllerDidSuccessfulyCompleteInlineAuthentication:(id)a3
{
  id v4;

  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterSwitcherViewControllerDidSuccessfullyCompleteInlineAuthentication:", self);

}

- (BOOL)posterCategoryViewControllerHasInlineAuthenticated:(id)a3
{
  AMUIPosterSwitcherViewController *v3;
  void *v4;

  v3 = self;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "posterSwitcherViewControllerHasInlineAuthenticated:", v3);

  return (char)v3;
}

- (void)posterCategoryViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterSwitcherViewController:didSetBiometricAuthenticationDisabled:", self, v4);

}

- (BOOL)posterCategoryViewController:(id)a3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:(BOOL)a4
{
  uint64_t v4;
  void *v6;

  v4 = a4;
  -[AMUIPosterSwitcherViewController delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "posterSwitcherViewController:wantsBiometricAuthenticationBlockedForDeepUserInteraction:", self, v4);

  return v4;
}

- (int64_t)switcherAxis
{
  return 0;
}

- (BOOL)isCircular
{
  return -[AMUIPosterSwitcherSettings horizontalSwitcherCircular](self->_settings, "horizontalSwitcherCircular");
}

- (double)spacing
{
  return 0.0;
}

- (void)switcher:(id)a3 updateItem:(id)a4 view:(id)a5 forPresentationProgress:(double)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  BSInvalidatable *v17;
  BSInvalidatable *unsettledAssertion;
  double v19;
  double v20;
  double v21;
  AMUIPosterSwitcherSettings *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  double v28;
  id v29;
  id v30;
  AMUIPosterSwitcherSettings *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  AMUIPosterSwitcherSettings *v35;
  id v36;
  double v37;
  double v38;
  double v39;
  _QWORD v40[4];
  id v41;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[AMUIPosterSwitcherSettings exitingCardBehaviorScaleDownOnly](self->_settings, "exitingCardBehaviorScaleDownOnly");
  -[AMUIPosterSwitcherViewController _unsettledSentinel](self, "_unsettledSentinel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUICountingSentinel increment](v14, v15);
  v16 = MEMORY[0x24BDAC760];
  if (!self->_unsettledAssertion)
  {
    -[AMUISwitcherViewController acquireUnsettledAssertionForReason:](self->_extensionSwitcherViewController, "acquireUnsettledAssertionForReason:", CFSTR("posterExtensionSwitcherTransition"));
    v17 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    unsettledAssertion = self->_unsettledAssertion;
    self->_unsettledAssertion = v17;

    objc_initWeak(location, self);
    v40[0] = v16;
    v40[1] = 3221225472;
    v40[2] = __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke;
    v40[3] = &unk_2507633B0;
    objc_copyWeak(&v41, location);
    -[AMUICountingSentinel performWhenCountAtZero:]((uint64_t)v14, v40);
    objc_destroyWeak(&v41);
    objc_destroyWeak(location);
  }
  v19 = fabs(a6 + -0.5);
  v20 = v19 + v19;
  if (v13)
    v21 = a6;
  else
    v21 = v20;
  v22 = self->_settings;
  location[0] = 0;
  v39 = 0.0;
  -[AMUIPosterSwitcherSettings horizontalScaleDampingRatio](v22, "horizontalScaleDampingRatio");
  v24 = v23;
  -[AMUIPosterSwitcherSettings horizontalScaleResponse](v22, "horizontalScaleResponse");
  AMUIConvertSpringDampingRatioAndResponseToTensionAndFriction((double *)location, &v39, v24, v25);
  v26 = (void *)MEMORY[0x24BDF6F90];
  v27 = location[0];
  v28 = v39;
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_2;
  v34[3] = &unk_2507635E8;
  v35 = v22;
  v36 = v12;
  v37 = v21;
  v38 = a6;
  v32[0] = v16;
  v32[1] = 3221225472;
  v32[2] = __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_3;
  v32[3] = &unk_250763610;
  v33 = v14;
  v29 = v14;
  v30 = v12;
  v31 = v22;
  objc_msgSend(v26, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v34, v32, *(double *)&v27, v28);

}

void __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[125], "invalidate");
    v2 = v3[125];
    v3[125] = 0;

    WeakRetained = v3;
  }

}

uint64_t __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGFloat v3;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "horizontalExitingCardTargetScale");
  BSFloatByLinearlyInterpolatingFloats();
  v2 = *(void **)(a1 + 40);
  CGAffineTransformMakeScale(&v5, v3, v3);
  objc_msgSend(v2, "setTransform:", &v5);
  objc_msgSend(*(id *)(a1 + 32), "exitingCardTargetOpacity");
  BSFloatByLinearlyInterpolatingFloats();
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:");
}

void *__85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_3(uint64_t a1, const char *a2)
{
  return -[AMUICountingSentinel decrement](*(void **)(a1 + 32), a2);
}

- (id)_switcherItemForConfiguration:(id)a3
{
  id v4;
  NSArray *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_items;
  v6 = (_QWORD *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8);
        if (v9)
          v10 = (void *)v9[2];
        else
          v10 = 0;
        if ((objc_msgSend(v10, "containsObject:", v4, (_QWORD)v13) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_15;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = (_QWORD *)v11;
    }
    while (v11);
  }
LABEL_15:

  return v6;
}

- (id)_unsettledSentinel
{
  AMUICountingSentinel *lazy_unsettledSentinel;
  AMUICountingSentinel *v4;
  AMUICountingSentinel *v5;

  lazy_unsettledSentinel = self->_lazy_unsettledSentinel;
  if (!lazy_unsettledSentinel)
  {
    v4 = objc_alloc_init(AMUICountingSentinel);
    v5 = self->_lazy_unsettledSentinel;
    self->_lazy_unsettledSentinel = v4;

    lazy_unsettledSentinel = self->_lazy_unsettledSentinel;
  }
  return lazy_unsettledSentinel;
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (AMUIPosterSwitcherViewControllerDelegate)delegate
{
  return (AMUIPosterSwitcherViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_unsettledAssertion, 0);
  objc_storeStrong((id *)&self->_lazy_unsettledSentinel, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_extensionSwitcherViewController, 0);
}

- (void)updatePosterConfiguration:(void *)a1 withAnimationSettings:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "serverUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "providerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_23600A000, a2, OS_LOG_TYPE_ERROR, "failed to find configuration with UUID %{public}@ bundle ID %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
