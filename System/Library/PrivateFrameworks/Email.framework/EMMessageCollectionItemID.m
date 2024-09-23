@implementation EMMessageCollectionItemID

id __43__EMMessageCollectionItemID_initWithCoder___block_invoke(uint64_t a1)
{
  id v2;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)EMMessageCollectionItemID;
  v2 = objc_msgSendSuper2(&v4, sel_init);
  if (v2)
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 40), "decodeInt64ForKey:", CFSTR("EFPropertyKey_globalMessageID"));
  return v2;
}

uint64_t __45__EMMessageCollectionItemID_encodeWithCoder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encodeInt64:forKey:", objc_msgSend(*(id *)(a1 + 40), "globalMessageID"), CFSTR("EFPropertyKey_globalMessageID"));
}

- (BOOL)isEqual:(id)a3
{
  EMMessageCollectionItemID *v4;
  EMMessageCollectionItemID *v5;
  int64_t v6;
  BOOL v7;

  v4 = (EMMessageCollectionItemID *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if ((-[EMMessageCollectionItemID isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    v6 = -[EMMessageCollectionItemID globalMessageID](self, "globalMessageID");
    v7 = v6 == -[EMMessageCollectionItemID globalMessageID](v5, "globalMessageID");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  -[EMMessageCollectionItemID globalMessageID](self, "globalMessageID");
  return EFMurmurHash3Mix();
}

- (int64_t)globalMessageID
{
  return self->_globalMessageID;
}

- (EMMessageCollectionItemID)initWithGlobalMessageID:(int64_t)a3
{
  EMMessageCollectionItemID *v4;
  EMMessageCollectionItemID *v5;
  EMMessageCollectionItemID *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EMMessageCollectionItemID;
  v4 = -[EMMessageCollectionItemID init](&v8, sel_init);
  v5 = v4;
  if (v4)
    v4->_globalMessageID = a3;
  -[EMMessageCollectionItemID cachedSelf](v4, "cachedSelf");
  v6 = (EMMessageCollectionItemID *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cachedSelf
{
  void *v3;

  if (cachedSelf_onceToken_1 != -1)
    dispatch_once(&cachedSelf_onceToken_1, &__block_literal_global_32);
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock_1);
  objc_msgSend((id)cachedSelf_sUniqueObjectIDs_1, "ef_uniquedObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock_1);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  EFEncodeCacheableInstance();

}

- (EMMessageCollectionItemID)initWithCoder:(id)a3
{
  id v3;
  EMMessageCollectionItemID *v4;
  EMMessageCollectionItemID *v5;
  id v8;

  v8 = a3;
  v3 = v8;
  v4 = self;
  EFDecodeCacheableInstance();
  v5 = (EMMessageCollectionItemID *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __52__EMMessageCollectionItemID_EFCacheable__cachedSelf__block_invoke()
{
  uint64_t v0;
  void *v1;

  cachedSelf_sTableLock_1 = 0;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
  v1 = (void *)cachedSelf_sUniqueObjectIDs_1;
  cachedSelf_sUniqueObjectIDs_1 = v0;

}

- (EMMessageCollectionItemID)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMMessageCollectionItemID;
  return -[EMMessageCollectionItemID init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("GlobalMessageID:%llu"), -[EMMessageCollectionItemID globalMessageID](self, "globalMessageID"));
}

@end
