@implementation EMThreadScope

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[EMThreadScope mailboxScope](self, "mailboxScope");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[EMThreadScope filterPredicate](self, "filterPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 33 * v4 + objc_msgSend(v5, "hash") + 1089;

  return v6;
}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (BOOL)isEqual:(id)a3
{
  EMThreadScope *v4;
  EMThreadScope *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (EMThreadScope *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if ((-[EMThreadScope isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    -[EMThreadScope mailboxScope](self, "mailboxScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMThreadScope mailboxScope](v5, "mailboxScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[EMThreadScope filterPredicate](self, "filterPredicate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMThreadScope filterPredicate](v5, "filterPredicate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = EFObjectsAreEqual();

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_mailboxScope, 0);
}

void __33__EMThreadScope_encodeWithCoder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "mailboxScope");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encodeObject:forKey:");

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "filterPredicate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:");

}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  EFEncodeCacheableInstance();

}

- (NSString)ef_publicDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[EMThreadScope mailboxScope](self, "mailboxScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_publicDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThreadScope filterPredicate](self, "filterPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_publicDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@: %@ filterPredicate: %@"), v4, v6, v8);

  return (NSString *)v9;
}

- (EMThreadScope)initWithCoder:(id)a3
{
  id v3;
  EMThreadScope *v4;
  EMThreadScope *v5;
  id v8;

  v8 = a3;
  v3 = v8;
  v4 = self;
  EFDecodeCacheableInstance();
  v5 = (EMThreadScope *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMThreadScope)initWithMailboxScope:(id)a3 filterPredicate:(id)a4
{
  id v7;
  id v8;
  EMThreadScope *v9;
  EMThreadScope *v10;
  EMThreadScope *v11;
  EMThreadScope *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMThreadScope;
  v9 = -[EMThreadScope init](&v14, sel_init);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mailboxScope, a3);
    objc_storeStrong((id *)&v10->_filterPredicate, a4);
  }
  -[EMThreadScope cachedSelf](v11, "cachedSelf");
  v12 = (EMThreadScope *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_5 != -1)
    dispatch_once(&cachedSelf_onceToken_5, &__block_literal_global_54);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_5);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_5, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_5);
  return v3;
}

void __40__EMThreadScope_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_5 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_5;
  cachedSelf_sUniqueObjectIDs_5 = v0;

}

id __31__EMThreadScope_initWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)EMThreadScope;
  v2 = objc_msgSendSuper2(&v10, sel_init);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mailboxScope"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    objc_msgSend(*(id *)(a1 + 40), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_filterPredicate"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allowEvaluation");
  }
  return v2;
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[EMThreadScope filterPredicate](self, "filterPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[EMThreadScope filterPredicate](self, "filterPredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR("\nfilterPredicate: %@"), v6);

  }
  else
  {
    v7 = &stru_1E70F6E90;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = objc_opt_class();
  -[EMThreadScope mailboxScope](self, "mailboxScope");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "debugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@%@"), v9, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

@end
