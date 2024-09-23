@implementation PKInkManager

void __33__PKInkManager_defaultInkManager__block_invoke()
{
  PKInkManager *v0;
  void *v1;

  v0 = objc_alloc_init(PKInkManager);
  v1 = (void *)_MergedGlobals_139;
  _MergedGlobals_139 = (uint64_t)v0;

}

- (id)supportedInkIdentifierFromIdentifier:(id)a3
{
  __CFString *v4;
  PKInkManager *v5;
  __CFString *v6;
  _BOOL4 v7;
  __CFString *v8;

  v4 = (__CFString *)a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_supportedInkIdentifiers, "objectForKeyedSubscript:", v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = +[PKInkParser hasDefinitionForIdentifier:]((uint64_t)PKInkParser, v4);
    v8 = CFSTR("com.apple.ink.pen");
    if (v7)
      v8 = v4;
    v6 = v8;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_supportedInkIdentifiers, "setObject:forKeyedSubscript:", v6, v4);
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)inkBehaviorForIdentifier:(id)a3 version:(unint64_t)a4 variant:(id)a5
{
  id v8;
  __CFString *v9;
  PKInkManager *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD *v20;
  int v22;
  __CFString *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a5;
  v10 = self;
  objc_sync_enter(v10);
  if (!v9)
    v9 = CFSTR("default");
  v11 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v8, a4, v9);
  -[NSMutableDictionary objectForKeyedSubscript:](v10->_inks, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[PKInkParser inkBehaviorsWithIdentifer:version:]((uint64_t)PKInkParser, v8, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary addEntriesFromDictionary:](v10->_inks, "addEntriesFromDictionary:", v13);
    if (!a4 || v13)
    {
      v15 = v11;
    }
    else
    {
      v14 = a4 - 1;
      do
      {
        +[PKInkParser inkBehaviorsWithIdentifer:version:]((uint64_t)PKInkParser, v8, v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary addEntriesFromDictionary:](v10->_inks, "addEntriesFromDictionary:", v13);
        v15 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v8, v14, v9);

        if (v14-- == 0)
          break;
        v11 = v15;
      }
      while (!v13);
      a4 = v14 + 1;
    }

    v11 = v15;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v10->_inks, "objectForKeyedSubscript:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v10->_inks, "objectForKeyedSubscript:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412546;
      v23 = v9;
      v24 = 2112;
      v25 = v8;
      _os_log_error_impl(&dword_1BE213000, v19, OS_LOG_TYPE_ERROR, "Could not find variant %@ for ink identifier %@, falling back to default", (uint8_t *)&v22, 0x16u);
    }

    v20 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v8, a4, CFSTR("default"));
    -[NSMutableDictionary objectForKeyedSubscript:](v10->_inks, "objectForKeyedSubscript:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
  }

  objc_sync_exit(v10);
  return v18;
}

- (PKInkManager)init
{
  PKInkManager *v2;
  uint64_t v3;
  NSMutableDictionary *inks;
  uint64_t v5;
  NSMutableDictionary *supportedInkIdentifiers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKInkManager;
  v2 = -[PKInkManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    inks = v2->_inks;
    v2->_inks = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    supportedInkIdentifiers = v2->_supportedInkIdentifiers;
    v2->_supportedInkIdentifiers = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (id)defaultInkManager
{
  if (qword_1ECEE6308 != -1)
    dispatch_once(&qword_1ECEE6308, &__block_literal_global_55);
  return (id)_MergedGlobals_139;
}

+ (void)clearCachedManager
{
  PKInkManager *v2;
  void *v3;

  v2 = objc_alloc_init(PKInkManager);
  v3 = (void *)_MergedGlobals_139;
  _MergedGlobals_139 = (uint64_t)v2;

}

- (id)inkBehaviorForIdentifier:(id)a3 variant:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  -[PKInkManager inkBehaviorForIdentifier:version:variant:](self, "inkBehaviorForIdentifier:version:variant:", v6, +[PKInk currentInkVersionForInkIdentifier:](PKInk, "currentInkVersionForInkIdentifier:", v6), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)addInkBehavior:(id)a3 forIdentifier:(id)a4
{
  id v6;
  PKInkManager *v7;
  _QWORD *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v6, 3, CFSTR("default"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_inks, "setObject:forKeyedSubscript:", v9, v8);

  objc_sync_exit(v7);
}

- (NSMutableDictionary)inks
{
  return self->_inks;
}

- (NSMutableDictionary)supportedInkIdentifiers
{
  return self->_supportedInkIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedInkIdentifiers, 0);
  objc_storeStrong((id *)&self->_inks, 0);
}

@end
