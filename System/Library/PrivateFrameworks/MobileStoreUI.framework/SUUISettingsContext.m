@implementation SUUISettingsContext

- (SUUISettingsContext)initWithClientContext:(id)a3
{
  id v4;
  SUUISettingsContext *v5;
  SUUISettingsContext *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *elementTypeClass;
  NSMutableArray *v9;
  NSMutableArray *descriptionReusePool;
  NSMutableArray *v11;
  NSMutableArray *viewReusePool;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUISettingsContext;
  v5 = -[SUUISettingsContext init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_clientContext, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    elementTypeClass = v6->_elementTypeClass;
    v6->_elementTypeClass = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    descriptionReusePool = v6->_descriptionReusePool;
    v6->_descriptionReusePool = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    viewReusePool = v6->_viewReusePool;
    v6->_viewReusePool = v11;

    -[SUUISettingsContext _registerReuseClasses](v6, "_registerReuseClasses");
  }

  return v6;
}

- (id)dequeueReusableSettingDescriptionForViewElement:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "elementType");
  switch(v8)
  {
    case 'o':
      v9 = CFSTR("editProfile");
      goto LABEL_8;
    case 'p':
      v9 = CFSTR("family");
      goto LABEL_8;
    case 'q':
      v9 = CFSTR("field");
      goto LABEL_8;
    case 'r':
      v9 = CFSTR("profile");
      goto LABEL_8;
    default:
      if (v8 == 66)
      {
        v9 = CFSTR("default");
LABEL_8:
        -[SUUISettingsContext _dequeueReusableSettingDescriptionWithReuseIdentifier:forViewElement:parent:](self, "_dequeueReusableSettingDescriptionWithReuseIdentifier:forViewElement:parent:", v9, v6, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

      return v10;
  }
}

- (void)recycleSettingDescriptions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableArray addObject:](self->_descriptionReusePool, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)_dequeueReusableSettingDescriptionWithReuseIdentifier:(id)a3 forViewElement:(id)a4 parent:(id)a5
{
  id v8;
  NSMutableArray *descriptionReusePool;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  descriptionReusePool = self->_descriptionReusePool;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __99__SUUISettingsContext__dequeueReusableSettingDescriptionWithReuseIdentifier_forViewElement_parent___block_invoke;
  v17[3] = &unk_2511FA778;
  v18 = v8;
  v10 = v8;
  v11 = a5;
  v12 = a4;
  v13 = -[NSMutableArray indexOfObjectPassingTest:](descriptionReusePool, "indexOfObjectPassingTest:", v17);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = (void *)objc_msgSend(objc_alloc((Class)(id)-[NSMutableDictionary objectForKey:](self->_elementTypeClass, "objectForKey:", v10)), "initWithViewElement:parent:", v12, v11);

    objc_setAssociatedObject(v14, "com.apple.iTunesStoreUI.SUUISettingsContext.reuseIdentifier", v10, (void *)1);
  }
  else
  {
    v15 = v13;
    -[NSMutableArray objectAtIndex:](self->_descriptionReusePool, "objectAtIndex:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_descriptionReusePool, "removeObjectAtIndex:", v15);
    objc_msgSend(v14, "reloadWithViewElement:parent:", v12, v11);

  }
  return v14;
}

uint64_t __99__SUUISettingsContext__dequeueReusableSettingDescriptionWithReuseIdentifier_forViewElement_parent___block_invoke(uint64_t a1, id object)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_getAssociatedObject(object, "com.apple.iTunesStoreUI.SUUISettingsContext.reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));
  else
    v5 = 0;

  return v5;
}

- (void)_registerReuseClasses
{
  -[SUUISettingsContext _registerClass:forReuseIdentifier:](self, "_registerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("default"));
  -[SUUISettingsContext _registerClass:forReuseIdentifier:](self, "_registerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("editProfile"));
  -[SUUISettingsContext _registerClass:forReuseIdentifier:](self, "_registerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("family"));
  -[SUUISettingsContext _registerClass:forReuseIdentifier:](self, "_registerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("field"));
  -[SUUISettingsContext _registerClass:forReuseIdentifier:](self, "_registerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("profile"));
}

- (void)_registerClass:(Class)a3 forReuseIdentifier:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_elementTypeClass, "setObject:forKey:", a3, a4);
}

- (SUUIClientContext)clientContext
{
  return (SUUIClientContext *)objc_loadWeakRetained((id *)&self->_clientContext);
}

- (void)setClientContext:(id)a3
{
  objc_storeWeak((id *)&self->_clientContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientContext);
  objc_storeStrong((id *)&self->_viewReusePool, 0);
  objc_storeStrong((id *)&self->_descriptionReusePool, 0);
  objc_storeStrong((id *)&self->_elementTypeClass, 0);
}

@end
