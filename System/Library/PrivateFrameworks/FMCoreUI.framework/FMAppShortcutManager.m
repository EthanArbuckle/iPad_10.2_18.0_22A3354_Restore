@implementation FMAppShortcutManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_instance;
}

void __38__FMAppShortcutManager_sharedInstance__block_invoke()
{
  FMAppShortcutManager *v0;
  void *v1;

  v0 = objc_alloc_init(FMAppShortcutManager);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (void)setShortcutItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "shortcutItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
LABEL_19:

      goto LABEL_20;
    }
    v8 = objc_msgSend(v4, "count");

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogCategory_Unspecified();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[FMAppShortcutManager setShortcutItems:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v17 = v4;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v18)
      {
        v19 = v18;
        v27 = v6;
        v28 = v4;
        v20 = 0;
        v21 = *(_QWORD *)v30;
        do
        {
          v22 = 0;
          v23 = v20;
          do
          {
            if (*(_QWORD *)v30 != v21)
              objc_enumerationMutation(v17);
            v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v22);
            objc_msgSend(v24, "shortcutIdentifier", v27, v28, (_QWORD)v29);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v20, "length"))
            {
              LogCategory_Unspecified();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                -[FMAppShortcutManager setShortcutItems:].cold.1(v33, v24, &v34, v25);

              -[FMAppShortcutManager createShortcutForItem:](self, "createShortcutForItem:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v26);

            }
            ++v22;
            v23 = v20;
          }
          while (v19 != v22);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        }
        while (v19);

        v6 = v27;
        v4 = v28;
      }

      objc_msgSend(v6, "setShortcutItems:", v7);
      goto LABEL_19;
    }
  }
LABEL_20:

}

- (BOOL)hasShortcutItems
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortcutItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)setShortcutItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  FMAppShortcutManager *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(v5, "shortcutItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v4, "shortcutIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      v24 = self;
      v25 = v8;
      v26 = v6;
      v27 = v4;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v29;
        while (2)
        {
          v15 = 0;
          v16 = v13;
          do
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v15);
            objc_msgSend(v17, "userInfo", v24);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("FMShortcutItemIdentifierKey"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v9, "isEqualToString:", v18);

            if ((v19 & 1) != 0)
            {
              v20 = v17;

              if (v20)
                objc_msgSend(v10, "removeObject:", v20);
              goto LABEL_17;
            }
            ++v15;
            v16 = v13;
          }
          while (v12 != v15);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v12)
            continue;
          break;
        }
      }
      else
      {
        v13 = 0;
      }

      v20 = 0;
LABEL_17:
      v6 = v26;
      v4 = v27;
      -[FMAppShortcutManager createShortcutForItem:](v24, "createShortcutForItem:", v27, v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertObject:atIndex:", v21, 0);
      if ((unint64_t)objc_msgSend(v10, "count") < 5)
      {
        objc_msgSend(v26, "setShortcutItems:", v10);
      }
      else
      {
        objc_msgSend(v10, "subarrayWithRange:", 0, 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setShortcutItems:", v22);

      }
      v8 = v25;
      LogCategory_Unspecified();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[FMAppShortcutManager setShortcutItem:].cold.1(v27, v23);

    }
  }

}

- (void)removeShortcutItemWithIentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "shortcutItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v19 = v5;
      v11 = 0;
      v12 = *(_QWORD *)v21;
LABEL_4:
      v13 = 0;
      v14 = v11;
      while (1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        objc_msgSend(v15, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FMShortcutItemIdentifierKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v3, "isEqualToString:", v16);

        if ((v17 & 1) != 0)
          break;
        ++v13;
        v14 = v11;
        if (v10 == v13)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v10)
            goto LABEL_4;
          v18 = v8;
          v5 = v19;
          goto LABEL_14;
        }
      }
      v18 = v15;

      if (v18)
      {
        objc_msgSend(v8, "removeObject:", v18);
        v5 = v19;
        objc_msgSend(v19, "setShortcutItems:", v8);
        goto LABEL_14;
      }
      v5 = v19;
    }
    else
    {
      v11 = 0;
      v18 = v8;
LABEL_14:

    }
  }

}

- (id)createShortcutForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "shortcutUserInfo"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = (void *)objc_msgSend(v4, "mutableCopy"),
        v4,
        !v5))
  {
    v5 = (void *)objc_opt_new();
  }
  objc_msgSend(v3, "shortcutIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("FMShortcutItemIdentifierKey"));

  objc_msgSend(v3, "shortcutTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "shortcutSubTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "shortcutIconContact"), (v9 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v10 = (void *)v9,
        objc_msgSend(MEMORY[0x24BDF6838], "iconWithContact:", v9),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v3, "shortcutIconImage"), (v12 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v13 = (void *)v12,
          objc_msgSend(MEMORY[0x24BDF6838], "iconWithCustomImage:", v12),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v11))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "shortcutIconImageName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(MEMORY[0x24BDF6838], "iconWithTemplateImageName:", v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }
    }
  }
  v15 = objc_alloc(MEMORY[0x24BDF6BD8]);
  objc_msgSend(v3, "shortcutType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", v16, v7, v8, v11, v5);

  return v17;
}

- (void)clearShortcutItems
{
  OUTLINED_FUNCTION_0(&dword_20DBDA000, a1, a3, "All shortcut items are cleared", a5, a6, a7, a8, 0);
}

- (void)setShortcutItems:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "shortcutType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_20DBDA000, a4, OS_LOG_TYPE_DEBUG, "Item is - %@", a1, 0xCu);

}

- (void)setShortcutItems:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DBDA000, a1, a3, "Setting initial shortcut items.", a5, a6, a7, a8, 0);
}

- (void)setShortcutItem:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "shortcutIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_20DBDA000, a2, OS_LOG_TYPE_DEBUG, "New shortcut item passed - %@", (uint8_t *)&v4, 0xCu);

}

@end
