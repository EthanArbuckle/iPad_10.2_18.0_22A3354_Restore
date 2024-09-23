@implementation CNActionMenuHelper

- (void)updateWithMenuItems:(id)a3 contextMenuInteraction:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "count"))
  {
    -[CNActionMenuHelper deferredMenuItem](self, "deferredMenuItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CNActionMenuHelper replaceDeferredMenuItemWithMenuItems:](self, "replaceDeferredMenuItemWithMenuItems:", v10);
    }
    else
    {
      v8 = -[CNActionMenuHelper isMenuDisplayed](self, "isMenuDisplayed");
      v9 = v10;
      if (!v8)
      {
LABEL_7:
        -[CNActionMenuHelper setCurrentMenuItems:](self, "setCurrentMenuItems:", v9);
        goto LABEL_8;
      }
      -[CNActionMenuHelper updateVisibleMenuWithMenuItems:contextMenuInteraction:](self, "updateVisibleMenuWithMenuItems:contextMenuInteraction:", v10, v6);
    }
    v9 = v10;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)setCurrentMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_currentMenuItems, a3);
}

- (BOOL)isMenuDisplayed
{
  return self->_isMenuDisplayed;
}

- (UIDeferredMenuElement)deferredMenuItem
{
  return self->_deferredMenuItem;
}

- (id)menuProviderWithActionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__CNActionMenuHelper_menuProviderWithActionBlock___block_invoke;
  v8[3] = &unk_1E2050388;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

- (void)setMenuTitle:(id)a3
{
  objc_storeStrong((id *)&self->_menuTitle, a3);
}

- (id)configurationActionProviderWithActionBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__CNActionMenuHelper_configurationActionProviderWithActionBlock___block_invoke;
  v8[3] = &unk_1E2050360;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

- (id)menuForProviders
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[CNActionMenuHelper currentMenuItems](self, "currentMenuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionMenuHelper setDisplayedMenuItems:](self, "setDisplayedMenuItems:", v3);

  -[CNActionMenuHelper displayedMenuItems](self, "displayedMenuItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    -[CNActionMenuHelper setupDeferredMenuItem](self, "setupDeferredMenuItem");
    -[CNActionMenuHelper deferredMenuItem](self, "deferredMenuItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionMenuHelper setDisplayedMenuItems:](self, "setDisplayedMenuItems:", v7);

  }
  v8 = (void *)MEMORY[0x1E0DC39D0];
  -[CNActionMenuHelper menuTitle](self, "menuTitle");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E20507A8;
  -[CNActionMenuHelper displayedMenuItems](self, "displayedMenuItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuWithTitle:children:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)targetedPreviewForSourceView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v3, v4);
  return v6;
}

- (void)updateVisibleMenuWithMenuItems:(id)a3 contextMenuInteraction:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  _QWORD v12[3];
  char v13;

  v6 = a3;
  v7 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__CNActionMenuHelper_updateVisibleMenuWithMenuItems_contextMenuInteraction___block_invoke;
  v9[3] = &unk_1E20503B0;
  v11 = v12;
  v9[4] = self;
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "updateVisibleMenuWithBlock:", v9);

  _Block_object_dispose(v12, 8);
}

- (void)setupDeferredMenuItem
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__CNActionMenuHelper_setupDeferredMenuItem__block_invoke;
  v4[3] = &unk_1E20503D8;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC36F8], "elementWithProvider:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionMenuHelper setDeferredMenuItem:](self, "setDeferredMenuItem:", v3);

}

- (void)replaceDeferredMenuItemWithMenuItems:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[CNActionMenuHelper deferredMenuElementCompletionBlock](self, "deferredMenuElementCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNActionMenuHelper setDisplayedMenuItems:](self, "setDisplayedMenuItems:", v7);
    -[CNActionMenuHelper deferredMenuElementCompletionBlock](self, "deferredMenuElementCompletionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[CNActionMenuHelper displayedMenuItems](self, "displayedMenuItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

    -[CNActionMenuHelper setDeferredMenuItem:](self, "setDeferredMenuItem:", 0);
    -[CNActionMenuHelper setDeferredMenuElementCompletionBlock:](self, "setDeferredMenuElementCompletionBlock:", 0);
  }

}

- (void)willDisplayMenuWithContextMenuInteraction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[CNActionMenuHelper setIsMenuDisplayed:](self, "setIsMenuDisplayed:", 1);
  -[CNActionMenuHelper deferredMenuItem](self, "deferredMenuItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CNActionMenuHelper displayedMenuItems](self, "displayedMenuItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNActionMenuHelper currentMenuItems](self, "currentMenuItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      objc_msgSend(MEMORY[0x1E0D13B68], "mainThreadScheduler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __64__CNActionMenuHelper_willDisplayMenuWithContextMenuInteraction___block_invoke;
      v10[3] = &unk_1E2050400;
      v10[4] = self;
      v11 = v4;
      v9 = (id)objc_msgSend(v8, "afterDelay:performBlock:", v10, 0.1);

    }
  }

}

- (void)willDismissMenu
{
  -[CNActionMenuHelper setDisplayedMenuItems:](self, "setDisplayedMenuItems:", 0);
  -[CNActionMenuHelper setCurrentMenuItems:](self, "setCurrentMenuItems:", 0);
  -[CNActionMenuHelper setIsMenuDisplayed:](self, "setIsMenuDisplayed:", 0);
  -[CNActionMenuHelper setDeferredMenuItem:](self, "setDeferredMenuItem:", 0);
  -[CNActionMenuHelper setDeferredMenuElementCompletionBlock:](self, "setDeferredMenuElementCompletionBlock:", 0);
}

- (NSString)menuTitle
{
  return self->_menuTitle;
}

- (NSArray)currentMenuItems
{
  return self->_currentMenuItems;
}

- (NSArray)displayedMenuItems
{
  return self->_displayedMenuItems;
}

- (void)setDisplayedMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_displayedMenuItems, a3);
}

- (void)setIsMenuDisplayed:(BOOL)a3
{
  self->_isMenuDisplayed = a3;
}

- (void)setDeferredMenuItem:(id)a3
{
  objc_storeStrong((id *)&self->_deferredMenuItem, a3);
}

- (id)deferredMenuElementCompletionBlock
{
  return self->_deferredMenuElementCompletionBlock;
}

- (void)setDeferredMenuElementCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredMenuElementCompletionBlock, 0);
  objc_storeStrong((id *)&self->_deferredMenuItem, 0);
  objc_storeStrong((id *)&self->_displayedMenuItems, 0);
  objc_storeStrong((id *)&self->_currentMenuItems, 0);
  objc_storeStrong((id *)&self->_menuTitle, 0);
}

void __64__CNActionMenuHelper_willDisplayMenuWithContextMenuInteraction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "currentMenuItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateVisibleMenuWithMenuItems:contextMenuInteraction:", v3, *(_QWORD *)(a1 + 40));

}

void __43__CNActionMenuHelper_setupDeferredMenuItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displayedMenuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deferredMenuItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentMenuItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentMenuItems");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setDisplayedMenuItems:", v7);

      objc_msgSend(*(id *)(a1 + 32), "displayedMenuItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v8);

      objc_msgSend(*(id *)(a1 + 32), "setDeferredMenuItem:", 0);
      goto LABEL_6;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "setDeferredMenuElementCompletionBlock:", v9);
LABEL_6:

}

id __76__CNActionMenuHelper_updateVisibleMenuWithMenuItems_contextMenuInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    v6 = v3;
  }
  else
  {
    *(_BYTE *)(v5 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "setDisplayedMenuItems:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "displayedMenuItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "menuByReplacingChildren:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __50__CNActionMenuHelper_menuProviderWithActionBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "menuForProviders");
}

uint64_t __65__CNActionMenuHelper_configurationActionProviderWithActionBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "menuForProviders");
}

@end
