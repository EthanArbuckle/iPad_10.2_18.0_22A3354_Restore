@implementation EMMailboxScope

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  EMMailboxScope *v4;
  EMMailboxScope *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _BOOL4 v12;

  v4 = (EMMailboxScope *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else if ((-[EMMailboxScope isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMailboxScope mailboxTypes](v5, "mailboxTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (EFSetsAreEqual()
      && (v8 = -[EMMailboxScope excludeTypes](self, "excludeTypes"),
          v8 == -[EMMailboxScope excludeTypes](v5, "excludeTypes")))
    {
      -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMMailboxScope mailboxObjectIDs](v5, "mailboxObjectIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (EFSetsAreEqual())
      {
        v12 = -[EMMailboxScope excludeMailboxes](self, "excludeMailboxes");
        v9 = v12 ^ -[EMMailboxScope excludeMailboxes](v5, "excludeMailboxes") ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NSSet)mailboxTypes
{
  return self->_mailboxTypes;
}

- (NSSet)mailboxObjectIDs
{
  return self->_mailboxObjectIDs;
}

- (BOOL)excludeTypes
{
  return self->_excludeTypes;
}

- (BOOL)excludeMailboxes
{
  return self->_excludeMailboxes;
}

+ (EMMailboxScope)allMailboxesScope
{
  if (allMailboxesScope_onceToken != -1)
    dispatch_once(&allMailboxesScope_onceToken, &__block_literal_global_53);
  return (EMMailboxScope *)(id)allMailboxesScope_sMailboxScope;
}

+ (EMMailboxScope)noMailboxesScope
{
  if (noMailboxesScope_onceToken != -1)
    dispatch_once(&noMailboxesScope_onceToken, &__block_literal_global_55_0);
  return (EMMailboxScope *)(id)noMailboxesScope_sMailboxScope;
}

- (EMMailboxScope)initWithMailboxTypes:(id)a3 excludeTypes:(BOOL)a4 mailboxObjectIDs:(id)a5 excludeMailboxes:(BOOL)a6 cached:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  EMMailboxScope *v14;
  uint64_t v15;
  NSSet *mailboxTypes;
  uint64_t v17;
  NSSet *mailboxObjectIDs;
  EMMailboxScope *v19;
  EMMailboxScope *v20;
  objc_super v22;

  v7 = a7;
  v12 = a3;
  v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)EMMailboxScope;
  v14 = -[EMMailboxScope init](&v22, sel_init);
  if (v14)
  {
    if (objc_msgSend(v12, "count"))
    {
      v15 = objc_msgSend(v12, "copy");
      mailboxTypes = v14->_mailboxTypes;
      v14->_mailboxTypes = (NSSet *)v15;
    }
    else
    {
      a4 = 0;
      mailboxTypes = v14->_mailboxTypes;
      v14->_mailboxTypes = 0;
    }

    v14->_excludeTypes = a4;
    if (objc_msgSend(v13, "count"))
    {
      v17 = objc_msgSend(v13, "copy");
      mailboxObjectIDs = v14->_mailboxObjectIDs;
      v14->_mailboxObjectIDs = (NSSet *)v17;
    }
    else
    {
      a6 = 0;
      mailboxObjectIDs = v14->_mailboxObjectIDs;
      v14->_mailboxObjectIDs = 0;
    }

    v14->_excludeMailboxes = a6;
    -[EMMailboxScope _calculateHash](v14, "_calculateHash");
  }
  if (v7)
  {
    -[EMMailboxScope cachedSelf](v14, "cachedSelf");
    v19 = (EMMailboxScope *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v14;
  }
  v20 = v19;

  return v20;
}

- (void)_calculateHash
{
  NSSet *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _BOOL8 excludeTypes;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSSet *v11;

  v11 = self->_mailboxTypes;
  v3 = self->_mailboxObjectIDs;
  v4 = -[NSSet count](v11, "count");
  v5 = v11;
  if (v4 == 1)
  {
    -[NSSet anyObject](v11, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "hash");
  if (v4 == 1)

  excludeTypes = self->_excludeTypes;
  v8 = -[NSSet count](v3, "count");
  v9 = v3;
  if (v8 == 1)
  {
    -[NSSet anyObject](v3, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_msgSend(v9, "hash");
  if (v8 == 1)

  self->_hash = 33 * (33 * (33 * v6 + excludeTypes) + v10) + self->_excludeMailboxes + 1185921;
}

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_0 != -1)
    dispatch_once(&cachedSelf_onceToken_0, &__block_literal_global_27);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_0);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_0, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_0);
  return v3;
}

+ (id)mailboxScopeForMailboxObjectIDs:(id)a3 forExclusion:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  EMMailboxScope *v7;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
  v7 = -[EMMailboxScope initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:]([EMMailboxScope alloc], "initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:", 0, 0, v6, v4);

  return v7;
}

- (EMMailboxScope)initWithMailboxTypes:(id)a3 excludeTypes:(BOOL)a4 mailboxObjectIDs:(id)a5 excludeMailboxes:(BOOL)a6
{
  return -[EMMailboxScope initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:cached:](self, "initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:cached:", a3, a4, a5, a6, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailboxTypes, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("mailboxTypes"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMMailboxScope excludeTypes](self, "excludeTypes"), CFSTR("EFPropertyKey_excludeTypes"));
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("url.absoluteString"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("mailboxObjectIDs"));
  objc_msgSend(v4, "encodeBool:forKey:", -[EMMailboxScope excludeMailboxes](self, "excludeMailboxes"), CFSTR("EFPropertyKey_excludeMailboxes"));

}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMMailboxScope _mailboxTypesDescription](self, "_mailboxTypesDescription");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[EMMailboxScope _mailboxObjectIDsDescription](self, "_mailboxObjectIDsDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E70F6E90;
  if (v5)
    v9 = v5;
  else
    v9 = &stru_1E70F6E90;
  if (v6)
    v8 = (const __CFString *)v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@%@"), v4, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)_mailboxTypesDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;

  -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ef_compactMap:", &__block_literal_global_68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    if (-[EMMailboxScope excludeTypes](self, "excludeTypes"))
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      v8 = CFSTR(" excluding types: [%@]");
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      v8 = CFSTR(" including types: [%@]");
    }
    v9 = (void *)objc_msgSend(v7, "initWithFormat:", v8, v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)scopeContainsMailboxObjectID:(id)a3 mailboxTypeResolver:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__EMMailboxScope_scopeContainsMailboxObjectID_mailboxTypeResolver___block_invoke;
    v11[3] = &unk_1E70F3D38;
    v12 = v7;
    v13 = v8;
    v9 = -[EMMailboxScope _scopeContainsMailboxWithObjectID:mailboxTypeBlock:](self, "_scopeContainsMailboxWithObjectID:mailboxTypeBlock:", v8, v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_scopeContainsMailboxWithObjectID:(id)a3 mailboxTypeBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    if (!v9)
    {
      LOBYTE(self) = 0;
      goto LABEL_9;
    }
LABEL_7:
    v11 = -[EMMailboxScope excludeTypes](self, "excludeTypes");
    -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(self) = v11 ^ objc_msgSend(v12, "containsObject:", v13);

    goto LABEL_9;
  }
  if (!objc_msgSend(v8, "containsObject:", v6))
  {
    if (!v10)
    {
      LOBYTE(self) = -[EMMailboxScope excludeMailboxes](self, "excludeMailboxes");
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  LODWORD(self) = !-[EMMailboxScope excludeMailboxes](self, "excludeMailboxes");
LABEL_9:

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __41__EMMailboxScope_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_0 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_0;
  cachedSelf_sUniqueObjectIDs_0 = v0;

}

- (EMMailboxScope)initWithCoder:(id)a3
{
  id v4;
  EMMailboxScope *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *mailboxTypes;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSSet *mailboxObjectIDs;
  EMMailboxScope *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EMMailboxScope;
  v5 = -[EMMailboxScope init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("mailboxTypes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);
      mailboxTypes = v5->_mailboxTypes;
      v5->_mailboxTypes = (NSSet *)v10;

    }
    v5->_excludeTypes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_excludeTypes"));
    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("mailboxObjectIDs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v15);
      mailboxObjectIDs = v5->_mailboxObjectIDs;
      v5->_mailboxObjectIDs = (NSSet *)v16;

    }
    v5->_excludeMailboxes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EFPropertyKey_excludeMailboxes"));
    -[EMMailboxScope _calculateHash](v5, "_calculateHash");

  }
  -[EMMailboxScope cachedSelf](v5, "cachedSelf");
  v18 = (EMMailboxScope *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __35__EMMailboxScope_allMailboxesScope__block_invoke()
{
  _EMSpecialMailboxScope *v0;
  void *v1;

  v0 = -[_EMSpecialMailboxScope initWithIdentifier:]([_EMSpecialMailboxScope alloc], "initWithIdentifier:", CFSTR("AllMailboxes"));
  v1 = (void *)allMailboxesScope_sMailboxScope;
  allMailboxesScope_sMailboxScope = (uint64_t)v0;

}

void __34__EMMailboxScope_noMailboxesScope__block_invoke()
{
  _EMSpecialMailboxScope *v0;
  void *v1;

  v0 = -[_EMSpecialMailboxScope initWithIdentifier:]([_EMSpecialMailboxScope alloc], "initWithIdentifier:", CFSTR("NoMailboxes"));
  v1 = (void *)noMailboxesScope_sMailboxScope;
  noMailboxesScope_sMailboxScope = (uint64_t)v0;

}

- (id)allMailboxObjectIDsWithMailboxTypeResolver:(id)a3 forExclusion:(BOOL *)a4
{
  id v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v6 = a3;
  v7 = -[EMMailboxScope excludeTypes](self, "excludeTypes");
  v8 = -[EMMailboxScope excludeMailboxes](self, "excludeMailboxes");
  if (v7 == v8)
  {
    -[EMMailboxScope _mailboxObjectIDsForTypesWithMailboxTypeResolver:](self, "_mailboxObjectIDsForTypesWithMailboxTypeResolver:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v14 = objc_alloc(MEMORY[0x1E0C99E60]);
      -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithObjects:", v9, v15, 0);

      objc_msgSend(v16, "ef_flatten");
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a4 = v8;
  }
  else
  {
    -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[EMMailboxScope _mailboxObjectIDsForTypesWithMailboxTypeResolver:](self, "_mailboxObjectIDsForTypesWithMailboxTypeResolver:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        v12 = v8;
      else
        v12 = 0;
      if (v12 == 1)
      {
        v13 = (id)objc_msgSend(v10, "mutableCopy");
        objc_msgSend(v13, "minusSet:", v9);
        LOBYTE(v8) = 0;
      }
      else
      {
        v13 = v9;
      }
      *a4 = v8;

    }
    else
    {
      -[EMMailboxScope _mailboxObjectIDsForTypesWithMailboxTypeResolver:](self, "_mailboxObjectIDsForTypesWithMailboxTypeResolver:", v6);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = v7;
    }
  }

  if (objc_msgSend(v13, "count"))
    v17 = v13;
  else
    v17 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  v18 = v17;

  return v18;
}

- (id)_mailboxObjectIDsForTypesWithMailboxTypeResolver:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__EMMailboxScope__mailboxObjectIDsForTypesWithMailboxTypeResolver___block_invoke;
  v10[3] = &unk_1E70F3CE8;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "ef_compactMap:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_flatten");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)mailboxScopeForMailboxType:(int64_t)a3 forExclusion:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  EMMailboxScope *v9;

  v4 = a4;
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);

  v9 = -[EMMailboxScope initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:]([EMMailboxScope alloc], "initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:", v8, v4, 0, 0);
  return v9;
}

+ (id)mailboxScopeForMailboxTypes:(id)a3 forExclusion:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  EMMailboxScope *v7;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
  v7 = -[EMMailboxScope initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:]([EMMailboxScope alloc], "initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:", v6, v4, 0, 0);

  return v7;
}

- (EMMailboxScope)init
{
  -[EMMailboxScope doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMMailboxScope init]", "EMMailboxScope.m", 79, "0");
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EMMailboxScope _mailboxTypesDescription](self, "_mailboxTypesDescription");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[EMMailboxScope _mailboxObjectIDsDescription](self, "_mailboxObjectIDsDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E70F6E90;
  if (v5)
    v9 = v5;
  else
    v9 = &stru_1E70F6E90;
  if (v6)
    v8 = (const __CFString *)v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@%@"), v4, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

id __42__EMMailboxScope__mailboxTypesDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "integerValue");
  ECNSStringFromMailboxMailboxType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_mailboxObjectIDsDescription
{
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[EMMailboxScope excludeMailboxes](self, "excludeMailboxes"))
    v4 = CFSTR("excluding");
  else
    v4 = CFSTR("including");
  -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(" %@ mailboxes: %ld <%p>"), v4, v6, objc_msgSend(v7, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mailboxScopeByAddingMailboxes:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  EMMailboxScope *v16;
  void *v17;
  EMMailboxScope *v18;
  id v20;
  EMMailboxScope *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "mutableCopy");

  v21 = self;
  if (!-[EMMailboxScope excludeMailboxes](self, "excludeMailboxes"))
  {
    v6 = -[EMMailboxScope excludeTypes](self, "excludeTypes");
    -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v20;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v9)
      goto LABEL_15;
    v10 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "type"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "containsObject:", v13);

        if (v14)
        {
          if (!v6)
            continue;
        }
        else if (v6)
        {
          continue;
        }
        objc_msgSend(v12, "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v15);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v9)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
  }
  objc_msgSend(v20, "ef_mapSelector:", sel_objectID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ef_removeObjectsInArray:", v5);

LABEL_16:
  v16 = [EMMailboxScope alloc];
  -[EMMailboxScope mailboxTypes](v21, "mailboxTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[EMMailboxScope initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:](v16, "initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:", v17, -[EMMailboxScope excludeTypes](v21, "excludeTypes"), v22, -[EMMailboxScope excludeMailboxes](v21, "excludeMailboxes"));

  return v18;
}

- (id)mailboxScopeByRemovingMailboxes:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  EMMailboxScope *v16;
  void *v17;
  EMMailboxScope *v18;
  id v20;
  EMMailboxScope *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  -[EMMailboxScope mailboxObjectIDs](self, "mailboxObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "mutableCopy");

  v21 = self;
  if (!-[EMMailboxScope excludeMailboxes](self, "excludeMailboxes"))
  {
    objc_msgSend(v20, "ef_mapSelector:", sel_objectID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ef_removeObjectsInArray:", v15);

    goto LABEL_16;
  }
  v5 = -[EMMailboxScope excludeTypes](self, "excludeTypes");
  -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v20;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v8)
    goto LABEL_14;
  v9 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "type"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "containsObject:", v12);

      if (v13)
      {
        if (v5)
          continue;
      }
      else if (!v5)
      {
        continue;
      }
      objc_msgSend(v11, "objectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v14);

    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v8);
LABEL_14:

LABEL_16:
  v16 = [EMMailboxScope alloc];
  -[EMMailboxScope mailboxTypes](v21, "mailboxTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[EMMailboxScope initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:](v16, "initWithMailboxTypes:excludeTypes:mailboxObjectIDs:excludeMailboxes:", v17, -[EMMailboxScope excludeTypes](v21, "excludeTypes"), v22, -[EMMailboxScope excludeMailboxes](v21, "excludeMailboxes"));

  return v18;
}

id __67__EMMailboxScope__mailboxObjectIDsForTypesWithMailboxTypeResolver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mailboxObjectIDsForMailboxType:", objc_msgSend(v3, "integerValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)scopeContainsMailbox:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__EMMailboxScope_scopeContainsMailbox___block_invoke;
  v8[3] = &unk_1E70F3D10;
  v6 = v4;
  v9 = v6;
  LOBYTE(self) = -[EMMailboxScope _scopeContainsMailboxWithObjectID:mailboxTypeBlock:](self, "_scopeContainsMailboxWithObjectID:mailboxTypeBlock:", v5, v8);

  return (char)self;
}

uint64_t __39__EMMailboxScope_scopeContainsMailbox___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "type"));
}

uint64_t __67__EMMailboxScope_scopeContainsMailboxObjectID_mailboxTypeResolver___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = objc_msgSend(*(id *)(a1 + 32), "mailboxTypeForMailboxObjectID:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
}

- (BOOL)containsOnlyInboxType
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[EMMailboxScope excludeTypes](self, "excludeTypes"))
    return 0;
  -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    -[EMMailboxScope mailboxTypes](self, "mailboxTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "integerValue") == 7;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
