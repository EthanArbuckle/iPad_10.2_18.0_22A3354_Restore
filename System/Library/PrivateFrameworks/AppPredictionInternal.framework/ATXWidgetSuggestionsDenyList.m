@implementation ATXWidgetSuggestionsDenyList

- (ATXWidgetSuggestionsDenyList)init
{
  void *v3;
  ATXWidgetSuggestionsDenyList *v4;

  objc_msgSend(MEMORY[0x1E0CF8CF0], "dictionaryForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXWidgetSuggestionsDenyList initWithAssets:](self, "initWithAssets:", v3);

  return v4;
}

- (ATXWidgetSuggestionsDenyList)initWithAssets:(id)a3
{
  id v4;
  ATXWidgetSuggestionsDenyList *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXWidgetSuggestionsDenyList;
  v5 = -[ATXWidgetSuggestionsDenyList init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("denyList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_bannedWidgets, v6);

  }
  return v5;
}

- (BOOL)containsInfoSuggestion:(id)a3
{
  id v4;
  NSArray *v5;
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
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_bannedWidgets;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extensionBundleId"), (_QWORD)v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("appBundleId"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("widgetKind"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (objc_msgSend(v4, "widgetBundleIdentifier"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v14,
            v14))
      {
        objc_msgSend(v4, "widgetBundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v11, "isEqualToString:", v15);

        if (v12)
          goto LABEL_11;
      }
      else
      {
        v16 = 1;
        if (v12)
        {
LABEL_11:
          objc_msgSend(v4, "appBundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v4, "appBundleIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v16 &= objc_msgSend(v12, "isEqualToString:", v18);

          }
        }
      }
      if (v13)
      {
        objc_msgSend(v4, "widgetKind");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v4, "widgetKind");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = v16 & objc_msgSend(v13, "isEqualToString:", v20);

        }
      }

      if ((v16 & 1) != 0)
      {
        v21 = 1;
        goto LABEL_22;
      }
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  v21 = 0;
LABEL_22:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannedWidgets, 0);
}

@end
