@implementation CNUICoreContactsAuthorizationModel

- (CNUICoreContactsAuthorizationModel)init
{
  CNUICoreContactsAuthorizationModel *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactsAuthorizationModel)initWithItems:(id)a3
{
  id v5;
  void *v6;
  CNUICoreContactsAuthorizationModel *v7;
  CNUICoreContactsAuthorizationModel *v8;
  CNUICoreContactsAuthorizationModel *v9;
  id v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("parameter ‘items’ must be nonnull"), 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)CNUICoreContactsAuthorizationModel;
  v7 = -[CNUICoreContactsAuthorizationModel init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_items, a3);
    v9 = v8;
  }

  return v8;
}

- (CNUICoreContactsAuthorizationModel)initWithCoder:(id)a3
{
  id v4;
  CNUICoreContactsAuthorizationModel *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *items;
  CNUICoreContactsAuthorizationModel *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNUICoreContactsAuthorizationModel;
  v5 = -[CNUICoreContactsAuthorizationModel init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_items"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    items = v5->_items;
    v5->_items = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_items, CFSTR("_items"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;
  CNUICoreContactsAuthorizationModel *v5;

  -[CNUICoreContactsAuthorizationModel items](self, "items", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_map:", &__block_literal_global_337);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[CNUICoreContactsAuthorizationModel initWithItems:]([CNUICoreContactsAuthorizationModel alloc], "initWithItems:", v4);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CNUICoreContactsAuthorizationModel *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = (CNUICoreContactsAuthorizationModel *)a3;
  v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v5 = (unint64_t)-[CNUICoreContactsAuthorizationModel items](self, "items"),
          v6 = (unint64_t)-[CNUICoreContactsAuthorizationModel items](v4, "items"),
          v5 | v6)
      && !objc_msgSend((id)v5, "isEqual:", v6))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)MEMORY[0x1E0D13A78];
  -[CNUICoreContactsAuthorizationModel items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "arrayHash:", v3) + 527;

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactsAuthorizationModel items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("items"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)changedItems
{
  void *v2;
  void *v3;

  -[CNUICoreContactsAuthorizationModel items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_filter:", &__block_literal_global_15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)remoteItems
{
  void *v2;
  void *v3;

  -[CNUICoreContactsAuthorizationModel items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_filter:", &__block_literal_global_16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)bundleIdentifiers
{
  void *v2;
  void *v3;

  -[CNUICoreContactsAuthorizationModel items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cn_map:", &__block_literal_global_18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isEmpty
{
  uint64_t v2;
  void *v3;

  v2 = *MEMORY[0x1E0D137F8];
  -[CNUICoreContactsAuthorizationModel items](self, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v2;
}

- (id)itemWithMatchingBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[CNUICoreContactsAuthorizationModel items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__CNUICoreContactsAuthorizationModel_itemWithMatchingBundleIdentifier___block_invoke;
  v9[3] = &unk_1E2047BB8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)modelByCopyingItemsWithBundleIdentifier:(id)a3
{
  void *v3;
  CNUICoreContactsAuthorizationModel *v4;
  CNUICoreContactsAuthorizationModel *v5;
  void *v6;
  void *v7;
  CNUICoreContactsAuthorizationModel *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CNUICoreContactsAuthorizationModel itemWithMatchingBundleIdentifier:](self, "itemWithMatchingBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [CNUICoreContactsAuthorizationModel alloc];
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_msgSend(v3, "copy");
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNUICoreContactsAuthorizationModel initWithItems:](v5, "initWithItems:", v7);

  }
  else
  {
    v8 = -[CNUICoreContactsAuthorizationModel initWithItems:](v4, "initWithItems:", MEMORY[0x1E0C9AA60]);
  }

  return v8;
}

- (id)modelByCopyingIconsOfRemoteItemsFromModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  CNUICoreContactsAuthorizationModel *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[CNUICoreContactsAuthorizationModel items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__CNUICoreContactsAuthorizationModel_modelByCopyingIconsOfRemoteItemsFromModel___block_invoke;
  v10[3] = &unk_1E2048090;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CNUICoreContactsAuthorizationModel initWithItems:]([CNUICoreContactsAuthorizationModel alloc], "initWithItems:", v7);
  return v8;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

id __80__CNUICoreContactsAuthorizationModel_modelByCopyingIconsOfRemoteItemsFromModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWithMatchingBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemBySettingIcon:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

uint64_t __71__CNUICoreContactsAuthorizationModel_itemWithMatchingBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __55__CNUICoreContactsAuthorizationModel_bundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

BOOL __49__CNUICoreContactsAuthorizationModel_remoteItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceType") == 1;
}

uint64_t __50__CNUICoreContactsAuthorizationModel_changedItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasChanges");
}

id __51__CNUICoreContactsAuthorizationModel_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copy");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
