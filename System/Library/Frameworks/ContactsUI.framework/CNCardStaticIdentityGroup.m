@implementation CNCardStaticIdentityGroup

- (CNCardStaticIdentityGroup)initWithContact:(id)a3
{
  CNCardStaticIdentityGroup *v3;
  CNCardStaticIdentityGroup *v4;
  CNCardStaticIdentityGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNCardStaticIdentityGroup;
  v3 = -[CNCardGroup initWithContact:](&v7, sel_initWithContact_, a3);
  v4 = v3;
  if (v3)
  {
    -[CNCardStaticIdentityGroup clearDisplay](v3, "clearDisplay");
    v5 = v4;
  }

  return v4;
}

- (void)addIdentity:(id)a3 isNew:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardStaticIdentityGroup setStaticIdentities:](self, "setStaticIdentities:", v6);

  if (v4 && (objc_msgSend(v7, "isEqualToString:", CFSTR(" ")) & 1) == 0)
    self->_didChange = 1;

}

- (void)clearDisplay
{
  NSArray *v3;
  NSArray *staticIdentities;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  staticIdentities = self->_staticIdentities;
  self->_staticIdentities = v3;

  self->_didChange = 0;
}

- (BOOL)canAddEditingItem
{
  return 0;
}

- (id)currentIdentity
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CNCardStaticIdentityGroup staticIdentities](self, "staticIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CNCardStaticIdentityGroup staticIdentities](self, "staticIdentities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)removeEditingItem:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *staticIdentities;
  id v7;

  v7 = a3;
  if (!-[CNCardStaticIdentityGroup didChange](self, "didChange"))
  {
    objc_msgSend(v7, "identity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardStaticIdentityGroup setDidChange:](self, "setDidChange:", objc_msgSend(v4, "isEqualToString:", CFSTR(" ")) ^ 1);

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  staticIdentities = self->_staticIdentities;
  self->_staticIdentities = v5;

}

- (BOOL)isMultiValue
{
  return 0;
}

- (id)displayItems
{
  void *v2;
  void *v3;

  -[CNCardStaticIdentityGroup staticIdentities](self, "staticIdentities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", &__block_literal_global_36076);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)editingItems
{
  void *v2;
  id v3;
  CNCardStaticIdentityPlaceholderGroupItem *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[CNCardStaticIdentityGroup displayItems](self, "displayItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = v2;
  }
  else
  {
    v4 = objc_alloc_init(CNCardStaticIdentityPlaceholderGroupItem);
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)saveChangesToKTStore
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (!-[CNCardStaticIdentityGroup didChange](self, "didChange"))
    return 1;
  -[CNCardStaticIdentityGroup staticIdentities](self, "staticIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = (void *)MEMORY[0x1E0D13D68];
  if (v4)
  {
    -[CNCardStaticIdentityGroup staticIdentities](self, "staticIdentities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCardGroup contact](self, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "addStaticKeyWithPublicIDString:contact:", v7, v8);

  }
  else
  {
    -[CNCardGroup contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAccountKeyFromContact:", v6);
    v9 = 1;
  }

  self->_didChange = 0;
  return v9;
}

- (BOOL)didChange
{
  return self->_didChange;
}

- (void)setDidChange:(BOOL)a3
{
  self->_didChange = a3;
}

- (NSArray)staticIdentities
{
  return self->_staticIdentities;
}

- (void)setStaticIdentities:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticIdentities, 0);
}

CNCardStaticIdentityGroupItem *__41__CNCardStaticIdentityGroup_displayItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNCardStaticIdentityGroupItem *v3;

  v2 = a2;
  v3 = -[CNCardStaticIdentityGroupItem initWithIdentity:]([CNCardStaticIdentityGroupItem alloc], "initWithIdentity:", v2);

  return v3;
}

@end
