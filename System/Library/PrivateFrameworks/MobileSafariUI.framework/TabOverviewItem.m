@implementation TabOverviewItem

- (uint64_t)setIsAlternateItem:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 13) = a2;
  return result;
}

- (uint64_t)setIncoming:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 12) = a2;
  return result;
}

- (uint64_t)setClosing:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 11) = a2;
  return result;
}

- (id)layoutInfo
{
  if (a1)
    a1 = (id *)a1[9];
  return a1;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (int64_t)dragState
{
  return self->_dragState;
}

- (NSString)title
{
  return self->_title;
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

- (BOOL)isRecording
{
  return self->_mediaStateIcon != 0;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *title;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_title != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      title = self->_title;
      self->_title = v7;

      -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
      v5 = v9;
    }
  }

}

- (BOOL)isAlternateItem
{
  if (result)
    return *(_BYTE *)(result + 13) != 0;
  return result;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setIcon:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
  }

}

- (void)setPinned:(BOOL)a3
{
  if (self->_pinned != a3)
  {
    self->_pinned = a3;
    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
  }
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
  }
}

- (TabOverviewItem)initWithUUID:(id)a3
{
  id v5;
  TabOverviewItem *v6;
  TabOverviewItem *v7;
  NSArray *shareParticipants;
  TabOverviewItem *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TabOverviewItem;
  v6 = -[TabOverviewItem init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    shareParticipants = v7->_shareParticipants;
    v7->_shareParticipants = (NSArray *)MEMORY[0x1E0C9AA60];

    v9 = v7;
  }

  return v7;
}

- (void)setTabOverview:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  id *v5;
  void *v6;
  id obj;

  v3 = a2;
  if (a1)
  {
    obj = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));

    v3 = obj;
    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 80), obj);
      if (obj)
      {
        v5 = -[TabOverviewItemLayoutInfo initWithTabOverview:item:]((id *)[TabOverviewItemLayoutInfo alloc], obj, (void *)a1);
        v6 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v5;
      }
      else
      {
        v6 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = 0;
      }

      v3 = obj;
    }
  }

}

- (BOOL)closing
{
  if (result)
    return *(_BYTE *)(result + 11) != 0;
  return result;
}

+ (id)placeholderItem
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUUID:", v3);

  objc_msgSend(v4, "setIsPlaceholder:", 1);
  return v4;
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    self->_unread = a3;
    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
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

    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
  }

}

- (_SFBarTheme)cachedTopBarTheme
{
  return self->_cachedTopBarTheme;
}

- (void)setCachedTopBarTheme:(id)a3
{
  objc_storeStrong((id *)&self->_cachedTopBarTheme, a3);
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (void)setDragState:(int64_t)a3
{
  self->_dragState = a3;
}

- (BOOL)incoming
{
  if (result)
    return *(_BYTE *)(result + 12) != 0;
  return result;
}

- (id)tabOverview
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropPreviewLayoutInfo, 0);
  objc_destroyWeak((id *)&self->_tabOverview);
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cachedTopBarTheme, 0);
}

@end
