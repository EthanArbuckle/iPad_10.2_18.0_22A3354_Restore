@implementation _EMSectionedMessageListItemID

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_3 != -1)
    dispatch_once(&cachedSelf_onceToken_3, &__block_literal_global_47);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_3);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_3, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_3);
  return v3;
}

- (_EMSectionedMessageListItemID)initWithItemID:(id)a3 sectionID:(id)a4
{
  id v7;
  id v8;
  _EMSectionedMessageListItemID *v9;
  _EMSectionedMessageListItemID *v10;
  _EMSectionedMessageListItemID *v11;
  _EMSectionedMessageListItemID *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EMSectionedMessageListItemID;
  v9 = -[_EMSectionedMessageListItemID init](&v14, sel_init);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionID, a4);
    objc_storeStrong((id *)&v10->_underlyingItemID, a3);
  }
  -[_EMSectionedMessageListItemID cachedSelf](v11, "cachedSelf");
  v12 = (_EMSectionedMessageListItemID *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _EMSectionedMessageListItemID *v4;
  _EMSectionedMessageListItemID *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (_EMSectionedMessageListItemID *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if ((-[_EMSectionedMessageListItemID isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[_EMSectionedMessageListItemID sectionID](self, "sectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EMSectionedMessageListItemID sectionID](v5, "sectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[_EMSectionedMessageListItemID underlyingItemID](self, "underlyingItemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EMSectionedMessageListItemID underlyingItemID](v5, "underlyingItemID");
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

  -[_EMSectionedMessageListItemID sectionID](self, "sectionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_EMSectionedMessageListItemID underlyingItemID](self, "underlyingItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 33 * v4 + objc_msgSend(v5, "hash") + 1089;

  return v6;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_EMSectionedMessageListItemID sectionID](self, "sectionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMSectionedMessageListItemID underlyingItemID](self, "underlyingItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("SectionID:%@ %@"), v4, v5);

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EMSectionedMessageListItemID)initWithCoder:(id)a3
{
  id v3;
  _EMSectionedMessageListItemID *v4;
  _EMSectionedMessageListItemID *v5;
  id v8;

  v8 = a3;
  v3 = v8;
  v4 = self;
  EFDecodeCacheableInstance();
  v5 = (_EMSectionedMessageListItemID *)objc_claimAutoreleasedReturnValue();

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

  -[_EMSectionedMessageListItemID underlyingItemID](self, "underlyingItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedMessageListItemID;
    v6 = -[_EMSectionedMessageListItemID respondsToSelector:](&v8, sel_respondsToSelector_, a3);
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  _EMSectionedMessageListItemID *v4;
  _EMSectionedMessageListItemID *v5;
  _EMSectionedMessageListItemID *v6;

  -[_EMSectionedMessageListItemID underlyingItemID](self, "underlyingItemID");
  v4 = (_EMSectionedMessageListItemID *)objc_claimAutoreleasedReturnValue();
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

  -[_EMSectionedMessageListItemID underlyingItemID](self, "underlyingItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedMessageListItemID;
    v6 = -[_EMSectionedMessageListItemID isKindOfClass:](&v8, sel_isKindOfClass_, a3);
  }

  return v6;
}

- (NSObject)sectionID
{
  return self->_sectionID;
}

- (EMCollectionItemID)underlyingItemID
{
  return self->_underlyingItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingItemID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
