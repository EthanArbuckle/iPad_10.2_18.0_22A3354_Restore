@implementation BSAuditHistory

- (void)addItem:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[NSMutableArray addObject:](self->_items, "addObject:", v4);

}

- (BSAuditHistory)init
{
  BSAuditHistory *v2;
  NSMutableArray *v3;
  NSMutableArray *items;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSAuditHistory;
  v2 = -[BSAuditHistory init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    items = v2->_items;
    v2->_items = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

- (NSArray)items
{
  return (NSArray *)self->_items;
}

- (BOOL)hasItems
{
  return -[NSMutableArray count](self->_items, "count") != 0;
}

- (void)addItemWithFormat:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *items;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v8);
  items = self->_items;
  +[BSAuditHistoryItem itemWithString:](BSAuditHistoryItem, "itemWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](items, "addObject:", v7);

}

- (BSAuditHistory)initWithXPCDictionary:(id)a3
{
  id v4;
  BSAuditHistory *v5;
  BSAuditHistory *v6;
  NSMutableArray *items;
  void *v8;

  v4 = a3;
  v5 = -[BSAuditHistory init](self, "init");
  v6 = v5;
  if (v5)
  {
    items = v5->_items;
    v8 = BSCreateDeserializedArrayFromXPCDictionaryWithKey(v4, "items", &__block_literal_global_20);
    -[NSMutableArray addObjectsFromArray:](items, "addObjectsFromArray:", v8);

  }
  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  BSSerializeArrayToXPCDictionaryWithKey(self->_items, a3, "items", &__block_literal_global_2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSAuditHistory)initWithCoder:(id)a3
{
  id v4;
  BSAuditHistory *v5;
  void *v6;

  v4 = a3;
  v5 = -[BSAuditHistory init](self, "init");
  if (v5)
  {
    if (qword_1ECD39B00 != -1)
      dispatch_once(&qword_1ECD39B00, &__block_literal_global_29);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", _MergedGlobals_33, CFSTR("items"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v5->_items, "addObjectsFromArray:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)-[NSMutableArray copy](self->_items, "copy");
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("items"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSAuditHistory succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_items, "count"), CFSTR("itemCount"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSAuditHistory descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BSAuditHistory succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", self->_items, 0, v4, 1);

  return v5;
}

@end
