@implementation ATXHomeScreenPage

- (NSArray)stacks
{
  return self->_stacks;
}

- (NSArray)panels
{
  return self->_panels;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (ATXHomeScreenPage)initWithCoder:(id)a3
{
  id v4;
  ATXHomeScreenPage *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)ATXHomeScreenPage;
  v5 = -[ATXHomeScreenPage init](&v38, sel_init);
  if (v5)
  {
    -[ATXHomeScreenPage setSuggestedPageType:](v5, "setSuggestedPageType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestedPageType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenPage setUniqueIdentifier:](v5, "setUniqueIdentifier:", v6);

    -[ATXHomeScreenPage setPageIndex:](v5, "setPageIndex:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pageIndex")));
    -[ATXHomeScreenPage setHidden:](v5, "setHidden:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hidden")));
    -[ATXHomeScreenPage setMaxPortraitRows:](v5, "setMaxPortraitRows:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("portraitRows")));
    -[ATXHomeScreenPage setMaxPortraitColumns:](v5, "setMaxPortraitColumns:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("portraitColumns")));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("stacks"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenPage setStacks:](v5, "setStacks:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("panels"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenPage setPanels:](v5, "setPanels:", v14);

    allowedLeafIconClasses();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("leafIcons"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenPage setLeafIcons:](v5, "setLeafIcons:", v16);

    v17 = (void *)MEMORY[0x1A85A4F90]();
    v18 = objc_alloc(MEMORY[0x1E0C99E60]);
    v19 = objc_opt_class();
    v20 = (void *)objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("associatedModeUUIDs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenPage setAssociatedModeUUIDs:](v5, "setAssociatedModeUUIDs:", v21);

    v22 = (void *)MEMORY[0x1A85A4F90]();
    v23 = objc_alloc(MEMORY[0x1E0C99E60]);
    v24 = objc_opt_class();
    v25 = (void *)objc_msgSend(v23, "initWithObjects:", v24, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v22);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("candidateApps"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenPage setCandidateApps:](v5, "setCandidateApps:", v26);

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("appLocations"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenPage setAppLocations:](v5, "setAppLocations:", v31);

    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("webClipLocations"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenPage setWebClipLocations:](v5, "setWebClipLocations:", v36);

  }
  return v5;
}

- (void)setWebClipLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setSuggestedPageType:(int64_t)a3
{
  self->_suggestedPageType = a3;
}

- (void)setStacks:(id)a3
{
  NSArray *v4;
  NSArray *stacks;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_stacks != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    stacks = self->_stacks;
    self->_stacks = v4;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_stacks;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setPage:", self, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setPanels:(id)a3
{
  NSArray *v4;
  NSArray *panels;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_panels != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    panels = self->_panels;
    self->_panels = v4;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_panels;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setPage:", self, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (void)setMaxPortraitRows:(unint64_t)a3
{
  self->_maxPortraitRows = a3;
}

- (void)setMaxPortraitColumns:(unint64_t)a3
{
  self->_maxPortraitColumns = a3;
}

- (void)setLeafIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void)setCandidateApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setAssociatedModeUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAppLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateApps, 0);
  objc_storeStrong((id *)&self->_leafIcons, 0);
  objc_storeStrong((id *)&self->_webClipLocations, 0);
  objc_storeStrong((id *)&self->_appLocations, 0);
  objc_storeStrong((id *)&self->_panels, 0);
  objc_storeStrong((id *)&self->_stacks, 0);
  objc_storeStrong((id *)&self->_associatedModeUUIDs, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (unint64_t)numberOfLeafIconSpots
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[ATXHomeScreenPage maxPortraitRows](self, "maxPortraitRows");
  if (v3)
    v4 = v3;
  else
    v4 = 6;
  v5 = -[ATXHomeScreenPage maxPortraitColumns](self, "maxPortraitColumns");
  v6 = 4;
  if (v5)
    v6 = v5;
  v14 = 0u;
  v15 = 0u;
  v7 = v6 * v4;
  v16 = 0u;
  v17 = 0u;
  -[ATXHomeScreenPage stacks](self, "stacks", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v7 -= objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "numberOfLeafIconSpots");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v7;
}

- (ATXHomeScreenPage)init
{
  ATXHomeScreenPage *v2;
  ATXHomeScreenPage *v3;
  NSDictionary *appLocations;
  NSDictionary *v5;
  NSDictionary *webClipLocations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXHomeScreenPage;
  v2 = -[ATXHomeScreenPage init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    appLocations = v2->_appLocations;
    v5 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v2->_appLocations = (NSDictionary *)MEMORY[0x1E0C9AA70];

    webClipLocations = v3->_webClipLocations;
    v3->_webClipLocations = v5;

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXHomeScreenPage pageIndex](self, "pageIndex"), CFSTR("pageIndex"));
  objc_msgSend(v8, "encodeBool:forKey:", -[ATXHomeScreenPage isHidden](self, "isHidden"), CFSTR("hidden"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXHomeScreenPage maxPortraitRows](self, "maxPortraitRows"), CFSTR("portraitRows"));
  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXHomeScreenPage maxPortraitColumns](self, "maxPortraitColumns"), CFSTR("portraitColumns"));
  -[ATXHomeScreenPage stacks](self, "stacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("stacks"));

  -[ATXHomeScreenPage panels](self, "panels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("panels"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_leafIcons, CFSTR("leafIcons"));
  -[ATXHomeScreenPage appLocations](self, "appLocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("appLocations"));

  -[ATXHomeScreenPage webClipLocations](self, "webClipLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("webClipLocations"));

  objc_msgSend(v8, "encodeInteger:forKey:", self->_suggestedPageType, CFSTR("suggestedPageType"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_associatedModeUUIDs, CFSTR("associatedModeUUIDs"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_candidateApps, CFSTR("candidateApps"));

}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenPage *v4;
  ATXHomeScreenPage *v5;
  NSArray *stacks;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  char v11;
  NSArray *panels;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  char v16;
  NSDictionary *appLocations;
  NSDictionary *v18;
  NSDictionary *v19;
  NSDictionary *v20;
  char v21;
  NSDictionary *webClipLocations;
  NSDictionary *v23;
  NSDictionary *v24;
  NSDictionary *v25;
  char v26;
  NSArray *leafIcons;
  NSArray *v28;
  NSArray *v29;
  NSArray *v30;
  char v31;
  NSSet *v33;
  NSSet *v34;

  v4 = (ATXHomeScreenPage *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[ATXHomeScreenPage pageIndex](v5, "pageIndex") != self->_pageIndex
        || self->_hidden != -[ATXHomeScreenPage isHidden](v5, "isHidden"))
      {
        goto LABEL_25;
      }
      stacks = self->_stacks;
      v7 = v5->_stacks;
      if (stacks == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = stacks;
        v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
          goto LABEL_25;
      }
      panels = self->_panels;
      v13 = v5->_panels;
      if (panels == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = panels;
        v16 = -[NSArray isEqual:](v15, "isEqual:", v14);

        if ((v16 & 1) == 0)
          goto LABEL_25;
      }
      appLocations = self->_appLocations;
      v18 = v5->_appLocations;
      if (appLocations == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = appLocations;
        v21 = -[NSDictionary isEqual:](v20, "isEqual:", v19);

        if ((v21 & 1) == 0)
          goto LABEL_25;
      }
      webClipLocations = self->_webClipLocations;
      v23 = v5->_webClipLocations;
      if (webClipLocations == v23)
      {

      }
      else
      {
        v24 = v23;
        v25 = webClipLocations;
        v26 = -[NSDictionary isEqual:](v25, "isEqual:", v24);

        if ((v26 & 1) == 0)
          goto LABEL_25;
      }
      leafIcons = self->_leafIcons;
      v28 = v5->_leafIcons;
      if (leafIcons == v28)
      {

      }
      else
      {
        v29 = v28;
        v30 = leafIcons;
        v31 = -[NSArray isEqual:](v30, "isEqual:", v29);

        if ((v31 & 1) == 0)
        {
LABEL_25:
          v11 = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      v33 = self->_associatedModeUUIDs;
      v34 = v33;
      if (v33 == v5->_associatedModeUUIDs)
        v11 = 1;
      else
        v11 = -[NSSet isEqual:](v33, "isEqual:");

      goto LABEL_26;
    }
    v11 = 0;
  }
LABEL_27:

  return v11;
}

- (id)_leafIconsFromExistingData
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *webClipLocations;
  NSDictionary *appLocations;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ATXHomeScreenWebClip *v16;
  void *v17;
  void *v18;
  ATXHomeScreenFolder *v19;
  ATXHomeScreenFolder *v20;
  ATXHomeScreenWebClip *v21;
  ATXHomeScreenWebClip *v22;
  ATXHomeScreenFolder *v23;
  uint64_t v24;
  void *v26;
  void *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = v3;
  v5 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  if (self->_webClipLocations)
    webClipLocations = self->_webClipLocations;
  else
    webClipLocations = (NSDictionary *)MEMORY[0x1E0C9AA70];
  objc_msgSend(v3, "addEntriesFromDictionary:", webClipLocations);
  if (self->_appLocations)
    appLocations = self->_appLocations;
  else
    appLocations = v5;
  objc_msgSend(v4, "addEntriesFromDictionary:", appLocations);
  v26 = v4;
  objc_msgSend(v4, "keysSortedByValueUsingComparator:", &__block_literal_global_250);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_opt_new();
  v27 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v12);
        -[NSDictionary objectForKeyedSubscript:](self->_webClipLocations, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_appLocations, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length") == 1)
        {
          v16 = -[ATXHomeScreenWebClip initWithUUID:name:url:]([ATXHomeScreenWebClip alloc], "initWithUUID:name:url:", v13, 0, 0);
          goto LABEL_14;
        }
        if (objc_msgSend(v14, "length") == 2)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "indexAtPosition:", 0));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "indexAtPosition:", 1));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v17);
          v19 = (ATXHomeScreenFolder *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v20 = [ATXHomeScreenFolder alloc];
            v19 = -[ATXHomeScreenFolder initWithFolderPages:name:](v20, "initWithFolderPages:name:", MEMORY[0x1E0C9AA60], 0);
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, v17);
            objc_msgSend(v29, "addObject:", v19);
          }
          v21 = -[ATXHomeScreenWebClip initWithUUID:name:url:]([ATXHomeScreenWebClip alloc], "initWithUUID:name:url:", v13, 0, 0);
          goto LABEL_19;
        }
        if (objc_msgSend(v15, "length") == 1)
        {
          v16 = -[ATXHomeScreenApp initWithBundleId:]([ATXHomeScreenApp alloc], "initWithBundleId:", v13);
LABEL_14:
          v17 = v16;
          objc_msgSend(v29, "addObject:", v16);
LABEL_20:

          goto LABEL_21;
        }
        if (objc_msgSend(v15, "length") == 2)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "indexAtPosition:", 0));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "indexAtPosition:", 1));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", v17);
          v19 = (ATXHomeScreenFolder *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v23 = [ATXHomeScreenFolder alloc];
            v19 = -[ATXHomeScreenFolder initWithFolderPages:name:](v23, "initWithFolderPages:name:", MEMORY[0x1E0C9AA60], 0);
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, v17);
            objc_msgSend(v29, "addObject:", v19);
          }
          v21 = -[ATXHomeScreenApp initWithBundleId:]([ATXHomeScreenApp alloc], "initWithBundleId:", v13);
LABEL_19:
          v22 = v21;
          -[ATXHomeScreenFolder addIcon:folderPageIndex:](v19, "addIcon:folderPageIndex:", v21, objc_msgSend(v18, "integerValue"));

          goto LABEL_20;
        }
LABEL_21:

        ++v12;
      }
      while (v10 != v12);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v10 = v24;
    }
    while (v24);
  }

  return v29;
}

uint64_t __47__ATXHomeScreenPage__leafIconsFromExistingData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "indexAtPosition:", 0);
  v7 = objc_msgSend(v5, "indexAtPosition:", 0);
  if (v6 >= v7)
  {
    if (v7 >= v6)
    {
      if ((unint64_t)objc_msgSend(v4, "length") > 1 || (unint64_t)objc_msgSend(v5, "length") >= 2)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "indexAtPosition:", 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "indexAtPosition:", 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "compare:", v10);

      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (NSArray)leafIcons
{
  NSArray *leafIcons;
  NSArray *v3;

  leafIcons = self->_leafIcons;
  if (leafIcons)
  {
    v3 = leafIcons;
  }
  else if (-[NSDictionary count](self->_webClipLocations, "count")
         || (v3 = -[NSDictionary count](self->_appLocations, "count")) != 0)
  {
    -[ATXHomeScreenPage _leafIconsFromExistingData](self, "_leafIconsFromExistingData");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSArray)leafAppIcons
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__ATXHomeScreenPage_leafAppIcons__block_invoke;
  v6[3] = &unk_1E4D5D350;
  v4 = v3;
  v7 = v4;
  -[ATXHomeScreenPage enumerateApps:](self, "enumerateApps:", v6);

  return (NSArray *)v4;
}

uint64_t __33__ATXHomeScreenPage_leafAppIcons__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)enumerateApps:(id)a3
{
  -[ATXHomeScreenPage enumerateAppsConsideringFolders:block:](self, "enumerateAppsConsideringFolders:block:", 1, a3);
}

- (void)enumerateAppsConsideringFolders:(BOOL)a3 block:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ATXHomeScreenPage leafIcons](self, "leafIcons", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6[2](v6, v12);
        }
        else if (v4)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v12, "enumerateApps:", v6);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("Page index: %lu; "), self->_pageIndex);
  objc_msgSend(v3, "appendFormat:", CFSTR("Hidden: %d; "), self->_hidden);
  objc_msgSend(v3, "appendFormat:", CFSTR("Unique identifier: %@; "), self->_uniqueIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("Number of app locations (legacy): %lu; "),
    -[NSDictionary count](self->_appLocations, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Number of web clip locations (legacy): %lu; "),
    -[NSDictionary count](self->_webClipLocations, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Number of leaf icons: %lu; "), -[NSArray count](self->_leafIcons, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Stacks: %@; "), self->_stacks);
  objc_msgSend(v3, "appendFormat:", CFSTR("Panels: %@; "), self->_panels);
  if (-[NSSet count](self->_associatedModeUUIDs, "count"))
  {
    -[NSSet allObjects](self->_associatedModeUUIDs, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Associated mode UUIDs: %@; "), v5);

  }
  if (-[NSArray count](self->_candidateApps, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Candidate apps: %ld;"), -[NSArray count](self->_candidateApps, "count"));
  return v3;
}

- (id)dictionaryRepresentationForIntrospection
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_stacks;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v9), "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_panels;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "dictionaryRepresentation", (_QWORD)v29);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v14);
  }

  -[NSSet allObjects](self->_associatedModeUUIDs, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("associatedModeUUIDs"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pageIndex);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("pageIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("hidden"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxPortraitRows);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("portraitRows"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxPortraitColumns);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("portraitColumns"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("stacks"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("panels"));
  -[ATXHomeScreenPage leafIcons](self, "leafIcons");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_pas_mappedArrayWithTransform:", &__block_literal_global_277);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("leafIcons"));

  -[ATXHomeScreenPage candidateApps](self, "candidateApps");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_pas_mappedArrayWithTransform:", &__block_literal_global_279);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("candidateApps"));

  v27 = (void *)objc_msgSend(v3, "copy");
  return v27;
}

uint64_t __61__ATXHomeScreenPage_dictionaryRepresentationForIntrospection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentationForIntrospection");
}

uint64_t __61__ATXHomeScreenPage_dictionaryRepresentationForIntrospection__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentationForIntrospection");
}

- (id)initFromDictionaryRepresentation:(id)a3
{
  id v4;
  ATXHomeScreenPage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *uniqueIdentifier;
  uint64_t v12;
  uint64_t v13;
  NSSet *associatedModeUUIDs;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSArray *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSArray *panels;
  ATXHomeScreenPage *v32;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)ATXHomeScreenPage;
  v5 = -[ATXHomeScreenPage init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pageIndex = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hidden"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_hidden = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("portraitRows"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxPortraitRows = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("portraitColumns"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxPortraitColumns = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("associatedModeUUIDs"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v12);
      associatedModeUUIDs = v5->_associatedModeUUIDs;
      v5->_associatedModeUUIDs = (NSSet *)v13;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stacks"), v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          v22 = -[ATXHomeScreenStackConfig initFromDictionaryRepresentation:]([ATXHomeScreenStackConfig alloc], "initFromDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v21));
          if (v22)
            objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v19);
    }

    objc_storeStrong((id *)&v5->_stacks, v16);
    v35 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("panels"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v23, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v25 = v23;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          v30 = -[ATXHomeScreenStackConfig initFromDictionaryRepresentation:]([ATXHomeScreenStackConfig alloc], "initFromDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v29));
          if (v30)
            -[NSArray addObject:](v24, "addObject:", v30);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v27);
    }

    panels = v5->_panels;
    v5->_panels = v24;

    v32 = v5;
    v4 = v35;
  }

  return v5;
}

- (BOOL)_containsWidgetWithExtensionBundleId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  char v17;
  BOOL v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ATXHomeScreenPage stacks](self, "stacks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v10, "widgets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "extensionBundleId");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", v4);

              if ((v17 & 1) != 0)
              {

                v18 = 1;
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v13)
              continue;
            break;
          }
        }

        v8 = v20;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v18 = 0;
    }
    while (v7);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (BOOL)containsSuggestionsWidget
{
  return -[ATXHomeScreenPage _containsWidgetWithExtensionBundleId:](self, "_containsWidgetWithExtensionBundleId:", *MEMORY[0x1E0CF9480]);
}

- (BOOL)containsAppPredictionPanel
{
  return -[ATXHomeScreenPage _containsWidgetWithExtensionBundleId:](self, "_containsWidgetWithExtensionBundleId:", CFSTR("com.apple.proactive.appprediction.panel"));
}

- (id)nonFolderAppsOnPage
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__ATXHomeScreenPage_nonFolderAppsOnPage__block_invoke;
  v6[3] = &unk_1E4D5D350;
  v4 = v3;
  v7 = v4;
  -[ATXHomeScreenPage enumerateAppsConsideringFolders:block:](self, "enumerateAppsConsideringFolders:block:", 0, v6);

  return v4;
}

void __40__ATXHomeScreenPage_nonFolderAppsOnPage__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bundleId");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (unint64_t)maxPortraitRows
{
  return self->_maxPortraitRows;
}

- (unint64_t)maxPortraitColumns
{
  return self->_maxPortraitColumns;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSSet)associatedModeUUIDs
{
  return self->_associatedModeUUIDs;
}

- (NSDictionary)appLocations
{
  return self->_appLocations;
}

- (NSDictionary)webClipLocations
{
  return self->_webClipLocations;
}

- (NSArray)candidateApps
{
  return self->_candidateApps;
}

- (int64_t)suggestedPageType
{
  return self->_suggestedPageType;
}

@end
