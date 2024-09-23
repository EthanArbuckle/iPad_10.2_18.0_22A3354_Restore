@implementation CRKCardSectionViewController

+ (id)cardSectionViewControllerForCardSection:(id)a3
{
  return +[_CRKCardSectionViewControllerFactory cardSectionViewControllerForCardSection:](_CRKCardSectionViewControllerFactory, "cardSectionViewControllerForCardSection:", a3);
}

+ (id)cardSectionClasses
{
  return 0;
}

+ (void)registerCardSectionViewController
{
  +[_CRKCardSectionViewControllerFactory registerCardSectionViewControllerClass:](_CRKCardSectionViewControllerFactory, "registerCardSectionViewControllerClass:", objc_opt_class());
}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  id v8;
  CRKCardSectionViewConfiguration **p_viewConfiguration;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id v15;

  v15 = a4;
  v8 = a5;
  p_viewConfiguration = &self->_viewConfiguration;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewConfiguration);
  objc_msgSend(WeakRetained, "cardSectionViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", self) & 1) != 0)
    goto LABEL_4;
  v12 = objc_loadWeakRetained((id *)&self->_viewConfiguration);
  objc_msgSend(v12, "cardSectionViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_viewConfiguration);
    objc_msgSend(WeakRetained, "cardSectionViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardEventDidOccur:withIdentifier:userInfo:", a3, v15, v8);
LABEL_4:

  }
}

+ (id)cardSectionViewControllerForViewConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CRKCardSectionViewControllerFactory cardSectionViewControllerForCardSection:](_CRKCardSectionViewControllerFactory, "cardSectionViewControllerForCardSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setViewConfiguration:", v3);
  objc_msgSend(v3, "feedbackDelegateProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFeedbackDelegate:", v5);

  objc_msgSend(v3, "cardSectionViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCardSectionViewControllingDelegate:", v5);
  return v5;
}

- (id)_initWithCardSection:(id)a3
{
  id v5;
  CRKCardSectionViewController *v6;
  CRKCardSectionViewController *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  CRKCardSectionViewController *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKCardSectionViewController;
  v6 = -[CRKCardSectionViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    -[CRKCardSectionViewController setViewRespectsSystemMinimumLayoutMargins:](v6, "setViewRespectsSystemMinimumLayoutMargins:", 0);
    objc_storeStrong((id *)&v7->_cardSection, a3);
    v7->_childVCDesiresInteractivity = 0;
    v8 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_218FCB000, v8, OS_LOG_TYPE_INFO, "Card section view controller initialized\n    CSVC: %@\n    Card section: %@", buf, 0x16u);
    }
  }

  return v7;
}

- (void)_setExtraCommands:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_extraCommands != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_extraCommands, a3);
    -[CRKOverlayButton setHidden:](self->_overlayButton, "setHidden:", -[CRKCardSectionViewController _shouldHideButtonOverlay](self, "_shouldHideButtonOverlay"));
    v5 = v6;
  }

}

- (void)_performCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canPerformCommand:forCardSectionViewController:", v4, self);

    if (!v7)
      goto LABEL_8;
  }
  else
  {

  }
  -[CRKCardSectionViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "performCommand:forCardSectionViewController:", v4, self);

  if ((v9 & 1) == 0)
  {
    v10 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_218FCB000, v10, OS_LOG_TYPE_INFO, "Unable to perform %@ command", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_8:

}

- (BOOL)_hasCorrespondingSearchUIView
{
  CRKCardSectionViewConfiguration **p_viewConfiguration;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;

  p_viewConfiguration = &self->_viewConfiguration;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewConfiguration);
  objc_msgSend(WeakRetained, "_providerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.cards.SearchUICardKitProvider")))
  {
    v5 = objc_loadWeakRetained((id *)p_viewConfiguration);
    objc_msgSend(v5, "cardSectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_expectsSearchUIView
{
  void *v3;
  char v4;

  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 0;
  else
    v4 = -[CRKCardSectionViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());

  return v4;
}

- (BOOL)_isLoadedWithIntentsUIView
{
  CRKCardSectionViewConfiguration **p_viewConfiguration;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;

  p_viewConfiguration = &self->_viewConfiguration;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewConfiguration);
  objc_msgSend(WeakRetained, "_providerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.cards.IntentsUICardKitProvider")))
  {
    v5 = objc_loadWeakRetained((id *)p_viewConfiguration);
    objc_msgSend(v5, "cardSectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_performAllCommands
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[3];

  v21[1] = *MEMORY[0x24BDAC8D0];
  -[CRKCardSectionViewController _preferredPunchoutCommand](self, "_preferredPunchoutCommand");
  v3 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v3;
  if (v3)
  {
    v21[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CRKCardSectionViewController _commands](self, "_commands");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[CRKCardSectionViewController delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {

LABEL_13:
          -[CRKCardSectionViewController delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "performCommand:forCardSectionViewController:", v10, self);

          continue;
        }
        -[CRKCardSectionViewController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "canPerformCommand:forCardSectionViewController:", v10, self);

        if (v13)
          goto LABEL_13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)_loadCardSectionView
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_218FCB000, v3, OS_LOG_TYPE_ERROR, "No card section view is available for %@ (card section %@)", (uint8_t *)&v5, 0x16u);

}

void __52__CRKCardSectionViewController__loadCardSectionView__block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CRKCardSectionViewController__loadCardSectionView__block_invoke_2;
  block[3] = &unk_24DA4D060;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v7 = a2;
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v6);
}

void __52__CRKCardSectionViewController__loadCardSectionView__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_BYTE *)(a1 + 48))
  {
    v3 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_218FCB000, v3, OS_LOG_TYPE_INFO, "Setting interceptsTouches to NO for %@", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setInterceptsTouches:", 0);
    WeakRetained[976] = 1;
    v5 = (void *)*((_QWORD *)WeakRetained + 121);
    if (v5)
    {
      objc_msgSend(v5, "removeFromSuperview");
      v6 = (void *)*((_QWORD *)WeakRetained + 121);
      *((_QWORD *)WeakRetained + 121) = 0;

    }
  }

}

- (void)_finishLoadingViewIfNecessary
{
  void *v3;
  char v4;
  id v5;

  if (-[CRKCardSectionViewController isLoading](self, "isLoading"))
  {
    -[CRKCardSectionViewController setLoading:](self, "setLoading:", 0);
    -[CRKCardSectionViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[CRKCardSectionViewController delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cardSectionViewControllerDidFinishLoading:", self);

    }
  }
}

- (BOOL)_shouldRenderButtonOverlay
{
  int v3;

  v3 = -[CRKCardSectionViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
  if (v3)
    LOBYTE(v3) = !self->_childVCDesiresInteractivity;
  return v3;
}

- (id)_commands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKCardSectionViewController _extraCommands](self, "_extraCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CRKCardSectionViewController _extraCommands](self, "_extraCommands");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (id)_destinationPunchout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[CRKCardSectionViewController _preferredPunchoutCommand](self, "_preferredPunchoutCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "crk_backingPunchout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[CRKCardSectionViewController _commands](self, "_commands", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "crk_backingPunchout");
            v12 = objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              v5 = (void *)v12;
              goto LABEL_14;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_14:

  }
  return v5;
}

- (id)_preferredPunchoutCommand
{
  CRKCardSectionViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_msgSend(v6, "preferredPunchoutIndexForCardSectionViewController:", self);

  if (v7 < 0)
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CRKCardSectionViewController _commands](self, "_commands", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v11 == v7)
          {
            v15 = v14;
            goto LABEL_16;
          }
          ++v11;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (void)_cardSectionTapped
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingCardSection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v4 = objc_alloc(MEMORY[0x24BE84D90]);
    -[CRKCardSectionViewController _destinationPunchout](self, "_destinationPunchout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithCardSection:destination:triggerEvent:actionCardType:", v7, v5, 2, 1);
    -[CRKCardSectionViewController didEngageCardSection:](self, "didEngageCardSection:", v6);

  }
}

- (void)_buttonOverlayWasTouchedUpInside:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[4];
  id v13;

  v4 = a3;
  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingCardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE84D90]);
    -[CRKCardSectionViewController _destinationPunchout](self, "_destinationPunchout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithCardSection:destination:triggerEvent:actionCardType:", v6, v8, 2, 1);
    -[CRKCardSectionViewController didEngageCardSection:](self, "didEngageCardSection:", v9);

  }
  else
  {
    -[CRKCardSectionViewController _performAllCommands](self, "_performAllCommands");
  }
  v10 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CRKCardSectionViewController__buttonOverlayWasTouchedUpInside___block_invoke;
  block[3] = &unk_24DA4CCA0;
  v13 = v4;
  v11 = v4;
  dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

}

uint64_t __65__CRKCardSectionViewController__buttonOverlayWasTouchedUpInside___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelected:animated:", 0, 1);
}

- (void)_buttonOverlayWasTouchedUpOutside:(id)a3
{
  objc_msgSend(a3, "setSelected:animated:", 0, 1);
}

- (void)_buttonOverlayWasTouchedDown:(id)a3
{
  objc_msgSend(a3, "setSelected:", 1);
}

- (void)_buttonOverlayTouchWasCanceled:(id)a3
{
  objc_msgSend(a3, "setSelected:", 0);
}

- (BOOL)_isIndicatingActivity
{
  return 0;
}

- (BOOL)_shouldHideButtonOverlay
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;

  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CRKCardSectionViewController cardSection](self, "cardSection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionCommands");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v7 = v6 == 0;
  }
  else
  {
    v7 = 1;
  }

  -[CRKCardSectionViewController _extraCommands](self, "_extraCommands");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return !v9 && v7;
}

- (id)_backingCardSection
{
  void *v3;
  void *v4;
  id v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CRCardSection backingCardSection](self->_cardSection, "backingCardSection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (-[CRKCardSectionViewController _checkIfCardSectionIsNull:](self, "_checkIfCardSectionIsNull:", v3))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (BOOL)_checkIfCardSectionIsNull:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE850A8]), "initWithFacade:", v3);
      v4 = objc_msgSend(v5, "type") == 0;

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_generateCardSectionViewAppearanceFeedback
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE154B8]);
  -[CRKCardSectionViewController cardSection](self, "cardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCardSection:", v4);

  return v3;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRKCardSectionViewController;
  -[CRKCardSectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CRKCardSectionViewController _setupCardSectionButtons](self, "_setupCardSectionButtons");
}

- (void)_setViewExternally:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_255046AC8))
  {
    -[CRKCardSectionViewController setView:](self, "setView:", v4);
    -[CRKCardSectionViewController _setupCardSectionButtons](self, "_setupCardSectionButtons");
  }

}

- (void)_setupCardSectionButtons
{
  CRKOverlayButton *v3;
  CRKOverlayButton *overlayButton;
  CRKOverlayButton *v5;
  void *v6;
  CRKOverlayButton *v7;
  CRKOverlayButton *v8;

  if (-[CRKCardSectionViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (-[CRKCardSectionViewController _shouldRenderButtonOverlay](self, "_shouldRenderButtonOverlay"))
    {
      v3 = objc_alloc_init(CRKOverlayButton);
      overlayButton = self->_overlayButton;
      self->_overlayButton = v3;

      v5 = self->_overlayButton;
      -[CRKCardSectionViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      -[CRKOverlayButton setFrame:](v5, "setFrame:");

      -[CRKOverlayButton addTarget:action:forControlEvents:](self->_overlayButton, "addTarget:action:forControlEvents:", self, sel__buttonOverlayWasTouchedUpInside_, 64);
      -[CRKOverlayButton addTarget:action:forControlEvents:](self->_overlayButton, "addTarget:action:forControlEvents:", self, sel__buttonOverlayWasTouchedUpOutside_, 128);
      -[CRKOverlayButton addTarget:action:forControlEvents:](self->_overlayButton, "addTarget:action:forControlEvents:", self, sel__buttonOverlayWasTouchedDown_, 1);
      -[CRKOverlayButton addTarget:action:forControlEvents:](self->_overlayButton, "addTarget:action:forControlEvents:", self, sel__buttonOverlayTouchWasCanceled_, 256);
      -[CRKOverlayButton setHidden:](self->_overlayButton, "setHidden:", -[CRKCardSectionViewController _shouldHideButtonOverlay](self, "_shouldHideButtonOverlay"));
      -[CRKCardSectionViewController view](self, "view");
      v8 = (CRKOverlayButton *)objc_claimAutoreleasedReturnValue();
      -[CRKOverlayButton addSubview:](v8, "addSubview:", self->_overlayButton);
      v7 = v8;
    }
    else
    {
      -[CRKOverlayButton removeFromSuperview](self->_overlayButton, "removeFromSuperview");
      v7 = self->_overlayButton;
      self->_overlayButton = 0;
    }

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id WeakRetained;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22.receiver = self;
  v22.super_class = (Class)CRKCardSectionViewController;
  -[CRKCardSectionViewController viewDidLayoutSubviews](&v22, sel_viewDidLayoutSubviews);
  -[CRKCardSectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CRKOverlayButton frame](self->_overlayButton, "frame");
  v25.origin.x = v12;
  v25.origin.y = v13;
  v25.size.width = v14;
  v25.size.height = v15;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  if (!CGRectEqualToRect(v23, v25))
    -[CRKOverlayButton setFrame:](self->_overlayButton, "setFrame:", v5, v7, v9, v11);
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewConfiguration);
  objc_msgSend(WeakRetained, "_debugOverlayView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "frame");
    v26.origin.x = v18;
    v26.origin.y = v19;
    v26.size.width = v20;
    v26.size.height = v21;
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    if (!CGRectEqualToRect(v24, v26))
      objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);
  }

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
  v9.super_class = (Class)CRKCardSectionViewController;
  -[CRKCardSectionViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewController cardSection](self, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewController _generateCardSectionViewAppearanceFeedback](self, "_generateCardSectionViewAppearanceFeedback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSectionViewWillAppearForCardSection:withAppearanceFeedback:", v7, v8);

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
  v9.super_class = (Class)CRKCardSectionViewController;
  -[CRKCardSectionViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewController cardSection](self, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewController _generateCardSectionViewAppearanceFeedback](self, "_generateCardSectionViewAppearanceFeedback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSectionViewDidAppearForCardSection:withAppearanceFeedback:", v7, v8);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRKCardSectionViewController;
  -[CRKCardSectionViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x24BE154C0]);
    -[CRKCardSectionViewController cardSection](self, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCardSection:", v7);

    -[CRKCardSectionViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewController cardSection](self, "cardSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSectionViewDidDisappearForCardSection:withDisappearanceFeedback:", v9, v6);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didEngageCardSection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BE15518];
    objc_msgSend(v16, "cardSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardSectionWithSFCardSection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSectionView:willProcessEngagementFeedback:", v9, v16);

  }
  -[CRKCardSectionViewController _performAllCommands](self, "_performAllCommands");
  -[CRKCardSectionViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BE15518];
    objc_msgSend(v16, "cardSection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cardSectionWithSFCardSection:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userDidEngageCardSection:withEngagementFeedback:", v15, v16);

  }
}

- (void)didPerformCommand:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commandWasPerformed:", v7);

  }
}

- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4
{
  void *v5;
  char v6;
  id v7;

  -[CRKCardSectionViewController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardSectionViewControllerBoundsDidChange:", self);

  }
}

- (void)cardSectionViewDidInvalidateSize:(id)a3
{
  -[CRKCardSectionViewController cardSectionViewDidInvalidateSize:animate:](self, "cardSectionViewDidInvalidateSize:animate:", a3, 0);
}

- (void)presentViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:forCardSectionViewController:", v7, self);

  }
}

- (void)willDismissViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSectionViewController:willDismissViewController:", self, v7);

  }
}

- (void)cardSectionViewDidSelectPreferredPunchoutIndex:(int64_t)a3
{
  void *v5;
  char v6;
  id v7;

  -[CRKCardSectionViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardSectionViewController:didSelectPreferredPunchoutIndex:", self, a3);

  }
}

- (BOOL)performCommand:(id)a3 forViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  _BOOL4 v12;
  BOOL v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canPerformCommand:forCardSectionViewController:", v5, self);

    if (!v8)
    {
      v9 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
      {
        v15 = 138412290;
        v16 = v5;
LABEL_11:
        _os_log_impl(&dword_218FCB000, v9, OS_LOG_TYPE_INFO, "Unable to perform %@ command", (uint8_t *)&v15, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {

  }
  -[CRKCardSectionViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "performCommand:forCardSectionViewController:", v5, self);

  v9 = *MEMORY[0x24BE15490];
  v12 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v12)
    {
      v15 = 138412290;
      v16 = v5;
      goto LABEL_11;
    }
LABEL_12:
    v13 = 0;
    goto LABEL_14;
  }
  if (v12)
  {
    v15 = 138412290;
    v16 = v5;
    v13 = 1;
    _os_log_impl(&dword_218FCB000, v9, OS_LOG_TYPE_INFO, "Performed %@ command", (uint8_t *)&v15, 0xCu);
  }
  else
  {
    v13 = 1;
  }
LABEL_14:

  return v13;
}

- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "backingFeedback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewController didEngageCardSection:](self, "didEngageCardSection:", v5);

  }
  else
  {
    -[CRKCardSectionViewController _performAllCommands](self, "_performAllCommands");
  }

}

- (void)commandWasPerformed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "backingFeedback");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKCardSectionViewController didPerformCommand:](self, "didPerformCommand:", v5);

  }
  else
  {
    v6 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
      -[CRKCardSectionViewController commandWasPerformed:].cold.1(v6);
  }

}

- (BOOL)shouldHandleEngagement:(id)a3 forCardSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldHandleEngagement:forCardSection:", v6, v7);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)cardViewWillAppearForCard:(id)a3 withAppearanceFeedback:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardViewWillAppearForCard:withAppearanceFeedback:", v10, v6);

  }
}

- (void)cardViewDidAppearForCard:(id)a3 withAppearanceFeedback:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardViewDidAppearForCard:withAppearanceFeedback:", v10, v6);

  }
}

- (void)cardViewDidDisappearForCard:(id)a3 withDisappearanceFeedback:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardViewDidDisappearForCard:withDisappearanceFeedback:", v10, v6);

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
  -[CRKCardSectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
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
  -[CRKCardSectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
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
  -[CRKCardSectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionViewDidDisappearForCardSection:withDisappearanceFeedback:", v10, v6);

  }
}

- (void)controllerForCard:(id)a3 didRequestAsyncCard:(id)a4 withAsyncCardRequestFeedback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "controllerForCard:didRequestAsyncCard:withAsyncCardRequestFeedback:", v13, v8, v9);

  }
}

- (void)controllerForCard:(id)a3 didReceiveAsyncCard:(id)a4 withAsyncCardReceiptFeedback:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "controllerForCard:didReceiveAsyncCard:withAsyncCardReceiptFeedback:", v13, v8, v9);

  }
}

- (void)cardSectionViewDidInvalidateSizeForCardSection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CRKCardSectionViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSectionViewDidInvalidateSizeForCardSection:", v10);

  }
  -[CRKCardSectionViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CRKCardSectionViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionViewControllerBoundsDidChange:", self);

  }
}

- (CRKCardSectionViewControllerDelegate)delegate
{
  return (CRKCardSectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (NSArray)_extraCommands
{
  return self->_extraCommands;
}

- (INUIRemoteViewController)_remoteViewController
{
  return self->__remoteViewController;
}

- (CRKCardSectionViewConfiguration)viewConfiguration
{
  return (CRKCardSectionViewConfiguration *)objc_loadWeakRetained((id *)&self->_viewConfiguration);
}

- (void)setViewConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_viewConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewConfiguration);
  objc_storeStrong((id *)&self->__remoteViewController, 0);
  objc_storeStrong((id *)&self->_extraCommands, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overlayButton, 0);
}

- (void)commandWasPerformed:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218FCB000, log, OS_LOG_TYPE_ERROR, "SFCommandEngagementFeedback is missing", v1, 2u);
}

@end
