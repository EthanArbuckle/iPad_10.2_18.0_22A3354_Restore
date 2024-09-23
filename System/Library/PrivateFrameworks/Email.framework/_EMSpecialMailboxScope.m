@implementation _EMSpecialMailboxScope

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_EMSpecialMailboxScope identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  _EMSpecialMailboxScope *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (_EMSpecialMailboxScope *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_EMSpecialMailboxScope identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EMSpecialMailboxScope identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)mailboxTypes
{
  return 0;
}

- (id)mailboxObjectIDs
{
  return 0;
}

- (BOOL)excludeTypes
{
  return 0;
}

- (BOOL)excludeMailboxes
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  EFEncodeCacheableInstance();

}

- (id)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_EMSpecialMailboxScope identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (_EMSpecialMailboxScope)initWithIdentifier:(id)a3
{
  id v4;
  _EMSpecialMailboxScope *v5;
  uint64_t v6;
  NSString *identifier;
  _EMSpecialMailboxScope *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EMSpecialMailboxScope;
  v5 = -[EMMailboxScope initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:cached:](&v10, sel_initWithMailboxTypes_excludeTypes_mailboxObjectIDs_excludeMailboxes_cached_, 0, 0, 0, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  -[_EMSpecialMailboxScope cachedSelf](v5, "cachedSelf");
  v8 = (_EMSpecialMailboxScope *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_51 != -1)
    dispatch_once(&cachedSelf_onceToken_51, &__block_literal_global_52);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_49);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_50, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_49);
  return v3;
}

- (_EMSpecialMailboxScope)initWithCoder:(id)a3
{
  _EMSpecialMailboxScope *v4;
  id v5;
  _EMSpecialMailboxScope *v6;
  id v8;
  _EMSpecialMailboxScope *v9;

  v8 = a3;
  v9 = self;
  v4 = self;
  v5 = v8;
  EFDecodeCacheableInstance();
  v6 = (_EMSpecialMailboxScope *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mailboxScopeByAddingMailboxes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _EMSpecialMailboxScope *v7;
  void *v8;

  v4 = a3;
  -[_EMSpecialMailboxScope identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AllMailboxes"));

  if (v6)
  {
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMMailboxScope mailboxScopeForMailboxObjectIDs:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxObjectIDs:forExclusion:", v8, 0);
    v7 = (_EMSpecialMailboxScope *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)mailboxScopeByRemovingMailboxes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  _EMSpecialMailboxScope *v8;

  v4 = a3;
  -[_EMSpecialMailboxScope identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AllMailboxes"));

  if (v6)
  {
    objc_msgSend(v4, "ef_mapSelector:", sel_objectID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMMailboxScope mailboxScopeForMailboxObjectIDs:forExclusion:](EMMailboxScope, "mailboxScopeForMailboxObjectIDs:forExclusion:", v7, 1);
    v8 = (_EMSpecialMailboxScope *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self;
  }

  return v8;
}

- (id)allMailboxObjectIDsWithMailboxTypeResolver:(id)a3 forExclusion:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  *a4 = 0;
  -[_EMSpecialMailboxScope identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v7, "isEqualToString:", CFSTR("AllMailboxes"));

  if ((_DWORD)self)
  {
    objc_msgSend(v6, "allMailboxObjectIDs");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }
  v9 = v8;

  return v9;
}

- (BOOL)scopeContainsMailbox:(id)a3
{
  void *v3;
  char v4;

  -[_EMSpecialMailboxScope identifier](self, "identifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AllMailboxes"));

  return v4;
}

- (BOOL)scopeContainsMailboxObjectID:(id)a3 mailboxTypeResolver:(id)a4
{
  void *v4;
  char v5;

  -[_EMSpecialMailboxScope identifier](self, "identifier", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AllMailboxes"));

  return v5;
}

@end
