@implementation _WDMultiSelectManualEntryItem

- (id)tableViewCells
{
  NSArray *tableViewCells;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v22;
  NSArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  tableViewCells = self->_tableViewCells;
  if (!tableViewCells)
  {
    v22 = 40;
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = self->_titles;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      v8 = *MEMORY[0x1E0DC4A88];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v9);
          -[WDAddDataManualEntryItem _createUITableViewCell](self, "_createUITableViewCell", v22);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "textLabel");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setText:", v10);

          objc_msgSend(v11, "textLabel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setFont:", v14);

          objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = CFSTR("AddData.ValueCell");
          v28[1] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          HKUIJoinStringsForAutomationIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setAccessibilityIdentifier:", v17);

          objc_msgSend(v4, "addObject:", v11);
          ++v9;
        }
        while (v6 != v9);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v6);
    }

    v18 = *(Class *)((char *)&self->super.super.isa + v22);
    *(Class *)((char *)&self->super.super.isa + v22) = (Class)v4;
    v19 = v4;

    objc_msgSend(*(id *)((char *)&self->super.super.isa + v22), "objectAtIndexedSubscript:", self->_selectedIndex);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setAccessoryType:", 3);
    tableViewCells = *(NSArray **)((char *)&self->super.super.isa + v22);
  }
  return tableViewCells;
}

- (void)cellForItemTapped:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_tableViewCells;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v10 == v4)
        {
          v10 = v4;
          v11 = 3;
        }
        else
        {
          v11 = 0;
        }
        objc_msgSend(v10, "setAccessoryType:", v11, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[WDAddDataManualEntryItem _didUpdateValue](self, "_didUpdateValue");
}

- (id)generateValue
{
  NSArray *tableViewCells;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  tableViewCells = self->_tableViewCells;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46___WDMultiSelectManualEntryItem_generateValue__block_invoke;
  v5[3] = &unk_1E55754F0;
  v5[4] = &v6;
  -[NSArray enumerateObjectsUsingBlock:](tableViewCells, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setTitles:(id)a3
{
  objc_storeStrong((id *)&self->_titles, a3);
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_tableViewCells, 0);
}

@end
