@implementation TabBarItem

- (int64_t)dragState
{
  return self->_dragState;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;

  if (self->_title != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    title = self->_title;
    self->_title = v4;

    -[TabBarItemLayoutInfo itemDidUpdateTitle](self->_layoutInfo, "itemDidUpdateTitle");
  }
}

- (void)setTabBar:(id)a3
{
  id WeakRetained;
  void *v5;
  TabBarItemLayoutInfo *v6;
  TabBarItemLayoutInfo *layoutInfo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tabBar, obj);
    if (obj)
    {
      v6 = -[TabBarItemLayoutInfo initWithTabBar:item:]([TabBarItemLayoutInfo alloc], "initWithTabBar:item:", obj, self);
      layoutInfo = self->_layoutInfo;
      self->_layoutInfo = v6;
    }
    else
    {
      layoutInfo = self->_layoutInfo;
      self->_layoutInfo = 0;
    }

    v5 = obj;
  }

}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (BOOL)isActive
{
  return self->_active;
}

- (TabBarItemLayoutInfo)layoutInfo
{
  return self->_layoutInfo;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (TabBarItem)init
{
  TabBarItem *v2;
  TabBarItem *v3;
  NSArray *shareParticipants;
  TabBarItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TabBarItem;
  v2 = -[TabBarItem init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    shareParticipants = v2->_shareParticipants;
    v2->_shareParticipants = (NSArray *)MEMORY[0x1E0C9AA60];

    v5 = v3;
  }

  return v3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[TabBarItemLayoutInfo itemDidUpdateIsActive](self->_layoutInfo, "itemDidUpdateIsActive");
  }
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (void)setIcon:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    -[TabBarItemLayoutInfo itemDidUpdateIcon](self->_layoutInfo, "itemDidUpdateIcon");
  }

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

- (void)setIsPlaceholder:(BOOL)a3
{
  if (self->_isPlaceholder != a3)
  {
    self->_isPlaceholder = a3;
    -[TabBarItemLayoutInfo itemDidUpdateIsPlaceholder](self->_layoutInfo, "itemDidUpdateIsPlaceholder");
  }
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    -[TabBarItemLayoutInfo itemDidUpdateMediaState](self->_layoutInfo, "itemDidUpdateMediaState");
  }
}

- (void)setPinned:(BOOL)a3
{
  if (self->_pinned != a3)
  {
    self->_pinned = a3;
    -[TabBarItemLayoutInfo itemDidUpdateIsPinned](self->_layoutInfo, "itemDidUpdateIsPinned");
  }
}

- (void)updateEntityAnnotation
{
  id v3;

  -[TabBarItemLayoutInfo tabBarItemView](self->_layoutInfo, "tabBarItemView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateEntityAnnotationWithUUID:", self->_UUID);

}

- (id)menuElementRepresentationWithSelectionHandler:(id)a3
{
  id v4;
  void *v5;
  NSString *title;
  UIImage *icon;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3428];
  title = self->_title;
  icon = self->_icon;
  v8 = icon;
  if (!icon)
  {
    objc_msgSend(MEMORY[0x1E0D4EF58], "fallbackFavicon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__TabBarItem_menuElementRepresentationWithSelectionHandler___block_invoke;
  v12[3] = &unk_1E9CF7758;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", title, v8, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!icon)
  return v10;
}

uint64_t __60__TabBarItem_menuElementRepresentationWithSelectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    self->_unread = a3;
    -[TabBarItemLayoutInfo itemDidUpdateIsUnread](self->_layoutInfo, "itemDidUpdateIsUnread");
  }
}

- (void)setShareParticipants:(id)a3
{
  NSArray *v4;
  NSArray *shareParticipants;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_shareParticipants, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v4;

    -[TabBarItemLayoutInfo itemDidUpdateShareParticipants](self->_layoutInfo, "itemDidUpdateShareParticipants");
  }

}

- (void)setDragState:(int64_t)a3
{
  self->_dragState = a3;
}

- (TabBar)tabBar
{
  return (TabBar *)objc_loadWeakRetained((id *)&self->_tabBar);
}

- (void)setLayoutInfo:(id)a3
{
  objc_storeStrong((id *)&self->_layoutInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
