@implementation EMThreadCollectionItemID

id __42__EMThreadCollectionItemID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)EMThreadCollectionItemID;
  v2 = objc_msgSendSuper2(&v4, sel_init);
  if (v2)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 40), "decodeInt64ForKey:", CFSTR("EFPropertyKey_conversationID"));
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  EFEncodeCacheableInstance();

}

- (EMThreadCollectionItemID)initWithCoder:(id)a3
{
  id v3;
  EMThreadCollectionItemID *v4;
  EMThreadCollectionItemID *v5;
  id v8;

  v8 = a3;
  v3 = v8;
  v4 = self;
  EFDecodeCacheableInstance();
  v5 = (EMThreadCollectionItemID *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __44__EMThreadCollectionItemID_encodeWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeInt64:forKey:", objc_msgSend(*(id *)(a1 + 40), "conversationID"), CFSTR("EFPropertyKey_conversationID"));
}

- (EMThreadCollectionItemID)initWithConversationID:(int64_t)a3
{
  EMThreadCollectionItemID *v4;
  EMThreadCollectionItemID *v5;
  EMThreadCollectionItemID *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EMThreadCollectionItemID;
  v4 = -[EMThreadCollectionItemID init](&v8, sel_init);
  v5 = v4;
  if (v4)
    v4->_conversationID = a3;
  -[EMThreadCollectionItemID cachedSelf](v4, "cachedSelf");
  v6 = (EMThreadCollectionItemID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_4 != -1)
    dispatch_once(&cachedSelf_onceToken_4, &__block_literal_global_53);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_4);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_4, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_4);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  EMThreadCollectionItemID *v4;
  EMThreadCollectionItemID *v5;
  int64_t v6;
  BOOL v7;

  v4 = (EMThreadCollectionItemID *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if ((-[EMThreadCollectionItemID isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    v6 = -[EMThreadCollectionItemID conversationID](self, "conversationID");
    v7 = v6 == -[EMThreadCollectionItemID conversationID](v5, "conversationID");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[EMThreadCollectionItemID conversationID](self, "conversationID") + 33;
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[EMThreadCollectionItemID conversationID](self, "conversationID");
  EFStringWithInt64();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("ConversationID:%@"), v4);

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __51__EMThreadCollectionItemID_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_4 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_4;
  cachedSelf_sUniqueObjectIDs_4 = v0;

}

- (EMThreadCollectionItemID)init
{
  -[EMThreadCollectionItemID doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EMThreadCollectionItemID init]", "EMThreadObjectID.m", 139, "0");
}

@end
