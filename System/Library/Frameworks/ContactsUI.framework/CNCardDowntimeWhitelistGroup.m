@implementation CNCardDowntimeWhitelistGroup

- (id)displayItems
{
  return 0;
}

- (id)editingItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C972D8];
  -[CNCardGroup contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isWhitelistedContact:", v4);

  if (!(_DWORD)v3)
    return 0;
  -[CNCardGroup contact](self, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPropertyGroupItem propertyGroupItemWithLabel:group:contact:](CNCardDowntimeWhitelistGroupItem, "propertyGroupItemWithLabel:group:contact:", &stru_1E20507A8, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)modified
{
  return 0;
}

- (id)policyForItem:(id)a3
{
  return objc_alloc_init(CNReadonlyPolicy);
}

- (BOOL)isMultiValue
{
  return 0;
}

@end
