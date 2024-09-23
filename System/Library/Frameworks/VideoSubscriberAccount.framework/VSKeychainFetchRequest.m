@implementation VSKeychainFetchRequest

- (VSKeychainFetchRequest)init
{
  VSKeychainFetchRequest *v2;
  VSOptional *v3;
  VSOptional *itemKind;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSKeychainFetchRequest;
  v2 = -[VSKeychainFetchRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    itemKind = v2->_itemKind;
    v2->_itemKind = v3;

  }
  return v2;
}

- (NSPredicate)predicate
{
  NSPredicate *v2;

  v2 = self->_predicate;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v2 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The predicate parameter must not be nil."));
      v2 = 0;
    }
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSKeychainFetchRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[VSKeychainFetchRequest init](+[VSKeychainFetchRequest allocWithZone:](VSKeychainFetchRequest, "allocWithZone:", a3), "init");
  -[VSKeychainFetchRequest itemKind](self, "itemKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceUnwrapObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainFetchRequest setItemKind:](v4, "setItemKind:", v8);

  -[VSKeychainFetchRequest predicate](self, "predicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainFetchRequest setPredicate:](v4, "setPredicate:", v9);

  -[VSKeychainFetchRequest sortDescriptors](self, "sortDescriptors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainFetchRequest setSortDescriptors:](v4, "setSortDescriptors:", v10);

  -[VSKeychainFetchRequest setFetchLimit:](v4, "setFetchLimit:", -[VSKeychainFetchRequest fetchLimit](self, "fetchLimit"));
  -[VSKeychainFetchRequest setIncludesDataValues:](v4, "setIncludesDataValues:", -[VSKeychainFetchRequest includesDataValues](self, "includesDataValues"));
  return v4;
}

- (VSOptional)itemKind
{
  return self->_itemKind;
}

- (void)setItemKind:(id)a3
{
  objc_storeStrong((id *)&self->_itemKind, a3);
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (BOOL)includesDataValues
{
  return self->_includesDataValues;
}

- (void)setIncludesDataValues:(BOOL)a3
{
  self->_includesDataValues = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
}

@end
