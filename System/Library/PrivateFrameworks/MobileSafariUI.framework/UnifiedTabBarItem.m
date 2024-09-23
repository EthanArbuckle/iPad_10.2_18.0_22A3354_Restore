@implementation UnifiedTabBarItem

- (void)setTitle:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  v4 = a3;
  -[SFUnifiedTabBarItem setTitle:](&v5, sel_setTitle_, v4);
  -[UnifiedTabBarItem setTitle:](self->_secondaryItem, "setTitle:", v4, v5.receiver, v5.super_class);

}

- (void)setUUID:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  v4 = a3;
  -[SFUnifiedTabBarItem setUUID:](&v5, sel_setUUID_, v4);
  -[UnifiedTabBarItem setUUID:](self->_secondaryItem, "setUUID:", v4, v5.receiver, v5.super_class);

}

- (void)setIcon:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  v4 = a3;
  -[SFUnifiedTabBarItem setIcon:](&v5, sel_setIcon_, v4);
  -[UnifiedTabBarItem setIcon:](self->_secondaryItem, "setIcon:", v4, v5.receiver, v5.super_class);

}

+ (id)placeholderItem
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUUID:", v3);

  objc_msgSend(v2, "setIsPlaceholder:", 1);
  return v2;
}

- (BOOL)isDragging
{
  return self->_dragState == 1;
}

- (BOOL)isDropping
{
  return (self->_dragState & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)setDragState:(int64_t)a3
{
  self->_dragState = a3;
  -[UnifiedTabBarItem _updateHidden](self, "_updateHidden");
}

- (void)setIsPlaceholder:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  -[SFUnifiedBarItem setIsPlaceholder:](&v5, sel_setIsPlaceholder_);
  -[UnifiedTabBarItem _updateHidden](self, "_updateHidden");
  -[UnifiedTabBarItem setIsPlaceholder:](self->_secondaryItem, "setIsPlaceholder:", v3);
}

- (void)_updateHidden
{
  _BOOL8 v3;

  v3 = -[SFUnifiedBarItem isPlaceholder](self, "isPlaceholder") || -[UnifiedTabBarItem isDropping](self, "isDropping");
  -[SFUnifiedBarItem setHidden:](self, "setHidden:", v3);
}

- (id)secondaryItem
{
  UnifiedTabBarItem *secondaryItem;
  UnifiedTabBarItem *v4;
  UnifiedTabBarItem *v5;
  void *v6;
  void *v7;
  void *v8;

  secondaryItem = self->_secondaryItem;
  if (!secondaryItem)
  {
    v4 = objc_alloc_init(UnifiedTabBarItem);
    v5 = self->_secondaryItem;
    self->_secondaryItem = v4;

    -[SFUnifiedTabBarItem icon](self, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UnifiedTabBarItem setIcon:](self->_secondaryItem, "setIcon:", v6);

    -[SFUnifiedTabBarItem title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UnifiedTabBarItem setTitle:](self->_secondaryItem, "setTitle:", v7);

    -[UnifiedTabBarItem setMediaStateIcon:](self->_secondaryItem, "setMediaStateIcon:", -[SFUnifiedTabBarItem mediaStateIcon](self, "mediaStateIcon"));
    -[SFUnifiedTabBarItem UUID](self, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UnifiedTabBarItem setUUID:](self->_secondaryItem, "setUUID:", v8);

    -[UnifiedTabBarItem setPinned:](self->_secondaryItem, "setPinned:", -[SFUnifiedBarItem isPinned](self, "isPinned"));
    -[UnifiedTabBarItem setIsPlaceholder:](self->_secondaryItem, "setIsPlaceholder:", -[SFUnifiedBarItem isPlaceholder](self, "isPlaceholder"));
    secondaryItem = self->_secondaryItem;
  }
  return secondaryItem;
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  -[SFUnifiedTabBarItem setMediaStateIcon:](&v5, sel_setMediaStateIcon_);
  -[UnifiedTabBarItem setMediaStateIcon:](self->_secondaryItem, "setMediaStateIcon:", a3);
}

- (void)setPinned:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  -[SFUnifiedBarItem setPinned:](&v5, sel_setPinned_);
  -[UnifiedTabBarItem setPinned:](self->_secondaryItem, "setPinned:", v3);
}

- (int64_t)dragState
{
  return self->_dragState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryItem, 0);
}

@end
