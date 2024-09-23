@implementation MUPlaceActionRowItemViewModel

- (MUPlaceActionRowItemViewModel)initWithActionRowItem:(id)a3 menuProvider:(id)a4 style:(unint64_t)a5
{
  id v9;
  id v10;
  MUPlaceActionRowItemViewModel *v11;
  MUPlaceActionRowItemViewModel *v12;
  id *p_actionRowItem;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceActionRowItemViewModel;
  v11 = -[MUActionRowItemViewModel init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    p_actionRowItem = (id *)&v11->_actionRowItem;
    objc_storeStrong((id *)&v11->_actionRowItem, a3);
    objc_storeWeak((id *)&v12->_menuProvider, v10);
    v12->_style = a5;
    objc_msgSend(*p_actionRowItem, "addObserver:forKeyPath:options:context:", v12, CFSTR("enabled"), 1, 0);
    objc_msgSend(*p_actionRowItem, "addObserver:forKeyPath:options:context:", v12, CFSTR("selected"), 1, 0);
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[MKPlaceCardActionItem removeObserver:forKeyPath:](self->_actionRowItem, "removeObserver:forKeyPath:", self, CFSTR("enabled"));
  -[MKPlaceCardActionItem removeObserver:forKeyPath:](self->_actionRowItem, "removeObserver:forKeyPath:", self, CFSTR("selected"));
  v3.receiver = self;
  v3.super_class = (Class)MUPlaceActionRowItemViewModel;
  -[MUPlaceActionRowItemViewModel dealloc](&v3, sel_dealloc);
}

- (id)titleText
{
  void *v2;
  void *v3;

  -[MKPlaceCardActionItem resolvedActionItem](self->_actionRowItem, "resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)symbolName
{
  void *v2;
  void *v3;

  -[MKPlaceCardActionItem resolvedActionItem](self->_actionRowItem, "resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "glyph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[MKPlaceCardActionItem resolvedActionItem](self->_actionRowItem, "resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabled");

  return v3;
}

- (BOOL)isSelected
{
  void *v2;
  char v3;

  -[MKPlaceCardActionItem resolvedActionItem](self->_actionRowItem, "resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selected");

  return v3;
}

- (void)setMenuProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_menuProvider, obj);
    -[MUActionRowItemViewModel _notifyObservers](self, "_notifyObservers");
    v5 = obj;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("enabled")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("selected")))
  {
    -[MUActionRowItemViewModel _notifyObservers](self, "_notifyObservers");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MUPlaceActionRowItemViewModel;
    -[MUPlaceActionRowItemViewModel observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (id)buildMenuWithPresentationOptions:(id)a3
{
  MUPlaceCardActionsRowViewMenuProvider **p_menuProvider;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  p_menuProvider = &self->_menuProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_menuProvider);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_menuProvider);
    objc_msgSend(v7, "menuForActionItem:", self->_actionRowItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[MKPlaceCardActionItem resolvedActionItem](self->_actionRowItem, "resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  MKPlaceCardActionTypeAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("ActionRowItemType"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)preferredTintColor
{
  void *v2;
  void *v3;

  -[MKPlaceCardActionItem resolvedActionItem](self->_actionRowItem, "resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "glyphColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)preferredBackgroundColor
{
  void *v2;
  void *v3;

  -[MKPlaceCardActionItem resolvedActionItem](self->_actionRowItem, "resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)analyticsButtonValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D27458];
  -[MUPlaceActionRowItemViewModel actionRowItem](self, "actionRowItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedActionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleButtonForType:", MURevealedButtonModuleTypeForActionType(objc_msgSend(v4, "type")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MKPlaceCardActionItem)actionRowItem
{
  return self->_actionRowItem;
}

- (MUPlaceCardActionsRowViewMenuProvider)menuProvider
{
  return (MUPlaceCardActionsRowViewMenuProvider *)objc_loadWeakRetained((id *)&self->_menuProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_storeStrong((id *)&self->_actionRowItem, 0);
}

@end
