@implementation _FEFocusEnvironmentPreferenceCache

- (_FEFocusEnvironmentPreferenceCache)init
{
  _FEFocusEnvironmentPreferenceCache *v2;
  uint64_t v3;
  NSMapTable *environmentsMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_FEFocusEnvironmentPreferenceCache;
  v2 = -[_FEFocusEnvironmentPreferenceCache init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 514, 512);
    v3 = objc_claimAutoreleasedReturnValue();
    environmentsMap = v2->_environmentsMap;
    v2->_environmentsMap = (NSMapTable *)v3;

  }
  return v2;
}

- (id)preferredEnvironmentsForEnvironment:(id)a3 isFinal:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[_FEFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "isResolved"))
    {
      if (a4)
        *a4 = 1;
      objc_msgSend(v8, "resolvedEnvironment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "resolvedEnvironment");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = (void *)MEMORY[0x24BDBD1A8];
      }
    }
    else
    {
      if (a4)
        *a4 = 0;
      objc_msgSend(v8, "childNodes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bs_map:", &__block_literal_global_9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setResolvedPreference:(id)a3 forEnvironment:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  -[_FEFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceCache.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node != nil"));

  }
  objc_msgSend(v9, "resolve:", v11);

}

- (void)setPreferredEnvironments:(id)a3 forEnvironment:(id)a4
{
  id v7;
  void *v8;
  _FEFocusEnvironmentPreferenceCacheNode *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _FEFocusEnvironmentPreferenceCache *v27;

  v24 = a3;
  v7 = a4;
  -[_FEFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (_FEFocusEnvironmentPreferenceCacheNode *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = -[_FEFocusEnvironmentPreferenceCacheNode initWithEnvironment:]([_FEFocusEnvironmentPreferenceCacheNode alloc], "initWithEnvironment:", v7);
    -[_FEFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v7);

  }
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __78___FEFocusEnvironmentPreferenceCache_setPreferredEnvironments_forEnvironment___block_invoke;
  v25[3] = &unk_250D3A8F0;
  v11 = v7;
  v26 = v11;
  v27 = self;
  objc_msgSend(v24, "bs_compactMap:", v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEFocusEnvironmentPreferenceCacheNode childNodes](v9, "childNodes");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[_FEFocusEnvironmentPreferenceCacheNode childNodes](v9, "childNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToArray:", v12);

    if ((v16 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_FEFocusEnvironmentPreferenceCacheNode environment](v9, "environment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)MEMORY[0x24BDD17C8];
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v18);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = CFSTR("(nil)");
      }
      -[_FEFocusEnvironmentPreferenceCacheNode childNodes](v9, "childNodes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusEnvironmentPreferenceCache.m"), 80, CFSTR("Modifying preferred environments for an environment. This indicates an unstable PFE chain. Results might be unreliable. Environment %@ had these childs before:\n%@\nnow has:\n%@"), v22, v23, v12);

    }
  }
  -[_FEFocusEnvironmentPreferenceCacheNode setChildNodes:](v9, "setChildNodes:", v12);

}

- (id)deepestPrimaryPreferredEnvironmentForEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[_FEFocusEnvironmentPreferenceCache environmentsMap](self, "environmentsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "childNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    do
    {
      objc_msgSend(v6, "childNodes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "childNodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      v6 = v10;
    }
    while (v12);
  }
  else
  {
    v10 = v6;
  }
  objc_msgSend(v10, "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSMapTable)environmentsMap
{
  return self->_environmentsMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentsMap, 0);
}

@end
