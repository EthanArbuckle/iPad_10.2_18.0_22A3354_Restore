@implementation CNCardGroup

- (NSString)title
{
  return self->_title;
}

- (BOOL)addSpacerFromPreviousGroup
{
  return self->_addSpacerFromPreviousGroup;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)displaysDropdownMenu
{
  return self->_displaysDropdownMenu;
}

- (CNCardGroup)initWithContact:(id)a3
{
  id v5;
  CNCardGroup *v6;
  CNCardGroup *v7;
  NSMutableArray *v8;
  NSMutableArray *actions;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNCardGroup;
  v6 = -[CNCardGroup init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v7->_actions;
    v7->_actions = v8;

  }
  return v7;
}

- (NSArray)actionItems
{
  NSArray *actionItems;
  NSArray *v4;
  NSArray *v5;

  actionItems = self->_actionItems;
  if (!actionItems)
  {
    -[CNCardGroup _loadActionItems](self, "_loadActionItems");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_actionItems;
    self->_actionItems = v4;

    actionItems = self->_actionItems;
  }
  return actionItems;
}

- (id)_loadActionItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNCardGroup useSplitActions](self, "useSplitActions"))
  {
    -[CNCardGroup actions](self, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = 0;
      do
      {
        -[CNCardGroup actions](self, "actions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        -[CNCardGroup actions](self, "actions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v6 + 1 >= v8)
        {
          v30 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v31[0] = v10;
          -[CNCardGroup actions](self, "actions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectAtIndexedSubscript:", v6 + 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v31[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        +[CNCardActionGroupItem actionGroupItemWithActions:](CNCardActionGroupItem, "actionGroupItemWithActions:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v15);

        v6 += 2;
        -[CNCardGroup actions](self, "actions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

      }
      while (v6 < v17);
    }
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[CNCardGroup actions](self, "actions", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          +[CNCardActionGroupItem actionGroupItemWithAction:](CNCardActionGroupItem, "actionGroupItemWithAction:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v22));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v23);

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v20);
    }

  }
  return v3;
}

- (NSArray)actions
{
  return &self->_actions->super;
}

- (BOOL)useSplitActions
{
  return self->_useSplitActions;
}

- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 transportType:(int64_t)a6
{
  -[CNCardGroup addAction:withTitle:color:glyphColor:transportType:](self, "addAction:withTitle:color:glyphColor:transportType:", a3, a4, a5, a5, a6);
}

- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 glyphColor:(id)a6 transportType:(int64_t)a7
{
  -[CNCardGroup addAction:withTitle:color:glyphColor:transportType:wrapTitle:](self, "addAction:withTitle:color:glyphColor:transportType:wrapTitle:", a3, a4, a5, a6, a7, 1);
}

- (void)addAction:(id)a3 withTitle:(id)a4
{
  -[CNCardGroup addAction:withTitle:wrapTitle:](self, "addAction:withTitle:wrapTitle:", a3, a4, 1);
}

- (void)setAddSpacerFromPreviousGroup:(BOOL)a3
{
  self->_addSpacerFromPreviousGroup = a3;
}

- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 glyphColor:(id)a6 transportType:(int64_t)a7 wrapTitle:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  NSArray *actionItems;
  id v20;

  v8 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[CNCardGroup removeActionWithTitle:](self, "removeActionWithTitle:", v16);
  +[CNContactAction contactActionWithTitle:target:selector:destructive:](CNContactAction, "contactActionWithTitle:target:selector:destructive:", v16, v17, sel_performActionWithSender_, objc_msgSend(v17, "isDestructive"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setColor:", v15);
  objc_msgSend(v20, "setGlyphColor:", v14);

  objc_msgSend(v20, "setTransportType:", a7);
  v18 = objc_msgSend(v17, "showBackgroundPlatter");

  objc_msgSend(v20, "setShowBackgroundPlatter:", v18);
  objc_msgSend(v20, "setWrapTitle:", v8);
  -[NSMutableArray addObject:](self->_actions, "addObject:", v20);
  actionItems = self->_actionItems;
  self->_actionItems = 0;

}

- (void)addAction:(id)a3 withTitle:(id)a4 wrapTitle:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSArray *actionItems;
  id v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[CNCardGroup removeActionWithTitle:](self, "removeActionWithTitle:", v9);
  objc_opt_class();
  v15 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v15;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v11, "menuProvider");
    v12 = objc_claimAutoreleasedReturnValue();
    +[CNContactMenuDisplayingAction contactActionWithTitle:menuProvider:destructive:](CNContactMenuDisplayingAction, "contactActionWithTitle:menuProvider:destructive:", v9, v12, objc_msgSend(v11, "isDestructive"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)v12;
  }
  else
  {
    +[CNContactAction contactActionWithTitle:target:selector:destructive:](CNContactAction, "contactActionWithTitle:target:selector:destructive:", v9, v15, sel_performActionWithSender_, objc_msgSend(v15, "isDestructive"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v13, "setWrapTitle:", v5);
  -[NSMutableArray addObject:](self->_actions, "addObject:", v13);
  actionItems = self->_actionItems;
  self->_actionItems = 0;

}

- (void)removeActionWithTitle:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  NSArray *actionItems;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_actions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "title", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[NSMutableArray removeObject:](self->_actions, "removeObject:", v10);
          actionItems = self->_actionItems;
          self->_actionItems = 0;

          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)setDisplaysDropdownMenu:(BOOL)a3
{
  self->_displaysDropdownMenu = a3;
}

- (void)removeActionWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t i;
  id v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  id v19;
  void *v20;
  _UNKNOWN **v21;
  char v22;
  uint64_t v23;
  id v24;
  const char *v25;
  NSArray *actionItems;
  CNCardGroup *v28;
  NSMutableArray *obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = self->_actions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    v10 = &off_1E203E000;
    v28 = self;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v12, "target");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v15 = v12;
        if ((isKindOfClass & 1) != 0)
        {
          v16 = v8;
          v17 = v9;
          v18 = a4;
          v19 = v6;
          objc_msgSend(v12, "target");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "target");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v10;
          objc_opt_class();
          v22 = objc_opt_isKindOfClass();

          if ((v22 & 1) != 0)
          {
            objc_msgSend(v15, "target");
            v23 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v23;
          }
          v10 = v21;
          v6 = v19;
          a4 = v18;
          v9 = v17;
          v8 = v16;
          self = v28;
        }
        -[CNCardGroup unwrappedTargetForAction:](self, "unwrappedTargetForAction:", v15, v28);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = -[CNCardGroup unwrappedSelectorForAction:](self, "unwrappedSelectorForAction:", v15);
        if (v24 == v6 && v25 == a4)
        {
          -[NSMutableArray removeObject:](self->_actions, "removeObject:", v12);
          actionItems = self->_actionItems;
          self->_actionItems = 0;

          goto LABEL_18;
        }

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_18:

}

- (NSArray)displayItems
{
  return 0;
}

- (NSArray)editingItems
{
  return 0;
}

- (id)addActionWithTitle:(id)a3 menuProvider:(id)a4 destructive:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a3;
  +[CNContactMenuDisplayingAction contactActionWithTitle:menuProvider:destructive:](CNContactMenuDisplayingAction, "contactActionWithTitle:menuProvider:destructive:", v8, a4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGroup addAction:withTitle:](self, "addAction:withTitle:", v9, v8);

  return v9;
}

- (id)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 destructive:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;

  v6 = a6;
  v10 = a3;
  +[CNContactAction contactActionWithTitle:target:selector:destructive:](CNContactAction, "contactActionWithTitle:target:selector:destructive:", v10, a4, a5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardGroup addAction:withTitle:](self, "addAction:withTitle:", v11, v10);

  return v11;
}

- (id)addActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5
{
  return -[CNCardGroup addActionWithTitle:target:selector:destructive:](self, "addActionWithTitle:target:selector:destructive:", a3, a4, a5, 0);
}

- (void)addAction:(id)a3 withTitle:(id)a4 color:(id)a5 transportType:(int64_t)a6 wrapTitle:(BOOL)a7
{
  -[CNCardGroup addAction:withTitle:color:glyphColor:transportType:wrapTitle:](self, "addAction:withTitle:color:glyphColor:transportType:wrapTitle:", a3, a4, a5, a5, a6, a7);
}

- (id)unwrappedTargetForAction:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v3, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "target");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (SEL)unwrappedSelectorForAction:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  const char *v7;

  v3 = a3;
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (const char *)objc_msgSend(v6, "action");
    v3 = v6;
  }
  else
  {
    v7 = (const char *)objc_msgSend(v3, "selector");
  }

  return v7;
}

- (void)removeAllActions
{
  NSArray *actionItems;

  -[NSMutableArray removeAllObjects](self->_actions, "removeAllObjects");
  actionItems = self->_actionItems;
  self->_actionItems = 0;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CNCardGroup actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %d actions"), v4, self, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void)setUseSplitActions:(BOOL)a3
{
  self->_useSplitActions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

+ (id)groupForContact:(id)a3
{
  id v3;
  CNCardGroup *v4;

  v3 = a3;
  v4 = -[CNCardGroup initWithContact:]([CNCardGroup alloc], "initWithContact:", v3);

  return v4;
}

@end
