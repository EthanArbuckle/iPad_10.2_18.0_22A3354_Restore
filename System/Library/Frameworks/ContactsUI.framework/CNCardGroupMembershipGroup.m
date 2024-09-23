@implementation CNCardGroupMembershipGroup

- (id)title
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  v3 = *MEMORY[0x1E0D137F8];
  -[CNCardGroupMembershipGroup parentGroups](self, "parentGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if ((v3 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[CNCardGroupMembershipGroup parentGroups](self, "parentGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 1)
      v10 = CFSTR("GROUP_MEMBERSHIP_TABLE_SECTION_TITLE_ONE");
    else
      v10 = CFSTR("GROUP_MEMBERSHIP_TABLE_SECTION_TITLE_MANY");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E20507A8, CFSTR("Localized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)displayItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGroupMembershipGroup parentGroupItems](self, "parentGroupItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CNCardGroup actionItems](self, "actionItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)editingItems
{
  void *v3;
  void *v4;
  CNCardGroupMembershipPlaceholderGroupItem *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGroupMembershipGroup groupItemsToDisplayForEditing](self, "groupItemsToDisplayForEditing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);
  v5 = objc_alloc_init(CNCardGroupMembershipPlaceholderGroupItem);
  objc_msgSend(v3, "addObject:", v5);

  return v3;
}

- (id)parentGroupItems
{
  void *v3;
  void *v4;
  void *v5;

  -[CNCardGroupMembershipGroup parentGroups](self, "parentGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNCardGroupMembershipGroup parentGroups](self, "parentGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_cn_map:", &__block_literal_global_29788);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (id)groupItemsToDisplayForEditing
{
  void *v3;
  void *v4;
  void *v5;

  -[CNCardGroupMembershipGroup groupsToDisplayForEditing](self, "groupsToDisplayForEditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNCardGroupMembershipGroup groupsToDisplayForEditing](self, "groupsToDisplayForEditing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_cn_map:", &__block_literal_global_10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (NSArray)parentGroups
{
  return self->_parentGroups;
}

- (void)setParentGroups:(id)a3
{
  objc_storeStrong((id *)&self->_parentGroups, a3);
}

- (NSArray)groupsToDisplayForEditing
{
  return self->_groupsToDisplayForEditing;
}

- (void)setGroupsToDisplayForEditing:(id)a3
{
  objc_storeStrong((id *)&self->_groupsToDisplayForEditing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsToDisplayForEditing, 0);
  objc_storeStrong((id *)&self->_parentGroups, 0);
}

CNCardGroupMembershipGroupItem *__59__CNCardGroupMembershipGroup_groupItemsToDisplayForEditing__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNCardGroupMembershipGroupItem *v3;

  v2 = a2;
  v3 = -[CNCardGroupMembershipGroupItem initWithGroup:]([CNCardGroupMembershipGroupItem alloc], "initWithGroup:", v2);

  return v3;
}

CNCardGroupMembershipGroupItem *__46__CNCardGroupMembershipGroup_parentGroupItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNCardGroupMembershipGroupItem *v3;

  v2 = a2;
  v3 = -[CNCardGroupMembershipGroupItem initWithGroup:]([CNCardGroupMembershipGroupItem alloc], "initWithGroup:", v2);

  return v3;
}

@end
