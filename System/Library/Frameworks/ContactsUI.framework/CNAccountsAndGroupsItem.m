@implementation CNAccountsAndGroupsItem

- (CNAccountsAndGroupsItem)initWithType:(int64_t)a3 nameProvider:(id)a4
{
  id v6;
  CNAccountsAndGroupsItem *v7;
  void *v8;
  uint64_t v9;
  id nameProvider;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNAccountsAndGroupsItem;
  v7 = -[CNAccountsAndGroupsItem init](&v12, sel_init);
  v7->_type = a3;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    if (a3)
      goto LABEL_5;
    v8 = &__block_literal_global_29753;
  }
  v9 = objc_msgSend(v8, "copy");
  nameProvider = v7->_nameProvider;
  v7->_nameProvider = (id)v9;

LABEL_5:
  return v7;
}

- (BOOL)isEditable
{
  return -[CNAccountsAndGroupsItem canRename](self, "canRename")
      || -[CNAccountsAndGroupsItem canDelete](self, "canDelete");
}

- (BOOL)acceptsVCardDrop
{
  return -[CNAccountsAndGroupsItem type](self, "type") == 4
      || -[CNAccountsAndGroupsItem type](self, "type") == 2
      || -[CNAccountsAndGroupsItem type](self, "type") == 1;
}

- (BOOL)canShowContextMenu
{
  return -[CNAccountsAndGroupsItem type](self, "type") != 3;
}

- (BOOL)canEmail
{
  return -[CNAccountsAndGroupsItem type](self, "type") != 3
      && -[CNAccountsAndGroupsItem contactCount](self, "contactCount") >= 1
      && -[CNAccountsAndGroupsItem contactCount](self, "contactCount") < 101;
}

- (BOOL)canMessage
{
  return -[CNAccountsAndGroupsItem type](self, "type") != 3
      && -[CNAccountsAndGroupsItem contactCount](self, "contactCount") >= 1
      && -[CNAccountsAndGroupsItem contactCount](self, "contactCount") < 32;
}

- (BOOL)canExport
{
  return -[CNAccountsAndGroupsItem type](self, "type") != 3
      && -[CNAccountsAndGroupsItem contactCount](self, "contactCount") > 0;
}

- (BOOL)canRename
{
  return -[CNAccountsAndGroupsItem type](self, "type") == 4;
}

- (BOOL)canDelete
{
  return -[CNAccountsAndGroupsItem type](self, "type") == 4;
}

- (void)setChildItems:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_childItems != v5)
  {
    objc_storeStrong((id *)&self->_childItems, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setParentItem:", self, (_QWORD)v11);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setSelected:(BOOL)a3 affectingChildren:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_selected != a3)
  {
    v4 = a4;
    v5 = a3;
    -[CNAccountsAndGroupsItem willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selected"));
    self->_selected = v5;
    if (!self->_type)
    {
      CNContactsUIBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v5)
        v9 = CFSTR("HIDE_ALL_CONTACTS");
      else
        v9 = CFSTR("SHOW_ALL_CONTACTS");
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E20507A8, CFSTR("Localized"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAccountsAndGroupsItem setName:](self, "setName:", v10);

    }
    -[CNAccountsAndGroupsItem didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selected"));
    if (v4)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[CNAccountsAndGroupsItem childItems](self, "childItems", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "setSelected:affectingChildren:", v5, 1);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
    if (!v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_parentItem);
      objc_msgSend(WeakRetained, "setSelected:affectingChildren:", 0, 0);

    }
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  CNAccountsAndGroupsItem **p_parentItem;
  id WeakRetained;
  _BOOL4 v7;
  id v8;
  CNAccountsAndGroupsItem *v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_selected != a3)
  {
    v3 = a3;
    p_parentItem = &self->_parentItem;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentItem);
    if (objc_msgSend(WeakRetained, "isSelected"))
    {
      v7 = -[CNAccountsAndGroupsItem soloSelect](self, "soloSelect");

      if (v7)
      {
        v8 = objc_loadWeakRetained((id *)p_parentItem);
        objc_msgSend(v8, "setSelected:affectingChildren:", 0, 1);

        v9 = self;
        v10 = 1;
        v11 = 0;
LABEL_7:
        -[CNAccountsAndGroupsItem setSelected:affectingChildren:](v9, "setSelected:affectingChildren:", v10, v11);
        return;
      }
    }
    else
    {

    }
    v9 = self;
    v10 = v3;
    v11 = 1;
    goto LABEL_7;
  }
}

- (id)arrayForDisplay:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNAccountsAndGroupsItem shouldHide](self, "shouldHide"))
    objc_msgSend(v5, "addObject:", self);
  -[CNAccountsAndGroupsItem childItems](self, "childItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3 && objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "bypassIfUnique"))
    {
      objc_msgSend(v8, "childItems");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
    }

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "arrayForDisplay:", v3, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (NSString)name
{
  void *v3;
  void (**v4)(void);
  NSString *v5;
  NSString *name;

  if (!self->_name)
  {
    -[CNAccountsAndGroupsItem nameProvider](self, "nameProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CNAccountsAndGroupsItem nameProvider](self, "nameProvider");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      self->_name = v5;

    }
  }
  return self->_name;
}

- (int64_t)localizedCompare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[CNAccountsAndGroupsItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompare:", v6);
  return v7;
}

- (NSString)contactCountString
{
  void *v3;
  char v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[CNAccountsAndGroupsItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("groupPlaceholderIdentifier"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = -[CNAccountsAndGroupsItem type](self, "type");
    v5 = 0;
    if (v6 <= 4 && v6 != 3)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNAccountsAndGroupsItem contactCount](self, "contactCount"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", CFSTR("%@"), v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v5;
}

- (UIImage)groupSymbol
{
  unint64_t v2;

  v2 = -[CNAccountsAndGroupsItem type](self, "type");
  if (v2 > 4 || ((0x17u >> v2) & 1) == 0)
    return (UIImage *)0;
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", off_1E204B930[v2]);
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  CNAccountsAndGroupsItem *v4;
  int64_t v5;
  void *v6;
  CNAccountsAndGroupsItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = [CNAccountsAndGroupsItem alloc];
  v5 = -[CNAccountsAndGroupsItem type](self, "type");
  -[CNAccountsAndGroupsItem nameProvider](self, "nameProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNAccountsAndGroupsItem initWithType:nameProvider:](v4, "initWithType:nameProvider:", v5, v6);

  -[CNAccountsAndGroupsItem containerIdentifier](self, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsItem setContainerIdentifier:](v7, "setContainerIdentifier:", v8);

  -[CNAccountsAndGroupsItem setContactCount:](v7, "setContactCount:", -[CNAccountsAndGroupsItem contactCount](self, "contactCount"));
  -[CNAccountsAndGroupsItem childItems](self, "childItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsItem setChildItems:](v7, "setChildItems:", v9);

  -[CNAccountsAndGroupsItem parentItem](self, "parentItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsItem setParentItem:](v7, "setParentItem:", v10);

  -[CNAccountsAndGroupsItem setBypassIfUnique:](v7, "setBypassIfUnique:", -[CNAccountsAndGroupsItem bypassIfUnique](self, "bypassIfUnique"));
  -[CNAccountsAndGroupsItem setSoloSelect:](v7, "setSoloSelect:", -[CNAccountsAndGroupsItem soloSelect](self, "soloSelect"));
  -[CNAccountsAndGroupsItem identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsItem setIdentifier:](v7, "setIdentifier:", v11);

  -[CNAccountsAndGroupsItem setContainerType:](v7, "setContainerType:", -[CNAccountsAndGroupsItem containerType](self, "containerType"));
  -[CNAccountsAndGroupsItem setSelected:](v7, "setSelected:", -[CNAccountsAndGroupsItem isSelected](self, "isSelected"));
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (id)nameProvider
{
  return self->_nameProvider;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (CNGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerIdentifier, a3);
}

- (int64_t)containerType
{
  return self->_containerType;
}

- (void)setContainerType:(int64_t)a3
{
  self->_containerType = a3;
}

- (int64_t)contactCount
{
  return self->_contactCount;
}

- (void)setContactCount:(int64_t)a3
{
  self->_contactCount = a3;
}

- (NSArray)childItems
{
  return self->_childItems;
}

- (CNAccountsAndGroupsItem)parentItem
{
  return (CNAccountsAndGroupsItem *)objc_loadWeakRetained((id *)&self->_parentItem);
}

- (void)setParentItem:(id)a3
{
  objc_storeWeak((id *)&self->_parentItem, a3);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)bypassIfUnique
{
  return self->_bypassIfUnique;
}

- (void)setBypassIfUnique:(BOOL)a3
{
  self->_bypassIfUnique = a3;
}

- (BOOL)shouldHide
{
  return self->_shouldHide;
}

- (void)setShouldHide:(BOOL)a3
{
  self->_shouldHide = a3;
}

- (BOOL)soloSelect
{
  return self->_soloSelect;
}

- (void)setSoloSelect:(BOOL)a3
{
  self->_soloSelect = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentItem);
  objc_storeStrong((id *)&self->_childItems, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_nameProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

id __53__CNAccountsAndGroupsItem_initWithType_nameProvider___block_invoke()
{
  void *v0;
  void *v1;

  CNContactsUIBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("ALL_CONTACTS_FOR_ACCOUNT"), &stru_1E20507A8, CFSTR("Localized"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
