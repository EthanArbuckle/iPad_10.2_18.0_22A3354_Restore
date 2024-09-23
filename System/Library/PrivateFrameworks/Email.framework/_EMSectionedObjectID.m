@implementation _EMSectionedObjectID

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_44 != -1)
    dispatch_once(&cachedSelf_onceToken_44, &__block_literal_global_45);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_42);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_43, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_42);
  return v3;
}

- (_EMSectionedObjectID)initWithObjectID:(id)a3 sectionID:(id)a4
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  id *v11;
  _EMSectionedObjectID *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_EMSectionedObjectID;
  v9 = -[EMObjectID initAsEphemeralID:](&v14, sel_initAsEphemeralID_, 0);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a4);
    objc_storeStrong(v10 + 6, a3);
  }
  objc_msgSend(v11, "cachedSelf");
  v12 = (_EMSectionedObjectID *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _EMSectionedObjectID *v4;
  _EMSectionedObjectID *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (_EMSectionedObjectID *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if ((-[_EMSectionedObjectID isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[_EMSectionedObjectID sectionID](self, "sectionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EMSectionedObjectID sectionID](v5, "sectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[_EMSectionedObjectID underlyingObjectID](self, "underlyingObjectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EMSectionedObjectID underlyingObjectID](v5, "underlyingObjectID");
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

  -[_EMSectionedObjectID sectionID](self, "sectionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_EMSectionedObjectID underlyingObjectID](self, "underlyingObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 33 * v4 + objc_msgSend(v5, "hash") + 1089;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EMSectionedObjectID)initWithCoder:(id)a3
{
  _EMSectionedObjectID *v4;
  id v5;
  _EMSectionedObjectID *v6;
  id v8;
  _EMSectionedObjectID *v9;

  v8 = a3;
  v9 = self;
  v4 = self;
  v5 = v8;
  EFDecodeCacheableInstance();
  v6 = (_EMSectionedObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
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

  -[_EMSectionedObjectID underlyingObjectID](self, "underlyingObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedObjectID;
    v6 = -[_EMSectionedObjectID respondsToSelector:](&v8, sel_respondsToSelector_, a3);
  }

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  _EMSectionedObjectID *v4;
  _EMSectionedObjectID *v5;
  _EMSectionedObjectID *v6;

  -[_EMSectionedObjectID underlyingObjectID](self, "underlyingObjectID");
  v4 = (_EMSectionedObjectID *)objc_claimAutoreleasedReturnValue();
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

  -[_EMSectionedObjectID underlyingObjectID](self, "underlyingObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_EMSectionedObjectID;
    v6 = -[_EMSectionedObjectID isKindOfClass:](&v8, sel_isKindOfClass_, a3);
  }

  return v6;
}

- (id)collectionItemID
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_EMSectionedObjectID underlyingObjectID](self, "underlyingObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_EMSectionedObjectID underlyingObjectID](self, "underlyingObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EMSectionedObjectID sectionID](self, "sectionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMSectionedMessageListObjectConverter itemIDForItemID:inSection:](EMSectionedMessageListObjectConverter, "itemIDForItemID:inSection:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSObject)sectionID
{
  return self->_sectionID;
}

- (EMObjectID)underlyingObjectID
{
  return self->_underlyingObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObjectID, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end
