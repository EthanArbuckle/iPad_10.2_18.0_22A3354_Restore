@implementation INRelevantShortcut

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  INImageProxyInjectionOperation *v15;
  void *v16;
  INImageProxyInjectionOperation *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (void *)-[INRelevantShortcut copy](self, "copy");
    v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    INImageProxyInjectionQueue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnderlyingQueue:", v10);

    objc_msgSend(v9, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(v9, "setSuspended:", 1);
    v11 = (void *)MEMORY[0x1E0CB34C8];
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v20[3] = &unk_1E2293BE8;
    v20[4] = v8;
    v21 = v7;
    objc_msgSend(v11, "blockOperationWithBlock:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INRelevantShortcut shortcut](self, "shortcut");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = objc_alloc_init(INImageProxyInjectionOperation);
      -[INImageProxyInjectionOperation setInjector:](v15, "setInjector:", v14);
      -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v15, "setImageProxyRequestBlock:", v6);
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
      v19[3] = &unk_1E22924C0;
      v19[4] = v8;
      -[INImageProxyInjectionOperation setCopyReturnBlock:](v15, "setCopyReturnBlock:", v19);
      objc_msgSend(v13, "addDependency:", v15);
      objc_msgSend(v9, "addOperation:", v15);

    }
    -[INRelevantShortcut watchTemplate](self, "watchTemplate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc_init(INImageProxyInjectionOperation);
      -[INImageProxyInjectionOperation setInjector:](v17, "setInjector:", v16);
      -[INImageProxyInjectionOperation setImageProxyRequestBlock:](v17, "setImageProxyRequestBlock:", v6);
      v18[0] = v12;
      v18[1] = 3221225472;
      v18[2] = __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3;
      v18[3] = &unk_1E22924C0;
      v18[4] = v8;
      -[INImageProxyInjectionOperation setCopyReturnBlock:](v17, "setCopyReturnBlock:", v18);
      objc_msgSend(v13, "addDependency:", v17);
      objc_msgSend(v9, "addOperation:", v17);

    }
    objc_msgSend(v9, "addOperation:", v13);
    objc_msgSend(v9, "setSuspended:", 0);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[INRelevantShortcut relevanceProviders](self, "relevanceProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRelevanceProviders:", v5);

  -[INRelevantShortcut watchTemplate](self, "watchTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWatchTemplate:", v6);

  -[INRelevantShortcut widgetKind](self, "widgetKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidgetKind:", v7);

  -[INRelevantShortcut shortcut](self, "shortcut");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShortcut:", v8);

  objc_msgSend(v4, "setShortcutRole:", -[INRelevantShortcut shortcutRole](self, "shortcutRole"));
  return v4;
}

- (INDefaultCardTemplate)watchTemplate
{
  return self->_watchTemplate;
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (void)setWatchTemplate:(INDefaultCardTemplate *)watchTemplate
{
  objc_setProperty_nonatomic_copy(self, a2, watchTemplate, 16);
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (INRelevantShortcutRole)shortcutRole
{
  return self->_shortcutRole;
}

- (void)setWidgetKind:(NSString *)widgetKind
{
  objc_setProperty_nonatomic_copy(self, a2, widgetKind, 24);
}

- (void)setShortcutRole:(INRelevantShortcutRole)shortcutRole
{
  self->_shortcutRole = shortcutRole;
}

- (void)setShortcut:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRelevanceProviders:(NSArray *)relevanceProviders
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  NSArray *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = relevanceProviders;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v34[0] = objc_opt_class();
        v34[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "arrayByAddingObject:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (!v12)
        {
LABEL_18:

          v18 = (void *)MEMORY[0x1E0CB3940];
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("\"%@\" is not a valid relevance provider class"), v20);
          v21 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v22);
        }
        v13 = v12;
        v14 = *(_QWORD *)v29;
LABEL_8:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          if ((objc_msgSend(v8, "isMemberOfClass:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15)) & 1) != 0)
            break;
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
            if (!v13)
              goto LABEL_18;
            goto LABEL_8;
          }
        }

      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v5);
  }

  v16 = (NSArray *)-[NSArray copy](v3, "copy");
  v17 = self->_relevanceProviders;
  self->_relevanceProviders = v16;

}

- (NSArray)relevanceProviders
{
  return self->_relevanceProviders;
}

- (INRelevantShortcut)init
{
  INShortcut *v3;
  void *v4;
  id v5;
  INRelevantShortcut *v6;

  v3 = [INShortcut alloc];
  v4 = (void *)objc_opt_new();
  v5 = -[INShortcut _initWithIntent:](v3, "_initWithIntent:", v4);
  v6 = -[INRelevantShortcut initWithShortcut:](self, "initWithShortcut:", v5);

  return v6;
}

- (INRelevantShortcut)initWithShortcut:(INShortcut *)shortcut
{
  INShortcut *v4;
  INRelevantShortcut *v5;
  uint64_t v6;
  INShortcut *v7;
  uint64_t v8;
  NSArray *relevanceProviders;
  INRelevantShortcut *v10;
  objc_super v12;

  v4 = shortcut;
  v12.receiver = self;
  v12.super_class = (Class)INRelevantShortcut;
  v5 = -[INRelevantShortcut init](&v12, sel_init);
  if (v5)
  {
    v6 = -[INShortcut copy](v4, "copy");
    v7 = v5->_shortcut;
    v5->_shortcut = (INShortcut *)v6;

    v8 = objc_opt_new();
    relevanceProviders = v5->_relevanceProviders;
    v5->_relevanceProviders = (NSArray *)v8;

    v5->_shortcutRole = 0;
    v10 = v5;
  }

  return v5;
}

- (INImage)_keyImage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[INRelevantShortcut watchTemplate](self, "watchTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_keyImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[INRelevantShortcut shortcut](self, "shortcut");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_keyImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (INImage *)v6;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_keyImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_keyImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = 1;
    else
      v9 = -1;
  }
  else
  {
    if (v8)
      v10 = -1;
    else
      v10 = 0;
    if (v7)
      v9 = 1;
    else
      v9 = v10;
  }

  return v9;
}

- (INRelevantShortcut)initWithCoder:(id)a3
{
  id v4;
  INRelevantShortcut *v5;
  uint64_t v6;
  INShortcut *shortcut;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *relevanceProviders;
  uint64_t v13;
  INDefaultCardTemplate *watchTemplate;
  uint64_t v15;
  NSString *widgetKind;
  INRelevantShortcut *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INRelevantShortcut;
  v5 = -[INRelevantShortcut init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcut"));
    v6 = objc_claimAutoreleasedReturnValue();
    shortcut = v5->_shortcut;
    v5->_shortcut = (INShortcut *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("relevanceProviders"));
    v11 = objc_claimAutoreleasedReturnValue();
    relevanceProviders = v5->_relevanceProviders;
    v5->_relevanceProviders = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchTemplate"));
    v13 = objc_claimAutoreleasedReturnValue();
    watchTemplate = v5->_watchTemplate;
    v5->_watchTemplate = (INDefaultCardTemplate *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetKind"));
    v15 = objc_claimAutoreleasedReturnValue();
    widgetKind = v5->_widgetKind;
    v5->_widgetKind = (NSString *)v15;

    v5->_shortcutRole = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shortcutRole"));
    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  INShortcut *shortcut;
  id v5;

  shortcut = self->_shortcut;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", shortcut, CFSTR("shortcut"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevanceProviders, CFSTR("relevanceProviders"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_watchTemplate, CFSTR("watchTemplate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_widgetKind, CFSTR("widgetKind"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_shortcutRole, CFSTR("shortcutRole"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_watchTemplate, 0);
  objc_storeStrong((id *)&self->_relevanceProviders, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setShortcut:", a2);
  return result;
}

uint64_t __80__INRelevantShortcut_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setWatchTemplate:", a2);
  return result;
}

@end
