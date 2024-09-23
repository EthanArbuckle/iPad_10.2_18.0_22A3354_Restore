@implementation ATXFakeSuggestionDeduplicator

- (ATXFakeSuggestionDeduplicator)init
{
  ATXFakeSuggestionDeduplicator *v2;
  ATXFakeSuggestionDeduplicator *v3;
  NSArray *pinnedWidgetSuggestions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXFakeSuggestionDeduplicator;
  v2 = -[ATXFakeSuggestionDeduplicator init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    pinnedWidgetSuggestions = v2->_pinnedWidgetSuggestions;
    v2->_pinnedWidgetSuggestions = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (void)setBlanketReturnValue:(BOOL)a3
{
  self->_blanketValueIsSet = 1;
  self->_blanketReturnValue = a3;
}

- (void)setExistingSuggestionsReturnValue:(BOOL)a3
{
  self->_existingSuggestionsReturnValueIsSet = 1;
  self->_existingSuggestionsReturnValue = a3;
}

- (void)setHomeScreenPageReturnValue:(BOOL)a3
{
  self->_homeScreenPageReturnValueIsSet = 1;
  self->_homeScreenPageReturnValue = a3;
}

- (void)setDuplicateWidgetReturnValue:(id)a3
{
  self->_duplicateWidgetReturnValueIsSet = 1;
  objc_storeStrong((id *)&self->_duplicateWidgetReturnValue, a3);
}

- (BOOL)suggestionIsDuplicate:(id)a3 existingSuggestions:(id)a4
{
  uint64_t v4;

  if (self->_existingSuggestionsReturnValueIsSet)
  {
    v4 = 13;
    return *((_BYTE *)&self->super.isa + v4) != 0;
  }
  if (self->_blanketValueIsSet)
  {
    v4 = 12;
    return *((_BYTE *)&self->super.isa + v4) != 0;
  }
  return 0;
}

- (BOOL)isWidget:(id)a3 showingIdenticalContentOfSuggestion:(id)a4
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (BOOL)suggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (BOOL)suggestionIsDuplicateAppOrWidget:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 homeScreenPageReturnValue;
  BOOL v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_homeScreenPageReturnValueIsSet)
  {
    homeScreenPageReturnValue = self->_homeScreenPageReturnValue;
  }
  else
  {
    if (self->_appsOnPage)
    {
      v12 = -[ATXFakeSuggestionDeduplicator suggestionIsDuplicate:otherApps:](self, "suggestionIsDuplicate:otherApps:", v8);
      goto LABEL_6;
    }
    if (!self->_blanketValueIsSet)
    {
      v12 = 0;
      goto LABEL_6;
    }
    homeScreenPageReturnValue = self->_blanketReturnValue;
  }
  v12 = homeScreenPageReturnValue;
LABEL_6:

  return v12;
}

- (BOOL)widgetSuggestionIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (BOOL)widgetSuggestionIsPinned:(id)a3 homeScreenPage:(id)a4 excludingStackConfigId:(id)a5
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_pinnedWidgetSuggestions;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)duplicateWidgetForWidgetSuggestion:(id)a3 otherWidgets:(id)a4
{
  if (self->_duplicateWidgetReturnValueIsSet)
    return self->_duplicateWidgetReturnValue;
  else
    return 0;
}

- (BOOL)suggestionIsDuplicate:(id)a3 appsOnHomeScreenPageAtIndex:(unint64_t)a4
{
  NSSet *appsOnPage;
  id v6;
  BOOL v7;
  id v8;

  appsOnPage = self->_appsOnPage;
  if (appsOnPage)
  {
    v6 = a3;
    v7 = -[ATXFakeSuggestionDeduplicator suggestionIsDuplicate:otherApps:](self, "suggestionIsDuplicate:otherApps:", v6, appsOnPage);
  }
  else
  {
    v8 = a3;
    v6 = (id)objc_opt_new();
    v7 = -[ATXFakeSuggestionDeduplicator suggestionIsDuplicate:otherApps:](self, "suggestionIsDuplicate:otherApps:", v8, v6);

  }
  return v7;
}

- (BOOL)suggestionIsDuplicate:(id)a3 otherApps:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL blanketReturnValue;

  v6 = a3;
  v7 = a4;
  if (!self->_appsOnPage)
  {
    if (self->_blanketValueIsSet)
    {
      blanketReturnValue = self->_blanketReturnValue;
      goto LABEL_7;
    }
LABEL_6:
    blanketReturnValue = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "executableType");

  if (v9 != 1)
    goto LABEL_6;
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v6, "executableSpecification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithData:encoding:", v12, 4);

  blanketReturnValue = -[NSSet containsObject:](self->_appsOnPage, "containsObject:", v13);
LABEL_7:

  return blanketReturnValue;
}

- (BOOL)widgetExtensionIdIsDuplicate:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (BOOL)widgetExtensionIdIsPinned:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5
{
  return self->_blanketValueIsSet && self->_blanketReturnValue;
}

- (id)pinnedWidgetIdentifiablesWithExtensionId:(id)a3 homeScreenPageConfig:(id)a4 excludingStackConfigId:(id)a5 shouldStopAfterFindingFirstOne:(BOOL)a6
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)blanketReturnValue
{
  return self->_blanketReturnValue;
}

- (BOOL)existingSuggestionsReturnValue
{
  return self->_existingSuggestionsReturnValue;
}

- (BOOL)homeScreenPageReturnValue
{
  return self->_homeScreenPageReturnValue;
}

- (ATXHomeScreenWidgetIdentifiable)duplicateWidgetReturnValue
{
  return self->_duplicateWidgetReturnValue;
}

- (NSArray)pinnedWidgetSuggestions
{
  return self->_pinnedWidgetSuggestions;
}

- (void)setPinnedWidgetSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedWidgetSuggestions, a3);
}

- (NSSet)appsOnPage
{
  return self->_appsOnPage;
}

- (void)setAppsOnPage:(id)a3
{
  objc_storeStrong((id *)&self->_appsOnPage, a3);
}

- (NSArray)suggestionsInRecentlyEngagedCache
{
  return self->_suggestionsInRecentlyEngagedCache;
}

- (void)setSuggestionsInRecentlyEngagedCache:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsInRecentlyEngagedCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsInRecentlyEngagedCache, 0);
  objc_storeStrong((id *)&self->_appsOnPage, 0);
  objc_storeStrong((id *)&self->_pinnedWidgetSuggestions, 0);
  objc_storeStrong((id *)&self->_duplicateWidgetReturnValue, 0);
}

@end
