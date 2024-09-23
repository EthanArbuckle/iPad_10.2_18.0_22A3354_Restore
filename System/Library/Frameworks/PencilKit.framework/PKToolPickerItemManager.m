@implementation PKToolPickerItemManager

- (id)initWithToolItems:(id *)a1
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)PKToolPickerItemManager;
    a1 = (id *)objc_msgSendSuper2(&v22, sel_init);
    if (a1)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = a1[2];
      a1[2] = v4;

      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = a1[1];
      a1[1] = v6;

      v8 = v3;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v9)
        goto LABEL_15;
      v10 = v9;
      v21 = v3;
      v11 = 0;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[1], "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            objc_msgSend(a1[1], "setObject:forKeyedSubscript:", v14, v15);
            objc_msgSend(a1[2], "addObject:", v14);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            v11 += (objc_opt_isKindOfClass() & 1) == 0;
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
      v3 = v21;
      if (!v11)
      {
LABEL_15:
        +[PKToolPickerInkingItem _defaultInkingItemForType:]((uint64_t)PKToolPickerInkingItem, CFSTR("com.apple.ink.pen"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[2], "addObject:", v17);
        v18 = a1[1];
        objc_msgSend(v17, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

      }
    }
  }

  return a1;
}

- (id)itemForTool:(id *)a1
{
  id *v2;
  id v3;
  void *v4;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "_toolPickerItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2[1], "objectForKeyedSubscript:", v4);
    v2 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "set_tool:", v3);

  }
  return v2;
}

- (void)_addTool:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "_toolPickerItemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "_toolPickerItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 8), "setObject:forKeyedSubscript:", v6, v5);
      if (!v6)
      {
        v7 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = 136315138;
          v9 = "item";
          _os_log_error_impl(&dword_1BE213000, v7, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v8, 0xCu);
        }

        v6 = 0;
      }
    }
    objc_msgSend(v6, "set_tool:", v4);

  }
}

- (void)_removeTool:(uint64_t)a1
{
  void *v2;
  id v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    objc_msgSend(a2, "_toolPickerItemIdentifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectForKey:", v3);

  }
}

- (id)toolForIdentifier:(uint64_t)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_tool");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)toolItemsForTools:(id *)a1
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          -[PKToolPickerItemManager itemForTool:](a1, *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    a1 = (id *)objc_msgSend(v4, "copy");
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueItemsForSetup, 0);
  objc_storeStrong((id *)&self->_itemMap, 0);
}

@end
