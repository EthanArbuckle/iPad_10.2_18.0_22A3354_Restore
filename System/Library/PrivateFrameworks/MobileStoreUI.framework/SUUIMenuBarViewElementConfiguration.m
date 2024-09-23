@implementation SUUIMenuBarViewElementConfiguration

- (id)_initWithMenuBarDocument:(id)a3
{
  id v5;
  SUUIMenuBarViewElementConfiguration *v6;
  SUUIMenuBarViewElementConfiguration *v7;
  uint64_t v8;
  SUUIMenuItemViewElement *selectedMenuItemViewElement;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMenuBarViewElementConfiguration;
  v6 = -[SUUIMenuBarViewElementConfiguration init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_menuBarDocument, a3);
    -[IKAppMenuBarDocument setDelegate:](v7->_menuBarDocument, "setDelegate:", v7);
    -[IKAppMenuBarDocument selectedMenuItem](v7->_menuBarDocument, "selectedMenuItem");
    v8 = objc_claimAutoreleasedReturnValue();
    selectedMenuItemViewElement = v7->_selectedMenuItemViewElement;
    v7->_selectedMenuItemViewElement = (SUUIMenuItemViewElement *)v8;

    v7->_needsReload = 1;
  }

  return v7;
}

- (void)menuBarDocument:(id)a3 didReplaceDocumentForEntityWithUniqueIdentifier:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  -[SUUIMenuBarViewElementConfiguration delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "menuBarViewElementConfiguration:didReplaceDocumentForEntityUniqueIdentifier:", self, v6);

}

- (void)menuBarDocument:(id)a3 didReplaceDocumentForMenuItem:(id)a4
{
  id v5;
  NSUInteger v6;
  id v7;

  v5 = a4;
  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  v6 = -[NSArray indexOfObject:](self->_menuItemViewElements, "indexOfObject:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SUUIMenuBarViewElementConfiguration delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "menuBarViewElementConfiguration:didReplaceDocumentForMenuItemAtIndex:", self, v6);

  }
}

- (void)menuBarDocument:(id)a3 didSelectMenuItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a4;
  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  if (-[NSArray containsObject:](self->_menuItemViewElements, "containsObject:", v9))
  {
    objc_storeStrong((id *)&self->_selectedMenuItemViewElement, a4);
    -[SUUIMenuBarViewElementConfiguration delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "menuBarViewElementConfiguration:selectMenuItemViewElement:animated:", self, self->_selectedMenuItemViewElement, v5);

  }
}

- (int64_t)menuBarStyle
{
  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  return self->_menuBarStyle;
}

- (unint64_t)numberOfMenuItems
{
  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  if (self->_menuBarStyle)
    return -[NSArray count](self->_menuItemViewElements, "count");
  else
    return 0;
}

- (SUUIMenuItemViewElement)selectedMenuItemViewElement
{
  SUUIMenuItemViewElement *selectedMenuItemViewElement;
  SUUIMenuItemViewElement *v4;

  if (self->_selectedMenuItemViewElement)
  {
    -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
    if (-[NSArray containsObject:](self->_menuItemViewElements, "containsObject:", self->_selectedMenuItemViewElement))
      selectedMenuItemViewElement = self->_selectedMenuItemViewElement;
    else
      selectedMenuItemViewElement = 0;
    v4 = selectedMenuItemViewElement;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)documentForEntityUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  -[IKAppMenuBarDocument documentForEntityUniqueIdentifier:](self->_menuBarDocument, "documentForEntityUniqueIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)documentForMenuItemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  -[NSArray objectAtIndex:](self->_menuItemViewElements, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppMenuBarDocument documentForMenuItem:](self->_menuBarDocument, "documentForMenuItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)documentOptionsForEntityUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  -[IKAppMenuBarDocument documentOptionsForEntityUniqueIdentifier:](self->_menuBarDocument, "documentOptionsForEntityUniqueIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)documentOptionsForMenuItemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  -[NSArray objectAtIndex:](self->_menuItemViewElements, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppMenuBarDocument documentOptionsForMenuItem:](self->_menuBarDocument, "documentOptionsForMenuItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)indexOfMenuItemViewElement:(id)a3
{
  id v4;
  NSArray *menuItemViewElements;
  unint64_t v6;

  v4 = a3;
  if (v4
    && (-[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded"),
        (menuItemViewElements = self->_menuItemViewElements) != 0))
  {
    v6 = -[NSArray indexOfObject:](menuItemViewElements, "indexOfObject:", v4);
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)contentWillAppearForMenuItemAtIndex:(unint64_t)a3 withEntityValueProvider:(id)a4 clientContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  IKAppMenuBarDocument *menuBarDocument;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[SUUIMenuBarViewElementConfiguration _ensureDataLoaded](self, "_ensureDataLoaded");
  -[NSArray objectAtIndex:](self->_menuItemViewElements, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  menuBarDocument = self->_menuBarDocument;
  if (v8)
  {
    objc_msgSend(v8, "entityUniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKAppMenuBarDocument documentForEntityUniqueIdentifier:](menuBarDocument, "documentForEntityUniqueIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = objc_alloc(MEMORY[0x24BE519B0]);
      objc_msgSend(v9, "_scriptAppContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithAppContext:", v15);

      if (v16)
      {
        objc_msgSend(v16, "setEntityValueProvider:", v8);
        v18 = CFSTR("entityValueProvider");
        v19[0] = v16;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }

      goto LABEL_9;
    }
  }
  else
  {
    -[IKAppMenuBarDocument documentForMenuItem:](menuBarDocument, "documentForMenuItem:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v17 = 0;
LABEL_9:
      objc_msgSend(v10, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 17, 1, 0, v17, 0);

      v13 = 0;
    }
  }

}

- (void)_ensureDataLoaded
{
  id WeakRetained;

  if (self->_needsReload)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_reloadDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "_menuBarViewElementConfigurationRequestsReload:", self);
      self->_needsReload = 0;
    }

  }
}

- (void)_reloadWithMenuBarStyle:(int64_t)a3 menuItemViewElements:(id)a4 scrollEnabled:(BOOL)a5
{
  NSArray *v7;
  NSArray *menuItemViewElements;

  self->_menuBarStyle = a3;
  v7 = (NSArray *)objc_msgSend(a4, "copy");
  menuItemViewElements = self->_menuItemViewElements;
  self->_menuItemViewElements = v7;

  self->_scrollEnabled = a5;
}

- (SUUIMenuBarViewElementConfigurationDelegate)delegate
{
  return (SUUIMenuBarViewElementConfigurationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (BOOL)_needsReload
{
  return self->_needsReload;
}

- (void)_setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (_SUUIMenuBarViewElementConfigurationReloadDelegate)_reloadDelegate
{
  return (_SUUIMenuBarViewElementConfigurationReloadDelegate *)objc_loadWeakRetained((id *)&self->_reloadDelegate);
}

- (void)_setReloadDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reloadDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reloadDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedMenuItemViewElement, 0);
  objc_storeStrong((id *)&self->_menuItemViewElements, 0);
  objc_storeStrong((id *)&self->_menuBarDocument, 0);
}

@end
