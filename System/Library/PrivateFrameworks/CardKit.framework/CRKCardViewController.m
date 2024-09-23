@implementation CRKCardViewController

+ (void)initialize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CRKCardViewController;
  objc_msgSendSuper2(&v3, sel_initialize);
  objc_msgSend(a1, "_registerCardSectionViewControllers");
  CRLogInitIfNeeded();
}

- (CRKCardViewController)initWithCard:(id)a3 delegate:(id)a4
{
  return (CRKCardViewController *)-[CRKCardViewController _initWithCard:delegate:loadBundles:loadProvidersImmediately:](self, "_initWithCard:delegate:loadBundles:loadProvidersImmediately:", a3, a4, 1, 1);
}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_cardSectionViewControllers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "cardEventDidOccur:withIdentifier:userInfo:", a3, v8, v9, (_QWORD)v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (BOOL)isLoading
{
  return -[NSMutableArray count](self->_loadingCardSections, "count") != 0;
}

- (void)setCard:(id)a3
{
  -[CRKCardViewController _setCard:loadProvidersImmediately:](self, "_setCard:loadProvidersImmediately:", a3, 1);
}

- (id)_initWithCard:(id)a3 delegate:(id)a4 loadProvidersImmediately:(BOOL)a5
{
  return -[CRKCardViewController _initWithCard:delegate:loadBundles:loadProvidersImmediately:](self, "_initWithCard:delegate:loadBundles:loadProvidersImmediately:", a3, a4, 0, a5);
}

- (id)_initWithCard:(id)a3 delegate:(id)a4 loadBundles:(BOOL)a5 loadProvidersImmediately:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  CRKCardViewController *v12;
  CRKCardViewController *v13;
  NSMutableArray *v14;
  NSMutableArray *pendingDismissalCommands;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  CRKCardViewController *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRKCardViewController;
  v12 = -[CRKCardViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    v12->_preferredPunchoutIndex = -1;
    objc_storeWeak((id *)&v12->_cardViewControllerDelegate, v11);
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingDismissalCommands = v13->_pendingDismissalCommands;
    v13->_pendingDismissalCommands = v14;

    v13->_loadBundles = a5;
    -[CRKCardViewController _setCard:loadProvidersImmediately:](v13, "_setCard:loadProvidersImmediately:", v10, v6);
    v16 = (void *)*MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v17 = v16;
      objc_msgSend(v10, "cardSections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v13;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_218FCB000, v17, OS_LOG_TYPE_INFO, "Card view controller initialized\n    CVC: %@\n    Card: %@\n    Card sections: %@", buf, 0x20u);

    }
  }

  return v13;
}

+ (void)_registerCardSectionViewControllers
{
  +[CRKCardSectionViewController _registerWithCardKit](CRKCardSectionViewController, "_registerWithCardKit");
}

- (id)_initWithCard:(id)a3
{
  return -[CRKCardViewController initWithCard:delegate:](self, "initWithCard:delegate:", a3, 0);
}

- (id)_loadCardSectionViewControllerFromCardSection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  CRKCardSectionViewSourcing *cardSectionViewSource;
  void *v8;
  int v10;
  CRKCardViewController *v11;
  __int16 v12;
  CRKCardSectionViewSourcing *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CRKCardSectionViewSourcing cardSectionShouldBeDisplayed:](self->_cardSectionViewSource, "cardSectionShouldBeDisplayed:", v4))
  {
    -[CRKCardSectionViewSourcing viewConfigurationForCardSection:](self->_cardSectionViewSource, "viewConfigurationForCardSection:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      +[CRKCardSectionViewController cardSectionViewControllerForViewConfiguration:](CRKCardSectionViewController, "cardSectionViewControllerForViewConfiguration:", v5);
    else
      +[CRKCardSectionViewController cardSectionViewControllerForCardSection:](CRKCardSectionViewController, "cardSectionViewControllerForCardSection:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardViewController _configureCardSectionViewController:forCardSection:](self, "_configureCardSectionViewController:forCardSection:", v8, v4);

  }
  else
  {
    v6 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      cardSectionViewSource = self->_cardSectionViewSource;
      v10 = 138412802;
      v11 = self;
      v12 = 2112;
      v13 = cardSectionViewSource;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_218FCB000, v6, OS_LOG_TYPE_INFO, "%@ not returning card section view controller because provider manager %@ marked card section %@ ineligble for display", (uint8_t *)&v10, 0x20u);
    }
    v8 = 0;
  }

  return v8;
}

- (void)_cancelTouchesIfNecessary
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_cardSectionViewControllers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_cancelTouchesIfNecessary", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_resumeTouchesIfNecessary
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_cardSectionViewControllers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_resumeTouchesIfNecessary", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_cardSectionViewControllerForCardSection:(id)a3
{
  return -[NSMapTable objectForKey:](self->_cardSectionsToCardSectionViewControllersMapTable, "objectForKey:", a3);
}

- (int64_t)_keylineStyleBetweenLeadingCardSectionViewController:(id)a3 andTrailingCardSectionViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && (objc_msgSend(v6, "cardSection"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "backingCardSection"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "separatorStyle"),
        v11,
        v10,
        (_DWORD)v12))
  {
    v13 = -[CRKCardViewController _convertSFSeparatorStyleToCRKKeylineStyle:](self, "_convertSFSeparatorStyleToCRKKeylineStyle:", v12);
  }
  else
  {
    v13 = -[CRKCardViewController _defaultKeylineStyleBetweenLeadingCardSection:andTrailingCardSection:](self, "_defaultKeylineStyleBetweenLeadingCardSection:andTrailingCardSection:", v6, v7);
  }
  v14 = v13;

  return v14;
}

- (int64_t)_defaultKeylineStyleBetweenLeadingCardSection:(id)a3 andTrailingCardSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "cardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backingCardSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v7, "cardSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v7, "cardSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "backingCardSection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v6, "cardSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    objc_msgSend(v6, "cardSection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "actionCommands");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v7, "cardSection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    objc_msgSend(v7, "cardSection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "actionCommands");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  if (objc_msgSend(v19, "count") || objc_msgSend(v23, "count"))
  {
    v24 = 1;
    goto LABEL_16;
  }
  if (objc_msgSend(v11, "_crk_leadingCardSectionSeparatorStyle"))
  {
    v26 = v11;
LABEL_21:
    v24 = -[CRKCardViewController _convertSFSeparatorStyleToCRKKeylineStyle:](self, "_convertSFSeparatorStyleToCRKKeylineStyle:", objc_msgSend(v26, "_crk_leadingCardSectionSeparatorStyle"));
    goto LABEL_16;
  }
  if (objc_msgSend(v15, "_crk_leadingCardSectionSeparatorStyle"))
  {
    v26 = v15;
    goto LABEL_21;
  }
  if (v11)
    v24 = 3;
  else
    v24 = 4;
LABEL_16:

  return v24;
}

- (int64_t)_convertSFSeparatorStyleToCRKKeylineStyle:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 2);
  if (v3 < 4)
    return v3 + 1;
  else
    return 0;
}

- (void)_removeCardSectionViewControllersFromParentViewController:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "didMoveToParentViewController:", 0);
        objc_msgSend(v8, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeFromComposedSuperview");

        objc_msgSend(v8, "removeFromParentViewController");
        objc_msgSend(v8, "setView:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_addCardSectionViewControllersAsChildViewControllers:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "count");
  if (-[CRKCardViewController isViewLoaded](self, "isViewLoaded") && v4)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v12, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        ++v5;
      }
      else
      {
        -[CRKCardViewController addChildViewController:](self, "addChildViewController:", v6);
        if (v4 <= ++v5)
        {
          v8 = 0;
        }
        else
        {
          objc_msgSend(v12, "objectAtIndex:", v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v9 = -[CRKCardViewController _keylineStyleBetweenLeadingCardSectionViewController:andTrailingCardSectionViewController:](self, "_keylineStyleBetweenLeadingCardSectionViewController:andTrailingCardSectionViewController:", v6, v8);
        -[CRKCardViewController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addCardSectionSubview:withKeyline:", v11, v9);

        objc_msgSend(v6, "didMoveToParentViewController:", self);
      }

    }
    while (v5 != v4);
    if (!-[CRKCardViewController isLoading](self, "isLoading"))
      -[CRKCardViewController _finishLoading](self, "_finishLoading");
  }

}

- (BOOL)_askDelegateToPerformReferentialCommand:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  char v10;
  void *v11;

  v5 = a3;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) != 0
    && (-[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v3, "canPerformReferentialCommand:forCardViewController:", v5, self)))
  {
    v9 = 0;
  }
  else
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      goto LABEL_7;
  }

LABEL_7:
  v10 = 0;
  if (v5 && (v9 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "performReferentialCommand:forCardViewController:", v5, self);

  }
  return v10;
}

- (void)_configureCardSectionViewController:(id)a3 forCardSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "setDelegate:", self);
    -[NSMutableArray addObject:](self->_cardSectionViewControllers, "addObject:", v6);
    if (v7)
      -[NSMapTable setObject:forKey:](self->_cardSectionsToCardSectionViewControllersMapTable, "setObject:forKey:", v6, v7);
    -[CRKCardViewController card](self, "card");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissalCommands");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v6, "_setExtraCommands:", v10);

    if (objc_msgSend(v6, "_isIndicatingActivity"))
      self->_indicatingActivity = 1;
  }
  else
  {
    v11 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[CRKCardViewController _configureCardSectionViewController:forCardSection:].cold.1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (void)_finishLoading
{
  CRKCardViewController *v2;
  void *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  os_log_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id WeakRetained;
  void *v27;
  CRKCardViewController *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v2 = self;
  v43 = *MEMORY[0x24BDAC8D0];
  if (-[CRKCardViewController isViewLoaded](self, "isViewLoaded")
    && (objc_opt_respondsToSelector() & 1) != 0
    && -[CRCard flexibleSectionOrder](v2->_card, "flexibleSectionOrder"))
  {
    -[CRKCardViewController view](v2, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cardSectionSubviews");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v28 = v2;
    v5 = v2->_cardSectionViewControllers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    if (!v6)
      goto LABEL_17;
    v7 = v6;
    v8 = *(_QWORD *)v33;
    v9 = (os_log_t *)MEMORY[0x24BE15490];
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
        objc_msgSend(v11, "view", v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cardSectionViewIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "view");
          v14 = objc_claimAutoreleasedReturnValue();
          -[NSObject cardSectionViewIdentifier](v14, "cardSectionViewIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v11, v15);
LABEL_11:

          goto LABEL_13;
        }
        v16 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          v14 = v16;
          objc_msgSend(v11, "cardSection");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v37 = v11;
          v38 = 2112;
          v39 = v15;
          v40 = 2112;
          v41 = v17;
          _os_log_error_impl(&dword_218FCB000, v14, OS_LOG_TYPE_ERROR, "Card section view controller's view doesn't have a card section view identifier\n    Card section view controller: %@\n    Card section: %@\n    Card section view: %@", buf, 0x20u);

          goto LABEL_11;
        }
LABEL_13:
        ++v10;
      }
      while (v7 != v10);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      v7 = v18;
      if (!v18)
      {
LABEL_17:

        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __39__CRKCardViewController__finishLoading__block_invoke;
        v29[3] = &unk_24DA4D0D8;
        v30 = v4;
        v31 = v27;
        v19 = v27;
        v20 = v4;
        objc_msgSend(v19, "sortedArrayUsingComparator:", v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v28;
        -[CRKCardViewController view](v28, "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setCardSectionSubviews:", v21);

        -[CRKCardViewController view](v28, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setNeedsLayout");

        break;
      }
    }
  }
  -[CRKCardViewController cardViewControllerDelegate](v2, "cardViewControllerDelegate", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->_cardViewControllerDelegate);
    objc_msgSend(WeakRetained, "cardViewControllerDidLoad:", v2);

  }
  v2->_loaded = 1;
}

uint64_t __39__CRKCardViewController__finishLoading__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "cardSectionViewIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "cardSectionViewIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v9, "_isLoadedWithIntentsUIView");
  v14 = objc_msgSend(v12, "_isLoadedWithIntentsUIView");
  v15 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v7);

  v16 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "compare:", v18);

  if (v14)
    v20 = 1;
  else
    v20 = v19;
  if (v14)
    v21 = v19;
  else
    v21 = -1;
  if (v13)
    v22 = v21;
  else
    v22 = v20;

  return v22;
}

- (BOOL)_isActuallyVisible
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  -[CRKCardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCardViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    while (1)
    {
      v6 = objc_msgSend(v5, "_crk_subviewIsVisible:", v3);
      if (!v6)
        break;
      v7 = v5;
      objc_msgSend(v7, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v7;
      if (!v5)
      {
        v3 = v7;
        break;
      }
    }

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)_generateCardViewAppearanceFeedback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;

  -[CRKCardViewController card](self, "card");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CRKCardViewController card](self, "card");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backingCard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84DA0]), "initWithCard:", v5);
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "navigationIndexOfCardViewController:", self);

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "setLevel:", v10);

  return v6;
}

- (void)_setCard:(id)a3 loadProvidersImmediately:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v4 = a4;
  v6 = a3;
  if ((-[CRCard isEqual:](self->_card, "isEqual:", v6) & 1) == 0)
  {
    if (self->_loadBundles)
    {
      +[_CRKProviderBundleManager sharedInstance](_CRKProviderBundleManager, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke;
      v8[3] = &unk_24DA4D128;
      v8[4] = self;
      v9 = v6;
      v10 = v4;
      objc_msgSend(v7, "getProviderBundlesWithCompletion:", v8);

    }
    else
    {
      -[CRKCardViewController _setCardWithLoadedBundles:loadProvidersImmediately:](self, "_setCardWithLoadedBundles:loadProvidersImmediately:", v6, v4);
    }
  }

}

void __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  os_log_t *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD block[5];
  id v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v23 = a1;
  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x24BE15490];
  if (v5)
  {
    v7 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }
  v24 = v5;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v20 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v19;
          _os_log_impl(&dword_218FCB000, v20, OS_LOG_TYPE_INFO, "Registering bundle provider with CardKit: %@", buf, 0xCu);
        }
        +[CRKIdentifiedProviderRegistry sharedInstance](CRKIdentifiedProviderRegistry, "sharedInstance", v23, v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "registerIdentifiedProvider:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v16);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke_48;
  block[3] = &unk_24DA4D100;
  v22 = *(void **)(v23 + 40);
  block[4] = *(_QWORD *)(v23 + 32);
  v26 = v22;
  v27 = *(_BYTE *)(v23 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCardWithLoadedBundles:loadProvidersImmediately:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_setCardWithLoadedBundles:(id)a3 loadProvidersImmediately:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a4;
  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v7, "asynchronous")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __76__CRKCardViewController__setCardWithLoadedBundles_loadProvidersImmediately___block_invoke;
    v8[3] = &unk_24DA4D178;
    objc_copyWeak(&v10, &location);
    v9 = v7;
    objc_msgSend(v9, "loadCardWithCompletion:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_storeStrong((id *)&self->_card, a3);
    if (v4)
      -[CRKCardViewController _loadCardSectionViewControllersFromCard:currentSourceInvalid:](self, "_loadCardSectionViewControllersFromCard:currentSourceInvalid:", v7, 1);
  }

}

void __76__CRKCardViewController__setCardWithLoadedBundles_loadProvidersImmediately___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__CRKCardViewController__setCardWithLoadedBundles_loadProvidersImmediately___block_invoke_2;
  block[3] = &unk_24DA4D150;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __76__CRKCardViewController__setCardWithLoadedBundles_loadProvidersImmediately___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id *v16;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v16 = WeakRetained;
    objc_msgSend(WeakRetained, "cardViewControllerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        v7 = objc_alloc_init(MEMORY[0x24BE154A0]);
        objc_msgSend(v16, "cardViewControllerDelegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          objc_msgSend(v16, "cardViewControllerDelegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "baseCardForCardViewController:", v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }
        objc_msgSend(v7, "setBaseCard:", v11);
        objc_msgSend(v7, "setRequestedCard:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v7, "setReceivedCard:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v16, "cardViewControllerDelegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "controllerForCard:didReceiveAsyncCard:withAsyncCardReceiptFeedback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v7);

      }
      objc_storeStrong(v16 + 129, *(id *)(a1 + 32));
      v15 = objc_msgSend(v16, "isViewLoaded");
      v3 = v16;
      if (v15)
      {
        objc_msgSend(v16, "_loadCardSectionViewControllersFromCard:currentSourceInvalid:", *(_QWORD *)(a1 + 32), 1);
        goto LABEL_12;
      }
    }
    else
    {
      v12 = objc_opt_respondsToSelector();

      v3 = v16;
      if ((v12 & 1) != 0)
      {
        objc_msgSend(v16, "cardViewControllerDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cardViewController:didFailToLoadCard:", v16, *(_QWORD *)(a1 + 40));

LABEL_12:
        v3 = v16;
      }
    }
  }

}

- (void)_loadCardSectionViewControllersFromCard:(id)a3 currentSourceInvalid:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  CRKCardSectionViewSourcing *cardSectionViewSource;
  void *v15;
  CRCard *card;
  _QWORD v17[4];
  id v18;
  void (**v19)(_QWORD);
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location[2];

  v4 = a4;
  v6 = a3;
  self->_loaded = 0;
  objc_initWeak(location, self);
  v7 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke;
  v25[3] = &unk_24DA4D1A0;
  objc_copyWeak(&v27, location);
  v8 = v6;
  v26 = v8;
  v9 = (void *)MEMORY[0x219A28084](v25);
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_3;
  v21[3] = &unk_24DA4D218;
  objc_copyWeak(&v24, location);
  v10 = v9;
  v23 = v10;
  v11 = v8;
  v22 = v11;
  v12 = MEMORY[0x219A28084](v21);
  v13 = (void (**)(_QWORD))v12;
  if (v4)
  {
    cardSectionViewSource = self->_cardSectionViewSource;
    self->_cardSectionViewSource = 0;

    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      card = self->_card;
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_6;
      v17[3] = &unk_24DA4D268;
      objc_copyWeak(&v20, location);
      v18 = v15;
      v19 = v13;
      objc_msgSend(v18, "cardViewController:requestCardSectionViewSourceForCard:reply:", self, card, v17);

      objc_destroyWeak(&v20);
    }
    else
    {
      v13[2](v13);
    }

  }
  else
  {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);
  objc_destroyWeak(location);

}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_removeCardSectionViewControllersFromParentViewController:", WeakRetained[121]);
    objc_msgSend((id)v3[121], "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 32), "cardSections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v5);
      v7 = (void *)v3[121];
      v3[121] = v6;

      objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 5);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v3[122];
      v3[122] = v8;

      objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v3[123];
      v3[123] = v10;

      *((_BYTE *)v3 + 1024) = 0;
      v12 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(*(id *)(a1 + 32), "cardSections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayWithArray:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v3[127];
      v3[127] = v14;

      objc_msgSend((id)v3[127], "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_loadCardSectionViewControllerFromCardSection:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v17, "isLoading") & 1) == 0)
        objc_msgSend(v3, "cardSectionViewControllerDidFinishLoading:", v17);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_2;
    block[3] = &unk_24DA4CCA0;
    block[4] = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "cardViewControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "cardViewControllerDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cardViewControllerBoundsDidChange:", *(_QWORD *)(a1 + 32));

    }
  }
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_3(id *a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  _CRKCardSectionViewLoader *v5;
  void *v6;
  char isKindOfClass;
  _CRKCardSectionViewLoader *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[4];
  _CRKCardSectionViewLoader *v13;
  id v14;
  id v15;
  id v16;

  v2 = a1 + 6;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[131])
    {
      (*((void (**)(void))a1[5] + 2))();
    }
    else
    {
      v5 = objc_alloc_init(_CRKCardSectionViewLoader);
      objc_storeStrong(v4 + 126, v5);
      objc_storeStrong(v4 + 131, v5);
      objc_msgSend(v4, "cardViewControllerDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("SiriUILegacyCardSnippetViewController"));
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        (*((void (**)(void))a1[5] + 2))();
      }
      else
      {
        v8 = objc_alloc_init(_CRKCardSectionViewLoader);
        objc_storeStrong(v4 + 126, v8);
        objc_storeStrong(v4 + 131, v8);
        objc_msgSend(v4, "cardViewControllerDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        NSClassFromString(CFSTR("SiriUILegacyCardSnippetViewController"));
        v10 = objc_opt_isKindOfClass();

        if ((v10 & 1) != 0)
        {
          (*((void (**)(void))a1[5] + 2))();
        }
        else
        {
          +[_CRKProviderBundleManager sharedInstance](_CRKProviderBundleManager, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_4;
          v12[3] = &unk_24DA4D1F0;
          objc_copyWeak(&v16, v2);
          v13 = v8;
          v14 = a1[4];
          v15 = a1[5];
          objc_msgSend(v11, "getProviderBundlesWithCompletion:", v12);

          objc_destroyWeak(&v16);
        }

      }
    }
  }

}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_4(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_5;
  v8[3] = &unk_24DA4D1C8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v6, "_loadIdentifiedCardSectionViewProvidersFromCard:identifiedProviders:delegate:completion:", v7, v4, WeakRetained, v8);

}

uint64_t __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_6(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_7;
  block[3] = &unk_24DA4D240;
  objc_copyWeak(&v14, a1 + 6);
  v10 = v6;
  v11 = a1[4];
  v12 = v5;
  v13 = a1[5];
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v14);
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_7(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_7_cold_1(a1, (uint64_t *)(a1 + 32), v4);
  }
  else if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 131, *(id *)(a1 + 48));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (CRKCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (CRKCardViewController)initWithCoder:(id)a3
{

  return 0;
}

- (void)loadView
{
  CRKComposedStackView *v3;

  v3 = objc_alloc_init(CRKComposedStackView);
  -[CRKCardViewController setView:](self, "setView:", v3);
  -[CRKCardViewController _addCardSectionViewControllersAsChildViewControllers:](self, "_addCardSectionViewControllersAsChildViewControllers:", self->_cardSectionViewControllers);

}

- (void)didMoveToParentViewController:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRKCardViewController;
  -[CRKCardViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_, a3);
  -[CRKCardViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRKCardViewController;
  -[CRKCardViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRKCardViewController;
  -[CRKCardViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardViewController card](self, "card");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardViewController _generateCardViewAppearanceFeedback](self, "_generateCardViewAppearanceFeedback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardViewWillAppearForCard:withAppearanceFeedback:", v7, v8);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRKCardViewController;
  -[CRKCardViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  if (-[CRKCardViewController _isActuallyVisible](self, "_isActuallyVisible"))
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKCardViewController card](self, "card");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKCardViewController _generateCardViewAppearanceFeedback](self, "_generateCardViewAppearanceFeedback");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cardViewDidAppearForCard:withAppearanceFeedback:", v7, v8);

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)CRKCardViewController;
  -[CRKCardViewController viewWillDisappear:](&v13, sel_viewWillDisappear_, a3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_pendingDismissalCommands;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
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
        -[CRKCardViewController _askDelegateToPerformReferentialCommand:](self, "_askDelegateToPerformReferentialCommand:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_pendingDismissalCommands, "removeAllObjects");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRKCardViewController;
  -[CRKCardViewController viewDidDisappear:](&v14, sel_viewDidDisappear_, a3);
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __42__CRKCardViewController_viewDidDisappear___block_invoke;
    v13[3] = &unk_24DA4D290;
    v13[4] = self;
    v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v13);
    v9 = 3;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7)
    {
      if (v8 == objc_msgSend(v7, "count") - 2)
        v9 = 5;
      else
        v9 = 4;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84DA8]), "initWithEvent:", v9);
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardViewController card](self, "card");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardViewDidDisappearForCard:withDisappearanceFeedback:", v12, v10);

  }
}

BOOL __42__CRKCardViewController_viewDidDisappear___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;

  if ((objc_msgSend(*(id *)(a1 + 32), "_crk_isDescendantOfViewController:", a2) & 1) == 0)
    return *a4 != 0;
  result = 1;
  *a4 = 1;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[CRKCardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[CRKCardViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[CRKCardViewController contentHeightForWidth:](self, "contentHeightForWidth:", v7);
  v9 = v8;

  v10 = v5;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CRKCardViewController)init
{

  return 0;
}

- (void)cardSectionViewControllerDidFinishLoading:(id)a3
{
  void *v4;
  id v5;

  if (-[NSMutableArray count](self->_loadingCardSections, "count", a3))
    -[NSMutableArray removeObjectAtIndex:](self->_loadingCardSections, "removeObjectAtIndex:", 0);
  if (-[CRKCardViewController isLoading](self, "isLoading"))
  {
    -[NSMutableArray objectAtIndex:](self->_loadingCardSections, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardViewController _loadCardSectionViewControllerFromCardSection:](self, "_loadCardSectionViewControllerFromCardSection:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "isLoading") & 1) == 0)
      -[CRKCardViewController cardSectionViewControllerDidFinishLoading:](self, "cardSectionViewControllerDidFinishLoading:", v5);

  }
  else
  {
    -[CRKCardViewController _addCardSectionViewControllersAsChildViewControllers:](self, "_addCardSectionViewControllersAsChildViewControllers:", self->_cardSectionViewControllers);
    -[CRKCardViewController _finishLoading](self, "_finishLoading");
  }
}

- (void)cardSectionViewControllerBoundsDidChange:(id)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_loaded)
  {
    -[CRKCardViewController view](self, "view", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __66__CRKCardViewController_cardSectionViewControllerBoundsDidChange___block_invoke;
    v5[3] = &unk_24DA4CD18;
    v5[4] = self;
    objc_msgSend(v4, "triggerLayoutAnimated:completion:", 0, v5);

  }
}

void __66__CRKCardViewController_cardSectionViewControllerBoundsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "cardViewControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cardViewControllerDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardViewControllerBoundsDidChange:", *(_QWORD *)(a1 + 32));

  }
}

- (void)cardSectionViewController:(id)a3 requestsHandlingOfIntent:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardViewController:requestsHandlingOfIntent:", self, v8);

  }
}

- (CGSize)boundingSizeForCardSectionViewController:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a3;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardViewController:boundingSizeForCardSectionViewController:", self, v4);
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v9 = *MEMORY[0x24BDBF148];
    v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)handleCardCommand:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _BOOL4 v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = objc_msgSend(v13, "commandDirection");
  if (v7 && v7 != 2)
  {
    if (v7 != 1)
      goto LABEL_13;
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE15488], 501, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v8);

    }
  }
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleCardCommand:reply:", v13, v6);
LABEL_12:

    goto LABEL_13;
  }
  v12 = -[CRKCardViewController _fireAndForgetOutboundCommand:](self, "_fireAndForgetOutboundCommand:", v13);
  if (v6)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE15488], 500, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0, v11);
      goto LABEL_12;
    }
    v6[2](v6, 0, 0);
  }
LABEL_13:

}

- (BOOL)_fireAndForgetOutboundCommand:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  uint64_t v17;
  CRKCardViewController *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  char v34;
  void *v35;
  char v36;
  uint64_t v38;
  CRKCardViewController *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "conformsToProtocol:", &unk_25505F468))
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_2550579F0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_msgSend(v4, "handleForCardViewController:", self);
        goto LABEL_40;
      }
LABEL_39:
      v16 = 0;
      goto LABEL_40;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_opt_respondsToSelector();

      -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if ((v29 & 1) != 0)
      {
        objc_msgSend(v30, "performRequestUserConfirmationCommand:forCardViewController:", v4, self);
      }
      else
      {
        v34 = objc_opt_respondsToSelector();

        if ((v34 & 1) == 0)
          goto LABEL_39;
        -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "cardViewController:requestsHandlingOfIntent:", self, 0);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_opt_respondsToSelector();

        if ((v33 & 1) == 0)
          goto LABEL_39;
        -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "performBeganEditingCommand:forCardViewController:", v4, self);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_39;
        -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_opt_respondsToSelector();

        if ((v36 & 1) == 0)
          goto LABEL_39;
        -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "performFinishedEditingCommand:forCardViewController:", v4, self);
      }
    }

    v16 = 1;
    goto LABEL_40;
  }
  v5 = v4;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v39 = self;
  -[CRKCardViewController card](self, "card");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissalCommands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend(v12, "conformsToProtocol:", &unk_25505F468))
        {
          objc_msgSend(v12, "referenceIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "referenceIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if ((v15 & 1) != 0)
          {

            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v17 = 992;
            v18 = v39;
            v19 = v39->_pendingDismissalCommands;
            v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v41;
              v38 = 992;
              while (2)
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v41 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                  objc_msgSend(v24, "referenceIdentifier", v38);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "referenceIdentifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v25, "isEqualToString:", v26);

                  if (v27)
                  {
                    v17 = v38;
                    v18 = v39;
                    objc_msgSend(*(id *)((char *)&v39->super.super.super.isa + v38), "removeObject:", v24);
                    goto LABEL_28;
                  }
                }
                v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
                v17 = v38;
                v18 = v39;
                if (v21)
                  continue;
                break;
              }
            }
LABEL_28:

            objc_msgSend(*(id *)((char *)&v18->super.super.super.isa + v17), "addObject:", v5);
            v16 = 1;
            goto LABEL_29;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = -[CRKCardViewController _askDelegateToPerformReferentialCommand:](v39, "_askDelegateToPerformReferentialCommand:", v5);
LABEL_29:

LABEL_40:
  return v16;
}

- (void)cardSectionViewControllerShouldBeRemoved:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKCardViewController _removeCardSectionViewControllersFromParentViewController:](self, "_removeCardSectionViewControllersFromParentViewController:", v6, v7, v8);

  -[NSMutableArray removeObject:](self->_cardSectionViewControllers, "removeObject:", v5);
}

- (void)presentViewController:(id)a3 forCardSectionViewController:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:forCardViewController:", v8, self);

  }
}

- (void)cardSectionViewController:(id)a3 didSelectPreferredPunchoutIndex:(int64_t)a4
{
  self->_preferredPunchoutIndex = a4;
}

- (int64_t)preferredPunchoutIndexForCardSectionViewController:(id)a3
{
  return self->_preferredPunchoutIndex;
}

- (void)didEngageCardSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "cardSection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE15518], "cardSectionWithSFCardSection:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_cardSectionsToCardSectionViewControllersMapTable, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didEngageCardSection:", v4);

}

- (void)presentViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:forCardViewController:", v7, self);

  }
}

- (void)willDismissViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardViewController:willDismissViewController:", self, v7);

  }
}

- (void)cardSectionViewDidSelectPreferredPunchoutIndex:(int64_t)a3
{
  self->_preferredPunchoutIndex = a3;
}

- (void)cardSectionView:(id)a3 willProcessEngagementFeedback:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionView:willProcessEngagementFeedback:", v10, v6);

  }
}

- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userDidEngageCardSection:withEngagementFeedback:", v10, v6);

  }
}

- (void)userDidReportFeedback:(id)a3 fromCardSection:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userDidReportFeedback:fromCardSection:", v10, v6);

  }
}

- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionViewWillAppearForCardSection:withAppearanceFeedback:", v10, v6);

  }
}

- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionViewDidAppearForCardSection:withAppearanceFeedback:", v10, v6);

  }
}

- (void)cardSectionViewDidDisappearForCardSection:(id)a3 withDisappearanceFeedback:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionViewDidDisappearForCardSection:withDisappearanceFeedback:", v10, v6);

  }
}

- (void)setCardSectionViewSource:(id)a3
{
  CRKCardSectionViewSourcing *v5;
  CRKCardSectionViewSourcing *v6;

  v5 = (CRKCardSectionViewSourcing *)a3;
  if (self->_cardSectionViewSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cardSectionViewSource, a3);
    -[CRKCardViewController _loadCardSectionViewControllersFromCard:currentSourceInvalid:](self, "_loadCardSectionViewControllersFromCard:currentSourceInvalid:", self->_card, 0);
    v5 = v6;
  }

}

- (double)contentHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[CRKCardViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeThatFits:", a3, 3.40282347e38);
  v6 = v5;

  return v6;
}

- (CRCard)card
{
  return self->_card;
}

- (CRKCardViewControllerDelegate)cardViewControllerDelegate
{
  return (CRKCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_cardViewControllerDelegate);
}

- (void)setCardViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cardViewControllerDelegate, a3);
}

- (CRKCardSectionViewSourcing)cardSectionViewSource
{
  return self->_cardSectionViewSource;
}

- (BOOL)isIndicatingActivity
{
  return self->_indicatingActivity;
}

- (BOOL)loadBundles
{
  return self->_loadBundles;
}

- (void)setLoadBundles:(BOOL)a3
{
  self->_loadBundles = a3;
}

- (int64_t)preferredPunchoutIndex
{
  return self->_preferredPunchoutIndex;
}

- (void)setPreferredPunchoutIndex:(int64_t)a3
{
  self->_preferredPunchoutIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionViewSource, 0);
  objc_destroyWeak((id *)&self->_cardViewControllerDelegate);
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_loadingCardSections, 0);
  objc_storeStrong((id *)&self->_builtInCardSectionViewSource, 0);
  objc_storeStrong((id *)&self->_pendingDismissalCommands, 0);
  objc_storeStrong((id *)&self->_handledParametersForInteraction, 0);
  objc_storeStrong((id *)&self->_cardSectionsToCardSectionViewControllersMapTable, 0);
  objc_storeStrong((id *)&self->_cardSectionViewControllers, 0);
}

- (void)_configureCardSectionViewController:(uint64_t)a3 forCardSection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218FCB000, a2, a3, "No cardSectionViewController for card section: %@. Dropping and continuing", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218FCB000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_7_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_218FCB000, log, OS_LOG_TYPE_ERROR, "Delegate %@ failed to provide card section view source: %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
