@implementation EMMessageObjectID

- (EMMessageObjectID)initWithCollectionItemID:(id)a3 mailboxScope:(id)a4
{
  id v7;
  id v8;
  id *v9;
  id *v10;
  id *v11;
  EMMessageObjectID *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EMMessageObjectID;
  v9 = -[EMObjectID initAsEphemeralID:](&v14, sel_initAsEphemeralID_, 0);
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a3);
    objc_storeStrong(v10 + 6, a4);
  }
  objc_msgSend(v11, "cachedSelf");
  v12 = (EMMessageObjectID *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)globalMessageID
{
  void *v2;
  int64_t v3;

  -[EMMessageObjectID collectionItemID](self, "collectionItemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "globalMessageID");

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  objc_super v6;

  if (-[EMObjectID isEphemeral](self, "isEphemeral"))
  {
    v6.receiver = self;
    v6.super_class = (Class)EMMessageObjectID;
    return -[EMObjectID hash](&v6, sel_hash);
  }
  else
  {
    -[EMMessageObjectID collectionItemID](self, "collectionItemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "hash");

  }
  return v3;
}

- (EMMessageCollectionItemID)collectionItemID
{
  return self->_collectionItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxScope, 0);
  objc_storeStrong((id *)&self->_collectionItemID, 0);
}

- (BOOL)isEqual:(id)a3
{
  EMMessageObjectID *v4;
  EMMessageObjectID *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = (EMMessageObjectID *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[EMObjectID isEphemeral](self, "isEphemeral") || -[EMObjectID isEphemeral](v5, "isEphemeral"))
      {
        v12.receiver = self;
        v12.super_class = (Class)EMMessageObjectID;
        v6 = -[EMObjectID isEqual:](&v12, sel_isEqual_, v5);
      }
      else
      {
        -[EMMessageObjectID collectionItemID](self, "collectionItemID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMMessageObjectID collectionItemID](v5, "collectionItemID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqual:", v8))
        {
          -[EMMessageObjectID mailboxScope](self, "mailboxScope");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[EMMessageObjectID mailboxScope](v5, "mailboxScope");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = EFObjectsAreEqual();

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
  }

  return v6;
}

- (EMMessageObjectID)init
{
  EMMessageObjectID *v2;
  EMMessageCollectionItemID *v3;
  EMMessageCollectionItemID *collectionItemID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EMMessageObjectID;
  v2 = -[EMObjectID initAsEphemeralID:](&v6, sel_initAsEphemeralID_, 1);
  if (v2)
  {
    v3 = -[EMMessageCollectionItemID initWithGlobalMessageID:]([EMMessageCollectionItemID alloc], "initWithGlobalMessageID:", -1);
    collectionItemID = v2->_collectionItemID;
    v2->_collectionItemID = v3;

  }
  return v2;
}

- (EMMessageObjectID)initWithCollectionItemID:(id)a3 predicate:(id)a4 mailboxTypeResolver:(id)a5
{
  id v8;
  void *v9;
  EMMessageObjectID *v10;

  v8 = a3;
  +[EMMessageListItemPredicates mailboxScopeForPredicate:withMailboxTypeResolver:](EMMessageListItemPredicates, "mailboxScopeForPredicate:withMailboxTypeResolver:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EMMessageObjectID initWithCollectionItemID:mailboxScope:](self, "initWithCollectionItemID:mailboxScope:", v8, v9);

  return v10;
}

- (EMMessageObjectID)initWithGlobalMessageID:(int64_t)a3 mailboxScope:(id)a4
{
  id v6;
  EMMessageCollectionItemID *v7;
  EMMessageObjectID *v8;

  v6 = a4;
  v7 = -[EMMessageCollectionItemID initWithGlobalMessageID:]([EMMessageCollectionItemID alloc], "initWithGlobalMessageID:", a3);
  v8 = -[EMMessageObjectID initWithCollectionItemID:mailboxScope:](self, "initWithCollectionItemID:mailboxScope:", v7, v6);

  return v8;
}

- (id)description
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
  v11.super_class = (Class)EMMessageObjectID;
  -[EMObjectID description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageObjectID collectionItemID](self, "collectionItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMMessageObjectID mailboxScope](self, "mailboxScope");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ %@ %@"), v4, v6, v8);

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageObjectID)initWithCoder:(id)a3
{
  EMMessageObjectID *v4;
  id v5;
  EMMessageObjectID *v6;
  id v8;
  EMMessageObjectID *v9;

  v8 = a3;
  v9 = self;
  v4 = self;
  v5 = v8;
  EFDecodeCacheableInstance();
  v6 = (EMMessageObjectID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __35__EMMessageObjectID_initWithCoder___block_invoke(uint64_t a1)
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
  v12.super_class = (Class)EMMessageObjectID;
  v4 = objc_msgSendSuper2(&v12, sel_initWithCoder_, v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_collectionItemID"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_mailboxScope"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = v8;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  EFEncodeCacheableInstance();

}

void __37__EMMessageObjectID_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)EMMessageObjectID;
  objc_msgSendSuper2(&v7, sel_encodeWithCoder_, v2);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "collectionItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_collectionItemID"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "mailboxScope");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_mailboxScope"));

}

- (EMMailboxScope)mailboxScope
{
  return self->_mailboxScope;
}

@end
