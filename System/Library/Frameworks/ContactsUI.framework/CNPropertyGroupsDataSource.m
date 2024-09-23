@implementation CNPropertyGroupsDataSource

- (CNPropertyGroupsDataSource)initWithMutableContact:(id)a3 contactStore:(id)a4 policy:(id)a5 linkedPolicies:(id)a6 prohibitedKeys:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CNPropertyGroupsDataSource *v17;
  CNPropertyGroupsDataSource *v18;
  CNPropertyGroupsDataSource *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CNPropertyGroupsDataSource;
  v17 = -[CNPropertyGroupsDataSource init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mutableContact, a3);
    objc_storeStrong((id *)&v18->_contactStore, a4);
    objc_storeStrong((id *)&v18->_policy, a5);
    objc_storeStrong((id *)&v18->_linkedPoliciesByContactIdentifier, a6);
    objc_storeStrong((id *)&v18->_prohibitedPropertyKeys, a7);
    v19 = v18;
  }

  return v18;
}

- (void)buildPropertyGroups
{
  void *v3;
  void (**v4)(void *, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD aBlock[5];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CNPropertyGroupsDataSource_buildPropertyGroups__block_invoke;
  aBlock[3] = &unk_1E204FD70;
  aBlock[4] = self;
  v16 = v3;
  v22 = v16;
  v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[CNContactView allCardProperties](CNContactView, "allCardProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = *MEMORY[0x1E0C966A0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", v9))
        {
          v12 = (void *)MEMORY[0x1E0C972D8];
          -[CNPropertyGroupsDataSource mutableContact](self, "mutableContact");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v12) = objc_msgSend(v12, "isWhitelistedContact:", v13);

          if (!(_DWORD)v12)
            continue;
        }
        -[CNPropertyGroupsDataSource prohibitedPropertyKeys](self, "prohibitedPropertyKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v11);

        if ((v15 & 1) == 0)
          v4[2](v4, v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  v4[2](v4, (void *)*MEMORY[0x1E0C96800]);
  -[CNPropertyGroupsDataSource setPropertyGroups:](self, "setPropertyGroups:", v16);

}

- (Class)groupClassForProperty:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96680]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96888]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96800]) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C966A0]);
  }
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (id)propertyGroupsForKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[CNPropertyGroupsDataSource propertyGroups](self, "propertyGroups", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)allDisplayPropertyItemsForPropertyKeys:(id)a3
{
  void *v4;
  void *v5;

  -[CNPropertyGroupsDataSource propertyGroupsForKeys:](self, "propertyGroupsForKeys:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupsDataSource allDisplayPropertyItemsFromGroups:](self, "allDisplayPropertyItemsFromGroups:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allDisplayPropertyItemsFromGroups:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v9, "displayItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v4, "addObject:", v15);
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  return v4;
}

- (NSDictionary)propertyGroups
{
  return self->_propertyGroups;
}

- (void)setPropertyGroups:(id)a3
{
  objc_storeStrong((id *)&self->_propertyGroups, a3);
}

- (CNMutableContact)mutableContact
{
  return self->_mutableContact;
}

- (void)setMutableContact:(id)a3
{
  objc_storeStrong((id *)&self->_mutableContact, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (CNPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (NSDictionary)linkedPoliciesByContactIdentifier
{
  return self->_linkedPoliciesByContactIdentifier;
}

- (void)setLinkedPoliciesByContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, a3);
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_linkedPoliciesByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_mutableContact, 0);
  objc_storeStrong((id *)&self->_propertyGroups, 0);
}

void __49__CNPropertyGroupsDataSource_buildPropertyGroups__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "policy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cnui_maximumNumberOfValuesForProperty:", v11);

  if (v4)
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "groupClassForProperty:", v11);
    objc_msgSend(*(id *)(a1 + 32), "mutableContact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "policy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "linkedPoliciesByContactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupForProperty:contact:store:policy:linkedPolicies:", v11, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v11);
  }

}

@end
