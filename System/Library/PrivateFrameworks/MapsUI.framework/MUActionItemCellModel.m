@implementation MUActionItemCellModel

- (MUActionItemCellModel)initWithActionItem:(id)a3
{
  id v5;
  MUActionItemCellModel *v6;
  MUActionItemCellModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUActionItemCellModel;
  v6 = -[MUActionItemCellModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionItem, a3);
    -[MUActionItemCellModel _registerObserver](v7, "_registerObserver");
  }

  return v7;
}

- (NSString)symbolName
{
  void *v2;
  void *v3;

  -[MUActionItemCellModel _resolvedActionItem](self, "_resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symbolForDisplayStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)titleString
{
  void *v2;
  void *v3;

  -[MUActionItemCellModel _resolvedActionItem](self, "_resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleForDisplayStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)accessibilityIdentifierForAction
{
  void *v2;
  void *v3;

  -[MKPlaceCardActionItem resolvedActionItem](self->_actionItem, "resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  MKPlaceCardActionTypeAsString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[MUActionItemCellModel _resolvedActionItem](self, "_resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enabled");

  return v3;
}

- (int64_t)actionStyle
{
  void *v2;
  unsigned int v3;

  -[MUActionItemCellModel _resolvedActionItem](self, "_resolvedActionItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDestructiveForDisplayStyle:", 0);

  return v3;
}

- (void)_registerObserver
{
  -[MKPlaceCardActionItem addObserver:forKeyPath:options:context:](self->_actionItem, "addObserver:forKeyPath:options:context:", self, CFSTR("enabled"), 1, 0);
  -[MKPlaceCardActionItem addObserver:forKeyPath:options:context:](self->_actionItem, "addObserver:forKeyPath:options:context:", self, CFSTR("selected"), 1, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("enabled")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("selected")))
  {
    -[MUActionItemCellModel changeDelegate](self, "changeDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dynamicButtonCellModelDidChange:", self);

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MUActionItemCellModel;
    -[MUActionItemCellModel observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (id)_resolvedActionItem
{
  return (id)-[MKPlaceCardActionItem resolvedActionItem](self->_actionItem, "resolvedActionItem");
}

- (void)dealloc
{
  objc_super v3;

  -[MKPlaceCardActionItem removeObserver:forKeyPath:](self->_actionItem, "removeObserver:forKeyPath:", self, CFSTR("enabled"));
  -[MKPlaceCardActionItem removeObserver:forKeyPath:](self->_actionItem, "removeObserver:forKeyPath:", self, CFSTR("selected"));
  v3.receiver = self;
  v3.super_class = (Class)MUActionItemCellModel;
  -[MUActionItemCellModel dealloc](&v3, sel_dealloc);
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MUDynamicButtonCellModelChangeDelegate)changeDelegate
{
  return (MUDynamicButtonCellModelChangeDelegate *)objc_loadWeakRetained((id *)&self->_changeDelegate);
}

- (void)setChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_changeDelegate, a3);
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_destroyWeak((id *)&self->_changeDelegate);
  objc_storeStrong(&self->_actionBlock, 0);
  objc_storeStrong((id *)&self->_actionItem, 0);
}

@end
