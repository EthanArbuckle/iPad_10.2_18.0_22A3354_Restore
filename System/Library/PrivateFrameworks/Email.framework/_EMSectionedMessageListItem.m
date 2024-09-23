@implementation _EMSectionedMessageListItem

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_48 != -1)
    dispatch_once(&cachedSelf_onceToken_48, &__block_literal_global_49);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_46);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_47, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_46);
  return v3;
}

- (_EMSectionedMessageListItem)initWithMessageListItem:(id)a3 sectionID:(id)a4
{
  id v7;
  id v8;
  _EMSectionedMessageListItem *v9;
  _EMSectionedMessageListItem *v10;
  _EMSectionedMessageListItem *v11;
  _EMSectionedMessageListItem *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EMSectionedMessageListItem;
  v9 = -[_EMSectionedMessageListItem init](&v14, sel_init);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionID, a4);
    objc_storeStrong((id *)&v10->_underlyingItem, a3);
  }
  -[_EMSectionedMessageListItem cachedSelf](v11, "cachedSelf");
  v12 = (_EMSectionedMessageListItem *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)changeFrom:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMSectionedMessageListObjectConverter.m"), 310, CFSTR("Not supported"));

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  _EMSectionedMessageListItem *v4;
  _EMSectionedMessageListItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (_EMSectionedMessageListItem *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if ((-[_EMSectionedMessageListItem isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[_EMSectionedMessageListItem sectionID](self, "sectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EMSectionedMessageListItem sectionID](v5, "sectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EMSectionedMessageListItem underlyingItem](v5, "underlyingItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_EMSectionedMessageListItem sectionID](self, "sectionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 33 * v4 + objc_msgSend(v5, "hash") + 1089;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EMSectionedMessageListItem)initWithCoder:(id)a3
{
  id v3;
  _EMSectionedMessageListItem *v4;
  _EMSectionedMessageListItem *v5;
  id v8;

  v8 = a3;
  v3 = v8;
  v4 = self;
  EFDecodeCacheableInstance();
  v5 = (_EMSectionedMessageListItem *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  EFEncodeCacheableInstance();

}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  BOOL v6;
  objc_super v8;

  -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedMessageListItem;
    v6 = -[_EMSectionedMessageListItem respondsToSelector:](&v8, sel_respondsToSelector_, a3);
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  _EMSectionedMessageListItem *v4;
  _EMSectionedMessageListItem *v5;
  _EMSectionedMessageListItem *v6;

  -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
  v4 = (_EMSectionedMessageListItem *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = v4;
  else
    v5 = self;
  v6 = v5;

  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  void *v5;
  BOOL v6;
  objc_super v8;

  -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedMessageListItem;
    v6 = -[_EMSectionedMessageListItem isKindOfClass:](&v8, sel_isKindOfClass_, a3);
  }

  return v6;
}

- (EMObjectID)objectID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMSectionedMessageListItem sectionID](self, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSectionedMessageListObjectConverter objectIDForObjectID:inSection:](EMSectionedMessageListObjectConverter, "objectIDForObjectID:inSection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMObjectID *)v6;
}

- (EMCollectionItemID)itemID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMSectionedMessageListItem sectionID](self, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSectionedMessageListObjectConverter itemIDForItemID:inSection:](EMSectionedMessageListObjectConverter, "itemIDForItemID:inSection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMCollectionItemID *)v6;
}

- (EMCollectionItemID)displayMessageItemID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayMessageItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMSectionedMessageListItem sectionID](self, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSectionedMessageListObjectConverter itemIDForItemID:inSection:](EMSectionedMessageListObjectConverter, "itemIDForItemID:inSection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMCollectionItemID *)v6;
}

- (EMObjectID)displayMessageObjectID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayMessageObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMSectionedMessageListItem sectionID](self, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSectionedMessageListObjectConverter objectIDForObjectID:inSection:](EMSectionedMessageListObjectConverter, "objectIDForObjectID:inSection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (EMObjectID *)v6;
}

- (EFFuture)displayMessage
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[_EMSectionedMessageListItem underlyingItem](self, "underlyingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45___EMSectionedMessageListItem_displayMessage__block_invoke;
  v7[3] = &unk_1E70F60A8;
  v7[4] = self;
  objc_msgSend(v4, "then:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFFuture *)v5;
}

- (NSObject)sectionID
{
  return self->_sectionID;
}

- (EMMessageListItem)underlyingItem
{
  return self->_underlyingItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingItem, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
