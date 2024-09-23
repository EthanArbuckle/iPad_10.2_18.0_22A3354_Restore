@implementation WFCNContactGroup

- (WFCNContactGroup)initWithCNGroup:(id)a3
{
  id v6;
  WFCNContactGroup *v7;
  WFCNContactGroup *v8;
  WFCNContactGroup *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCNContact.m"), 862, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("group"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFCNContactGroup;
  v7 = -[WFCNContactGroup init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_group, a3);
    v9 = v8;
  }

  return v8;
}

- (id)name
{
  void *v2;
  void *v3;

  -[WFCNContactGroup group](self, "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)contacts
{
  id CNContactClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  CNContactClass = getCNContactClass();
  -[WFCNContactGroup group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CNContactClass, "predicateForContactsInGroupWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  getCNContactStoreClass();
  v7 = (void *)objc_opt_new();
  +[WFCNContact requiredKeysToFetch](WFCNContact, "requiredKeysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "if_map:", &__block_literal_global_203);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (NSArray)cachedMembers
{
  NSArray *cachedMembers;
  id CNContactClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  cachedMembers = self->_cachedMembers;
  if (!cachedMembers)
  {
    CNContactClass = getCNContactClass();
    -[WFCNContactGroup group](self, "group");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CNContactClass, "predicateForContactsInGroupWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    getCNContactStoreClass();
    v8 = (void *)objc_opt_new();
    objc_msgSend(getCNContactFormatterClass(), "descriptorForRequiredKeysForStyle:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7, v10, 0);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_cachedMembers;
    self->_cachedMembers = v11;

    cachedMembers = self->_cachedMembers;
  }
  return cachedMembers;
}

- (BOOL)containsContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  char v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[WFCNContactGroup cachedMembers](self, "cachedMembers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "contact");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "isEqualToString:", v12);

          if ((v13 & 1) != 0)
          {
            LOBYTE(v14) = 1;
            goto LABEL_23;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v7)
          continue;
        break;
      }
    }
    LOBYTE(v14) = 0;
  }
  else
  {
    objc_msgSend(v4, "formattedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[WFCNContactGroup cachedMembers](self, "cachedMembers", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v14)
    {
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v15);
          objc_msgSend(getCNContactFormatterClass(), "stringFromContact:style:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v5);

          if ((v19 & 1) != 0)
          {
            LOBYTE(v14) = 1;
            goto LABEL_22;
          }
        }
        v14 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_22:

  }
LABEL_23:

  return v14;
}

- (CNGroup)group
{
  return self->_group;
}

- (void)setCachedMembers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMembers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMembers, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

WFCNContact *__28__WFCNContactGroup_contacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFCNContact contactWithCNContact:](WFCNContact, "contactWithCNContact:", a2);
}

+ (id)allContactGroups
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  if (WFCNContactAuthorizationStatus() != 3)
    return 0;
  getCNContactStoreClass();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "groupsMatchingPredicate:error:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__WFCNContactGroup_allContactGroups__block_invoke;
  v7[3] = &__block_descriptor_40_e20__24__0__CNGroup_8Q16l;
  v7[4] = a1;
  objc_msgSend(v4, "if_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contactGroupWithCNGroup:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCNGroup:", v4);

  return v5;
}

uint64_t __36__WFCNContactGroup_allContactGroups__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "contactGroupWithCNGroup:", a2);
}

@end
