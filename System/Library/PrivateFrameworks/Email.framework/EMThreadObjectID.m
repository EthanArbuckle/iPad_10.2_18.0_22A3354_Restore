@implementation EMThreadObjectID

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  EFEncodeCacheableInstance();

}

- (EMThreadObjectID)initWithCoder:(id)a3
{
  EMThreadObjectID *v4;
  id v5;
  EMThreadObjectID *v6;
  id v8;
  EMThreadObjectID *v9;

  v8 = a3;
  v9 = self;
  v4 = self;
  v5 = v8;
  EFDecodeCacheableInstance();
  v6 = (EMThreadObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadScope, 0);
  objc_storeStrong((id *)&self->_collectionItemID, 0);
}

- (EMThreadObjectID)initWithConversationID:(int64_t)a3 threadScope:(id)a4
{
  id v6;
  EMThreadCollectionItemID *v7;
  EMThreadObjectID *v8;

  v6 = a4;
  v7 = -[EMThreadCollectionItemID initWithConversationID:]([EMThreadCollectionItemID alloc], "initWithConversationID:", a3);
  v8 = -[EMThreadObjectID initWithCollectionItemID:threadScope:](self, "initWithCollectionItemID:threadScope:", v7, v6);

  return v8;
}

- (EMThreadObjectID)initWithCollectionItemID:(id)a3 threadScope:(id)a4
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  id *v11;
  EMThreadObjectID *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMThreadObjectID;
  v9 = -[EMObjectID initAsEphemeralID:](&v14, sel_initAsEphemeralID_, 0);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a3);
    objc_storeStrong(v10 + 6, a4);
  }
  objc_msgSend(v11, "cachedSelf");
  v12 = (EMThreadObjectID *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __34__EMThreadObjectID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v2 = *(id *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v12.receiver = v2;
  v12.super_class = (Class)EMThreadObjectID;
  v4 = objc_msgSendSuper2(&v12, sel_initWithCoder_, v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_collectionItemID"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_threadScope"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = v8;

  }
  return v4;
}

void __36__EMThreadObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)EMThreadObjectID;
  objc_msgSendSuper2(&v7, sel_encodeWithCoder_, v2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "collectionItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_collectionItemID"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "threadScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_threadScope"));

}

- (BOOL)isEqual:(id)a3
{
  EMThreadObjectID *v4;
  EMThreadObjectID *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = (EMThreadObjectID *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if ((-[EMThreadObjectID isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    if (-[EMObjectID isEphemeral](self, "isEphemeral"))
    {
      v12.receiver = self;
      v12.super_class = (Class)EMThreadObjectID;
      v6 = -[EMObjectID isEqual:](&v12, sel_isEqual_, v5);
    }
    else
    {
      -[EMThreadObjectID collectionItemID](self, "collectionItemID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMThreadObjectID collectionItemID](v5, "collectionItemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[EMThreadObjectID threadScope](self, "threadScope");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMThreadObjectID threadScope](v5, "threadScope");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  if (-[EMObjectID isEphemeral](self, "isEphemeral"))
  {
    v8.receiver = self;
    v8.super_class = (Class)EMThreadObjectID;
    return -[EMObjectID hash](&v8, sel_hash);
  }
  else
  {
    -[EMThreadObjectID collectionItemID](self, "collectionItemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");

    -[EMThreadObjectID threadScope](self, "threadScope");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 33 * v5 + objc_msgSend(v6, "hash") + 1089;

  }
  return v3;
}

- (EMCollectionItemID)collectionItemID
{
  return self->_collectionItemID;
}

- (EMThreadScope)threadScope
{
  return self->_threadScope;
}

- (NSString)ef_publicDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)EMThreadObjectID;
  -[EMObjectID description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThreadObjectID collectionItemID](self, "collectionItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThreadObjectID threadScope](self, "threadScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_publicDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@, %@"), v4, v6, v8);

  return (NSString *)v9;
}

- (int64_t)conversationID
{
  void *v2;
  void *v3;
  int64_t v4;

  -[EMThreadObjectID _threadCollectionItemID](self, "_threadCollectionItemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "conversationID");
  else
    v4 = -1;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_44_0 != -1)
    dispatch_once(&cachedSelf_onceToken_44_0, &__block_literal_global_45_0);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_42_0);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_43_0, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_42_0);
  return v3;
}

void __30__EMThreadObjectID_cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_42_0 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 10000);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_43_0;
  cachedSelf_sUniqueObjectIDs_43_0 = v0;

}

- (EMThreadObjectID)init
{
  _QWORD *v2;
  EMThreadCollectionItemID *v3;
  void *v4;
  EMThreadObjectID *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EMThreadObjectID;
  v2 = -[EMObjectID initAsEphemeralID:](&v7, sel_initAsEphemeralID_, 1);
  if (v2)
  {
    v3 = -[EMThreadCollectionItemID initWithConversationID:]([EMThreadCollectionItemID alloc], "initWithConversationID:", -1);
    v4 = (void *)v2[5];
    v2[5] = v3;

  }
  objc_msgSend(v2, "cachedSelf");
  v5 = (EMThreadObjectID *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)EMThreadObjectID;
  -[EMObjectID description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThreadObjectID collectionItemID](self, "collectionItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMThreadObjectID threadScope](self, "threadScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@, %@"), v4, v6, v8);

  return (NSString *)v9;
}

@end
