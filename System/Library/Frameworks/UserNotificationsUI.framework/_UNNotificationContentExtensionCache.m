@implementation _UNNotificationContentExtensionCache

- (_UNNotificationContentExtensionCache)init
{
  _UNNotificationContentExtensionCache *v2;
  uint64_t v3;
  NSMutableDictionary *extensions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionCache;
  v2 = -[_UNNotificationContentExtensionCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    extensions = v2->_extensions;
    v2->_extensions = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)extensionForNotificationSourceIdentifier:(id)a3 categoryIdentifier:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;

  v4 = 0;
  if (a3 && a4)
  {
    v7 = a4;
    v8 = a3;
    -[_UNNotificationContentExtensionCache extensions](self, "extensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v11, &v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      if (v12)
      {
        v13 = UNLogExtensions;
        if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR))
          -[_UNNotificationContentExtensionCache extensionForNotificationSourceIdentifier:categoryIdentifier:].cold.1((uint64_t)v11, (uint64_t)v12, v13);
      }

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)registerExtensions:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  os_log_t *v9;
  uint64_t v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  _UNNotificationContentExtensionCache *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_UNNotificationContentExtensionCache _removeAllExtensions](self, "_removeAllExtensions");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v24;
    v9 = (os_log_t *)&UNLogExtensions;
    *(_QWORD *)&v6 = 138543874;
    v20 = v6;
    v21 = self;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v12 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          objc_msgSend(v11, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "un_supportedCategoryIdentifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
          v16 = v9;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attributes");
          v18 = v8;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v20;
          v28 = v14;
          v29 = 2114;
          v30 = v17;
          v31 = 2114;
          v32 = v19;
          _os_log_impl(&dword_216870000, v13, OS_LOG_TYPE_DEFAULT, "Loaded extension %{public}@ for categories [ %{public}@ ] with attributes: %{public}@", buf, 0x20u);

          v8 = v18;
          v9 = v16;
          self = v21;

        }
        -[_UNNotificationContentExtensionCache _addExtension:](self, "_addExtension:", v11, v20);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v7);
  }

}

- (void)_addExtension:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "un_supportedCategoryIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "un_allowedSourceIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      obj = v5;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(obj);
          -[_UNNotificationContentExtensionCache _sourceDictForSource:](self, "_sourceDictForSource:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), obj);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v10 = v21;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v23;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v23 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
                objc_msgSend(v3, "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            }
            while (v12);
          }

        }
        v5 = obj;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }
  }
  else
  {
    v17 = (void *)UNLogExtensions;
    if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR))
      -[_UNNotificationContentExtensionCache _addExtension:].cold.1(v17, v3);
  }

}

- (void)_removeAllExtensions
{
  id v2;

  -[_UNNotificationContentExtensionCache extensions](self, "extensions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)_sourceDictForSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_UNNotificationContentExtensionCache extensions](self, "extensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !v6)
  {
    v6 = (void *)objc_opt_new();
    -[_UNNotificationContentExtensionCache extensions](self, "extensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v6, v4);

  }
  return v6;
}

- (NSMutableDictionary)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
}

- (void)extensionForNotificationSourceIdentifier:(os_log_t)log categoryIdentifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_216870000, log, OS_LOG_TYPE_ERROR, "Loaded extension %{public}@ failed: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_addExtension:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_216870000, v3, OS_LOG_TYPE_ERROR, "Could not find container bundle id for extension %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
